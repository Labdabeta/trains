#ifndef HANDLERS_H
#define HANDLERS_H

#include "buffer.h"

struct KernelData;
struct TaskDescriptor;

typedef enum SyscallCode {
	CODE_EXIT = 0,
	CODE_MY_ID,
	CODE_PARENT_ID,
	CODE_CREATE,
	CODE_PASS,
	CODE_SEND,
	CODE_RECEIVE, /* 0 return -> call again */
	CODE_REPLY,
	CODE_SHARE,
	CODE_OBTAIN, /* 0 return -> call again */
	CODE_RESPOND,
	CODE_AWAIT, /* Just add to await queue */
    CODE_AWAIT_TX,
    CODE_AWAIT_RX,
	CODE_UTIME,
	CODE_SERVICE,
	CODE_QUIT
} SyscallCode;

int handleSyscall(struct KernelData *data, struct TaskDescriptor *active);

#endif /* HANDLERS_H */
