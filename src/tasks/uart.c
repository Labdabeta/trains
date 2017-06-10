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
  Service();
  int caller, len;
  char tid;
  RegisterAs("COM2rcv");

  SetGlobalTID(&global_com2rcv, CreateSize(0, uart_recieve_notifier, TASK_SIZE_TINY));
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
  char c;
  while(1){
    Send(serv_tid, 0, 0, &c, 1);
    putcom2(c);
    AwaitEvent(EVENT_TRANSMIT);
  }
}

void uart_transmit_server(){
  Service();
  int caller, len;
  char tid;
  RegisterAs("COM2tmt");

  int not_tid = CreateSize(0, uart_transmit_notifier, TASK_SIZE_TINY);
  SetGlobalTID(&global_com2tmt, not_tid);
  char msg[3];
  cbuff content;
  cbinit(&content);
  cbuff requests;
  cbinit(&requests);
  setuptransmit();

  while(1){
    len = Receive(&caller, msg, 1);
    if(len){
      if(cbsize(&requests)){
        cbwrite(&requests, caller);
        cbwrite(&content, msg[0]);
      } else{
        Reply(not_tid, msg, 1);
      }
    } else{
      if(cbsize(&content)){
        cbread(&requests, msg);
        Reply(caller, msg , 1);
        cbread(&requests, &tid);
        Reply(tid, 0, 0);
      } else{
        //Don't reply - blocks the event
      }
    }
  }
}
