#include "handlers.h"
#include "debugio.h"
#include "kernel.h"

int handleSyscall(struct KernelData *data, struct TaskDescriptor *active)
{
    switch (data->fn) {
        case CODE_EXIT:
            active->priority = -1;
            return 0;
        case CODE_MY_ID:
            return active->tid;
        case CODE_PARENT_ID:
            if (active->parent)
                return active->parent->tid;
            else
                return -1;
        default:
            debugio_putstr("\n\rInvalid syscall...\n\r");
            DEBUG_DUMP_VAL(data->fn);
            return -1;
    }
}
