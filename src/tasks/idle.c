#include "tasks.h"
#include "debugio.h"

void idle(){
  int cs_tid = WhoIs("CLOCK");
  DEBUG_PRINT("Calling Delay!");
  Delay(cs_tid, 500);
  DEBUG_PRINT("Returned from delay!");
}
