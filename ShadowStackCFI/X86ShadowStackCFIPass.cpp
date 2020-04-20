#include "X86.h"
#include "X86InstrBuilder.h"
#include "X86InstrInfo.h"
#include "X86Subtarget.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/LiveVariables.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/MC/MCContext.h"

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>

using namespace llvm;
using namespace X86;
using namespace std;

//在字符串src的字符f前添加/进行转义，用于形成符合dot文件规则的字符串
std::string transMean(std::string src, char f)
{
    if (src.find(f) != -1)
    {
        return src.insert(src.find(f), "\\");
    }
    else
    {
        return src;
    }
}
//删除字符串src的字符f，用于形成符合dot文件规则的字符串
std::string replaceChar(std::string src, char f)
{
    if (src.find(f) != -1)
    {
        return src.replace(src.find(f), 1, "");
    }
    else
    {
        return src;
    }
}
//打印MachineInstr的相关信息，IorB用于表示该MI是原有的还是插入的
void printMachineInstr(MachineInstr &MI, int IorB)
{
    if (IorB == 0)
    {
        outs() << "Instructoin: " << MI.getOpcode() << "\n";
    }
    else
    {
        outs() << "Builder: " << MI.getOpcode() << "\n";
    }
    
    MI.print(outs());
    for (int i = 0; i < MI.getNumOperands(); i++)
    {
        MachineOperand MO = MI.getOperand(i);
        outs() << "\t" << MI.getOperand(i) << "\t" <<MO.isReg() << "\t" << MO.isImm() << "\n";
        
        // outs() << " " << MI.getOperand(i) << " isBlockAddress " << MO.isBlockAddress() << " isCFIIndex " << MO.isCFIIndex() << " isCImm " << MO.isCImm() << " isCPI " << MO.isCPI() << " isFI " << MO.isFI() << " isFPImm " << MO.isFPImm() << " isGlobal " << MO.isGlobal() << " isImm " << MO.isImm() << " isIntrinsicID " << MO.isIntrinsicID() << " isJTI " << MO.isJTI() << " isMBB " << MO.isMBB() << " isMCSymbol " << MO.isMCSymbol() << " isMetadata " << MO.isMetadata() << " isPredicate " << MO.isPredicate() << " isReg " << MO.isReg() << " isRegLiveOut " << MO.isRegLiveOut() << " isRegMask " << MO.isRegMask() << " isSymbol " << MO.isSymbol() << " isTargetIndex " << MO.isTargetIndex()<< "\n";
    }
    outs() << "\n";
}

namespace {
	class X86ShadowStackCFIPass : public MachineFunctionPass {	
    private:
        int count = 0;  //记录runonmachinefunction到了第几个func
        //用于保存MachineBasicBlock相关信息的结构体
        struct MBBNode
        {
            string MBBNodeName; //MBB的名字，格式为:函数名_MBB块名_函数内序号，如:main_entry_0
            vector<string> MBBNodeInstrVev; //MBB包含的指令
            string callFun; //MBB调用的函数，没有则为“”
            string retFun;  //retfun返回后，进入该MBB，没有则为“”
            vector<string> nextMBBNVec; //MBB可能会转到的MBB
            bool isRetMBB;  //MBB是否为该函数最后一个MBB
            //由MachineBasicBlock构造MBBNode
            MBBNode(MachineBasicBlock *MBB)
            {
                string MBBNN = MBB->getParent()->getName().str() + "_" + MBB->getName().str() + "_" + to_string(MBB->getNumber());
                MBBNN = replaceChar(MBBNN, '.');
                this->MBBNodeName = MBBNN;
                for (auto MII = MBB->begin(); MII != MBB->end(); ++MII)
                {
                    MachineInstr &MI = *MII;
                    string tmpStr;
                    raw_string_ostream rso(tmpStr);
                    MI.print(rso);
                    string MIStr = rso.str();
                    MIStr = transMean(MIStr, '<');
                    MIStr = transMean(MIStr, '>');
                    this->MBBNodeInstrVev.push_back(MIStr);
                }
                isRetMBB = MBB->isReturnBlock();
            }
            //深拷贝构造函数
            MBBNode(const MBBNode &M)
            {
                this->MBBNodeName = M.MBBNodeName;
                this->MBBNodeInstrVev = M.MBBNodeInstrVev;
                this->callFun = M.callFun;
                this->retFun = M.retFun;
                this->nextMBBNVec = M.nextMBBNVec;
                this->isRetMBB = M.isRetMBB;
            }
            //深拷贝构造函数
            MBBNode& operator=(MBBNode &M)
            {
                this->MBBNodeName = M.MBBNodeName;
                this->MBBNodeInstrVev = M.MBBNodeInstrVev;
                this->callFun = M.callFun;
                this->retFun = M.retFun;
                this->nextMBBNVec = M.nextMBBNVec;
                this->isRetMBB = M.isRetMBB;
            }
            //打印MBBNode自身信息
            void print()
            {
                outs() << this->MBBNodeName << "\n";
                outs() << "Next:\n";
                for (int i = 0; i < this->nextMBBNVec.size(); i++)
                {
                    outs() << this->nextMBBNVec[i] << " ";
                }
                outs() << "\nInstr:\n";
                for (int i = 0; i < this->MBBNodeInstrVev.size(); i++)
                {
                    outs() << this->MBBNodeInstrVev[i];
                }
                outs() << "fun:\n";
                outs() << this->callFun << " " << this->retFun << "\n";
                outs() << "\n";
            }
        };
        
        map<string, MBBNode> MBBNodeMap;    //保存所有的MBBNode，string为MBBNodeName
        const GlobalValue* exitGV;
        const GlobalValue* CFICheckGV;
        const GlobalValue* transactionBeginGV;
        bool hasExit = false;
        bool hasCFICheck = false;
        bool hasTransactionBegin = false;
        bool entryLabelPrinted = false;
        bool needCFIInsert = true;  //用于设置是否需要进行CFICheck插桩
        bool needShadowStackInsert = true; //用于设置是否需要进行ShadowStack插桩
        bool needRspInsert = true; //用于设置是否需要进行rsp检查插桩
        bool needMovInsert = true; //用于设置是否需要进行mov检查插桩
        bool needTsxInsert = true; //用于设置是否需要进行tsx插桩
        string mainFunName = "enclave_main";

