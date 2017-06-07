#include "tasks.h"
#include "debugio.h"
#include "setup.h"

extern struct TaskDescriptor *global_uartnotifier;

void uart_notifier(){
  Service();
  int serv_tid = MyParentTid();
  char c;
  while(1){
    c = AwaitEvent();
    Send(serv_tid, &c, 1, 0, 0);
  }
}

void uart_server(){
  Service();
  RegisterAs("COM2");
  SetGlobalTID(&global_uartnotifier, CreateSize(0, uart_notifier, TASK_SIZE_TINY));
  setupCOM2(); //This is wrong
  char c;
  int caller;
  while(1){
    Receive(&caller, (char *)&c, 1);
    Reply(caller, 0, 0);
    debugio_putc(c);
  }
}
