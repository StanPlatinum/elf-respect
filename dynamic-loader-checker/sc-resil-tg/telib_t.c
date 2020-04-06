#include "internal/thread_data.h"
#include "internal/arch.h"

#define MAX_LEN 1000
#define PLOT_RES 100

ssa_gpr_t *main_ssa = NULL, *shadow_ssa = NULL;
unsigned long long *main_rip = NULL, *shadow_rip = NULL;
unsigned long long main_rip_addr = 0, shadow_rip_addr = 0;
int aep_count = 0, re_try_count = 0;

uint64_t result1 = 100;
uint64_t result2 = 100;

void instrument_function_get_time()
{
#if 0
	aep_count++;
	re_try_count = 0;
	while (main_ssa->rip != 0 || shadow_ssa->rip != 0) {
		// set SSA marker
		main_ssa->REG(ip) = 0;
		if (
				(
				 ((result1>>0) & 0xff) >= 0xe1 ||
				 ((result1>>8) & 0xff) >= 0xe1 ||
				 ((result1>>16) & 0xff) >= 0xe1 ||
				 ((result1>>24) & 0xff) >= 0xe1 ||
				 ((result1>>32) & 0xff) >= 0xe1 ||  
				 ((result1>>40) & 0xff) >= 0xe1 || 
				 ((result1>>48) & 0xff) >= 0xe1 || 
				 ((result1>>56) & 0xff) >= 0xe1 
				) && (
					((result2>>0) & 0xff) >= 0xf2 ||
					((result2>>8) & 0xff) >= 0xf2 ||
					((result2>>16) & 0xff) >= 0xf2 ||
					((result2>>24) & 0xff) >= 0xf2 ||
					((result2>>32) & 0xff) >= 0xf2 || 
					((result2>>40) & 0xff) >= 0xf2 ||
					((result2>>48) & 0xff) >= 0xf2 ||
					((result2>>56) & 0xff) >= 0xf2 
				     )
		   ) {
			if (main_ssa->rip != 0 || shadow_ssa->rip != 0) re_try_count = 0;
		} else {
			main_ssa->REG(ip) = 1;
			re_try_count ++;
			if (re_try_count > 22) {
				__asm __volatile("hlt");
			}
		}
	}
#endif
}

