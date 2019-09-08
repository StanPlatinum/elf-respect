### Files:
CFIHello is an IR pass to insert CFICheck function call in your program.  
X86ShadowStackCFIPass.cpp is a backend pass to instrument ShadowStack and CFI instructions in your program.  
CFICheck.c is the source file of CFICheck function.  
foo.c and foo1.c are demo source files.  
CFIShell.py is the assembly of the shell to compile, link, opt and llc by llvm.  
1.sh is the demo of executing CFISHell.py.  

### The parameters of CFIShell.py in 1.sh
0 python3  
1 CFIShell.py  
2 the path of llvm/build/bin  
3 the path of CFIHello.so  
4 the path of demo source file(or your source file)  
5 the path of the source file of CFICheck function  
6 the path of the txt file which save entry lables  


### Usage:
1 Add CFIHello to llvm/lib/Transform  
2 Add X86ShadowStackCFIPass.cpp to llvm/lib/Target/X86  
3 Add "addPass(createX86ShadowStackCFIPass());" to the end of the function "addPreEmitPass()" in llvm/lib/Target/X86/X86TargetMachine.cpp  
4 Add "add_subdirectory(CFIHello)" to the end of Transform/cmkelist.txt
4 Add "FunctionPass *createX86ShadowStackCFIPass();" to llvm/lib/Target/X86/X86.h  
5 Add "X86ShadowStackCFIPass.cpp" to "set(sources...)" in llvm/lib/Target/X86/CMakeLists.txt  
6 Make your llvm.  
7 Execute CFISHell.py  

### Results:
There will be an dir in the same path of demo source file(or your source file) and "entryLabel.txt" in the path used in parameter 6.  
In this dir, you can see five files:  
xxx.ll is the IR file of demo source file(or your source file).  
xxx_link.ll is the IR file of demo IR(or your source IR) linked CFIFunction.  
xxx_opt.ll is the IR file inserted CFIFunction call.  
xxx_opt.s is the assmbly file instrumented ShadowStack and CFI instructions.  
xxx.txt is the txt file which save entry lables of this module.  
