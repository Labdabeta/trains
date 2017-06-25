#ifndef TASK_H
#define TASK_H

#include "buffer.h"
#include "asm.h"

/* Don't forget the hardcoded name server tid. */

/* Change these to increase tasks */
#define NUM_SUPPORTED_TASKS 75
#define NUM_GIANT_TASKS 3 /* 1 is kernel */
#define NUM_BIG_TASKS 10
#define NUM_NORMAL_TASKS 15
#define NUM_SMALL_TASKS 17
#define NUM_TINY_TASKS 30

/* Indices in the tid array */
#define GIANT_TASK_INITIAL_IDX 0
#define BIG_TASK_INITIAL_IDX NUM_GIANT_TASKS
#define NORMAL_TASK_INITIAL_IDX BIG_TASK_INITIAL_IDX + NUM_BIG_TASKS
#define SMALL_TASK_INITIAL_IDX NORMAL_TASK_INITIAL_IDX + NUM_NORMAL_TASKS
#define TINY_TASK_INITIAL_IDX SMALL_TASK_INITIAL_IDX + NUM_SMALL_TASKS

/* Size of each task type in addresses */
#define GIANT_TASK_SIZE_BYTES 0x200000
#define BIG_TASK_SIZE_BYTES 0x100000
#define NORMAL_TASK_SIZE_BYTES 0x40000
#define SMALL_TASK_SIZE_BYTES 0x10000
#define TINY_TASK_SIZE_BYTES 0x4000

#define SIZE_GIANT 0
#define SIZE_BIG 1
#define SIZE_NORMAL 2
#define SIZE_SMALL 3
#define SIZE_TINY 4

struct TaskFrame {
	int pc; int r4; int r5; int r6; int r7; int r8;
	int r9; int r10; int r11; int fp; int lr;
};

typedef enum TaskState {
	STATE_ACTIVE = 0,
	STATE_ZOMBIE = 1,
	STATE_SEND_BLOCKED,
	STATE_RECV_BLOCKED,
	STATE_REPL_BLOCKED,
	STATE_SHARE_BLOCKED,
	STATE_OBTAIN_BLOCKED,
	STATE_RESPOND_BLOCKED,
	STATE_EVENT_BLOCKED
} TaskState;

typedef struct TaskDescriptor {
	int tid;

	/* Context */
	int cpsr;
	int rval; /* return value */
	void *stack; /* The top of memory of the stack */
	struct TaskFrame *data;

	/* Scheduler */
	struct TaskDescriptor *next; /* Set to "1" if 'real' blocked. */
	int priority; /* -1 == dead */

	/* Hierarchy */
	struct TaskDescriptor *parent;

	/* Message passing */
	struct TaskDescriptor *recvQueueHead;
	struct TaskDescriptor *recvQueueTail;
	struct TaskDescriptor *nextRecv;
	struct TaskDescriptor *obtQueueHead;
	struct TaskDescriptor *obtQueueTail;
	struct TaskDescriptor *nextObt;
	void *share[2]; /* { normal, reply/extra } */
	struct Buffer *buf[2]; /* { normal, reply/extra } */
	TaskState state;

	/* Runtime */
	unsigned long long int ticks; /* t4 ticks spent in this task. */
} *TD_ptr;

/** Initializes an entire task array to point to the correct addresses.
 *
 * This fills the tasks in the array to have frames at the addresses specified
 * in the comment at the end of this file.
 *
 * The provided array must contain at least NUM_SUPPORTED_TASKS elements.
 *
 * \param[in,out] ta           The task array to setup.
 */
void setupTaskArray(struct TaskDescriptor *ta);

/** Loads a task into memory for execution.
 *
 * This function loads a task's stack into memory, saving its location and
 * registers.
 *
 * \param[in,out] td           The task descriptor of the task to load.
 * \param[in] entry            The entry point of the task.
 */
void activateTask(struct TaskDescriptor *td, void (*entry)());

