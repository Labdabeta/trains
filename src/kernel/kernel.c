#include "kernel.h"
#include "linker.h"
#include "debugio.h"
#include "interface.h"
#include "syscall.h"
#include "tasks/tasks.h"

//extern void asm_SetupTrap(struct KernelData *kernel_sp);
extern void asm_SetupTrap(SyscallCode *kernel_sp);

int newTID(struct KernelData *data, int size)
{
    int i;
	switch (size) {
		case 0: i = GIANT_TASK_INITIAL_IDX; break;
		case 1: i = BIG_TASK_INITIAL_IDX; break;
		case 2: i = NORMAL_TASK_INITIAL_IDX; break;
		case 3: i = SMALL_TASK_INITIAL_IDX; break;
		case 4: i = TINY_TASK_INITIAL_IDX; break;
        default: return -1;
	}

    for (; i < NUM_SUPPORTED_TASKS; ++i)
        if (data->tasks[i].priority < 0)
            return i;

	return -1;
}

int main(int argc, char *argv[])
{
	struct KernelData data;
	struct TaskDescriptor *active;

	init_debugio();
    initScheduler(&data.scheduler);

	setupTaskArray(data.tasks);
	data.tasks[0].stack = &data;
    data.tasks[0].priority = 0; /* Don't ever schedule us, but don't delete us either. */

	asm_SetupTrap(&data.fn);

	/* Load first task. */
	data.tasks[1].priority = 1;

	activateTask(&data.tasks[1], fn_ptr(main_task));
	scheduleTask(&data.scheduler, &data.tasks[1]);

    while ((active = reschedule(&data.scheduler))) {
        DEBUG_DUMP_VAL(active->tid);

		enterTask(active);

        DEBUG_DUMP_VAL(active->priority);

		active->rval = handleSyscall(&data, active);

        DEBUG_DUMP_VAL(active->rval);
	}

	return 0;
}
