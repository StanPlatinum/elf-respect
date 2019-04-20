#include "CodeSource.h"
#include "CodeObject.h"
#include "CFG.h"
#include "Instruction.h"
#include "InstructionDecoder.h"
#include "Register.h"
#include "Absloc.h"
#include "AbslocInterface.h"
#include "Expression.h"

using namespace std;
using namespace Dyninst;
using namespace Dyninst::ParseAPI;
using namespace Dyninst::InstructionAPI;

void DumpInstructionForBlock(Function *f, Block *b) {
    const unsigned char* buf = (const unsigned char*) b->obj()->cs()->getPtrToInstruction(b->start());
    InstructionDecoder dec(buf, b->end() - b->start(), b->obj()->cs()->getArch());

    Address curAddr = b->start();
    while ( curAddr < b->end() ) {
        Instruction insn = dec.decode();
        printf("%lx: %s\n", curAddr, insn.format().c_str());
        curAddr += insn.size();
    }

}

int main(int argc, char **argv) {
    if (argc < 2 || argc > 3) {
        fprintf(stderr, "Usage: %s <binary>\nDump the discovered code from the input binary\n", argv[0]);
	exit(-1);
    }

    SymtabCodeSource *sts;
    CodeObject *co;

    sts = new SymtabCodeSource(argv[1]);    
    co = new CodeObject(sts);
    co->parse();   
    map<Address, Block*> blocks;
    int count = 0;
    for (auto fit = co->funcs().begin(); fit != co->funcs().end(); ++fit) {
        Function *f = *fit;
        count++;
        printf("Function %lx %s\n",f->addr(), f->name().c_str());
        for (auto bit = f->blocks().begin(); bit != f->blocks().end(); ++bit) {
            DumpInstructionForBlock(f, *bit);
            blocks[(*bit)->start()] = *bit;
        }
    }
}
