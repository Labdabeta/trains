#ifndef TASKS_H
#define TASKS_H

#include "syscall.h"
#include "debugio.h" /* Safe now that debugio doesn't print to the UARTS */
#include "logging.h"

#define EMPTY char _unused[0]
#define IGNORED char _unused[0];

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
	void tin_server(void);
		void tin_courier(void);
			void tin_notifier(void);
	void tout_server(void);
		void tout_courier(void);
			void tout_notifier(void);
    void gui(void);
    void parse_server(void);
    void track_server(void);
    void hotel(void);
    void router(void);
    void controller(void);
void idle(void);


#include "printf/printf.h"
#include "main.h"

#endif /* TASKS_H */
