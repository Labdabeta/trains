#include "handlers.h"
#include "kernel.h"
#include "task.h"
#include "linker.h"
#include "debugio.h"
#include "hwi.h"

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
		newtask->state = STATE_ACTIVE;
		newtask->ticks = 0;
		activateTask(newtask, (void*)code);

		scheduleTask(&data->scheduler, newtask);
		data->alive++;
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

	return 0;
}

static inline int handleShare(struct KernelData *data, struct TaskDescriptor *active)
{
	int tid = data->argv[0];
	void *msg = (void*)data->argv[1];
	void **rpl = (void**)data->argv[2];
	struct TaskDescriptor *target = 0;

	active->share[0] = msg;
	active->share[1] = rpl;

	target = &data->tasks[tid];
	active->nextObt = 0;
	if (target->obtQueueTail)
		target->obtQueueTail->nextObt = active;
	if (!target->obtQueueHead)
		target->obtQueueHead = active;
	target->obtQueueTail = active;

	if (target->state == STATE_OBTAIN_BLOCKED)
		unblockTask(&data->scheduler, target);

	/* Set ourselves up for blocking. */
	active->state = STATE_SHARE_BLOCKED;

	return 0;
}

static inline int handleReceive(struct KernelData *data, struct TaskDescriptor *active)
{
	int *tid = (int*)data->argv[0];
	Buffer *msg = (Buffer*)data->argv[1];

	if (active->recvQueueHead) {
		struct TaskDescriptor *sender = active->recvQueueHead;
		writeBuffer(msg, sender->buf[0]);
		*tid = sender->tid;
		sender->state = STATE_REPL_BLOCKED;
		/* Don't awaken sender yet, they still need their reply. */
		if (active->recvQueueTail == active->recvQueueHead) active->recvQueueTail = 0;
		active->recvQueueHead = sender->nextRecv;

		return 1;
	} else {
		active->state = STATE_RECV_BLOCKED;
		return 0;
	}
}

static inline int handleObtain(struct KernelData *data, struct TaskDescriptor *active)
{
	int *tid = (int*)data->argv[0];
	void **ret = (void**)data->argv[1];

	if (active->obtQueueHead) {
		struct TaskDescriptor *sender = active->obtQueueHead;
		*ret = sender->share[0];
		*tid = sender->tid;
		sender->state = STATE_RESPOND_BLOCKED;
		/* Don't awaken sender yet, they still need their reply. */
		if (active->obtQueueTail == active->obtQueueHead) active->obtQueueTail = 0;
		active->obtQueueHead = sender->nextObt;

		return 1;
	} else {
		active->state = STATE_OBTAIN_BLOCKED;
		return 0;
	}
}

static inline int handleReply(struct KernelData *data, struct TaskDescriptor *active)
{
	int tid = data->argv[0];
	Buffer *reply = (Buffer*)data->argv[1];
	struct TaskDescriptor *target;

	if (tid < 0 ||
		tid > NUM_SUPPORTED_TASKS ||
		data->tasks[tid].priority >= NUM_PRIORITIES)
		return -2;

	target = &data->tasks[tid];

	if (target->state != STATE_REPL_BLOCKED)
		return -3;

	writeBuffer(target->buf[1], reply);
	unblockTask(&data->scheduler, target);

	return -1 * (target->buf[1]->truncated);
}

static inline int handleRespond(struct KernelData *data, struct TaskDescriptor *active)
{
	int tid = data->argv[0];
	void *ret = (void*)data->argv[1];

	struct TaskDescriptor *target = &data->tasks[tid];

	target->share[1] = ret;
	unblockTask(&data->scheduler, target);

	return 0;
}

static inline int handleUtime(struct KernelData *data, struct TaskDescriptor *active)
{
	unsigned long long int *ret = (unsigned long long int*)data->argv[0];
	int which = data->argv[1];

	switch (which) {
		case 0: *ret = active->ticks; break;
		case 1: *ret = data->usertime; break;
		case 2: *ret = data->kerntime; break;
		case 3: *ret = data->handtime; break;
		case 4: *ret = data->inittime; break;
		default: *ret = 0;
	}
	return 0;
}

int handleSyscall(struct KernelData *data, struct TaskDescriptor *active)
{
	switch (data->fn) {
		case CODE_EXIT:
			active->state = STATE_ZOMBIE;
			active->priority = -1;
			data->alive--;
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
        case CODE_SHARE:
            return handleShare(data, active);
        case CODE_OBTAIN:
            return handleObtain(data, active);
        case CODE_RESPOND:
            return handleRespond(data, active);
        case CODE_AWAIT:
            active->state = STATE_EVENT_BLOCKED;
            addAwait(data->argv[0], active);
            return 0; /* Not actually returned. */
        case CODE_AWAIT_TX:
            active->state = STATE_EVENT_BLOCKED;
            addTransmit(data->argv[0], active, data->argv[1], (int*)data->argv[2]);
            return 0;
        case CODE_AWAIT_RX:
            active->state = STATE_EVENT_BLOCKED;
            addReceive(data->argv[0], active, (int*)data->argv[2]);
            return 0;
        case CODE_UTIME:
            return handleUtime(data, active);
        case CODE_SERVICE:
            data->alive--;
            return 0;
        case CODE_QUIT:
            data->alive = 0;
            return 0;
        default:
            DEBUG_PRINT("%s", "Invalid syscall...\n\r");
            return -1;
	}
}
