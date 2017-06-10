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

static int NameCommon(char *name, char prefix)
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

int AwaitEvent(EventType event){
	return asm_callSystemInterrupt(0, 0, 0, CODE_AWAIT);
}

int AwaitTransmit(char c){
	return asm_callSystemInterrupt(c, 0, 0, CODE_TRANSMIT);
}

int Time(int tid){
	struct intandflag msg;
	msg.code = 't';
	Send(tid, &msg.code, 1, (char*) &msg, sizeof(struct intandflag));
	return msg.val;
}

static inline void DelayCommon(int tid, char code, int arg)
{
	struct intandflag msg;
	msg.val = arg;
	msg.code = code;
	Send(tid, (void *)&msg, sizeof(struct intandflag), 0, 0);
}

void Delay(int tid, int ticks)
{
	DelayCommon(tid, 'd', ticks);
}

void DelayUntil(int tid, int ticks)
{
	DelayCommon(tid, 'u', ticks);
}

unsigned long long int UTime(KernelTimer kt)
{
	unsigned long long int ret = 0;
	(void)asm_callSystemInterrupt((int)&ret, (int)kt, 0, CODE_UTIME);
	return ret;
}

void SetGlobalTID(void *global, int tid)
{
	(void)asm_callSystemInterrupt((int)global, tid, 0, CODE_SETGLOBALTID);
}

void Service(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_SERVICE);
}

void KQuit(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_QUIT);
}

char Getc(int tid, int uart){
	char c;
	Send(tid, 0, 0, &c, 1);
	return c;
}

void Putc(int tid, int uart, char ch){
	char c = ch;
	Send(tid, &c, 1, 0, 0);
}
