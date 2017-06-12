#include "kernel.h"
#include "linker.h"
#include "debugio.h"
#include "interface.h"
#include "syscall.h"
#include "tasks/tasks.h"

#ifdef DEBUG_MODE
#define HWI_STACK_SIZE 100
#else
#define HWI_STACK_SIZE 100
#endif

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

struct Scheduler *global_scheduler;
struct TaskDescriptor *global_clocknotifier;
struct TaskDescriptor *global_com2rcv;
struct TaskDescriptor *global_com2tmt;

void EnterHWI(void) __attribute__((interrupt("IRQ")));
void EnterHWI(void)
{
	debugio_putstr("HWI!\n\r");
	volatile int *vic1status = (int *)( VIC1_BASE + VIC_STATUS_OFFSET);
	DEBUG_DUMP_ADR(*vic1status);
	//volatile int *vic2status = (int *)( VIC2_BASE + VIC_STATUS_OFFSET);
	if(*vic1status){
		if(*vic1status & 1 << 25){
			volatile int *uart2data = (int *)(UART2_BASE + UART_DATA_OFFSET);
			global_com2rcv->rval = *uart2data;
			if(global_com2rcv->state == STATE_EVENT_BLOCKED)
				unblockTask(global_scheduler, global_com2rcv); // Faliure here means dropped input
		} else{
			debugio_putstr("Transmit!\n\r");
			transmitoff();
			DEBUG_DUMP_ADR(*vic1status);
			unblockTask(global_scheduler, global_com2tmt); //Nescessarily event blocked
		}
	} else {
		volatile int *tclr = (int *) ( TIMER_BASE + TIMER_CLR_OFFSET );
		*tclr = 0;
		if(global_clocknotifier->state == STATE_EVENT_BLOCKED)
			unblockTask(global_scheduler, global_clocknotifier); // Faliure here means lost ticks
	}
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
	initScheduler(&data.scheduler);
	global_scheduler = &data.scheduler;

	setupTaskArray(data.tasks);
	data.tasks[0].stack = &data;
	data.tasks[0].priority = 0; /* Don't ever schedule us, but don't delete us either. */

	/* Load first task. */
	data.tasks[1].priority = 0;
	data.tasks[1].state = STATE_ACTIVE;
	activateTask(&data.tasks[1], fn_ptr(main_task));
	scheduleTask(&data.scheduler, &data.tasks[1]);

	/* Load idle task. */
	data.tasks[NUM_SUPPORTED_TASKS-1].priority = NUM_PRIORITIES+1; /* never gets scheduled anyways. */
	activateTask(&data.tasks[NUM_SUPPORTED_TASKS-1], fn_ptr(idle));

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
			#endif

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
	debugio_putstr("\n\r");
	debugio_putstr("Kernel time: ");
	debugio_putuint_decimal((unsigned int)(data.kerntime>>32));
	debugio_putuint_decimal((unsigned int)data.kerntime);
	debugio_putstr("\n\r");
	debugio_putstr("Handler time: ");
	debugio_putuint_decimal((unsigned int)(data.handtime>>32));
	debugio_putuint_decimal((unsigned int)data.handtime);
	debugio_putstr("\n\r");
	debugio_putstr("User time: ");
	debugio_putuint_decimal((unsigned int)(data.usertime>>32));
	debugio_putuint_decimal((unsigned int)data.usertime);
	debugio_putstr("\n\r");
	debugio_putstr("Idle time: ");
	debugio_putuint_decimal((unsigned int)(data.tasks[NUM_SUPPORTED_TASKS-1].ticks>>32));
	debugio_putuint_decimal((unsigned int)data.tasks[NUM_SUPPORTED_TASKS-1].ticks);
	debugio_putstr("\n\r");
	debugio_putstr("Total time: ");
	unsigned long long int ttime = data.lasttick - data.inittime;
	debugio_putuint_decimal((unsigned int)(ttime>>32));
	debugio_putuint_decimal((unsigned int)ttime);
	debugio_putstr("\n\r");
	debugio_putstr("Percent idle: ");
	debugio_putint_decimal((data.tasks[NUM_SUPPORTED_TASKS-1].ticks * 100) / ttime);
	debugio_putstr("%\n\r");
	#endif

	cleanupTimer();

	return 0;
}
