#include "Enclave_t.h"
#include "stdio.h"

#include "/home/donnod/Research/SGX/linux-sgx/common/inc/internal/thread_data.h"
#include "/home/donnod/Research/SGX/linux-sgx/common/inc/internal/arch.h"

#include <sgx_spinlock.h>

#define MAX_LEN 1000
#define PLOT_RES 100

sgx_spinlock_t race_condition_test = 1, race_condition_test_1 = 1, shadow_thread_counter_ready = 0;

ssa_gpr_t *main_ssa = NULL, *shadow_ssa = NULL;
unsigned long long *main_rip = NULL, *shadow_rip = NULL;
unsigned long long main_rip_addr = 0, shadow_rip_addr = 0;
unsigned long long main_counter, shadow_counter, shared_variable;
unsigned long long co_location(unsigned long id);
void ctFunc();
void ctFunc2();
//void ctFuncReset();
int aep_count = 0, re_try_count = 0;

char counter[0x50] = {'\0'};
uint64_t result1 = 100,rcacc1 = 0;
uint64_t result2 = 100,rcacc2 = 0;

void secure_timer()
{
    thread_data_t *thread_data = get_thread_data();
    shadow_ssa = (ssa_gpr_t *)(thread_data->first_ssa_gpr);
    shadow_rip = &(shadow_ssa->REG(ip));
    shadow_rip_addr = &(shadow_ssa->REG(ip));
    
    //printf("sssssssssss %x, %x\n", shadow_rip_addr, &(shadow_ssa->rip)); 
    //printf("S: shadow ssa: %x main ssa: %x\n", shadow_ssa, main_ssa);
    
    // while (main_ssa == NULL) __asm __volatile("pause");
    
    while (1) {
    
        //sgx_spin_unlock(&race_condition_test_1);
        sgx_spin_lock(&race_condition_test);
        
        // set SSA marker
        shadow_ssa->REG(ip) = 0;
        //*shadow_rip = 0;
        
        // begin co-location check
        //shadow_counter = co_location(1);
        ctFunc();
        //shadow_counter = 9999;
        
        // wait shadow_counter to be read
        sgx_spin_unlock(&shadow_thread_counter_ready);
    }
}

void main_ssa_init()
{
    thread_data_t *thread_data = get_thread_data();
    main_ssa = (ssa_gpr_t *)(thread_data->first_ssa_gpr);
    main_rip = &(main_ssa->REG(ip));
    main_rip_addr = &(main_ssa->REG(ip));
    main_ssa->REG(ip) = 1;
    //*main_rip = 1;
    while (shadow_ssa == NULL) __asm __volatile("pause");
    //printf("pppppppppp %x, %x\n", main_rip_addr, &(main_ssa->rip)); 
}

