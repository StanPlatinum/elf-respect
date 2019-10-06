
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
 
using namespace llvm;
 
#define DEBUG_TYPE "hello"
 
namespace {
  // Hello - The first implementation, without getAnalysisUsage.
  struct MyHello : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    MyHello() : FunctionPass(ID) {}
 
    bool runOnFunction(Function &F) override {
    	errs() << "Hello: ";
    	errs() << F.getName() << '\n';
    	return false;
    }
  };
}
 
char MyHello::ID = 0;
static RegisterPass<MyHello> X("myhello", "Hello World Pass");
