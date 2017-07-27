#include "syscall.h"
#include "kernel/interface.h" /* Kernel space breach */
#include "kernel/handlers.h" /* Kernel space breach */
#include "tasks/tasks.h"
#include "tasks/drivers/clock_server.h"
#include "tasks/util/name_server.h"
#include "tasks/drivers/cin_server.h"
#include "tasks/drivers/cout_server.h"
#include "tasks/drivers/tin_server.h"
#include "tasks/drivers/tout_server.h"
#include "trains/ts7200.h"
#include "tasks/logging.h"

extern void *memcpy(void *dst, const void *src, unsigned int len);

#undef dprintf
#define dprintf(...)

void Exit(void)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	(void)asm_callSystemInterrupt(0,0,0,CODE_EXIT);
}

int CreateSize(int priority, void (*code)(), TaskSize size)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d, %d, %d) ", __func__, priority, code, size);
#endif
	int ret = asm_callSystemInterrupt(priority, (int)code, (int)size, CODE_CREATE);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
    LOG(LOG_CREATE, "%d - %x", ret, (int)code);
#endif
    return ret;
}

int Create(int priority, void (*code)())
{
	return CreateSize(priority, code, TASK_SIZE_NORMAL);
}

int MyTid(void)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	int ret = asm_callSystemInterrupt(0,0,0,CODE_MY_ID);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

int MyParentTid(void)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	int ret = asm_callSystemInterrupt(0,0,0,CODE_PARENT_ID);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

void Pass(void)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	(void)asm_callSystemInterrupt(0,0,0,CODE_PASS);
}

int SendBuffer(int tid, Buffer *msg, Buffer *reply)
{
	int result = asm_callSystemInterrupt(tid,(int)msg,(int)reply,CODE_SEND);

	if (result == -2)
		return -2;

	if (reply->truncated)
		return -1;

	if (reply->data_len == (size_t)(~0))
		return -3; // dead task

	return reply->data_len;
}

int Send(int tid, char *msg, int msglen, char *reply, int rplen)
{
	Buffer m;
	Buffer r;
#ifdef DEBUG_MODE
    int i;
    dprintf("%s(%d, {", __func__, tid);
    if (msglen > 0) {
        dprintf("%d",(int)msg[0]);
        for (i = 1; i < msglen; ++i)
           dprintf(",%d",(int)msg[i]);
    }
    dprintf("}, %d) ", rplen);
#endif

	loadBuffer(&m, msg, msglen);
	loadBuffer(&r, reply, rplen);

	int ret = SendBuffer(tid, &m, &r);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
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
#ifdef DEBUG_MODE
    dprintf("%s(%d) ", __func__, msglen);
#endif
	Buffer m;

	loadBuffer(&m, msg, msglen);

	int ret = ReceiveBuffer(tid, &m);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

int ReplyBuffer(int tid, Buffer *reply)
{
	return asm_callSystemInterrupt(tid,(int)reply,0,CODE_REPLY);
}

int Reply(int tid, char *reply, int rplen)
{
	Buffer r;
#ifdef DEBUG_MODE
    int i;
    dprintf("%s(%d, {", __func__, tid);
    if (rplen > 0) {
        dprintf("%d",(int)reply[0]);
        for (i = 1; i < rplen; ++i)
           dprintf(",%d",(int)reply[i]);
    }
    dprintf("}) ");
#endif

	loadBuffer(&r, reply, rplen);

	int ret = ReplyBuffer(tid, &r);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

int RegisterAs(char *name)
{
#ifndef DEBUG_MODE
    dprintf("%s(%s) ", __func__, name);
#endif
	int ret = sendRegisterAs(NAMESERVER_TID, name);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

int WhoIs(char *name)
{
#ifndef DEBUG_MODE
    dprintf("%s(%s) ", __func__, name);
#endif
	int ret = sendWhoIs(NAMESERVER_TID, name);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

void AwaitEvent(EventType type)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	(void)asm_callSystemInterrupt(type, 0, 0, CODE_AWAIT);
}

void AwaitTransmission(EventType type, int value, int *addr)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d, %x) ", __func__, value, addr);
#endif
    (void)asm_callSystemInterrupt(type, value, (int)addr, CODE_AWAIT_TX);
}

int AwaitReceive(EventType type, int *addr)
{
#ifdef DEBUG_MODE
    dprintf("%s(%x) ", __func__, addr);
#endif
    return asm_callSystemInterrupt(type, 0, (int)addr, CODE_AWAIT_RX);
}

int Time(int tid)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d) ", __func__, tid);
#endif
	int ret = sendGetTime(tid);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

void Delay(int tid, int ticks)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d, %d) ", __func__, tid, ticks);
#endif
	if(ticks > 0)
		sendDelay(tid, ticks);
}

void DelayUntil(int tid, int ticks)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d, %d) ", __func__, tid, ticks);
#endif
	if(ticks > 0)
	 sendDelayUntil(tid, ticks);
}

unsigned long long int UTime(KernelTimer kt)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d) ", __func__, kt);
#endif
	unsigned long long int ret = 0;
	(void)asm_callSystemInterrupt((int)&ret, (int)kt, 0, CODE_UTIME);
	return ret;
}

int Getc(int tid, int uart)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d, %d) ", __func__, tid, uart);
#endif
	if (uart == 1) {
		int ret = sendTinGetc(tid);
#ifdef DEBUG_MODE
        dprintf("=%d ", ret);
#endif
        return ret;
    }
	int ret = sendCinGetc(tid);
#ifdef DEBUG_MODE
    dprintf("=%d ", ret);
#endif
    return ret;
}

int Putc(int tid, int uart, char ch)
{
#ifdef DEBUG_MODE
    dprintf("%s(%d, %d, %d) ", tid, uart, (int)ch);
#endif
	if (uart == 1) {
		sendToutByte(tid, ch);
		return 0;
	}
	sendCoutPutstr(tid, &ch, 1);
	return 0;
}

int Putstr(int tid, int uart, char *str, int strlen)
{
	if (uart == 1) {
        char *ch;
        for (ch = str; ch[0] && ch[1]; ch += 2)
            sendToutBytePair(tid, ch[0], ch[1]);
        if (ch[0])
            sendToutByte(tid, *ch);
		return 0;
	}
	sendCoutPutstr(tid, str, strlen);
	return 0;
}

void Service(void)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	(void)asm_callSystemInterrupt(0,0,0,CODE_SERVICE);
}

void KQuit(void)
{
#ifdef DEBUG_MODE
    dprintf("%s() ", __func__);
#endif
	(void)asm_callSystemInterrupt(0,0,0,CODE_QUIT);
}
