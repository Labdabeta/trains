#include "syscall.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */
#include "tasks/tasks.h"

#include "debugio.h"

void Exit(void)
{
	(void)callSystemInterrupt(0,0,0,CODE_EXIT);
}

int CreateSize(int priority, void (*code)(), TaskSize size)
{
	return callSystemInterrupt(priority, (int)code, (int)size, CODE_CREATE);
}

int Create(int priority, void (*code)())
{
	return CreateSize(priority, code, TASK_SIZE_NORMAL);
}

int MyTid(void)
{
	return callSystemInterrupt(0,0,0,CODE_MY_ID);
}

int MyParentTid(void)
{
	return callSystemInterrupt(0,0,0,CODE_PARENT_ID);
}

void Pass(void)
{
	(void)callSystemInterrupt(0,0,0,CODE_PASS);
}

int SendBuffer(int tid, Buffer *msg, Buffer *reply)
{
	int result = callSystemInterrupt(tid,(int)msg,(int)reply,CODE_SEND);

	if (result == -2)
		return -2;

	if (reply->truncated)
		return -1;

	return reply->data_len;
}

int Send(int tid, char *msg, int msglen, char *reply, int rplen)
{
	Buffer m;
	Buffer r;

	loadBuffer(&m, msg, msglen);
	loadBuffer(&r, reply, rplen);

	return SendBuffer(tid, &m, &r);
}

int ReceiveBuffer(int *tid, Buffer *msg)
{
	if (!callSystemInterrupt((int)tid,(int)msg,0,CODE_RECEIVE))
		callSystemInterrupt((int)tid,(int)msg,0,CODE_RECEIVE);

	if (msg->truncated)
		return -1;

	return msg->data_len;
}

int Receive(int *tid, char *msg, int msglen)
{
	Buffer m;

	loadBuffer(&m, msg, msglen);

	return ReceiveBuffer(tid, &m);
}

int ReplyBuffer(int tid, Buffer *reply)
{
	return callSystemInterrupt(tid,(int)reply,0,CODE_REPLY);
}

int Reply(int tid, char *reply, int rplen)
{
	Buffer r;

	loadBuffer(&r, reply, rplen);

	return ReplyBuffer(tid, &r);
}

