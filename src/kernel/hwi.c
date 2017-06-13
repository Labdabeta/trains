#include "hwi.h"
#include "debugio.h"

struct HWIBlock {
	struct TaskDescriptor *task; /* The blocked task. */
	int *addr; /* The relevant address, or 0 if unused. */
	int send; /* The data to send */
	int isSend; /* 1 if we wish to send, 0 otherwise. */
};

static struct Scheduler *scheduler;
static struct HWIBlock event_blocks[EVENT_TYPE_MAX];

void initEventBlocks(struct Scheduler *s)
{
	int i;
	scheduler = s;
	for (i = 0; i < EVENT_TYPE_MAX; ++i) {
		event_blocks[i].task = 0;
		event_blocks[i].addr = 0;
	}
}

static inline void enableEventInterrupt(EventType type)
{
	dprintf("Enabling %d\n\r", type);
	if (type > 31)
		ENABLE_INTERRUPT(2, type - 32);
	else
		ENABLE_INTERRUPT(1, type);
}

static inline void disableEventInterrupt(EventType type)
{
	if (type > 31)
		DISABLE_INTERRUPT(2, type - 32);
	else
		DISABLE_INTERRUPT(1, type);
}

static inline void handleEvent(int event)
{
	dprintf("Got event %d\n\r", event);
	unblockTask(scheduler, event_blocks[event].task);
	disableEventInterrupt(event);
}

void EnterHWI(void)
{
	int vic;
	dprintf("VIC1: %x S, %x E, %x R\tVIC2: %x S, %x E, %x R\n\r",
			GET_INT(1), GET_ENA(1), GET_RAW(1),
			GET_INT(2), GET_ENA(2), GET_RAW(2));

	while ((vic = GET_INT(1)))
		handleEvent(__builtin_ctz(vic));
	while ((vic = GET_INT(2)))
		handleEvent(32 + __builtin_ctz(vic));
}

void addAwait(EventType type, struct TaskDescriptor *task)
{
	/* could 2x check for double blocking here. */
	event_blocks[type].task = task;
	event_blocks[type].addr = 0;
	enableEventInterrupt(type);
}

void addTransmit(EventType type, struct TaskDescriptor *task, int data, int *addr)
{
	event_blocks[type].task = task;
	event_blocks[type].addr = addr;
	event_blocks[type].send = data;
	event_blocks[type].isSend = 1;
	enableEventInterrupt(type);
}

void addReceive(EventType type, struct TaskDescriptor *task, int *addr)
{
	event_blocks[type].task = task;
	event_blocks[type].addr = addr;
	event_blocks[type].isSend = 0;
	enableEventInterrupt(type);
}
