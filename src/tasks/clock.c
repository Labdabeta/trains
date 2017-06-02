#include "tasks.h"
#include "debugio.h"

void clock_notifier(){
  while(1){
    DEBUG_PRINT("Tick/r/n");
    AwaitEvent();
  }
}
