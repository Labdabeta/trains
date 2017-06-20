#include <server.h>
#include "kernel/task.h"
#include "clock_server.h"

#define PQ_CAPACITY NUM_SUPPORTED_TASKS
#include "pq.h"

struct Data {
	int ticks;
	struct PriorityQueue queue;
};

typedef enum TimerMessageType {
	TMT_TICK, /* for when a tick happens. */
	TMT_DELAY,
	TMT_DELAY_UNTIL,
	TMT_TIME
} TimerMessageType;

struct Message {
	int val;
	TimerMessageType type;
};

ENTRY initialize(struct Data *data)
{
	RegisterAs("CLOCK");
	data->ticks = 0;
	pqInit(&data->queue);

	(void)CreateSize(1, clock_courier, TASK_SIZE_TINY);
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	(void)size; /* unused */
	switch (m->type) {
		case TMT_TICK:
			Reply(tid, 0, 0);
			data->ticks++;
			while (pqSize(&data->queue) && pqGetMinPriority(&data->queue) < data->ticks) {
				Reply(pqGetMin(&data->queue), 0, 0);
				pqPop(&data->queue);
			}
			break;
		case TMT_DELAY:
			pqInsert(&data->queue, m->val + data->ticks, tid);
			break;
		case TMT_DELAY_UNTIL:
			pqInsert(&data->queue, m->val, tid);
			break;
		case TMT_TIME:
			Reply(tid, (char*)&data->ticks, sizeof(data->ticks));
			break;
		default:
			DEBUG_PRINT("ERROR: Invalid code (%d) passed to clock server from %d.", m->type, tid);
	}
}

void sendTick(int tid)
{
	struct Message msg;
	msg.type = TMT_TICK;

	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void sendDelay(int tid, int ticks)
{
	struct Message msg;
	msg.val = ticks;
	msg.type = TMT_DELAY;

	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void sendDelayUntil(int tid, int ticks)
{
	struct Message msg;
	msg.val = ticks;
	msg.type = TMT_DELAY_UNTIL;

	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

int sendGetTime(int tid)
{
	struct Message msg;
	int time;

	msg.type = TMT_TIME;

	Send(tid, (char*)&msg, sizeof(msg), (char*)&time, sizeof(time));

	return time;
}

MAKE_SERVER(clock_server)
