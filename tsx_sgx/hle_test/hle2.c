/* Test program for MS flavoured HLE intrinsics */
#include <stdio.h>
#include "hle-lwj.h"
#include <assert.h>

int main(void)
{
	{
		static int lock;
		int res = 0;

		int status;

		printf("lock = %d\n", lock);

		res = _InterlockedCompareExchange_HLEAcquire(&lock, 5, 0);
		assert(res == 0);
		assert(lock == 5);

		for(int i = 0; i < 10; i++)
		{ 
			res = res + 0.5;
		}
		printf("res = %d, executing transcations...\n", res);

		status = _xtest();
		printf("status: %d\n", status);
		
		res = _InterlockedCompareExchange_HLERelease(&lock, 0, 0);
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

		res = _InterlockedCompareExchange64_HLEAcquire(&lock, 1, 0);
		assert(res == 0);
		assert(lock == 1);
		res = _InterlockedCompareExchange64_HLERelease(&lock, 0, 1);
		assert(lock == 0);
		assert(res == 1);

		res = _InterlockedExchangeAdd64_HLEAcquire(&lock, 1);
		assert(res == 0);
		assert(lock == 1);
		_Store64_HLERelease(&lock, 0);
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
