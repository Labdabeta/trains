#include "syscall.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */
#include "tasks/tasks.h"

#include "debugio.h"

void Exit(void)
{
    (void)callSystemInterrupt(0,0,0,CODE_EXIT);
}

int CreateSize(int priority, void (*code)(), TaskSize size)
{
    return callSystemInterrupt(priority, (int)code, (int)size, CODE_CREATE);
}

int Create(int priority, void (*code)())
{
    return CreateSize(priority, code, TASK_SIZE_NORMAL);
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
