#include "syscall.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */
#include "tasks/tasks.h"

#include "debugio.h"

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

static char NameCommon(char *name, char prefix)
{
	int len = 0;
	char res;
	char msg[MAX_NAME_LENGTH];
	int err;

	while(name[len++]);
	if(len > MAX_NAME_LENGTH - 2)
		return -1;

	(void)memcpy((void*)(&msg[1]), (const void*)name, len + 1);
	msg[0] = prefix;
	err = Send(NAMESERVER_TID, msg, len + 2, &res, 1);
	return err > -1 && res ? res : -1;
}

int RegisterAs(char *name){
	return NameCommon(name, 'r');
}

int WhoIs(char *name){
	return NameCommon(name, 'w');
}
