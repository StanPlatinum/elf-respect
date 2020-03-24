#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/IR/LLVMContext.h"
#include <llvm/IR/PassManager.h>
#include <llvm/IR/CallingConv.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/IRBuilder.h>
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRPrintingPasses.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/MathExtras.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/LineIterator.h"
#include "llvm/Support/FileSystem.h"
#include <string>
#include <vector>
#include <fstream>

using namespace llvm;
using namespace std;

#define DEBUG_TYPE "hello"
 
namespace {
  class CFIHello : public ModulePass {
      map<string, Function*> wrapperMap;
  public:
    static char ID; // Pass identification, rep lacement for typeid
    CFIHello() : ModulePass(ID) {}

    //打印每个Fun的entry的label到文件。
    void printEntryLable(Function &F, std::ofstream &file)
    {
        //string MName = F.getParent()->getSourceFileName();
        //MName.erase(MName.end() - 3, MName.end());
        file << F.getName().str() << "\n";
    }

    //插入一个全新的Fun并添加调用
    void insertNewFunc(Module &M)
    {
        LLVMContext &ctx = M.getContext();
        FunctionCallee FCe = M.getOrInsertFunction("mul_add", Type::getVoidTy(ctx), Type::getInt32Ty(ctx));
        Function* mul_add = cast<Function>(FCe.getCallee()->stripPointerCasts());
    
        Function::arg_iterator args = mul_add->arg_begin();
        Value* x = args++;
        x->setName("x");
        Value* y = args++;
        y->setName("y");
        Value* z = args++;
        z->setName("z");

        BasicBlock* block = BasicBlock::Create(ctx, "entry", mul_add);
        IRBuilder<> builder(block);
        Value* tmp = builder.CreateBinOp(Instruction::Mul, x, x, "tmp");
        Value* tmp2 = builder.CreateBinOp(Instruction::Add, tmp, x, "tmp2");builder.CreateRetVoid();

        Module::iterator F = M.begin();
        Function::iterator BB = F->begin();
        BasicBlock::iterator II = BB->begin();
        ArrayRef< Value* > arguments(ConstantInt::get(Type::getInt32Ty(M.getContext()), 5, true));
        CallInst *newInst = CallInst::Create(mul_add, arguments, "");
        BB->getInstList().insert(II, newInst); 
    }

    //找到indirectcall并调用检查Fun
    bool insertCFIFun(Module &M, string funName)
    {
        bool b = false;
        LLVMContext &ctx = M.getContext();
        FunctionCallee hookFunc = M.getOrInsertFunction(funName, Type::getVoidTy(ctx), Type::getInt64Ty(ctx));
        Function* hook= cast<Function>(hookFunc.getCallee()->stripPointerCasts());
        for(Module::iterator FI = M.begin(); FI != M.end(); ++FI)
        {
            //errs() << FI->getName();
            if (FI->getName() == hook->getName())
                continue;
            for(Function::iterator BBI = FI->begin(); BBI != FI->end(); ++BBI)
            {
                for(BasicBlock::iterator II = BBI->begin(); II != BBI->end(); ++II)          
                {
                    // if (isa<IndirectBrInst>(&(*II)))
                    // {
                    //     errs() << "!!!\n";
                    //     IndirectBrInst *IdI = dyn_cast<IndirectBrInst>(II);
                    //     IdI->print(errs());
                    // }
                    

                    if(isa<CallInst>(&(*II)))
                    {
                        CallInst *CI = dyn_cast<CallInst>(II);
                        if (CI->isIndirectCall())
                        {
                            // Instruction *III = dyn_cast<Instruction>(CI->getOperand(0));
                            // III->print(errs());
                            // errs() << "\n";
                            // for (int i = 0; i < III->getNumOperands(); i++)
                            // {
                            //     III->getOperand(i)->print(errs());
                            //     errs() << "\n";
                            // }
                            // errs() << "!!!\n";
                            // for (BasicBlock::iterator IIII = BBI->begin(); IIII != BBI->end(); ++IIII)
                            // {
                            //     if (IIII->getOperand(0) == III->getOperand(0))
                            //     {
                            //         IIII--;
                            //         for (int i = 0; i < IIII->getNumOperands(); i++)
                            //         {
                            //             IIII->getOperand(i)->print(errs());
                            //             errs() << "!!!\n";
                            //         }
                            //         break;
                            //     }
                            // }
                            const long long i = 0x1111111111111111;
                            ArrayRef<Value *> arguments(ConstantInt::get( Type::getInt64Ty(M.getContext()), i, true));
                            CallInst *newInst = CallInst::Create(hook, arguments, "");
                            BBI->getInstList().insert(II, newInst);
                            II->print(errs());
                            b = true;
                        }
                    }
                }
            }
        }
        return b;
    }

