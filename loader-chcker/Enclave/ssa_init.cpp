#include "thread_data.h"
#include "arch.h"

#define MAX_LEN 1000
#define PLOT_RES 100

ssa_gpr_t *main_ssa = NULL, *shadow_ssa = NULL;
unsigned long *main_rip = NULL, *shadow_rip = NULL;
unsigned long long main_rip_addr = 0, shadow_rip_addr = 0;

void secure_timer()
{
        thread_data_t *thread_data = get_thread_data();
        shadow_ssa = (ssa_gpr_t *)(thread_data->first_ssa_gpr);
        shadow_rip = &(shadow_ssa->REG(ip));
        shadow_rip_addr = (unsigned long long)&(shadow_ssa->REG(ip));
#if 0
        while (1) {
                // set SSA marker
                shadow_ssa->REG(ip) = 0;
        }
#endif
	// set SSA marker
	shadow_ssa->REG(ip) = 0;
}

void main_ssa_init()
{
        thread_data_t *thread_data = get_thread_data();
        main_ssa = (ssa_gpr_t *)(thread_data->first_ssa_gpr);
        main_rip = &(main_ssa->REG(ip));
        main_rip_addr = (unsigned long long)&(main_ssa->REG(ip));
        main_ssa->REG(ip) = 1;
        //*main_rip = 1;
        while (shadow_ssa == NULL) __asm __volatile("pause");
}

