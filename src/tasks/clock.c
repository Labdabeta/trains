#include "tasks.h"
#include "debugio.h"
#include "ts7200.h"

void clock_notifier(){
  int ticks = 0;
  while(1){
    AwaitEvent();
    ticks++;
    DEBUG_DUMP_VAL(ticks);
  }
}
