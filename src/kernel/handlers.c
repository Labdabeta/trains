#include "handlers.h"
#include "debugio.h"
#include "kernel.h"
#include "task.h"
#include "linker.h"

static inline int handleCreate(struct KernelData *data, struct TaskDescriptor *active)
{
	int prio = data->argv[0];
	int code = fn_ptr(data->argv[1]);
	int size = data->argv[2];

	if (prio < 0 || prio >= NUM_PRIORITIES)
		return -1;

	int newid = newTID(data, size);

	if (newid > 0) {
		struct TaskDescriptor *newtask = &data->tasks[newid];
		newtask->priority = prio;
		newtask->parent = active;
		activateTask(newtask, (void*)code);

		scheduleTask(&data->scheduler, newtask);
	}

	/* convert -1 to -2 */
	return newid - (newid == -1);
}

static inline int handleSend(struct KernelData *data, struct TaskDescriptor *active)
{
	int tid = data->argv[0];
	Buffer *msg = (Buffer*)data->argv[1];
	Buffer *reply = (Buffer*)data->argv[2];
	struct TaskDescriptor *target = 0;

    DEBUG_PRINT("Sending");
    DEBUG_DUMP_VAL(tid);
    DEBUG_DUMP_ADR(msg);
    DEBUG_DUMP_ADR(reply);

	if (tid < 0 ||
		tid > NUM_SUPPORTED_TASKS ||
		data->tasks[tid].priority >= NUM_PRIORITIES)
		return -2;

	/* Load our buffers. */
	active->buf[0] = msg;
	active->buf[1] = reply;

	/* Add ourselves to the target's recv queue. */
	target = &data->tasks[tid];
	active->nextRecv = 0;
	if (target->recvQueueTail)
		target->recvQueueTail->nextRecv = active;
	if (!target->recvQueueHead)
		target->recvQueueHead = active;
	target->recvQueueTail = active;

	/* Make sure the target isn't blocked. */
	unblockTask(&data->scheduler, target);

	/* Set ourselves up for blocking. */
	active->state = STATE_SEND_BLOCKED;
	blockTask(&data->scheduler, active);

	return 0;
}

static inline int handleReceive(struct KernelData *data, struct TaskDescriptor *active)
{
	int *tid = (int*)data->argv[0];
	Buffer *msg = (Buffer*)data->argv[1];


    DEBUG_PRINT("Receiving");
    DEBUG_DUMP_ADR(tid);
    DEBUG_DUMP_ADR(msg);

	if (active->recvQueueHead) {
		struct TaskDescriptor *sender = active->recvQueueHead;
        DEBUG_DUMP_ADR(sender);
		writeBuffer(msg, sender->buf[0]);
		*tid = sender->tid;
		sender->state = STATE_REPL_BLOCKED;
		/* Don't awaken sender yet, they still need their reply. */
		active->recvQueueHead = sender->nextRecv;

		return 1;
	} else {
		active->state = STATE_RECV_BLOCKED;
		blockTask(&data->scheduler, active);
		return 0;
	}
}

static inline int handleReply(struct KernelData *data, struct TaskDescriptor *active)
{
	int tid = data->argv[0];
	Buffer *reply = (Buffer*)data->argv[1];
	struct TaskDescriptor *target;

    DEBUG_PRINT("Receiving Reply");
    DEBUG_DUMP_VAL(tid);
    DEBUG_DUMP_ADR(reply);

	if (tid < 0 ||
		tid > NUM_SUPPORTED_TASKS ||
		data->tasks[tid].priority >= NUM_PRIORITIES)
		return -2;

	target = &data->tasks[tid];

	if (target->state != STATE_REPL_BLOCKED)
		return -3;

	writeBuffer(target->buf[1], reply);
	target->state = STATE_ACTIVE;
	unblockTask(&data->scheduler, target);

	return -1 * (target->buf[1]->truncated);
}

int handleSyscall(struct KernelData *data, struct TaskDescriptor *active)
{
	switch (data->fn) {
		case CODE_EXIT:
			active->priority = NUM_PRIORITIES;
            DEBUG_PRINT("Zombied: ");
            DEBUG_DUMP_VAL(active->tid);
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
		case CODE_PASS:
			return 0;
		case CODE_SEND:
			return handleSend(data, active);
		case CODE_RECEIVE:
			return handleReceive(data, active);
		case CODE_REPLY:
			return handleReply(data, active);
		default:
			debugio_putstr("\n\rInvalid syscall...\n\r");
			DEBUG_DUMP_VAL(data->fn);
			return -1;
	}
}
