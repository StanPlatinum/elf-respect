#include <stdarg.h>
#include <stdio.h>

#include <assert.h>

#include "Enclave.h"
#include "Enclave_t.h"
#include "hle-ms.h"

void PrintDebugInfo(const char *fmt, ...)
{
	char buf[BUFSIZ] = {'\0'};
	va_list ap;
	va_start(ap, fmt);
	vsnprintf(buf, BUFSIZ, fmt, ap);
	va_end(ap);
	Ocall_PrintString(buf);
}

void hle_test(){
	PrintDebugInfo("--- test 1 ---\n");
        {
                static int lock;
                int res;

                res = _InterlockedCompareExchange_HLEAcquire(&lock, 1, 0);
                assert(res == 0);
                assert(lock == 1);
                res = _InterlockedCompareExchange_HLERelease(&lock, 0, 1);
                assert(lock == 0);
                assert(res == 1);

                res = _InterlockedExchangeAdd_HLEAcquire(&lock, 1);
                assert(res == 0);
                assert(lock == 1);
                _Store_HLERelease(&lock, 0);
                assert(lock == 0);
        }

	PrintDebugInfo("--- test 2 ---\n");
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

	PrintDebugInfo("--- test 3 ---\n");
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
        PrintDebugInfo("--- finished. ---\n");

}