    public:
        static char ID;
        X86ShadowStackCFIPass() : MachineFunctionPass(ID) {}

        //输出函数cfg到dot文件
        void MFunCFG(MachineFunction &MF)
        {
            std::vector<MachineBasicBlock*> MBBVec;
            StringRef fileName(MF.getName().str() + ".dot");
            enum sys::fs::OpenFlags F_None;
            std::error_code error;
            raw_fd_ostream file(fileName, error, F_None);

            file << "digraph \"CFG for'" + MF.getName() + "\' function\" {\n";
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock* curMBB = &*MBBI;
                if (std::find(MBBVec.begin(), MBBVec.end(), curMBB) == MBBVec.end())
                {
                    MBBVec.push_back(curMBB);
                }
                std::string curMBBName = MF.getName().str() + "_" +  curMBB->getName().str() + "_" + std::to_string(curMBB->getNumber());
                curMBBName = replaceChar(curMBBName, '.');
                file << "\t" << curMBBName << " " " [shape=record, label=\"{";
                file << curMBBName << ":\\l\\l";
                for (auto MII = curMBB->begin(); MII != curMBB->end(); ++MII)
                {
                    MachineInstr &MI = *MII;
                    std::string str;
                    raw_string_ostream rso(str);
                    MI.print(rso);
                    std::string MIStr = rso.str();
                    MIStr = transMean(MIStr, '<');
                    MIStr = transMean(MIStr, '>');
                    file << MIStr << "\\l\n";
                }
                file << "}\"];\n";
                for (MachineBasicBlock *SucMBB : curMBB->successors())
                {
                    if (std::find(MBBVec.begin(), MBBVec.end(),  SucMBB) == MBBVec.end())
                    {
                        MBBVec.push_back(SucMBB);
                    }
                    std::string sucMBBName = MF.getName().str() + "_" + SucMBB->getName().str() + "_" +  std::to_string(SucMBB->getNumber());
                    sucMBBName = replaceChar(sucMBBName, '.');
                    file << "\t" << curMBBName << "-> " << sucMBBName << ";\n";
                }
            }
            file << "}\n";
            file.close();
        }