void instrument_function_get_time()
{
    //printf("success\n");
    //return;
    /*if (main_ssa == NULL) {
        thread_data_t *thread_data = get_thread_data();
        main_ssa = (ssa_gpr_t *)(thread_data->first_ssa_gpr);
        main_ssa->REG(ip) = 1;
        //printf("P: shadow ssa: %x main ssa: %x\n", shadow_ssa, main_ssa);
    }*/
    
    //while (shadow_ssa == NULL) __asm __volatile("pause");
    //return;
    aep_count++;
    re_try_count = 0;
    while (main_ssa->rip != 0 || shadow_ssa->rip != 0) {
    //while (*main_rip != 0 || *shadow_rip != 0) {
    
    //int cnts[PLOT_RES][PLOT_RES];
    //for (int i = 0; i < PLOT_RES; i++)
    //    for (int j = 0; j < PLOT_RES; j++)
    //        cnts[i][j] = 0;
    //for (int i = 0; i < 1000000; i++) {
        //if (*main_rip != main_ssa->rip)
        //printf("main %x %x\n", main_rip, &(main_ssa->rip));
        //if (*shadow_rip != shadow_ssa->rip)
        //printf("shadow %x %x\n", *shadow_rip, shadow_ssa->rip);
        //rcacc1 = rcacc2 = 0;
        //int i;
        //for (i = 0; i < 255; i++) {
        //ctFuncReset();
        sgx_spin_unlock(&race_condition_test);
        //sgx_spin_lock(&race_condition_test_1);
        
        // set SSA marker
        main_ssa->REG(ip) = 0;
        //*main_rip = 0;
        
        // begin co-location check
        //main_counter = co_location(0);
        ctFunc2();
        //main_counter = 9999;
        
        // wait for shadow to update its counter
        sgx_spin_lock(&shadow_thread_counter_ready);
        //continue;
        //rcacc1 += result1;
        //rcacc2 += result2;
        //}
        // check co-location
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
            //if (main_ssa->rip == 0 && shadow_ssa->rip == 0) {
                printf("Co-location re-try count exceeds limit\n");
                __asm __volatile("hlt");
            }
	     }
   /*     if (main_counter * 100 / MAX_LEN < 90 || shadow_counter * 100 / MAX_LEN < 90) {
            main_ssa->REG(ip) = 1;
            //*main_rip = 1;
            re_try_count ++;
            if (re_try_count > 10) {
                printf("Co-location re-try count exceeds limit\n");
                __asm __volatile("hlt");
            }
        } else {
            // printf("rips %x %x\n", main_ssa->REG(ip), shadow_ssa->REG(ip));
            //main_counter = shadow_counter = 0;
            //break;
            //aep_count +=10000;
            //if (main_ssa->REG(ip) == 0 && shadow_ssa->REG(ip) == 0)
                //aep_count ++;
            re_try_count = 0;
        }*/
        //aep_count += 10000;
        //printf("count %llu, %llu \n", main_counter, shadow_counter);
        //printf("count %llx, %llx \n", result1, result2);
        //cnts[main_counter][shadow_counter] ++;
    }
    //for (int i = 0; i < PLOT_RES; i++) {
    //    for (int j = 0; j < PLOT_RES; j++)
    //        printf("%d ", cnts[i][j]);
    //    printf("\n");
    //}
    //asm("hlt");
    //printf("success\n");
}
/*
void ctFuncReset()
{
	__asm__ __volatile__(
		
		
		"movl $0, -0x8(%0)\n\t"
		"cmpl $0, -0x10(%0)\n\t"

		:// "=m" (result1)
		: "r" (&counter[0x40])//, "r" (&measure[0])
		: "memory", "rax", "rbx", "rcx", "rdx", "rsi"
	);
}*/

void ctFunc()
{
	__asm__ __volatile__(
		"movl $1, %%edx\n\t"  // initialize to zero, count of co-location test	
		"xor %%rcx, %%rcx\n\t" // count the number of data races
		"mfence\n\t"
		".L1o21:\n\t"
		
		//sync_code{
		"movb $0, -0x1a(%1)\n\t" //unlock 1a
		
		"mfence\n\t"
		".L1_dr_sync:\n\t"
		"movl %%edx, -0x8(%1)\n\t"    // write to one address to tell the other thread it's ready
		"cmpl %%edx, -0x10(%1)\n\t"    // test whether the other thread has written to this address 
		"je .L1xx21\n\t"               // if equal, then the other thread is also ready, then goto: co-location test
		"jmp .L1_dr_sync\n\t"
		//sync_code}
		".L1xx21:\n\t"
		
		"mfence\n\t"
		
		"movl %%edx, -0x8(%1)\n\t"
		"movq $0, -0x10(%1)\n\t"
		"movq $59, %%rsi\n\t"         // each co-location test has $ race tests
		
		"movq $1, %%rbx\n\t"   // to shift according to %%rsi
		
		"mfence\n\t"
		
		".L122:\n\t"
		
		
		"movq (%1), %%rax\n\t"
			
		//"movq $0, (%1)\n\t"  // store, a different value
		
		"movq $0, %%r10\n\t"
		"movq $0, %%r11\n\t"
		
		"cmpq $70, %%rax\n\t"
		"cmovg %%rbx, %%r10\n\t"
		
		"subq %%rax, %%r9\n\t"
		"cmpq $1, %%r9\n\t"
		"cmova %%r11, %%r10\n\t"
		
		"addq %%r10, %%rcx\n\t"
		
		"shlq $8, %%rbx\n\t"   
		"movq %%rax, %%r9\n\t"
		
		
		"movq %%rsi, (%1)\n\t"  // store
		
		
		
		"movq (%1), %%rax\n\t"
		"lfence\n\t"	
		"movq (%1), %%rax\n\t"
		"lfence\n\t"	
		"movq (%1), %%rax\n\t"
		"lfence\n\t"	
		"movq (%1), %%rax\n\t"
		"lfence\n\t"
		"movq (%1), %%rax\n\t"
		"lfence\n\t"

		
		"dec %%rsi\n\t"
		"cmp $50, %%rsi\n\t"	
		"jne .L122\n\t"
		
	
		"mfence\n\t"	
	    //sync_code{
	    "movb $1, %%r10b\n\t"
	    
	    ".L1lock:\n\t"//lock 1b
	    "lock xchg %%r10b, -0x1b(%1)\n\t"
	    "cmpb $1, %%r10b\n\t"
	    "je .L1lock\n\t"
	    //sync_code}
		
		"inc %%edx\n\t"
		"cmpl $256, %%edx\n\t"
		"jne .L1o21\n\t"
		"movl %%edx, -0x8(%1)\n\t"
		
		"mfence\n\t"	
		
		"movq %%rcx, %0\n\t"
		: "=m" (result1)
		: "r" (&counter[0x40])//, "r" (&measure[0])
		: "memory", "rax", "rbx", "rcx", "rdx", "rsi", "r9", "r10", "r11"
	);
}

