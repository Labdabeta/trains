#include "tasks.h"
#include "debugio.h"
#include "setup.h"

#define PQ_CAPACITY 100
#include "pq.h"

void clock_notifier(){
  int ticks = 0;
  int serv_tid = MyParentTid();
  Share(serv_tid, &ticks);

  while(1){
    AwaitEvent();
    ticks++;
    Send(serv_tid, 0, 0, 0, 0);
  }
}

void clock_server(){
  CreateSize(0, clock_notifier, TASK_SIZE_NORMAL);
  int caller, len, deadline;
  int *ticks = Obtain(&caller);
  Respond(caller, ticks);
  RegisterAs("CLOCK");
  timeheap events;
  thinit(&events);
  struct event* top;
  char msg[2];

  while(1){
    len = Receive(&caller, msg, 2);
    if(len){
      if(len == 1){
        Reply(caller, (char*) ticks, sizeof(*ticks));
      } else{
        deadline = msg[0];
        if(msg[0] == 'd')
          deadline += *ticks;
        thinsert(&events, deadline, caller);
      }
    } else{
      Reply(caller, 0, 0);
      while((top = thgetmax(&events))){
        if(top->time > *ticks)
          break;
        Reply(top->tid, 0, 0);
        thpop(&events);
      }
      debugio_putstr("Time: ");
      debugio_putint_decimal(*ticks);
      debugio_putstr("\r\n");
    }
  }
}
