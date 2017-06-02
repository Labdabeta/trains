#ifndef TASKS_H
#define TASKS_H

#include "syscall.h"

/* Initializes user space, then becomes name server as TID 1. */
void main_task(void);
void rps_server(void);
void rps_client(void);
void name_server(void);
void clock_notifier(void);

#endif /* TASKS_H */
