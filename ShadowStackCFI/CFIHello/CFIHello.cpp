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
#include <string>
#include<fstream>
 
using namespace llvm;
using namespace std;

#define DEBUG_TYPE "hello"
 
namespace {
  class CFIHello : public ModulePass {
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
 
    bool runOnModule(Module &M) override {
        // std::error_code error;
        // const string sourceName = M.getSourceFileName();
        // int pos = sourceName.find(".", 0);
        // string name = sourceName.substr(0, pos) + ".txt";
        // errs() << name << "\n";
        // StringRef nameR(name);
        // errs() << nameR << "\n";
        // enum sys::fs::OpenFlags F_None;
        // enum sys::fs::FileAccess FA_Write;
        // raw_fd_ostream file(name, error, FA_Write);
        // std::ofstream file(name);
        // for (auto FI = M.begin(); FI != M.end(); FI++)
        // {
        //     Function &F = *FI;
        //     file << F.getName().str() << "\n";
        // }
        // file.close();
        // return insertCFIFun(M, "CFICheck");
        LLVMContext &ctx = M.getContext();
        FunctionCallee funDeclareCFICheck = M.getOrInsertFunction("CFICheck", Type::getVoidTy(ctx), Type::getInt64Ty(ctx));
        FunctionCallee funDeclareExit = M.getOrInsertFunction("exit", Type::getVoidTy(ctx), Type::getInt32Ty(ctx));
        return 1;
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