#ifndef __ENCLAVE_H
#define __ENCLAVE_H

#include <stdlib.h>

#define MAX_OCALL_GET_LINE 64

#define enclave_exit() exit(0)

void enclave_main();
void *memalign(size_t alignment, size_t size);
void ocall_open(char *name, int *fd);
size_t get_line(int fd, char *buf);
void push_gadget(unsigned long gadget);

char *my_itoa(unsigned long long val, char *buf, unsigned radix)
{
    char   *p;             
    char   *firstdig;      
    char   temp;           
    unsigned   digval;     
    //puts("----------1 in my_itoa----------");
    p = buf;
    /*
     * Weijie: use an unsigned 64 bit int as input
    if(val <0)
    {
        *p++ = '-';
        val = (unsigned long)(-(long)val);
    }
    */
    firstdig = p; 
    //puts("----------2 in my_itoa----------");
    do{
        digval = (unsigned)(val % radix);
        val /= radix;
       
        if  (digval > 9)
            *p++ = (char)(digval - 10 + 'a'); 
        else
            *p++ = (char)(digval + '0');      
    }while(val > 0);
   
    *p-- = '\0 ';         
    do{
        temp = *p;
        *p = *firstdig;
        *firstdig = temp;
        --p;
        ++firstdig;        
    }while(firstdig < p);  
    //puts("----------3 in my_itoa----------");
    return buf;
}

#endif