        //遍历函数的MBB，向map中插入MBBNode，并记录MBB与函数的调用和返回关系
        void findCallandInsertMBBNode(MachineFunction &MF)
        {
            string callFunStr = "";
            string retFunStr = "";
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock &MBB = *MBBI;
                retFunStr = callFunStr;
                callFunStr = "";

                //遍历MBB的指令，如果有callq，则分割MBB，并记录调用关系
                for (auto MII = MBB.begin(); MII != MBB.end(); MII++)
                {
                    MachineInstr &MI = *MII;
                    if (MI.getOpcode() == CALL64pcrel32)
                    {
                        MachineBasicBlock &NewBB = *MF.CreateMachineBasicBlock();
                        auto FNPI = NewBB.getFirstNonPHI();
                        NewBB.splice(++FNPI, &MBB, ++MII, MBB.end());
                        for (MachineBasicBlock *SucMBB : MBB.successors())
                        {
                            MBB.removeSuccessor(SucMBB);
                            NewBB.addSuccessor(SucMBB);
                        }
                        MBB.addSuccessor(&NewBB);
                        MF.insert(++MBBI, &NewBB);
                        MBBI--;
                        MBBI--;

                        MachineOperand MO = MI.getOperand(0);
                        string tmpStr;
                        raw_string_ostream rso(tmpStr);
                        MO.print(rso);
                        callFunStr = rso.str();
                        callFunStr = replaceChar(callFunStr, '@');
                        break;
                    }
                }

                //向MBBNodeMap中插入由当前MBB构造的MBBNode
                MBBNode MBBN(&MBB);
                MBBN.callFun = callFunStr;
                MBBN.retFun = retFunStr;
                if (callFunStr == "")
                {
                    for (MachineBasicBlock *sucMBB : MBB.successors())
                    {
                        MBBNode sucMBBN(sucMBB);
                        MBBN.nextMBBNVec.push_back(sucMBBN.MBBNodeName);
                    }
                }
                MBBNodeMap.insert(pair<string, MBBNode>(MBBN.MBBNodeName,MBBN));
            }
        }

        //向MBBNode中添加因为call和ret产生的NextNode
        void addCallRetNext()
        {
            for (auto mapI = MBBNodeMap.begin(); mapI != MBBNodeMap.end(); mapI++)
            {
                int rc = 0;
                for (auto mapI2 = MBBNodeMap.begin(); mapI2 != MBBNodeMap.end(); mapI2++)
                {
                    string nameStr = mapI2->second.MBBNodeName;
                    string funStr = nameStr.substr(0, nameStr.find("_"));
                    if (mapI->second.callFun == funStr && nameStr[nameStr.length() - 1] == '0')
                    {
                        mapI->second.nextMBBNVec.push_back(mapI2->second.MBBNodeName);
                        rc++;
                    }
                    if (mapI->second.retFun == funStr && mapI2->second.isRetMBB)
                    {
                        mapI2->second.nextMBBNVec.push_back(mapI->second.MBBNodeName);
                        rc++;
                    }
                    if (rc == 2)
                    {
                        break;
                    }
                    if (++mapI2 == MBBNodeMap.end() && mapI->second.callFun != "" && rc == 0)
                    {
                        for (auto mapI3 = MBBNodeMap.begin(); mapI3 != MBBNodeMap.end(); mapI3++)
                        {
                            if (mapI->second.callFun == mapI3->second.retFun)
                            {
                                mapI->second.nextMBBNVec.push_back(mapI3->second.MBBNodeName);
                                break;
                            }
                        }
                    }
                    mapI2--;
                }
            }
        }
        
        //输出Module的CFG到dot文件
        void MModuleCFG()
        {
            std::error_code error;
            std::string str;
            vector<string> MBBNodeVec;
            StringRef name("ModuleCFG.dot");
            
            enum sys::fs::OpenFlags F_None;
            raw_fd_ostream file(name, error, F_None);
            file << "digraph \"CFG for Module\" {\n";
            for (auto mapI = MBBNodeMap.begin(); mapI != MBBNodeMap.end(); mapI++)
            {
                if (find(MBBNodeVec.begin(), MBBNodeVec.end(), mapI->first) == MBBNodeVec.end())
                {
                    MBBNodeVec.push_back(mapI->first);
                }
                file << "\t" << mapI->first << " [shape=record, label=\"{";
                file << mapI->first << ":\\l\\l";
                for (auto instrI = mapI->second.MBBNodeInstrVev.begin(); instrI != mapI->second.MBBNodeInstrVev.end(); instrI++)
                {
                    file << *instrI << "\\l\n";
                }
                file << "}\"];\n";
                for (auto nextMBBI = mapI->second.nextMBBNVec.begin(); nextMBBI != mapI->second.nextMBBNVec.end(); nextMBBI++)
                {
                    if (find(MBBNodeVec.begin(), MBBNodeVec.end(), *nextMBBI) == MBBNodeVec.end())
                    {
                        MBBNodeVec.push_back(*nextMBBI);
                    }
                    file << "\t" << mapI->first << "-> " << *nextMBBI << ";\n";
                }
            }
            file << "}\n";
            file.close();
        }

        //输出Module的CFG到dot文件,用于被runOnMachineFunction调用
        void MModuleCFG(MachineFunction &MF, int funTotalNum)
        {
            outs() << "\n" << MF.getName().str() << "\n";
            findCallandInsertMBBNode(MF);
            outs() << "findCall Done\n";
            count++;
            //在遍历完所有函数后，执行
            if (count == funTotalNum)
            {
                addCallRetNext();
                outs() << "!!!\n";
                for (auto mapI = MBBNodeMap.begin(); mapI != MBBNodeMap.end(); mapI++)
                {
                    mapI->second.print();
                }
                MModuleCFG();
            }
        }

        //找到mov指令并插桩,检查mov目标是否合法，不合法则跳转(未使用)
        void insertMovInst(MachineFunction &MF)
        {
            outs() << "MachineFunc: " << MF.getName() <<"\n";
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock &MBB = *MBBI;
                MBB.setLabelMustBeEmitted();
                outs() << "MachineBasicBlock: " << MBB.getName() << " " << MBB.getSymbol() << "\n" << MBB << "\n";
                for (auto MII = MBB.begin(), BBE = MBB.end(); MII != BBE; MII++)
                {
                    MachineInstr &MI = *MII;
                    printMachineInstr(MI, 0);
                    if (MI.getOpcode() == MOV64mr)
                    {
                        const TargetInstrInfo *TII;
                        DebugLoc DL = MI.getDebugLoc();
                        TII = MF.getSubtarget().getInstrInfo();

                        MachineInstr &tmpMI = *BuildMI(MBB, MII, DL, TII->get(LEA64r)).addReg(R15).addReg(MI.getOperand(0).getReg()).addImm(1).addReg(0).addImm(MI.getOperand(3).getImm()).addReg(0);
                        printMachineInstr(tmpMI, 1);

                        MachineInstr &tmpMI1 = *BuildMI(MBB, MII, DL, TII->get(CMP64ri8)).addReg(R15).addImm(0xffffffffffffffff);
                        printMachineInstr(tmpMI1, 1);

                        MachineBasicBlock &NextMBB = *(++MBBI);
                        MBBI--;

                        MachineBasicBlock &NewBB = *MF.CreateMachineBasicBlock();
                        DebugLoc nDL;
                        MachineInstr &ntmpMI = *BuildMI(NewBB, NewBB.getFirstNonPHI(), nDL, TII->get(JMP_4)).addMBB(&NextMBB);
                        printMachineInstr(ntmpMI, 1);
                        NewBB.setLabelMustBeEmitted();
                        //MF.insert(MBBI, &NewBB);
                        MBB.addSuccessor(&NewBB);
                        NewBB.addSuccessor(&NextMBB);
                        MF.push_back(&NewBB);

                        MachineInstr &tmpMI2 = *BuildMI(MBB, MII, DL, TII->get(JCC_1)).addMBB(&NewBB).addImm(2);
                        printMachineInstr(tmpMI2, 1);
                    }
                }
            }
        }
        
        //在函数入口进行ShadowStack插桩
        void insertSSEntry(const TargetInstrInfo *TII, MachineBasicBlock &MBB, const DebugLoc &DL, bool hasTransaction)
        { 
            auto MII = MBB.begin();
            if (hasTransaction == true)
            {
                MII++;MII++;
            }
            // mov r11, 0x2fffffffffffffff
            BuildMI(MBB, MII, DL, TII->get(X86::MOV64ri)).addReg(X86::R11).addImm(0x2fffffffffffffff);
            // add [r11], 8
            BuildMI(MBB, MII, DL, TII->get(X86::ADD64mi8)).addReg(X86::R11).addImm(1).addReg(0).addImm(0).addReg(0).addImm(8);
            // mov r10, [r11]
            addDirectMem(BuildMI(MBB, MII, DL, TII->get(X86::MOV64rm)).addDef(X86::R10), X86::R11);
            // add r11, r10
            BuildMI(MBB, MII, DL, TII->get(X86::ADD64rr)).addReg(X86::R11).addDef(X86::R11).addReg(X86::R10);
            // mov r10, [rsp]
            addDirectMem(BuildMI(MBB, MII, DL, TII->get(X86::MOV64rm)).addDef(X86::R10), X86::RSP);
            // mov [r11], r10
            BuildMI(MBB, MII, DL, TII->get(X86::MOV64mr)).addReg(X86::R11).addImm(1).addReg(0).addImm(0).addReg(0).addReg(X86::R10);
        }

        //在函数出口进行ShadowStack插桩
        void insertSSRet(const TargetInstrInfo *TII, MachineBasicBlock &MBB, MachineInstr &MI, MachineBasicBlock &TrapBB)
        {
            const DebugLoc &DL = MI.getDebugLoc();
            // mov r11, 0x2fffffffffffffff
            BuildMI(MBB, MI, DL, TII->get(X86::MOV64ri)).addReg(X86::R11).addImm(0x2fffffffffffffff);
            // mov r10, [r11]
            addDirectMem(BuildMI(MBB, MI, DL, TII->get(X86::MOV64rm)).addDef(X86::R10), X86::R11);
            // add r10, r11
            BuildMI(MBB, MI, DL, TII->get(X86::ADD64rr)).addReg(X86::R10).addDef(X86::R10).addReg(X86::R11);
            // sub [r11], 8
            BuildMI(MBB, MI, DL, TII->get(X86::SUB64mi8)).addReg(X86::R11).addImm(1).addReg(0).addImm(0).addReg(0).addImm(8);
            // mov r11, [r10]
            addDirectMem(BuildMI(MBB, MI, DL, TII->get(X86::MOV64rm)).addDef(X86::R11), X86::R10);
            // cmp [rsp], r11
            addDirectMem(BuildMI(MBB, MI, DL, TII->get(X86::CMP64mr)), X86::RSP).addReg(X86::R11);
            // jne trap
            BuildMI(MBB, MI, DL, TII->get(X86::JCC_1)).addMBB(&TrapBB).addImm(5);
            MBB.addSuccessorWithoutProb(&TrapBB);
        }

        //在leaf函数入口进行ShadowStack插桩
        void insertSSEntrySimple(const TargetInstrInfo *TII, MachineBasicBlock &MBB, const DebugLoc &DL, MCPhysReg FreeRegister)
        {
            // mov REG, [rsp]
            addDirectMem(BuildMI(MBB, MBB.begin(), DL, TII->get(X86::MOV64rm)).addDef(FreeRegister), X86::RSP);
        }

        //在leaf函数出口进行ShadowStack插桩
        void insertSSRetSimple(const TargetInstrInfo *TII, MachineBasicBlock &MBB, MachineInstr &MI, MachineBasicBlock &TrapBB, MCPhysReg FreeRegister)
        {
            const DebugLoc &DL = MI.getDebugLoc();

            // cmp [rsp], REG
            addDirectMem(BuildMI(MBB, MI, DL, TII->get(X86::CMP64mr)), X86::RSP).addReg(FreeRegister);
            // jne trap
            BuildMI(MBB, MI, DL, TII->get(X86::JCC_1)).addMBB(&TrapBB).addImm(5);
            MBB.addSuccessor(&TrapBB);
        }

        //检查函数能否进行shadowstack插桩
        bool checkSSMF(MachineFunction &MF)
        {
            if (MF.empty() || !MF.getRegInfo().tracksLiveness())
                return false;
            if (MF.front().isLiveIn(X86::R10) || MF.front().isLiveIn(X86::R11))
                return false;
            
            bool HasReturn = false;
            for (auto &MBB : MF)
            {
                if (MBB.empty())
                    continue;
                const MachineInstr &MI = MBB.instr_back();
                if (MI.isReturn())
                {
                    if (MI.findRegisterUseOperand(X86::R11))
                        return false;
                    if (MI.findRegisterUseOperand(X86::R10))
                        return false;
                    HasReturn = true;
                }
                if (MI.isReturn() && MI.isCall())
                {
                    if (MI.findRegisterUseOperand(X86::EFLAGS))
                        HasReturn = false;
                    if (MI.findRegisterUseOperand(X86::R10) || MI.hasRegisterImplicitUseOperand(X86::R10))
                        HasReturn = false;
                }
            }
            return HasReturn;
        }

        //检查函数能否进行简易ss插桩
        MCPhysReg checkSimpleMF(MachineFunction &MF)
        {
            MCPhysReg SimpleMFReg = X86::NoRegister;
            unsigned callInst[20] = {CALLpcrel32, CALLpcrel16, CALL16r, CALL16m, CALL32r, CALL32m, CALL16r_NT, CALL16m_NT, CALL32r_NT, CALL32m_NT, FARCALL16i, FARCALL32i, FARCALL16m, FARCALL32m, CALL64pcrel32, CALL64r, CALL64m, CALL64r_NT, CALL64m_NT, FARCALL64};
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock &MBB = *MBBI;
                for (auto MII = MBB.begin(); MII != MBB.end(); MII++)
                {
                    MachineInstr &MI = *MII;
                    for (int i = 0; i < 20; i++)
                    {
                        if (MI.getOpcode() == callInst[i])
                        {
                            return SimpleMFReg;
                        }
                    }
                }
            }
            
            if (!MF.getFrameInfo().adjustsStack())
            {
                std::bitset<X86::NUM_TARGET_REGS> UsedRegs;
                for (auto &MBB : MF)
                {
                    for (auto &LiveIn : MBB.liveins())
                        UsedRegs.set(LiveIn.PhysReg);
                    for (auto &MI : MBB)
                    {
                        for (auto &Op : MI.operands())
                            if (Op.isReg() && Op.isDef())
                                UsedRegs.set(Op.getReg());
                    }
                }

                std::bitset<X86::NUM_TARGET_REGS> CalleeSavedRegs;
                const MCPhysReg *CSRegs = MF.getRegInfo().getCalleeSavedRegs();
                for (size_t i = 0; CSRegs[i]; i++)
                    CalleeSavedRegs.set(CSRegs[i]);

                const TargetRegisterInfo *TRI = MF.getSubtarget().getRegisterInfo();
                for (auto &Reg : X86::GR64_NOSPRegClass.getRegisters())
                {
                    if (CalleeSavedRegs.test(Reg))
                        continue;

                    bool Used = false;
                    for (MCSubRegIterator SR(Reg, TRI, true); SR.isValid(); ++SR)
                        if ((Used = UsedRegs.test(*SR)))
                            break;

                    if (!Used)
                    {
                        SimpleMFReg = Reg;
                        break;
                    }
                }
            }
            return SimpleMFReg;
        }

        //插入shadowstack指令，目前尚未添加ret地址更改后的处理，ss首地址写为0x2FFFFFFFFFFFFFFF
        bool insertShadowStackInst(MachineFunction &MF)
        {
            bool hasTransactionEntry = false;
            if (!checkSSMF(MF))
                return false;
            
            if ((MF.getFunction().getName().str().find(mainFunName) == string::npos) && needTsxInsert && hasTransactionBegin)
            {
                hasTransactionEntry = true;
            }

            // MCPhysReg SimpleMFReg = checkSimpleMF(MF);
            // const bool SimpleMFRegBool = (SimpleMFReg != X86::NoRegister);
            // if (SimpleMFRegBool)
            //     for (auto I = ++MF.begin(), E = MF.end(); I != E; ++I)
            //         I->addLiveIn(SimpleMFReg);

            MachineBasicBlock &MBB = MF.front();
            const MachineBasicBlock *NonEmpty = MBB.empty() ? MBB.getFallThrough() : &MBB;
            const DebugLoc &DL = NonEmpty->front().getDebugLoc();

            const TargetInstrInfo *TII = MF.getSubtarget().getInstrInfo();
            // if (SimpleMFRegBool)
            //     insertSSEntrySimple(TII, MBB, DL, SimpleMFReg);
            // else
            insertSSEntry(TII, MBB, DL, hasTransactionEntry);

            MachineBasicBlock *Trap = nullptr;
            for (auto &MBB : MF)
            {
                if (MBB.empty())
                    continue;
                //MachineInstr &MI = MBB.instr_back();
                auto MII = MBB.end();
                MII--;
                if (MII->isReturn())
                {
                    Trap = MF.CreateMachineBasicBlock();
                    Trap->setLabelMustBeEmitted();
                    // // mov eax, 60(60为exit的syscall调用号)
                    // BuildMI(Trap, MI.getDebugLoc(), TII->get(X86::MOV32ri)).addReg(EAX).addImm(60);
                    // // mov edi, 0
                    // BuildMI(Trap, MI.getDebugLoc(), TII->get(X86::MOV32ri)).addReg(EDI).addImm(0);
                    // // syscall
                    // BuildMI(Trap, MI.getDebugLoc(), TII->get(SYSCALL));
                    // callq exit(-1)
                    BuildMI(Trap, MII->getDebugLoc(), TII->get(X86::MOV32ri)).addReg(EDI).addImm(0xFFFFFFFF);
                    BuildMI(Trap, MII->getDebugLoc(), TII->get(X86::CALL64pcrel32)).addGlobalAddress(exitGV);
                    MF.push_back(Trap);
                    // if (SimpleMFRegBool)
                    //     insertSSRetSimple(TII, MBB, MI, *Trap, SimpleMFReg);
                    // else
                    // if (hasTransactionEntry == true)
                    // {
                    //     MII--;MII--;
                    //     MachineInstr &MI = *MII;
                    //     insertSSRet(TII, MBB, MI, *Trap);
                    // }
                    // else
                    // {
                        MachineInstr &MI = *MII;
                        insertSSRet(TII, MBB, MI, *Trap);
                    //}
                    return true;
                }
            }
        }
        
        //被rewriteCFIFun调用，检查是否有IR PASS插入了CFICheck
        bool checkCFIFun(MachineInstr &MI)
        {
            if (MI.getOpcode() == CALL64pcrel32)
            {
                MachineOperand MO = MI.getOperand(0);
                const GlobalValue* GV = MO.getGlobal();
                
                if (GV->getName() == "CFICheck")
                {
                    return true;
                }
                return false;
            }
        }

        //修改地址检查Fun的参数，此函数需要同IR PASS进行配合使用
        bool rewriteCFIFun(MachineFunction &MF)
        {
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock &MBB = *MBBI;
                for (auto MII = MBB.begin(); MII != MBB.end(); MII++)
                {
                    MachineInstr &MI = *MII;
                        
                    if (MI.getOpcode() == CALL64r)
                    {//call reg1
                        MCPhysReg reg1 = MI.getOperand(0).getReg();
                        MII--;
                        if (!checkCFIFun(*MII))
                        {
                            MII++;
                            continue;
                        }
                        
                        MII--;
                        MachineInstr &MI1 = *MII;
                        MCPhysReg reg2 = MI1.getOperand(0).getReg();
                        const TargetInstrInfo *TII;
                        DebugLoc DL = MI1.getDebugLoc();
                        TII = MF.getSubtarget().getInstrInfo();
                        
                        //mov reg2, reg1
                        MachineInstr &tmpMI = *BuildMI(MBB, MII, DL, TII->get(MOV64rr)).addReg(reg2).addReg(reg1);
                        
                        MII++;MII++;
                        MBB.erase(&MI1);
                    }
                    if (MI.getOpcode() == CALL64m)
                    {//call [reg1]
                        MCPhysReg reg1 = MI.getOperand(0).getReg();
                        int64_t imm = MI.getOperand(3).getImm();
                        MII--;
                        if (!checkCFIFun(*MII))
                        {
                            MII++;
                            continue;
                        }
                        MII--;
                        MachineInstr &MI1 = *MII;
                        MCPhysReg reg2 = MI1.getOperand(0).getReg();
                        const TargetInstrInfo *TII;
                        DebugLoc DL = MI1.getDebugLoc();
                        TII = MF.getSubtarget().getInstrInfo();

                        //mov reg2, [reg1]
                        MachineInstr &tmpMI = *BuildMI(MBB, MI, DL, TII->get(X86::MOV64rm)).addReg(reg2).addReg(reg1).addImm(1).addReg(0).addImm(imm).addReg(0);
                        
                        MII++;MII++;
                        MBB.erase(&MI1);
                    }
                }
            }
            return true;
        }

        //插入地址检查Fun
        bool insertCFIFun(MachineFunction &MF)
        {
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock &MBB = *MBBI;
                for (auto MII = MBB.begin(); MII != MBB.end(); MII++)
                {
                    MachineInstr &MI = *MII;
                    if (hasTransactionBegin == true && needTsxInsert == true)
                    {
                        MII--;MII--;
                    }
                    if (MI.getOpcode() == CALL64r)
                    {//call reg
                        const TargetInstrInfo *TII;
                        DebugLoc DL = MI.getDebugLoc();
                        TII = MF.getSubtarget().getInstrInfo();
                        MCPhysReg reg = MI.getOperand(0).getReg();
                        //mov RDI, reg
                        MachineInstr &tmpMI = *BuildMI(MBB, *MII, DL, TII->get(MOV64rr)).addReg(RDI).addReg(reg);
                        //callq CFICheck
                        MachineInstr &tmpMI1 = *BuildMI(MBB, *MII, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(CFICheckGV);
                    }
                    else if (MI.getOpcode() == CALL64m)
                    {//call [reg]
                        const TargetInstrInfo *TII;
                        DebugLoc DL = MI.getDebugLoc();
                        TII = MF.getSubtarget().getInstrInfo();
                        MCPhysReg reg = MI.getOperand(0).getReg();
                        int64_t imm = MI.getOperand(3).getImm();

                        //mov RDI, [reg]
                        MachineInstr &tmpMI = *BuildMI(MBB, *MII, DL, TII->get(X86::MOV64rm)).addReg(RDI).addReg(reg).addImm(1).addReg(0).addImm(imm).addReg(0);
                        //callq CFICheck
                        MachineInstr &tmpMI1 = *BuildMI(MBB, *MII, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(CFICheckGV);
                    }
                    if (hasTransactionBegin == true && needTsxInsert == true)
                    {
                        MII++;MII++;
                    }
                }
            }
            return true;
        }

        //获取exit函数的GlobaValue指针（未使用）
        void getExitGV(MachineFunction &MF)
        {
            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                MachineBasicBlock &MBB = *MBBI;
                for (auto MII = MBB.begin(); MII != MBB.end(); MII++)
                {
                    MachineInstr &MI = *MII;
                    if (MI.getOpcode() == CALL64pcrel32)
                    {
                        MachineOperand MO = MI.getOperand(0);
                        const GlobalValue* GV = MO.getGlobal();
                        
                        if (GV->getName() == "exit")
                        {
                            exitGV = MO.getGlobal();
                        }
                    }
                }
            }
        }

        static bool FindMemoryOperand(const MachineInstr &MI, SmallVectorImpl<unsigned>* indices)
        {
          int NumFound = 0;
          for (unsigned i = 0; i < MI.getNumOperands();) {
            if (isMem(MI, i)) {
              NumFound++;
              indices->push_back(i);
              i += X86::AddrNumOperands;
            } else {
              i++;
            }
          }

          if (NumFound == 0)
            return false;
          return true;
        }

        //找到store指令并插桩,检查store目标是否合法，不合法则跳转
        bool movInsert(MachineFunction &MF)
        {
            bool hasStore = false;
            const TargetInstrInfo *TII;

            TII = MF.getSubtarget().getInstrInfo();
            MachineBasicBlock &MBBf = MF.front();
            const MachineBasicBlock *NonEmpty = MBBf.empty() ? MBBf.getFallThrough() : &MBBf;
            const DebugLoc &DL = NonEmpty->front().getDebugLoc();

            MachineBasicBlock* Trap = MF.CreateMachineBasicBlock();
            Trap->setLabelMustBeEmitted();
            //popfq
            BuildMI(Trap, DL, TII->get(X86::POPF64));
            //popq %rax
            BuildMI(Trap, DL, TII->get(X86::POP64r)).addReg(RAX);
            //popq %rbx
            BuildMI(Trap, DL, TII->get(X86::POP64r)).addReg(RBX);
            //movl $-1, %edi
            BuildMI(Trap, DL, TII->get(X86::MOV32ri)).addReg(EDI).addImm(0xFFFFFFFF);
            //callq exit
            BuildMI(Trap, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(exitGV);
            MF.push_back(Trap);

            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                for (auto MII = (*MBBI).begin(); MII != (*MBBI).end(); MII++)
                {
                    MachineInstr &MI = *MII;                    
                    if (MI.mayStore() == false)
                    {
                        continue;
                    }
                    else
                    {
                        hasStore = true;
                    }

                    SmallVector<unsigned, 2> MemOps;
                    if (FindMemoryOperand(MI, &MemOps))
                    {
                        for (unsigned MemOp : MemOps)
                        {
                            MachineOperand &BaseReg = MI.getOperand(MemOp + 0);
                            MachineOperand &Scale = MI.getOperand(MemOp + 1);
                            MachineOperand &IndexReg = MI.getOperand(MemOp + 2);
                            MachineOperand &Disp = MI.getOperand(MemOp + 3);
                            MachineOperand &SegmentReg = MI.getOperand(MemOp + 4);

                            //检查是否为全局指针
                            if (!Disp.isImm())
                            {
                                continue;
                            }

                            //pushq %rbx
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::PUSH64r)).addReg(X86::RBX);
                            //pushq %rax
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::PUSH64r)).addReg(X86::RAX);
                            //pushfq
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::PUSHF64));
                            if (Disp.isImm())
                            {
                                //leaq (BaseReg+Disp*IndexReg), %rax
                                MachineInstr &tmpMI = *BuildMI(*MBBI, *MII, DL, TII->get(X86::LEA64r)).addReg(X86::RAX).addReg(BaseReg.getReg()).addImm(Scale.getImm()).addReg(IndexReg.getReg()).addImm(Disp.getImm()).addReg(SegmentReg.getReg());
                            }
                            else
                            {
                                //leaq (BaseReg+Disp*IndexReg), %rax
                                MachineInstr &tmpMI1 = *BuildMI(*MBBI, *MII, DL, TII->get(X86::LEA64r)).addReg(X86::RAX).addReg(BaseReg.getReg()).addImm(Scale.getImm()).addReg(IndexReg.getReg()).addGlobalAddress(Disp.getGlobal()).addReg(SegmentReg.getReg());
                            }
                            
                            
                            //检查下界，如果rbx>rax，则exit
                            //movq $0x3FFFFFFFFFFFFFFF, %rbx
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::MOV64ri)).addReg(X86::RBX).addImm(0x3FFFFFFFFFFFFFFF);
                            //cmpq %rbx, %rax
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::CMP64rr)).addReg(X86::RAX).addReg(X86::RBX);
                            //ja trap
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::JCC_1)).addMBB(Trap).addImm(7);
                            
                            //检查上界，如果rbx<rax，则exit
                            //movq $0x4FFFFFFFFFFFFFFF, %rbx
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::MOV64ri)).addReg(X86::RBX).addImm(0x4FFFFFFFFFFFFFFF);
                            //cmpq %rbx, %rax
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::CMP64rr)).addReg(X86::RAX).addReg(X86::RBX);
                            //jb trap
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::JCC_1)).addMBB(Trap).addImm(2);

                            
                            //popfq
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::POPF64));
                            //popq %rax
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::POP64r)).addReg(RAX);
                            //popq %rbx
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::POP64r)).addReg(RBX);
                            
                            MBBI->addSuccessorWithoutProb(Trap);
                        }
                    }
                }
            }
            if (hasStore == false)
            {
                MF.erase(Trap);
            }
            
            return hasStore;
        }

        //找到修改rsp指令并插桩,检查rsp被修改后是否合法，不合法则跳转
        bool rspInsert(MachineFunction &MF)
        {
            bool hasRsp = false;
            const TargetInstrInfo *TII;
            TII = MF.getSubtarget().getInstrInfo();
            MachineBasicBlock &MBBf = MF.front();
            const MachineBasicBlock *NonEmpty = MBBf.empty() ? MBBf.getFallThrough() : &MBBf;
            const DebugLoc &DL = NonEmpty->front().getDebugLoc();

            MachineBasicBlock* Trap = MF.CreateMachineBasicBlock();
            Trap->setLabelMustBeEmitted();
            //popq %rax
            BuildMI(Trap, DL, TII->get(X86::POP64r)).addReg(X86::RAX);
            //movq $-1, %edi
            BuildMI(Trap, DL, TII->get(X86::MOV32ri)).addReg(X86::EDI).addImm(0xFFFFFFFF);
            //callq exit
            BuildMI(Trap, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(exitGV);
            MF.push_back(Trap);

            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                for (auto MII = MBBI->begin(); MII != MBBI->end(); MII++)
                {
                    if (!((MII->readsWritesVirtualRegister(X86::RSP).second && !MII->hasRegisterImplicitUseOperand(X86::RSP)) || (MII->readsWritesVirtualRegister(X86::ESP).second && !MII->hasRegisterImplicitUseOperand(X86::ESP))))
                    {
                        continue;
                    }
                    else
                    {
                        hasRsp = true;
                    }
                    
                    bool isMovRbpRsp = ((MII->getOpcode() == X86::MOV64rr) ? (MII->getOperand(1).getReg() == X86::RBP) : false);
                    MCPhysReg checkReg = isMovRbpRsp ? X86::RBP : X86::RSP;
                    if (!isMovRbpRsp)
                    {
                        MII++;
                    }
                    //pushq %rax
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::PUSH64r)).addReg(X86::RAX);

                    //检查下界，如果imm>rsp，则exit
                    //movq $0x5FFFFFFFFFFFFFFF, %rax
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::MOV64ri)).addReg(X86::RAX).addImm(0x5FFFFFFFFFFFFFFF);
                    //cmpq %rax, %rsp
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::CMP64rr)).addReg(checkReg).addReg(X86::RAX);
                    //ja trap
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::JCC_1)).addMBB(Trap).addImm(7);

                    //检查上界，如果imm<rsp，则exit
                    //movq $0x6FFFFFFFFFFFFFFF, %rax
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::MOV64ri)).addReg(X86::RAX).addImm(0x6FFFFFFFFFFFFFFF);
                    //cmpq %rax, %rsp
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::CMP64rr)).addReg(checkReg).addReg(X86::RAX);
                    //jb trap
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::JCC_1)).addMBB(Trap).addImm(2);

                    //popq %rax
                    BuildMI(*MBBI, *MII, DL, TII->get(X86::POP64r)).addReg(X86::RAX);

                    MBBI->addSuccessorWithoutProb(Trap);
                    if (!isMovRbpRsp)
                    {
                        MII--;
                    }
                }
            }
            if (hasRsp == false)
            {
                MF.erase(Trap);
            }
            
            return hasRsp;
        }

        bool wrapperTsxInsert(MachineFunction &MF)
        {
            const TargetInstrInfo *TII;
            TII = MF.getSubtarget().getInstrInfo();
            MachineBasicBlock &MBBf = MF.front();
            const MachineBasicBlock *NonEmpty = MBBf.empty() ? MBBf.getFallThrough() : &MBBf;
            const DebugLoc &DL = NonEmpty->front().getDebugLoc();
            auto MBBI = MF.begin();
            //movq %r15, %rax
            BuildMI(*MBBI, MBBI->begin(), DL, TII->get(MOV64rr)).addReg(X86::RAX).addReg(X86::R15);
            //xend
            BuildMI(*MBBI, MBBI->begin(), DL, TII->get(X86::XEND));
            auto MII = MBBI->end();
            MII--;
            //movq %rax, %r15
            BuildMI(*MBBI, *MII, DL, TII->get(MOV64rr)).addReg(X86::R15).addReg(X86::RAX);
            //callq transactionBegin
            BuildMI(*MBBI, *MII, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(transactionBeginGV);
        }

        bool normalTsxInsert(MachineFunction &MF)
        {
            string funName = MF.getFunction().getName().str();
            const TargetInstrInfo *TII;
            TII = MF.getSubtarget().getInstrInfo();
            MachineBasicBlock &MBBf = MF.front();
            const MachineBasicBlock *NonEmpty = MBBf.empty() ? MBBf.getFallThrough() : &MBBf;
            const DebugLoc &DL = NonEmpty->front().getDebugLoc();

            for (auto MBBI = MF.begin(); MBBI != MF.end(); MBBI++)
            {
                if (!(funName == mainFunName && MBBI == MF.begin()))
                {
                    //movq %r15, %rax
                    BuildMI(*MBBI, MBBI->begin(), DL, TII->get(MOV64rr)).addReg(X86::RAX).addReg(X86::R15);
                    //xend
                    BuildMI(*MBBI, MBBI->begin(), DL, TII->get(X86::XEND));
                }
                for (auto MII = MBBI->begin(); MII != MBBI->end(); MII++)
                {
                    if (MII->isBranch() || MII->isCall())
                    {
                        //movq %rax, %r15
                        BuildMI(*MBBI, *MII, DL, TII->get(MOV64rr)).addReg(X86::R15).addReg(X86::RAX);
                        //callq transactionBegin
                        BuildMI(*MBBI, *MII, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(transactionBeginGV);
                        MII++;
                        if (MII == MBBI->end())
                        {
                            MII--;
                            if(MII->isBranch() && MII->getOperand(0).isMBB())
                            {
                                MachineBasicBlock* MBB = MII->getOperand(0).getMBB();
                                MBB->setLabelMustBeEmitted();
                            }
                            MII++;

                            //xend
                            BuildMI(*MBBI, MBBI->end(), DL, TII->get(X86::XEND));
                            //movq %r15, %rax
                            BuildMI(*MBBI, MBBI->end(), DL, TII->get(MOV64rr)).addReg(X86::RAX).addReg(X86::R15);
                        }
                        else
                        {
                            //xend
                            BuildMI(*MBBI, *MII, DL, TII->get(X86::XEND));
                            //movq %r15, %rax
                            BuildMI(*MBBI, *MII, DL, TII->get(MOV64rr)).addReg(X86::RAX).addReg(X86::R15);
                        }
                        MII--;
                    }
                    else if(MII->isReturn() && funName != mainFunName)
                    {
                        //movq %rax, %r15
                        BuildMI(*MBBI, *MII, DL, TII->get(MOV64rr)).addReg(X86::R15).addReg(X86::RAX);
                        //callq transactionBegin
                        BuildMI(*MBBI, *MII, DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(transactionBeginGV);
                    }
                    else
                    {
                        continue;
                    }
                }
                if (!MBBI->isReturnBlock())
                {
                    auto MII = MBBI->end();
                    MII--;
                    if(MII->isBranch() && MII->getOperand(0).isMBB())
                    {
                       MachineBasicBlock* MBB = MII->getOperand(0).getMBB();
                       MBB->setLabelMustBeEmitted();
                    }
                    //movq %rax, %r15
                    BuildMI(*MBBI, MBBI->end(), DL, TII->get(MOV64rr)).addReg(X86::R15).addReg(X86::RAX);
                    //callq transactionBegin
                    BuildMI(*MBBI, MBBI->end(), DL, TII->get(X86::CALL64pcrel32)).addGlobalAddress(transactionBeginGV);
                }
                MBBI++;
                if (MBBI != MF.end())
                {
                    MBBI->setLabelMustBeEmitted();
                }
                MBBI--;
            }
            return true;
        }
        
        bool tsxInsert(MachineFunction &MF)
        {
            if (MF.getFunction().getName().str().find("wrapper_by_compiler_") != string::npos)
            {
                wrapperTsxInsert(MF);
            }
            else
            {
                normalTsxInsert(MF);
            }
        }

        void printEntrylabel(const Module &M)
        {
            const string sourceName = M.getName().str();
            int pos = sourceName.find(".", 0);
            string name = sourceName.substr(0, pos) + ".txt";
            std::ofstream file(name);
            for (auto FI = M.begin(); FI != M.end(); FI++)
            {
                const Function &F = *FI;
                pos = F.getName().str().find(".", 0);
                if (pos != -1)
                {
                    string isllvm =  F.getName().str().substr(0, pos);
                    if (isllvm == "llvm")
                    {
                        continue;
                    }
                }
                file << F.getName().str() << "\n";
            }
            file.close();
        }
        
        //获取CFICheck和exit函数的GlobaValue指针
        void findCFICheckExitTrsactionBegin(const Module &M)
        {
            for (auto FI = M.begin(); FI != M.end(); FI++)
                {
                    if (hasCFICheck == false && FI->getName().str().find("CFICheck") != string::npos)
                    {
                        const Function &F = *FI;
                        CFICheckGV = &F;
                        hasCFICheck = true;
                        outs() << "Found CFICheck\n";
                    }
                    else if (hasExit == false && FI->getName().str().find("exit") != string::npos)
                    {
                        const Function &F = *FI;
                        exitGV = &F;
                        hasExit = true;
                        outs() << "Found exit\n";
                    }
                    else if (hasTransactionBegin == false && FI->getName().str().find("transactionBegin") != string::npos)
                    {
                        const Function &F = *FI;
                        transactionBeginGV = &F;
                        hasTransactionBegin = true;
                        outs() << "Found transactionBegin\n";
                    }
                }
        }
        
        virtual bool runOnMachineFunction(MachineFunction &MF) {
            bool bm = false, bs = false, bc = false, br = false, bt = false;
            bool needCFI = false, needShadowStack = false, needTsx = false, needRsp = false, needMov = false, needExit = false;
            string funName = MF.getFunction().getName().str();
            needTsx = ((funName.find("CFICheck") != string::npos) || (funName.find("transactionBegin") != string::npos)) ? false : true;
            needMov = (funName.find("transactionBegin") != string::npos) ? false : true;
            needShadowStack = (funName.find("transactionBegin") != string::npos) ? false : true;
            needRsp = (funName.find("transactionBegin") != string::npos) ? false : true;
            needCFI = (funName.find("transactionBegin") != string::npos) ? false : true;
            needTsx = needTsx && needTsxInsert;
            needMov = needMov && needMovInsert;
            needCFI = needCFI && needCFIInsert;
            needShadowStack = needShadowStack && needShadowStackInsert;
            needRsp = needRsp && needRspInsert;
            needExit = needShadowStack || needRsp || needMov;
            outs() << MF.getFunction().getParent()->getName() << "\n";

            if ((hasExit == false && needExit == true) || (hasCFICheck == false && needCFI == true) || (hasTransactionBegin == false && needTsx == true))
            {
                const Function &FF = MF.getFunction();
                const Module &M = *FF.getParent();
                findCFICheckExitTrsactionBegin(M);
            }

            if (needCFI == true && entryLabelPrinted == false)
            {
                const Function &FF = MF.getFunction();
                const Module &M = *FF.getParent();
                printEntrylabel(M);
                entryLabelPrinted = true;
            }
            
            if (hasTransactionBegin == true && needTsx == true)
            {
                bt = tsxInsert(MF);
            }
            else
            {
                string str = needTsx ? "Cannot find trsactionbegin.\n" : "Donot need tsxInsert.\n";
                outs() << str;
            }

            if (hasExit == true)
            {
                if (needMov == true)
                {
                    bm = movInsert(MF);
                }
                else
                {
                    outs() << "Donot need movInsert.\n";
                }
                if (needShadowStack == true)
                {
                    bs = insertShadowStackInst(MF);
                }
                else
                {
                    outs() << "Donot need ShadowStack.\n";
                }
                if (needRsp == true)
                {
                    br = rspInsert(MF);
                }
                else
                {
                    outs() << "Donot need rspInsert.\n";
                }
            }
            else
            {
                string str = needExit ? "Cannot find Exit.\n" : "Donot need rspInsert, movInsert and ShadowStack.\n";
                outs() << str;
            }
            
            if (hasCFICheck == true && needCFI == true)
            {
                bc = insertCFIFun(MF);
            }
            else
            {
                string str = needCFI ? "Cannot find CFICheck.\n" : "Donot need CFICheck.\n";
                outs() << str;
            }
            
            return bm || bc || bs || br || bt;
        }
    };
}

namespace llvm {
FunctionPass *createX86ShadowStackCFIPass(){
    return new X86ShadowStackCFIPass();
}
}

char X86ShadowStackCFIPass::ID = 0;
static RegisterPass<X86ShadowStackCFIPass> X("X86ShadowStackCFIPass", "X86ShadowStackCFIPass");