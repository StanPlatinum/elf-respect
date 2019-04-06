#include <stdio.h>

#include "timing-lwj.h"

#include "hle-lwj.h"
#include <assert.h>

int main(void)
{
	{
                static int lock;
                int res = 0;

                int status;

	unsigned long long start, middle, end;

                printf("lock = %d\n", lock);

	start = rdtsc_value();
                res = _InterlockedCompareExchange_HLEAcquire(&lock, 5, 0);
	middle = rdtsc_value();
	printf("compare exchange acquire cost: %lld\n", middle - start);
                assert(res == 0);
                assert(lock == 5);

                for(int i = 0; i < 10; i++)
                {
                        res = res + 0.5;
                }

		printf("res = %d, executing transcations...\n", res);

	middle = rdtsc_value();
                status = _xtest();
	end = rdtsc_value();
	printf("xtest cost: %lld\n", end - middle);
                printf("status: %d\n", status);

	start = rdtsc_value();
                res = _InterlockedCompareExchange_HLERelease(&lock, 0, 0);
	end = rdtsc_value();
	printf("compare exchange release cost: %lld\n", end - start);
                assert(lock == 5);
                printf("res = %d\n", res);
                assert(res == 5);

                /* another round... */
                lock = 0;

                res = _InterlockedExchangeAdd_HLEAcquire(&lock, 1);
                assert(res == 0);
                assert(lock == 1);
                _Store_HLERelease(&lock, 0);
                assert(lock == 0);
	}
	{
                static __hle_int64 lock;
                __hle_int64 res;

	unsigned long long start, middle, end;

	start = rdtsc_value();
                res = _InterlockedCompareExchange64_HLEAcquire(&lock, 1, 0);
	middle = rdtsc_value();
	printf("compare exchange 64 acquire cost: %lld\n", middle - start);
                assert(res == 0);
                assert(lock == 1);
                res = _InterlockedCompareExchange64_HLERelease(&lock, 0, 1);
                assert(lock == 0);
                assert(res == 1);

	middle = rdtsc_value();
                res = _InterlockedExchangeAdd64_HLEAcquire(&lock, 1);
	end = rdtsc_value();
	printf("compare exchange 64 release cost: %lld\n", end - middle);
                assert(res == 0);
                assert(lock == 1);
	start = rdtsc_value();
                _Store64_HLERelease(&lock, 0);
	end = rdtsc_value();
	printf("store 64 cost: %lld\n", end - start);
                assert(lock == 0);
	}
	{
                static void *lock;
                void *res;
                res = _InterlockedCompareExchangePointer_HLEAcquire(&lock,
                                                                    (void*)1L,
                                                                    0);
                assert(res == 0);
                assert(lock == (void *)1L);
                res = _InterlockedCompareExchangePointer_HLERelease(&lock,
                                                                    0,
                                                                    (void *)1L);
                assert(lock == 0);
                assert(res == (void *)1L);
                res = _InterlockedCompareExchangePointer_HLEAcquire(&lock,
                                                                    (void *)1L,
                                                                    0);
                assert(res == 0);
                assert(lock == (void *)1L);
                _StorePointer_HLERelease(&lock, 0);
                assert(lock == 0);
	}

        printf("finished.\n");
        return 0;
}

