#ifndef TASKS_H
#define TASKS_H

#include "syscall.h"
#include "debugio.h" /* Safe now that debugio doesn't print to the UARTS */

/* Tasks indented based on who creates who. */
void main_task(void);
	void name_server(void);
	void clock_server(void);
		void clock_courier(void);
			void clock_notifier(void);
	void cin_server(void);
		void cin_courier(void);
			void cin_notifier(void);
	void cout_server(void);
		void cout_courier(void);
			void cout_notifier(void);
	void hello(void);
void idle(void);


#include "printf/printf.h"

#endif /* TASKS_H */
