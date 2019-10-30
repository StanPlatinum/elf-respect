#include <stdio.h>

void CFICheck(unsigned long long target)
{
	unsigned long long *CFICheckAddressPtr = 0x1FFFFFFFFFFFFFFF;
	int CFICheckAddressNum = 0x1FFFFFFF;
	int low = 0, high = CFICheckAddressNum, mid;
    unsigned long long magic = 0x1;

    //Weijie: for debugging
	// char i_b[8];
	// char *ii_b = &i_b;
    // for (int i = 0; i < CFICheckAddressNum; i++)
    // {
    //     ii_b = my_itoa(i, ii_b, 10);
    //     puts(ii_b);
	// 	ii_b = my_itoa(CFICheckAddressPtr[i], ii_b, 16);
	// 	puts(ii_b);
    // }
    
	// puts("checking next indirect call...");

	// char target_s[8];
	// char *target_str = target_s;
	// target_str = my_itoa(target, target_str, 16);
	// puts("target: ");
	// puts(target_str);

	while (low <= high)
	{
		mid = low + (high - low) / 2;
        // ii_b = my_itoa(mid, ii_b, 10);
        // puts(ii_b);
        // ii_b = my_itoa(low, ii_b, 10);
        // puts(ii_b);
        // ii_b = my_itoa(high, ii_b, 10);
        // puts(ii_b);
		// puts("Matching CFICheckAddressPtr[mid]: ");
		// ii_b = my_itoa(CFICheckAddressPtr[mid], ii_b, 16);
		// puts(ii_b);

		if (mid > high)
		{
			break;
		}
		if (CFICheckAddressPtr[mid] > target)
		{
			//ii_b = my_itoa(CFICheckAddressPtr[mid], ii_b, 10);
			//puts("larger!");
			//puts("CFICheckAddress[mid]: ");
			//puts(ii_b);
			//puts("\n");
			high = mid - 1;
		}
		else if (CFICheckAddressPtr[mid] < target)
		{
			//ii_b = my_itoa(CFICheckAddressPtr[mid], ii_b, 10);
			//puts("smaller!");
			//puts("CFICheckAddress[mid]: ");
			//puts(ii_b);
			//puts("\n");
			low = mid + 1;
		}
        else
        {
            //puts("found it!");
			return;
        }
        
	}
	//abort();
	exit(-1);
}