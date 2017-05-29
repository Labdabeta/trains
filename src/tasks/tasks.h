#ifndef TASKS_H
#define TASKS_H

#include "syscall.h"

/* Initializes user space, then becomes name server as TID 1. */
void main_task(void);
void k1_test_task(void);
void name_server(void);
void rps_server(void);

#endif /* TASKS_H */
