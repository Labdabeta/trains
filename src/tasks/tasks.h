#ifndef TASKS_H
#define TASKS_H

#include "syscall.h"

/* Initializes user space, then becomes name server as TID 1. */
void main_task(void);
void name_server(void);
void clock_notifier(void);
void clock_courier(void);
void clock_server(void);
void cin_server(void);
void cin_courier(void);
void cin_notifier(void);
void cout_server(void);
void cout_courier(void);
void cout_notifier(void);
void idle(void);

/* User tasks. */
void hello(void);

#define DEBUG_STORE(LOCATION, X) *(int*)(LOCATION) = (X)

#endif /* TASKS_H */
