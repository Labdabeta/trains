#include "kernel.h"
#include "linker.h"
#include "interface.h"
#include "syscall.h"
#include "tasks/tasks.h"
#include "hwi.h"

#include "tasks/logging.h"

//extern void asm_SetupTrap(struct KernelData *kernel_sp);
extern void asm_SetupTrap(void *one, void *two, void *three);

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

static void enableT4(void)
{
    unsigned long long int *t4 = (unsigned long long int*)0x80810060;

	*t4 &= 0UL;
    *t4 |= 0x10000000000UL;
}

int main(int argc, char *argv[])
{
	int HWIstackspace[HWI_STACK_SIZE];
	struct KernelData data;
	struct TaskDescriptor *active;
    int active_tid;
    int active_state;

    _log_enabled = 0; // ensure logging is off!

	data.inittime = 0;
	data.lasttick = 0;
	data.kerntime = 0;
	data.usertime = 0;
	data.handtime = 0;

    enableT4();
    data.lasttick = t4t();

	/* First user task. */
	data.alive = 1;

	init_debugio();
	DEBUG_PRINT("%s", GIT_NAME);
    DEBUG_PRINT("Active TID: %x\tState: %x", &active_tid, &active_state);
	initScheduler(&data.scheduler);

	initEventBlocks(&data.scheduler);

	setupTaskArray(data.tasks);
	data.tasks[0].stack = &data;
	data.tasks[0].priority = 0; /* Don't ever schedule us, but don't delete us either. */

	/* Load first task. */
	data.tasks[1].priority = NUM_PRIORITIES - 1;
	data.tasks[1].state = STATE_ACTIVE;
	activateTask(&data.tasks[1], fn_ptr(main_task));
	scheduleTask(&data.scheduler, &data.tasks[1]);

	/* Load idle task. */
	data.tasks[NUM_SUPPORTED_TASKS-1].priority = NUM_PRIORITIES+1; /* never gets scheduled anyways. */
	activateTask(&data.tasks[NUM_SUPPORTED_TASKS-1], fn_ptr(idle));

	/* Load the dispatcher. */
	asm_SetupTrap(&data.fn, fn_ptr(EnterHWI), &HWIstackspace[HWI_STACK_SIZE-1]);

#ifdef DEBUG_MODE
	data.inittime = data.lasttick;
	data.lasttick = t4t();
	data.inittime = data.lasttick - data.inittime;
#endif

	while (data.alive > 0) {
		/* Process active tasks until there are none. */
		while ((active = reschedule(&data.scheduler))) {
#ifdef DEBUG_MODE
			data.tmp = t4t();
			data.kerntime += data.tmp - data.lasttick;
			data.lasttick = data.tmp;
            //dprintf("--%d--\n", active->tid);
#endif
            active_tid = active->tid;
            active_state = active->state;
			enterTask(active);

#ifdef DEBUG_MODE
			data.tmp = t4t();
			data.usertime += data.tmp - data.lasttick;
			active->ticks += data.tmp - data.lasttick;
			data.lasttick = data.tmp;
#endif

			active->rval = handleSyscall(&data, active);

#ifdef DEBUG_MODE
			data.tmp = t4t();
			data.handtime += data.tmp - data.lasttick;
			data.lasttick = data.tmp;
#endif
		}

#ifdef DEBUG_MODE
		/* Add the last kernel's time to the idle task. */
		data.tmp = t4t();
		data.tasks[NUM_SUPPORTED_TASKS-1].ticks += data.tmp - data.lasttick;
		data.lasttick = data.tmp;
#endif
		enterTask(&data.tasks[NUM_SUPPORTED_TASKS-1]);

		data.tasks[NUM_SUPPORTED_TASKS-1].rval = handleSyscall(&data, &data.tasks[NUM_SUPPORTED_TASKS-1]);

#ifdef DEBUG_MODE
		/* Add the last kernel's time to the idle task. */
		data.tmp = t4t();
		data.tasks[NUM_SUPPORTED_TASKS-1].ticks += data.tmp - data.lasttick;
		data.lasttick = data.tmp;
#endif
	}

#ifdef DEBUG_MODE
	unsigned long long int ttime = data.lasttick - data.inittime;
	dprintf("\nKernel time: %u%u\nHandler time: %u%u\nUser time: %u%u\nIdle time: %u%u\nTotal time: %u%u\nPercent idle: %u%%\n",
			(unsigned int)(data.kerntime>>32), (unsigned int)data.kerntime,
			(unsigned int)(data.handtime>>32), (unsigned int)data.handtime,
			(unsigned int)(data.usertime>>32), (unsigned int)data.usertime,
			(unsigned int)(data.tasks[NUM_SUPPORTED_TASKS-1].ticks >> 32),
			(unsigned int)data.tasks[NUM_SUPPORTED_TASKS-1].ticks,
			(unsigned int)(ttime>>32), (unsigned int)ttime,
			(unsigned int)((data.tasks[NUM_SUPPORTED_TASKS-1].ticks*100)/ttime));
    for (int i = 1; i < NUM_SUPPORTED_TASKS; ++i)
        dprintf("Time spent in task %d: %u%u\n", i, (unsigned int)(data.tasks[i].ticks>>32), (unsigned int)data.tasks[i].ticks);
#endif

	cleanupTimer1();

	return 0;
}
