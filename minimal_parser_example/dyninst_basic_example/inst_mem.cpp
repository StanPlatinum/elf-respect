#include "BPatch.h"
#include "BPatch_addressSpace.h"
#include "BPatch_binaryEdit.h"
#include "BPatch_function.h"
#include "BPatch_snippet.h"
#include <sstream>
using namespace std;
BPatch bpatch;

bool InstrumentMemory(BPatch_binaryEdit* binary, BPatch_function *tarFunc, BPatch_function *printfFunc) {
    // Specify to find all memory writes 
    BPatch_Set<BPatch_opCode> axs;
    axs.insert(BPatch_opStore);

    // Find all memory writes
    std::vector<BPatch_point*>* points = tarFunc->findPoint(axs);

    // Construct printf parameters
    std::vector<BPatch_snippet*> printfArgs;
    BPatch_snippet* fmt = new BPatch_constExpr("Access at: 0x%lx\n"); 
    printfArgs.push_back(fmt);
    // Construct memory effective address
    BPatch_snippet* eae = new BPatch_effectiveAddressExpr(); 
    printfArgs.push_back(eae);

    // Construct a function call snippet
    BPatch_funcCallExpr printfCall(*printfFunc, printfArgs);
    if (!binary->insertSnippet(printfCall, *points)) {
        fprintf(stderr, "insertSnippet failed\n");
        return false; 
    }
    return true;
}


BPatch_function* FindFunction(BPatch_image* image, const char* name) {
    std::vector<BPatch_function*> functions;
    image->findFunction(name, functions); 
    if (functions.size() == 0) {
        return NULL;
    }
    return functions[0];
}

int main(int argc, char ** argv) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s target_binary_name new_binary_name\n", argv[0]);
        return -1;
    }

    // Open the target binary without opening its dependency
    BPatch_binaryEdit *binary = bpatch.openBinary(argv[1], false);
    BPatch_image* image = binary->getImage();

    BPatch_function* printfFunc = FindFunction(image, "printf");
    if (printfFunc == NULL) {
        fprintf(stderr, "Cannot find printf\n");
        return -1;
    }
    BPatch_function* maliFunc = FindFunction(image, "Ecall_MaliciousDataProcessing");
    if (maliFunc == NULL) {
        fprintf(stderr, "Cannot find Ecall_MaliciousDataProcessing\n");
        return -1;
    }

	// We will later instrument all functions by:
    //std::vector<BPatch_function*> funcs;
	//image->getProcedures(funcs);
    
    if (!InstrumentMemory(binary, maliFunc, printfFunc)) {
        fprintf(stderr, "Failed to instrument memory writes\n");
        return -1;
    }
    binary->writeFile(argv[2]);
}

