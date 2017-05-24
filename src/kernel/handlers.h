#ifndef HANDLERS_H
#define HANDLERS_H

struct KernelData;
struct TaskDescriptor;

typedef enum SyscallCode {
    CODE_EXIT = 0,
    CODE_MY_ID,
    CODE_PARENT_ID
} SyscallCode;

int handleSyscall(struct KernelData *data, struct TaskDescriptor *active);

#endif /* HANDLERS_H */
