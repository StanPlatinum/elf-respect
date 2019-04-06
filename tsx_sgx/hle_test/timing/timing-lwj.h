
#define START_TSC(cl) __asm__ __volatile__ ( \
	"cpuid \n		\
	rdtsc \n		\
	shlq $32 , %%rdx \n	\
	orq %%rdx , %%rax "	\
	: "=a" ( cl.r0 ) :	\
	: "%rbx" , "%rcx" , "%rdx")

#define END_TSC(cl) __asm__ __volatile__ ( \
	"rdtscp \n		\
	shlq $32 , %%rdx \n	\
	orq %%rdx , %%rax \n	\
	movq %%rax , %0 \n	\
	cpuid" 			\
	: "=g" (cl.r1) : 	\
	: "%rax" , "%rbx" , "%rcx" , "%rdx" ) ; \
cl.ticks = cl.r1 − cl.r0

void acess_counter ( unsigned * hi , unsigned * lo ){
    asm (	"rdtsc \n "
		"movl %%edx , %0\n"
		"movl %%eax , %1\n"
		: "=r" (*hi) , "=r" (*lo) 
		:
		: "%edx" , "%eax");
}

unsigned long long rdtsc_value(void)
{
    unsigned long long lo, hi;
    asm volatile ( "rdtsc"
            : "=a"(lo), "=d"(hi)
            );
    return (unsigned long long)((hi << 32) | (lo));
}


