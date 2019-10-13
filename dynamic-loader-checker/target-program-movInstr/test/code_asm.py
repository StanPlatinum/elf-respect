import os
import sys

if __name__ == '__main__':
    
    special_address = '$12121'
    rsp_address = "$21212"
    function_exit_label = ''
    
    
    fileContent = open(sys.argv[1]).readlines()
    #fileContent = open('main.s').readlines()
    
    newFileContent = []
    
    i = 0
    while i < len(fileContent) - 1 :        
        
        if '.type' in fileContent[i] and '@function' in fileContent[i]:
            tmp = fileContent[i].strip()[5:-10].strip()
            function_exit_label = '.chenyi_sgx_' + tmp
            exit_flag = False
        
        if 'cmpq' in fileContent[i] and 'cmpq' in fileContent[i+1] and special_address in fileContent[i] and special_address in fileContent[i+1] and '%rax' in fileContent[i] and '%rax' in fileContent[i+1]:
            
            tmp_leaq = newFileContent.pop()
            newFileContent.append("pushq %rax")
            newFileContent.append(tmp_leaq)
            
            newFileContent.append(fileContent[i])
            newFileContent.append("ja " + function_exit_label)
            newFileContent.append(fileContent[i+1])
            newFileContent.append("jl " + function_exit_label)
            newFileContent.append("popq %rax")
            
            i = i + 2
        
        elif '.Lfunc_end' in fileContent[i] and exit_flag == False:
            
            exit_flag = True
            
            newFileContent.append(function_exit_label + ':')
            newFileContent.append("popq %rax")
            newFileContent.append('movl $1, %edi')
            newFileContent.append('callq exit')
            
            newFileContent.append(fileContent[i])
            i = i + 1
        else:
            newFileContent.append(fileContent[i])
            i = i + 1
            
    for i in newFileContent:
        print(i.strip())
            
