#include <stdio.h>
#include "rtm.h"

void transactionBegin()
{
    int i = 0;  //i用来记录abort次数，达到10次程序就exit
    for (;i < 10; i++)
    {
        int status = _xbegin();
        if (status == _XBEGIN_STARTED)
        {
            return;
        }
        else
        {//fallback here
            //printf("abort %d\n", i);
	    puts("warning!");
        }
    }
    exit(-1);
}
