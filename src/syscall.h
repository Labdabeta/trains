#ifndef SYSCALL_H
#define SYSCALL_H

#include "buffer.h"
#define NAMESERVER_TID 70
#define MAX_NAME_LENGTH 32

typedef enum TaskSize {
	TASK_SIZE_GIANT = 0,
	TASK_SIZE_BIG,
	TASK_SIZE_NORMAL,
	TASK_SIZE_SMALL,
	TASK_SIZE_TINY
} TaskSize;

void Exit(void);

int CreateSize(int priority, void (*code)(), TaskSize size);

int Create(int priority, void (*code)());

int MyTid(void);

int MyParentTid(void);

void Pass(void);

int SendBuffer(int tid, Buffer *msg, Buffer *reply);

int Send(int tid, char *msg, int msglen, char *reply, int rplen);

int ReceiveBuffer(int *tid, Buffer *msg);

int Receive(int *tid, char *msg, int msglen);

int ReplyBuffer(int tid, Buffer *reply);

int Reply(int tid, char *reply, int rplen);

int RegisterAs(char *name);

int WhoIs(char *name);

#endif /* SYSCALL_H */
