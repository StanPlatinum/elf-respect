#include <iostream>
#include <sys/fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include "BPatch.h"
#include "BPatch_Vector.h"
#include "BPatch_thread.h"
#include "BPatch_snippet.h"

int main(int argc,char** argv){
    BPatch* bpatch = new BPatch ;
    BPatch_Vector<BPatch_function*> old_func ;
    BPatch_Vector<BPatch_function*> new_func ;
    BPatch_process* app = bpatch->processAttach("test_dynamic",atoi(argv[1])) ;
    BPatch_image* appImage = app->getImage() ;
    BPatch_Vector<BPatch_function*> *tmp = appImage->findFunction("old",old_func) ;
    tmp = appImage->findFunction("new",new_func) ;
    app->replaceFunction(*old_func[0],*new_func[0]) ;
    app->detach(1) ;
    return 0 ;
 
}
