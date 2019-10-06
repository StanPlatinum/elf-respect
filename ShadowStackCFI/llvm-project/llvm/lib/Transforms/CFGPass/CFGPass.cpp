#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include "llvm/IR/Module.h"
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/User.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Pass.h>
#include <fstream>
#include <llvm/Analysis/CFG.h>
#include <stdio.h>
#include <map>
#include <iostream>
using namespace llvm;

void outPutBbIns(BasicBlock *bb)
{
    std::cout << bb->getName().str() << std::endl;
    for (auto iter = bb->begin(); iter != bb->end(); iter++)
    {
        Instruction &i = *iter;
        std::cout << "Instruction: " << i.getOpcodeName();
        int oprandCount = i.getNumOperands();
        for (int j = 0; j < oprandCount; j++)
        {
            std::cout << " " << i.getOperand(j) << " " << i.getOperand(j)->getValueName() << "";
        }
        std::cout << std::endl;
    }
}

namespace {
	struct CFGPass : public FunctionPass {
		static char ID;
		std::error_code error;
		std::string str;
		std::map<BasicBlock*, int> basicBlockMap;
		int bbCount;
		CFGPass() : FunctionPass(ID){
			bbCount = 0;
		}

		bool runOnFunction(Function &F) override {
			std::cout << F.getParent()->getName().str() << " " << F.getName().str() << " " << F.getValueName() << std::endl;
			raw_string_ostream rso(str);
			StringRef name(F.getName().str() + ".dot");
			
			enum sys::fs::OpenFlags F_None;
			raw_fd_ostream file(name, error, F_None);
			file << "digraph \"CFG for'" + F.getName() + "\' function\" {\n";
			for (Function::iterator B_iter = F.begin(); B_iter != F.end(); ++B_iter){
				BasicBlock* curBB = &*B_iter;
				std::string name = curBB->getName().str();
				int fromCountNum;
				int toCountNum;
				if (basicBlockMap.find(curBB) != basicBlockMap.end())
				{
					outPutBbIns(curBB);
					fromCountNum = basicBlockMap[curBB];
				}
				else
				{
					fromCountNum = bbCount;
					basicBlockMap[curBB] = bbCount++;
				}

				file << "\tBB" << fromCountNum << " [shape=record, label=\"{";
				file << "BB" << fromCountNum << ":\\l\\l";
				for (BasicBlock::iterator I_iter = curBB->begin(); I_iter != curBB->end(); ++I_iter) {
					//printInstruction(&*I_iter, os);
					file << *I_iter << "\\l\n";
				}
				file << "}\"];\n";
				for (BasicBlock *SuccBB : successors(curBB)){
					if (basicBlockMap.find(SuccBB) != basicBlockMap.end())
					{
						outPutBbIns(SuccBB);
						toCountNum = basicBlockMap[SuccBB];
					}
					else
					{
						toCountNum = bbCount;
						basicBlockMap[SuccBB] = bbCount++;
					}

					file << "\tBB" << fromCountNum<< "-> BB"
						<< toCountNum << ";\n";
				}
			}
			file << "}\n";
			file.close();
			return false;
		}
	};
}
char CFGPass::ID = 0;
static RegisterPass<CFGPass> X("CFG", "CFG Pass Analyse",
	false, false
);

