#include "syscall.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */
#include "tasks/tasks.h"
#include "tasks/drivers/clock_server.h"
#include "tasks/drivers/name_server.h"
#include "tasks/drivers/cin_server.h"
#include "tasks/drivers/cout_server.h"
#include "tasks/drivers/tin_server.h"
#include "tasks/drivers/tout_server.h"
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

void AwaitEvent(EventType type)
{
	(void)asm_callSystemInterrupt(type, 0, 0, CODE_AWAIT);
}

void AwaitTransmission(EventType type, int value, int *addr)
{
    (void)asm_callSystemInterrupt(type, value, (int)addr, CODE_AWAIT_TX);
}

int AwaitReceive(EventType type, int *addr)
{
    return asm_callSystemInterrupt(type, 0, (int)addr, CODE_AWAIT_RX);
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

int Getc(int tid, int uart)
{
	if (uart == 1)
		return sendTinGetc(tid);
	return sendCinGetc(tid);
}

int Putc(int tid, int uart, char ch)
{
	if (uart == 1) {
		sendToutByte(tid, ch);
		return 0;
	}
	char msg[2];
	msg[0] = ch;
	msg[1] = 0;
	sendCoutPutstr(tid, msg);
	return 0;
}

int Putstr(int tid, int uart, char *str)
{
	if (uart == 1) {
        char *ch;
        for (ch = str; ch[0] && ch[1]; ch += 2)
            sendToutBytePair(tid, ch[0], ch[1]);
        if (ch[0])
            sendToutByte(tid, *ch);
		return 0;
	}
	sendCoutPutstr(tid, str);
	return 0;
}

void Service(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_SERVICE);
}

void KQuit(void)
{
	(void)asm_callSystemInterrupt(0,0,0,CODE_QUIT);
}
