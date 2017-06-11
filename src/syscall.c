#include "syscall.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */
#include "tasks/tasks.h"
#include "tasks/clock_server.h"
#include "tasks/name_server.h"
#include "ts7200.h"

extern void *memcpy(void *dst, const void *src, unsigned int len);

void Exit(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_EXIT);
}

int CreateSize(int priority, void (*code)(), TaskSize size)
{
	return asm_callSystemInterrupt(priority, (int)code, (int)size, CODE_CREATE);
}

int Create(int priority, void (*code)())
{
	return CreateSize(priority, code, TASK_SIZE_NORMAL);
}

int MyTid(void)
{
	return asm_callSystemInterrupt(0,0,0,CODE_MY_ID);
}

int MyParentTid(void)
{
	return asm_callSystemInterrupt(0,0,0,CODE_PARENT_ID);
}

void Pass(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_PASS);
}

int SendBuffer(int tid, Buffer *msg, Buffer *reply)
{
	int result = asm_callSystemInterrupt(tid,(int)msg,(int)reply,CODE_SEND);

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

void *Share(int tid, void *msg)
{
	void *ret = 0;
	(void)asm_callSystemInterrupt(tid,(int)msg,(int)&ret,CODE_SHARE);
	return ret;
}

int ReceiveBuffer(int *tid, Buffer *msg)
{
	if (!asm_callSystemInterrupt((int)tid,(int)msg,0,CODE_RECEIVE)) {
		asm_callSystemInterrupt((int)tid,(int)msg,0,CODE_RECEIVE);
	}

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

void *Obtain(int *tid)
{
	void *ret = 0;
	if (asm_callSystemInterrupt((int)tid,(int)&ret,0,CODE_OBTAIN))
		asm_callSystemInterrupt((int)tid,(int)&ret,0,CODE_OBTAIN);

	return ret;
}

int ReplyBuffer(int tid, Buffer *reply)
{
	return asm_callSystemInterrupt(tid,(int)reply,0,CODE_REPLY);
}

int Reply(int tid, char *reply, int rplen)
{
	Buffer r;

	loadBuffer(&r, reply, rplen);

	return ReplyBuffer(tid, &r);
}

void Respond(int tid, void *rpl)
{
	(void)asm_callSystemInterrupt(tid,(int)rpl,0,CODE_RESPOND);
}

int RegisterAs(char *name)
{
	return sendRegisterAs(NAMESERVER_TID, name);
}

int WhoIs(char *name)
{
	return sendWhoIs(NAMESERVER_TID, name);
}

int AwaitEvent(EventType type)
{
	return asm_callSystemInterrupt(type, 0, 0, CODE_AWAIT);
}

void EnableEvent(EventType type)
{
	int code = (int)type;
	if (code > 31)
		ENABLE_INTERRUPT(2, code - 31);
	else
		ENABLE_INTERRUPT(1, code);
}

void DisableEvent(EventType type)
{
	int code = (int)type;
	if (code > 31)
		DISABLE_INTERRUPT(2, code - 31);
	else
		DISABLE_INTERRUPT(1, code);
}

int Time(int tid)
{
	return sendGetTime(tid);
}

void Delay(int tid, int ticks)
{
	sendDelay(tid, ticks);
}

void DelayUntil(int tid, int ticks)
{
	sendDelayUntil(tid, ticks);
}

unsigned long long int UTime(KernelTimer kt)
{
	unsigned long long int ret = 0;
	(void)asm_callSystemInterrupt((int)&ret, (int)kt, 0, CODE_UTIME);
	return ret;
}

void Service(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_SERVICE);
}

void KQuit(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_QUIT);
}
