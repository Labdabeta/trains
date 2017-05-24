#include "handlers.h"
#include "debugio.h"
#include "kernel.h"
#include "task.h"
#include "linker.h"

static inline int handleCreate(struct KernelData *data, struct TaskDescriptor *active)
{
    int prio = data->argv[0];
    int code = data->argv[1];
    int size = data->argv[2];

    int newid = newTID(data, size);

    if (newid > 0) {
        struct TaskDescriptor *newtask = &data->tasks[newid];
        newtask->priority = prio;
        activateTask(newtask, (void(*)())fn_ptr(code));
        scheduleTask(&data->scheduler, newtask);
    }

    return newid;
}

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
        case CODE_CREATE:
            return handleCreate(data, active);
        default:
            debugio_putstr("\n\rInvalid syscall...\n\r");
            DEBUG_DUMP_VAL(data->fn);
            return -1;
    }
}