    bool insertPrintf(Module &M)
    {
        LLVMContext &context = M.getContext();
        for (Module::iterator FI = M.begin(); FI != M.end(); FI++)
        {
            Function::iterator BBI = FI->begin();
            if (BBI == FI->end())
            {
                continue;
            }
            Instruction &I = BBI->front();
            Instruction *inst = &I;
            IRBuilder<> builder(inst);
            Value *formatStr = builder.CreateGlobalStringPtr("analysis: " + FI->getName().str() + "\n");
            std::vector<llvm::Type *> args;
            args.push_back(llvm::Type::getInt8PtrTy(context));
            // accepts a char*, is vararg, and returns int
            llvm::FunctionType *printfType = llvm::FunctionType::get(builder.getInt32Ty(), args, true);
            llvm::FunctionCallee printfFunc = M.getOrInsertFunction("printf", printfType);

            std::vector<llvm::Value *> values;
            values.push_back(formatStr);
            builder.CreateCall(printfFunc, values);
        }
        return true;
    }

    unsigned getAlignmentByType(Type *Ty)
    {
      if (Ty->isIntegerTy()) {
        return cast<IntegerType>(Ty)->getBitWidth() / 8;
      }
      if (Ty->isFloatTy()) {
        return 4;
      }
      if (Ty->isDoubleTy()) {
        return 8;
      }
      return 1;
    }

    void readFunNeedWrapperListFile(string fileName)
    {
        ifstream file(fileName);
        string line;
        if (file)
        {
            while (getline(file, line))
            {
                wrapperMap[line] = NULL;
            }
        }
        else
        {
            errs() << "No file: " << fileName << "\n";
        }
    }

    void paddingWrapper(Function* n_fun, Module &M, string oldFunName)
    {
        LLVMContext &ctx = M.getContext();
        //Function *n_fun = *it;
        BasicBlock* label_entry = BasicBlock::Create(ctx, "entry", n_fun, 0);
        // Get argument list
        std::vector<AllocaInst*> allocinst_list;
        for (Function::arg_iterator n_args = n_fun->arg_begin(); n_args != n_fun->arg_end(); ++n_args)
        {
            StringRef ptr_name(n_args->getName().str() + ".addr");

            AllocaInst* ptr_addr = new AllocaInst(n_args->getType(), 0, ptr_name.str(), label_entry);
            unsigned align = getAlignmentByType(n_args->getType());
            ptr_addr->setAlignment(align);
            allocinst_list.push_back(ptr_addr);
        }

        std::vector<AllocaInst*>::iterator alloc_it;
        alloc_it = allocinst_list.begin();
        for (Function::arg_iterator args = n_fun->arg_begin(); args != n_fun->arg_end(); ++args)
        {
            AllocaInst *allocinst = *alloc_it;
            StoreInst* store = new StoreInst(args, allocinst, false, label_entry);
            unsigned align = getAlignmentByType(args->getType());
            store->setAlignment(align);
            alloc_it++;
        }

        std::vector<Value*> call_params;
        alloc_it = allocinst_list.begin();
        for (Function::arg_iterator args = n_fun->arg_begin(); args != n_fun->arg_end(); ++args)
        {
            // Load
            AllocaInst *allocinst = *alloc_it;
            LoadInst* load = new LoadInst(allocinst, "", false, label_entry);
            unsigned align = getAlignmentByType(args->getType());
            load->setAlignment(align);
            call_params.push_back(load);
            alloc_it++;
        }
        Function* callee = M.getFunction(StringRef(oldFunName));
        CallInst* call = CallInst::Create(callee, call_params, "", label_entry);
        call->setCallingConv(CallingConv::C);
        call->setTailCall(false);
        AttributeList call_PAL;
        call->setAttributes(call_PAL);

        Type *ret_type = n_fun->getReturnType();
        if (!ret_type->isVoidTy())
        {
            // Return based on the return type
            ReturnInst::Create(ctx, call, label_entry);
        }
        else
        {
            // Return void
            ReturnInst::Create(ctx, label_entry);
        }
    }
    
