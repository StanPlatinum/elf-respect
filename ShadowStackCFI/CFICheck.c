#include <stdio.h>

void CFICheck(long long target)
{
    long long *CFICheckAddressPtr = 0x1FFFFFFFFFFFFFFF;
    int CFICheckAddressNum = 0x1FFFFFFF;
    int low = 0, high = CFICheckAddressNum-1, mid;
    while (low <= high)
    {
        mid = low + (high - low) / 2;
        if (mid >= high)
        {
            break;
        }
        if (CFICheckAddressPtr[mid] == target)
        {
            return;
        }
        else if (CFICheckAddressPtr[mid] > target)
        {
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }
    abort();
}