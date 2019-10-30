#include <stdio.h>
#include <string.h>

#include "enclave.h"

void CFICheck(unsigned long long target)
{
	unsigned long long *CFICheckAddressPtr = 0x1FFFFFFFFFFFFFFF;
	int CFICheckAddressNum = 0x1FFFFFFF;
	unsigned long long low = 0, high = CFICheckAddressNum, mid;

	//Weijie: for debugging
	puts("traverse all targets:");
	for (int i = 0; i < CFICheckAddressNum; i++)
	{
		char list[9];
		char *list_s = &list;
		//list_s = my_itoa(i, list_s, 10);
		//puts(list_s);
		//puts(i + 0x30);
		list_s = my_itoa(CFICheckAddressPtr[i], list_s, 16);
		puts(list_s);
	}

	puts("checking next indirect call...");

	char target_d[9];
	char *target_str = &target_d;
	target_str = my_itoa(target, target_str, 16);
	puts("target: ");
	puts(target_str);

	while (low <= high)
	{
		mid = low + (high - low) / 2;
		
		char mid_d[9];
		//char *mid_s = &mid_d;
		puts("mid: ");
		//mid_s = my_itoa(mid, mid_s, 16);
		//puts(mid_s);
		int ret = snprintf(mid_d, 8, "%s", mid);
		puts(mid_d);

		char cfiptr_mid[9];
		char *cfiptr_mid_s = &cfiptr_mid;
		puts("CFICheckAddressPtr[mid]: ");
		cfiptr_mid_s = my_itoa(CFICheckAddressPtr[mid], cfiptr_mid_s, 16);
		puts(cfiptr_mid_s);

		if (mid > high)
		{
			break;
		}
		//if ((unsigned long long)CFICheckAddressPtr[mid] > target)
		if (strncmp(cfiptr_mid_s, target_str, 12) > 0)
		{
			puts("target is smaller than [mid]");
			high = mid - 1;
		}
		//else if ((unsigned long long)CFICheckAddressPtr[mid] < target)
		else if (strncmp(cfiptr_mid_s, target_str, 12) < 0)
		{
			puts("target is larger than [mid]");
			low = mid + 1;
		}
		else
		{
			puts("found it!");
			return;
		}
		puts(".");
	}
	exit(-1);
}
