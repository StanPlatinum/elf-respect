#include <stdio.h>
#include <immintrin.h>

//这个函数实际将被链接而不是出现在源文件中，类似于CFICheck
void transactionBegin()
{
    int i = 0;  //i用来记录abort次数，达到10次程序就exit
    for (;i < 10; i++)
    {
        if (_xbegin() == _XBEGIN_STARTED)
        {
            return;
        }
        else
        {//fallback here
            printf("abort %d\n", i);
        }
    }
    exit(-1);
}

//这个函数实际将被链接而不是出现在源文件中，类似于CFICheck
void transactionEnd()
{
    //_xabort(0xff);
    _xend();
}

int main()
{
    int a = 0;

    transactionBegin(); //通过插桩进行调用
    a++;    //Transaction内容
    transactionEnd();   //通过插桩进行调用

    printf("%d\n", a);
    return 1;
}