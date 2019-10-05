#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/LoopPass.h" 
 
using namespace llvm;
using namespace std;
 
#define DEBUG_TYPE "countblocks"
 
namespace {
    struct BBinLoops : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    BBinLoops() : FunctionPass(ID) {}
    void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.addRequired<LoopInfoWrapperPass>();
        AU.setPreservesAll();
    }

    void countBlocksInLoop(Loop *L, unsigned nesting) {
        unsigned numBlocks = 0;
        Loop::block_iterator bb;
        for(bb = L->block_begin(); bb != L->block_end(); ++bb) {
            numBlocks++;
        }
        errs() << "Loop level " << nesting << " has " << numBlocks << " blocks\n";
        vector<Loop*> subLoops = L->getSubLoops();
        Loop::iterator j, f;
        for (j = subLoops.begin(), f = subLoops.end(); j != f; j++) {
            countBlocksInLoop(*j, nesting + 1);
        }
    }
 
    bool runOnFunction(Function &F) override {
        LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
        errs() << "Function " << F.getName() + "\n";
        for (LoopInfo::iterator i = LI.begin(), e = LI.end(); i != e; ++i) {
            countBlocksInLoop(*i, 0);
      }
    	return false;
    }
  };
}
 
char BBinLoops::ID = 0;
static RegisterPass<BBinLoops> X("bbloop", "Count the number of BBs inside each loop");