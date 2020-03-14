#include <stdio.h>
#include <immintrin.h>

int main()
{
    int a = 0;
    
    //9-21行通过插桩实现
    int i = 0;  //i用来记录abort次数，达到10次程序就exit，这里的i在插桩时用寄存器来表示
    for (;i < 10; i++)
    {
        if (_xbegin() == _XBEGIN_STARTED)
        {
            goto XBEGIN;
        }
        else
        {//fallback here
            printf("abort %d\n", i);
        }
    }
    exit(-1);

XBEGIN:
    a++;    //Transaction内容，将被分离为一个新的BasicBlock

    _xend();    //通过指令插桩实现

    printf("%d\n", a);
    return 1;
}