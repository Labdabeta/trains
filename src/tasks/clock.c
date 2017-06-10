#include "tasks.h"
#include "debugio.h"
#include "setup.h"

#define PQ_CAPACITY 100
#include "pq.h"

extern struct TaskDescriptor *global_clocknotifier;

void clock_notifier(){
	Service();
	int serv_tid = MyParentTid();
	while(1){
		AwaitEvent(EVENT_CLOCK);
		Send(serv_tid, 0, 0, 0, 0);
	}
}

void clock_server(){
	Service();
	int caller, len, deadline;
	int ticks = 0;
	RegisterAs("CLOCK");

	struct intandflag msg;
	timeheap events;
	thinit(&events);
	struct event* top;

	SetGlobalTID(&global_clocknotifier, CreateSize(0, clock_notifier, TASK_SIZE_NORMAL));
	setupTimer();

	while(1){
		len = Receive(&caller, (char *)&msg, sizeof(struct intandflag));
		if(len){
			if(len == 1){
				msg.val = ticks;
				Reply(caller, (char*) &msg, sizeof(struct intandflag));
			} else{
				deadline = msg.val;
				if(msg.code == 'd')
					deadline += ticks;
				thinsert(&events, deadline, caller);
			}
		} else{
			Reply(caller, 0, 0);
			ticks++;
			while((top = thgetmax(&events))){
				if(top->time > ticks)
					break;
				Reply(top->tid, 0, 0);
				thpop(&events);
			}
		}
	}
}
