#include "syscall.h"
#include "interface.h" /* Kernel space breach */
#include "handlers.h" /* Kernel space breach */

#include "debugio.h"

void Exit(void)
{
    (void)callSystemInterrupt(0,0,0,CODE_EXIT);
}

int Create(int priority, void (*code)(), TaskSize size)
{
    return callSystemInterrupt(priority, (int)code, (int)size, CODE_CREATE);
}

int MyTid(void)
{
    return callSystemInterrupt(0,0,0,CODE_MY_ID);
}

int MyParentTid(void)
{
    return callSystemInterrupt(0,0,0,CODE_PARENT_ID);
}

void Pass(void)
{
    (void)callSystemInterrupt(0,0,0,CODE_PASS);
}
