#include <stdlib.h>
int *p_inprogram = NULL;

void instrument_function_get_time()
{
	int tmp;
	if (p_inprogram == NULL)	puts("init failed");
	p_inprogram = &tmp;
	tmp = 129;
	//Weijie: debugging
	puts("tmp:");
	//sprintf();
	//puts();
}
