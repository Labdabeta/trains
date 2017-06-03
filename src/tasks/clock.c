#include "tasks.h"
#include "debugio.h"
#include "setup.h"

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
  int notifier = CreateSize(0, clock_notifier, SIZE_TINY);
  int caller;
  int *ticks = Obtain(&caller);
  Respond(caller, ticks);
  RegisterAs("CLOCK");
  setupTimer();
  
  while(1){
    Revieve(&caller, 0, 0);
    Reply(&caller, 0, 0);

    debugio_putstr("Time: ");
    debugio_putint_decimal(*ticks);
    debugio_putstr("\n\t");
  }
}
