#ifndef SYSCALL_H
#define SYSCALL_H

typedef enum TaskSize {
    TASK_SIZE_GIANT = 0,
    TASK_SIZE_BIG,
    TASK_SIZE_NORMAL,
    TASK_SIZE_SMALL,
    TASK_SIZE_TINY
} TaskSize;

void Exit(void);

int Create(int priority, void (*code)(), TaskSize size);

int MyTid(void);

int MyParentTid(void);

void Pass(void);

#endif /* SYSCALL_H */
