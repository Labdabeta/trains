#include "tasks.h"
#include "debugio.h"
#include "setup.h"

#define PQ_CAPACITY 100
#include "pq.h"

void clock_notifier(){
  int serv_tid = MyParentTid();
  while(1){
    AwaitEvent();
    Send(serv_tid, 0, 0, 0, 0);
  }
}

void clock_server(){
  CreateSize(0, clock_notifier, TASK_SIZE_NORMAL);
  int caller, len, deadline;
  int ticks = 0;
  RegisterAs("CLOCK");

  struct intandflag msg;
  timeheap events;
  thinit(&events);
  struct event* top;

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
