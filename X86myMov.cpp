#include "X86.h"
#include "X86InstrInfo.h"
#include "X86Subtarget.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include <iostream>

using namespace llvm;
using namespace std;

namespace{
  struct X86myMov: public MachineFunctionPass{
    public:
      static char ID;
      X86myMov(): MachineFunctionPass(ID) {}
      bool runOnMachineFunction(MachineFunction &MF) override;

      const TargetInstrInfo *TII;
      MachineRegisterInfo *MRI;
  };
  char X86myMov::ID = 0;
}


static bool FindMemoryOperand(const MachineInstr &MI, SmallVectorImpl<unsigned>* indices) {
  int NumFound = 0;
  for (unsigned i = 0; i < MI.getNumOperands(); ) {
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


bool X86myMov::runOnMachineFunction(MachineFunction &Func){
  printf("\nX86myMov work\n");
  printf("Func: %s\n", Func.getName().data());
  
  TII = Func.getSubtarget().getInstrInfo();
  MRI = &Func.getRegInfo();

  for (MachineFunction::iterator MBB = Func.begin(), MBB_end = Func.end(); MBB != MBB_end; MBB++){
    for (MachineBasicBlock::iterator MBBI = (*MBB).begin(), MBBI_end = (*MBB).end(); MBBI != MBBI_end; MBBI++){
      MachineInstr &MI = *MBBI;
      printf("opcode = %d, operandNo = %d, mayStore = %d, memoryNo = %d\n", MI.getOpcode(), MI.getNumOperands(), MI.mayStore(), MI.getNumMemOperands());

      if (MI.mayStore() == false)
        continue;

      SmallVector<unsigned, 2> MemOps;
      if (FindMemoryOperand(MI, &MemOps)){

        for (unsigned MemOp: MemOps){
          MachineOperand &BaseReg  = MI.getOperand(MemOp + 0);
          MachineOperand &Scale = MI.getOperand(MemOp + 1);
          MachineOperand &IndexReg  = MI.getOperand(MemOp + 2);
          MachineOperand &Disp = MI.getOperand(MemOp + 3);
          MachineOperand &SegmentReg = MI.getOperand(MemOp + 4);

          DebugLoc DL = MI.getDebugLoc();

          BuildMI(*MBB, *MBBI, DL, TII->get(X86::LEA64r)).addReg(X86::RAX).addReg(BaseReg.getReg()).addImm(Scale.getImm()).addReg(IndexReg.getReg()).addImm(Disp.getImm()).addReg(SegmentReg.getReg());
 
          BuildMI(*MBB, *MBBI, DL, TII->get(X86::CMP64rr)).addReg(X86::RAX).addImm(12121);
          BuildMI(*MBB, *MBBI, DL, TII->get(X86::CMP64rr)).addReg(X86::RAX).addImm(12121);
        }
      }
    }
  }
  
  return true;
}


FunctionPass *llvm::createX86myMov() { return new X86myMov();}
