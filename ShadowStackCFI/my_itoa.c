#include "enclave.h"

char *my_itoa(unsigned long long val, char *buf, unsigned radix)
{
	char   *p;
	char   *firstdig;
	char   temp;
	unsigned   digval;
	puts("----------1 in my_itoa----------");
	p = buf;
	/*
	 * Weijie: use an unsigned 64 bit int as input
	 if(val <0)
	 {
	 *p++ = '-';
	 val = (unsigned long)(-(long)val);
	 }
	 */
	firstdig = p;
	puts("----------2 in my_itoa----------");
	do{
		digval = (unsigned)(val % radix);
		val /= radix;

		if  (digval > 9)
			*p++ = (char)(digval - 10 + 'a');
		else
			*p++ = (char)(digval + '0');
	}while(val > 0);
	puts("----------3 in my_itoa----------");

	*p-- = '\0 ';
	do{
		temp = *p;
		*p = *firstdig;
		*firstdig = temp;
		--p;
		++firstdig;
	}while(firstdig < p);
	puts("----------4 in my_itoa----------");
	return buf;
}

