### Files:
 - CFIHello is an IR pass to insert CFICheck function call in your program.
 - X86ShadowStackCFIPass.cpp is a backend pass to instrument ShadowStack and CFI instructions in your program.  
 - MachineRegisterInfo.cpp is used to replace llvm/lib/CodeGen/MachineRegisterInfo.cpp.  
 - ChangeMachineRegisterInfo.jpg shows the changes of MachineRegisterInfo.cpp.  
 - CFICheck.c is the source file of CFICheck function.  
 - foo.c and foo1.c are demo source files.  
 - CFIShell.py is the assembly of the shell to compile, link, opt and llc by llvm.  
 - 1.sh/run.sh is the demo of executing CFISHell.py.  

### The parameters of CFIShell.py in 1.sh
 - 0 python3  
 - 1 CFIShell.py  
 - 2 the path of llvm/build/bin  
 - 3 the path of CFIHello.so  
 - 4 the path of demo source file(or your source file)  
 - 5 the path of the source file of CFICheck function  
 - 6 If there is a new CFICheck source file, it should be 'n', otherwise it should be 'o'.  

### Usage:
 - 1 Add CFIHello to llvm/lib/Transform 
 - 2 Add "add_subdirectory(CFIHello)" to the end of llvm/lib/Transform/CMakelist.txt  
 - 3 Add X86ShadowStackCFIPass.cpp to llvm/lib/Target/X86  
 - 4 Add "addPass(createX86ShadowStackCFIPass());" to the end of the function "addPreEmitPass()" in llvm/lib/Target/X86/X86TargetMachine.cpp  
 - 5 Add "FunctionPass *createX86ShadowStackCFIPass();" to llvm/lib/Target/X86/X86.h  
 - 6 Add "X86ShadowStackCFIPass.cpp" to "set(sources...)" in llvm/lib/Target/X86/CMakeLists.txt  
 - 7 If your clang-version is 9.0, you should replace file llvm/lib/CodeGen/MachineRegisterInfo.cpp with file MachineRegisterInfo.cpp  
　If your clang-version is over 9.0, you shoule change the function "MachineRegisterInfo::addRegOperandToUseList(MachineOperand *MO)" in llvm/lib/CodeGen/MachineRegisterInfo.cpp like this:  
  ![](https://github.com/StanPlatinum/elf-respect/blob/master/ShadowStackCFI/ChangeMachineRegisterInfo.png)  
 - 8 Make your llvm  
 - 9 Execute CFISHell.py (using 1.sh/run.sh)

### Results:
 - There will be an dir in the same path of demo source file(or your source file) and "entryLabel.txt" in the path used in parameter 6.  
 - In this dir, you can see five files:  
xxx.ll is the IR file of demo source file(or your source file).  
xxx_link.ll is the IR file of demo IR(or your source IR) linked CFIFunction.  
xxx_opt.ll is the IR file inserted CFIFunction call.  
xxx_opt.s is the assmbly file instrumented ShadowStack and CFI instructions.  
xxx.txt is the txt file which save entry lables of this module.  

### UsagePlus:
 - To replace CFIChell.py.
 - 1 Add #include "CFICheck.c" to your source code.
 - 2 Execute command:
~~~
/your/llvm/path/build/bin/clang -fno-asynchronous-unwind-tables -fno-addrsig -S -Xclang -load -Xclang /your/llvm/path/build/lib/LLVMCFIHello.so yoursourcefile.c -o yourasmfile.s
~~~
 - 3 Now you can see yoursourcefile.txt in your source file path and yourasmfile.s.

***

### Notes: How to write a sample source program
 - The entry should be "void enclave_main()", instead of "int main()"
 - The exit should be "enclave_exit();", instead of "return 0;"
 - Please remember to include the "enclave.h" header.