    void makeWrapper(Module &M)
    {
        LLVMContext &ctx = M.getContext();
        int funNum = 0;
        for (auto FI = M.begin(); FI != M.end(); FI++)
        {
            funNum++;
        }
        for (auto FI = M.begin(); funNum > 0; FI++)
        {
            funNum--;
            string funName = FI->getName().str();
            if (wrapperMap.find(funName) == wrapperMap.end())
            {
                continue;
            }
            FunctionCallee nFCe = M.getOrInsertFunction(("wrapper_by_compiler_" + FI->getName().str()), FI->getFunctionType(), FI->getAttributes());
            //FunctionCallee nFCe = M.getOrInsertFunction(("wrapper_by_compiler_" + FI->getName().str()), FI->getFunctionType());
            Function* wrapperFun = cast<Function>(nFCe.getCallee()->stripPointerCasts());
            Attribute attr = Attribute::get(ctx, Attribute::NoUnwind);
            wrapperFun->addFnAttr(attr);
            //wrapperFun->stealArgumentListFrom(*FI);
            paddingWrapper(wrapperFun, M, funName);
            wrapperMap[funName] = wrapperFun;
        }
    }

    void callWrapper(Module &M)
    {
        for(Module::iterator FI = M.begin(); FI != M.end(); ++FI)
        {
            if (FI->getName().str().find("wrapper_by_compiler_") != string::npos)
            {
                continue;
            }
            for(Function::iterator BBI = FI->begin(); BBI != FI->end(); ++BBI)
            {
                for(BasicBlock::iterator II = BBI->begin(); II != BBI->end(); ++II)
                {
                    if(isa<CallInst>(&(*II)))
                    {
                        CallInst *CI = dyn_cast<CallInst>(II);
                        if (CI->isIndirectCall())
                        {
                            continue;
                        }
                        Function *oFun = CI->getCalledFunction();
                        string oldFunName = oFun->getName().str();
                        if (wrapperMap.find(oldFunName) == wrapperMap.end())
                        {
                            continue;
                        }
                        CI->setCalledFunction(wrapperMap[oldFunName]);
                    }
                }
            }
        }
    }

    bool runOnModule(Module &M) override {
        if (!(M.getName().str() == "CFICheck.c" || M.getName().str() == "transactionBegin.c"))
        {   
            readFunNeedWrapperListFile("fun_need_wrapper_list");
            makeWrapper(M);
            callWrapper(M);
        }
        LLVMContext &ctx = M.getContext();
        FunctionCallee funDeclareCFICheck = M.getOrInsertFunction("CFICheck", Type::getVoidTy(ctx), Type::getInt64Ty(ctx));
        FunctionCallee funDeclareExit = M.getOrInsertFunction("exit", Type::getVoidTy(ctx), Type::getInt32Ty(ctx));
        FunctionCallee funDeclareTransactionBegin = M.getOrInsertFunction("transactionBegin", Type::getVoidTy(ctx));
        return true;
    }
  };
}

char CFIHello::ID = 0;
static RegisterPass<CFIHello> X("cfihello", "CFI Pass");

static void registerCFIHello(const PassManagerBuilder &,
                                llvm::legacy::PassManagerBase &PM) {
       PM.add(new CFIHello());
}

static RegisterStandardPasses
    RegisterCFIHello0(PassManagerBuilder::EP_EnabledOnOptLevel0,
                          registerCFIHello);

static RegisterStandardPasses
    RegisterCFIHello(PassManagerBuilder::EP_ModuleOptimizerEarly,
                          registerCFIHello);