#include <stdio.h>
#include "enclave.h"

int fun()
{
    puts("----------1 in fun----------");
    return 1;
}

char *my_itoa(int val, char *buf, unsigned radix)
{
    char   *p;             
    char   *firstdig;      
    char   temp;           
    unsigned   digval;     
    //puts("----------1 in my_itoa----------");
    p = buf;
    if(val <0)
    {
        *p++ = '-';
        val = (unsigned long)(-(long)val);
    }
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

void enclave_main()
{
    int (*fp)(void);
    fp = fun;
    puts("----------1----------");
    int b = fp();
    puts("----------2----------");
    char i_b[8];
    char *ii_b = &i_b;
    puts("----------3----------");
    ii_b = my_itoa(b, ii_b, 10);
    puts("----------4----------");
    puts(ii_b);
    puts("success!");
    enclave_exit();
}
