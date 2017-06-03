#include "tasks.h"
#include "debugio.h"
#include "ts7200.h"

void clock_notifier(){
  int ticks = 0;
  int serv_tid;
  
  while ((serv_tid = WhoIs("CLOCK")) < 0)
      Pass();

  while(1){
    AwaitEvent();
    ticks++;
  }
}

void clock_server(){
  RegisterAs("CLOCK");
}
