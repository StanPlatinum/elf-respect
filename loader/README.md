The loader would need a whitelisted signature, but payload wouldn't.

可以选择直接修改静态文件中代码段的p_flags，从（PF_R|PF_X）修改为（PF_R|PF_W|PF_X），使得ELF文件加载后，代码段默认可写

loader最后从得到的main函数入口进入主程序运行。
