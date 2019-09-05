#include <stdio.h>

typedef int (*PTRFUN)(void);

int fun1()
{
    return 1;
}
int fun2()
{
    return 2;
}
int fun3()
{
    return 3;
}
int main()
{
    PTRFUN *pFun = malloc(16 * sizeof(PTRFUN));
    pFun[0] = fun1;
    pFun[1] = fun2;
    pFun[2] = fun3;
    int b = (*pFun[0])();
    b = (*pFun[1])();
    b = (*pFun[2])();
    printf("%d\n", b);
    return 0;
}