/** Re-enters a task.
 *
 * This transfers execution from the current task to the specified task, saving
 * state and switching modes as necessary.
 *
 * \param[in] td               The task to transfer control to.
 */
static inline void enterTask(struct TaskDescriptor *td)
{
	extern int asm_EnterTask(struct TaskFrame *sp, int cpsr, int rval);
	td->data = (struct TaskFrame*)asm_EnterTask((struct TaskFrame*)td->data, td->cpsr, td->rval);
	ASM ("mov %0, r1" : "=r"(td->cpsr));
}

#endif /* TASK_H */

/*******************************************************************************
 * There are 32mb of addressable memory. These are split into tasks as
 * follows:
 *
 *  - 4 giant tasks (2mb each) [total: 8mb]
 *  - 14 big tasks (1mb each) [total: 14mb]
 *  - 24 normal tasks (256kb each) [total: 6mb]
 *  - 28 small tasks (64kb each) [total: 1.75mb]
 *  - 16 tiny tasks (16kb each) [total: 0.25mb]
 *  - Code (2mb allowed)
 *
 *  Total: 86 tasks
 *
 * Task layout in memory:
 *
 * 0x2000000 - Top of memory (32mb) [exclusive, approximate]
 *      .      Giant Task 1 (2mb) [kernel]
 * 0x1E00000
 *      .      Giant Task 2 (2mb) [1]
 * 0x1C00000
 *      .      Giant Task 3 (2mb) [2]
 * 0x1A00000
 *      .      Giant Task 4 (2mb) [3]
 * 0x1800000
 *      .      Big Task 1 (1mb) [4]
 * 0x1700000
 *      .      Big Task 2 (1mb) [5]
 * 0x1600000
 *      .      Big Task 3 (1mb) [6]
 * 0x1500000
 *      .      Big Task 4 (1mb) [7]
 * 0x1400000
 *      .      Big Task 5 (1mb) [8]
 * 0x1300000
 *      .      Big Task 6 (1mb) [9]
 * 0x1200000
 *      .      Big Task 7 (1mb) [10]
 * 0x1100000
 *      .      Big Task 8 (1mb) [11]
 * 0x1000000
 *      .      Big Task 9 (1mb) [12]
 * 0x0F00000
 *      .      Big Task 10 (1mb) [13]
 * 0x0E00000
 *      .      Big Task 11 (1mb) [14]
 * 0x0D00000
 *      .      Big Task 12 (1mb) [15]
 * 0x0C00000
 *      .      Big Task 13 (1mb) [16]
 * 0x0B00000
 *      .      Big Task 14 (1mb) [17]
 * 0x0A00000
 *      .      Task 1 (256kb) [18]
 * 0x09C0000
 *      .      Task 2 (256kb) [19]
 * 0x0980000
 *      .      Task 3 (256kb) [20]
 * 0x0940000
 *      .      Task 4 (256kb) [21]
 * 0x0900000
 *      .      Task 5 (256kb) [22]
 * 0x08C0000
 *      .      Task 6 (256kb) [23]
 * 0x0880000
 *      .      Task 7 (256kb) [24]
 * 0x0840000
 *      .      Task 8 (256kb) [25]
 * 0x0800000
 *      .      Task 9 (256kb) [26]
 * 0x07C0000
 *      .      Task 10 (256kb) [27]
 * 0x0780000
 *      .      Task 11 (256kb) [28]
 * 0x0740000
 *      .      Task 12 (256kb) [29]
 * 0x0700000
 *      .      Task 13 (256kb) [30]
 * 0x06C0000
 *      .      Task 14 (256kb) [31]
 * 0x0680000
 *      .      Task 15 (256kb) [32]
 * 0x0640000
 *      .      Task 16 (256kb) [33]
 * 0x0600000
 *      .      Task 17 (256kb) [34]
 * 0x05C0000
 *      .      Task 18 (256kb) [35]
 * 0x0580000
 *      .      Task 19 (256kb) [36]
 * 0x0540000
 *      .      Task 20 (256kb) [37]
 * 0x0500000
 *      .      Task 21 (256kb) [38]
 * 0x04C0000
 *      .      Task 22 (256kb) [39]
 * 0x0480000
 *      .      Task 23 (256kb) [40]
 * 0x0440000
 *      .      Task 24 (256kb) [41]
 * 0x0400000
 *      .      Small Task 1 (64kb) [42]
 * 0x03F0000
 *      .      Small Task 2 (64kb) [43]
 * 0x03E0000
 *      .      Small Task 3 (64kb) [44]
 * 0x03D0000
 *      .      Small Task 4 (64kb) [45]
 * 0x03C0000
 *      .      Small Task 5 (64kb) [46]
 * 0x03B0000
 *      .      Small Task 6 (64kb) [47]
 * 0x03A0000
 *      .      Small Task 7 (64kb) [48]
 * 0x0390000
 *      .      Small Task 8 (64kb) [49]
 * 0x0380000
 *      .      Small Task 9 (64kb) [50]
 * 0x0370000
 *      .      Small Task 10 (64kb) [51]
 * 0x0360000
 *      .      Small Task 11 (64kb) [52]
 * 0x0350000
 *      .      Small Task 12 (64kb) [53]
 * 0x0340000
 *      .      Small Task 13 (64kb) [54]
 * 0x0330000
 *      .      Small Task 14 (64kb) [55]
 * 0x0320000
 *      .      Small Task 15 (64kb) [56]
 * 0x0310000
 *      .      Small Task 16 (64kb) [57]
 * 0x0300000
 *      .      Small Task 17 (64kb) [58]
 * 0x02F0000
 *      .      Small Task 18 (64kb) [59]
 * 0x02E0000
 *      .      Small Task 19 (64kb) [60]
 * 0x02D0000
 *      .      Small Task 20 (64kb) [61]
 * 0x02C0000
 *      .      Small Task 21 (64kb) [62]
 * 0x02B0000
 *      .      Small Task 22 (64kb) [63]
 * 0x02A0000
 *      .      Small Task 23 (64kb) [64]
 * 0x0290000
 *      .      Small Task 24 (64kb) [65]
 * 0x0280000
 *      .      Small Task 25 (64kb) [66]
 * 0x0270000
 *      .      Small Task 26 (64kb) [67]
 * 0x0260000
 *      .      Small Task 27 (64kb) [68]
 * 0x0250000
 *      .      Small Task 28 (64kb) [69]
 * 0x0240000
 *      .      Tiny Task 1 (4kb) [70]
 * 0x023C000
 *      .      Tiny Task 2 (4kb) [71]
 * 0x0238000
 *      .      Tiny Task 3 (4kb) [72]
 * 0x0234000
 *      .      Tiny Task 4 (4kb) [73]
 * 0x0230000
 *      .      Tiny Task 5 (4kb) [74]
 * 0x022C000
 *      .      Tiny Task 6 (4kb) [75]
 * 0x0228000
 *      .      Tiny Task 7 (4kb) [76]
 * 0x0224000
 *      .      Tiny Task 8 (4kb) [77]
 * 0x0220000
 *      .      Tiny Task 9 (4kb) [78]
 * 0x021C000
 *      .      Tiny Task 10 (4kb) [79]
 * 0x0218000
 *      .      Tiny Task 11 (4kb) [80]
 * 0x0214000
 *      .      Tiny Task 12 (4kb) [81]
 * 0x0210000
 *      .      Tiny Task 13 (4kb) [82]
 * 0x020C000
 *      .      Tiny Task 14 (4kb) [83]
 * 0x0208000
 *      .      Tiny Task 15 (4kb) [84]
 * 0x0204000
 *      .      Tiny Task 16 (4kb) [85]
 * 0x0200000 - Max top of code (2mb) [exclusive]
 */
