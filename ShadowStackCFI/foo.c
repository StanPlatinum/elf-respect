#include <stdio.h>

int fun()
{
    return 1;
}

int main()
{
    int (*fp)(void);
    fp = fun;
    int b = fp();
    printf("%d\n", b);
    return 0;
}