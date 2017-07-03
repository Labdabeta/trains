#include "async_delay.h"
#include "tasks.h"

struct AsyncMessage {
	int cid;
	int delay;
	char *reply;
	int reply_size;
};

void async_delay_task(void)
{
	struct AsyncMessage msg;
	int tid;
	Receive(&tid, (char*)&msg, sizeof(msg));
	Reply(tid, 0, 0);

	Delay(msg.cid, msg.delay);

	tid = MyParentTid();
	Send(tid, msg.reply, msg.reply_size, 0, 0);

	Exit();
}

void async_delay(int clockid, int delay, char *reply, int reply_size)
{
	int child = CreateSize(1, async_delay_task, TASK_SIZE_TINY);
	struct AsyncMessage msg = {clockid, delay, reply, reply_size};
	Send(child, (char*)&msg, sizeof(msg), 0, 0);
}

