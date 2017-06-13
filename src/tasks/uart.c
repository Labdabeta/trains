#include "tasks.h"
#include "debugio.h"
#include "setup.h"

#define CBUFF_SIZE 100
#include "cbuff.h"

extern struct TaskDescriptor *global_com2rcv;
extern struct TaskDescriptor *global_com2tmt;

void uart_recieve_notifier(){
  Service();
  int serv_tid = MyParentTid();
  char c;
  recieveon();

  while(1){
    c = AwaitEvent(EVENT_RECIEVE);
    Send(serv_tid, &c, 1, 0, 0);
  }
}

void uart_recieve_server(){
  debugio_putstr("Entering rs\n\r");
  Service();
  int caller, len;
  char tid;

  char name[8];
  Receive(&caller, name, 8); // Must be null terminated
  Reply(caller, 0, 0);
  debugio_putstr(name);
  debugio_putstr("Name set\n\r");
  RegisterAs(name);

  struct intandflag asdfasd;
  Receive(&caller, (char *)&asdfasd, sizeof(struct intandflag));
  void *notifier_code = (void *)asdfasd.val;
  Reply(caller, 0, 0);

  SetGlobalTID(&global_com2rcv, CreateSize(0, notifier_code, TASK_SIZE_TINY));
  char msg[3];
  cbuff content;
  cbinit(&content);
  cbuff requests;
  cbinit(&requests);
  setuprecieve();

  while(1){
    len = Receive(&caller, msg, 1);
    if(len){
      Reply(caller, 0, 0);
      if(cbsize(&requests)){
        cbread(&requests, &tid);
        Reply(tid, msg, 1);
      } else{
        cbwrite(&content, msg[0]);
      }
    } else{
      if(cbsize(&content)){
        cbread(&content, msg);
        Reply(caller, msg , 1);
      } else{
        cbwrite(&requests, caller);
      }
    }
  }
}

void uart_transmit_notifier(){
  Service();
  int serv_tid = MyParentTid();
  char c = '\n';
  while(1){
    AwaitTransmit(c);
    debugio_putstr("Await done!\n\r");
    Send(serv_tid, 0, 0, &c, 1);
    debugio_putstr("Recieved char - not!\n\r");
  }
}

void uart_transmit_server(){
  Service();
  int caller, len;
  char tid;
  int ready = 0;

  char name[8];
  Receive(&caller, name, 8); // Must be null terminated
  Reply(caller, 0, 0);

  struct intandflag asdfasd;
  Receive(&caller, (char *)&asdfasd, sizeof(struct intandflag));
  void *notifier_code = (void *)asdfasd.val;
  Reply(caller, 0, 0);

  int not_tid = CreateSize(0, notifier_code, TASK_SIZE_TINY);
  SetGlobalTID(&global_com2tmt, not_tid);
  char msg[3];
  cbuff content;
  cbinit(&content);
  cbuff requests;
  cbinit(&requests);
  setuptransmit();
  RegisterAs(name);

  while(1){
    len = Receive(&caller, msg, 1);
    if(len){
      if(ready){
        Reply(not_tid, msg, 1);
        Reply(caller, 0, 0);
        ready = 0;
      } else{
        cbwrite(&requests, caller);
        cbwrite(&content, msg[0]);
      }
    } else{
      if(cbsize(&content)){
        cbread(&requests, msg);
        Reply(caller, msg , 1);
        cbread(&requests, &tid);
        Reply(tid, 0, 0);
      } else{
        ready = 1;
      }
    }
  }
}