void ctFunc2()
{
	__asm__ __volatile__(	
		"movl $1, %%edx\n\t"	
		"xor %%rcx, %%rcx\n\t"
		
		"mfence\n\t"

		".Lo21:\n\t"
	    //sync_code{
	    "movb $1, %%r10b\n\t"
	    
	    "mfence\n\t"
	    
	    ".L2lock:\n\t"//lock 1a
	    "lock xchg %%r10b, -0x1a(%1)\n\t"
	    "cmpb $1, %%r10b\n\t"
	    "je .L2lock\n\t"
	    
	    ".L2_dr_sync:\n\t"
		"movl %%edx, -0x10(%1)\n\t"
		"cmpl %%edx, -0x8(%1)\n\t"
		"je .Loxx21\n\t"
		
		"jmp .L2_dr_sync\n\t"
		//sync_code}
		".Loxx21:\n\t"
		
		"mfence\n\t"
		
		"movl %%edx, -0x10(%1)\n\t"
		"movq $0, -0x8(%1)\n\t"
		"movq $109, %%rsi\n\t"
		
		"movq $1, %%rbx\n\t"   // to shift according to %%rsi
		
		"mfence\n\t"
			
		".L222:\n\t"
		    
		"movq (%1), %%rax\n\t"
		
		
		"movq %%rsi, (%1)\n\t" // store
		
		"movq $0, %%r10\n\t"
		"movq $0, %%r11\n\t"
		
		"cmpq $70, %%rax\n\t"
		"cmovl %%rbx, %%r10\n\t"
		
		"subq %%rax, %%r9\n\t"
		"cmpq $1, %%r9\n\t"
		"cmova %%r11, %%r10\n\t"
		
		"addq %%r10, %%rcx\n\t"
		
		"shlq $8, %%rbx\n\t"   
		"movq %%rax, %%r9\n\t"
	
		
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		
		
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
		"nop\n\t"
				
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t" // 10

		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"  // 20
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"  // 30
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"  // 40
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t" // 50
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t" // 60
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"  // 70 

		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"  // 80 
		
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t" // 90
		
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t"
		"movq (%1), %%rax\n\t" // 100
		

	


		
			
			
		"dec %%rsi\n\t"
		"cmp $100, %%rsi\n\t"
		"jne .L222\n\t"
		
		"mfence\n\t"
		//sync_code{
		"movb $0, -0x1b(%1)\n\t" //unlock 1b
		//sync_code}
		"inc %%edx\n\t"
		"cmpl $256, %%edx\n\t"
		"jne .Lo21\n\t"
		"movl %%edx, -0x10(%1)\n\t"
		
		"mfence\n\t"	
		
		"movq %%rcx, %0\n\t"
		: "=m" (result2)
		: "r" (&counter[0x40])
		: "memory", "rax", "rbx", "rcx", "rdx", "rsi", "r9", "r10", "r11"
	);
}
