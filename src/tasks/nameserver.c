#include "tasks.h"
#include "debugio.h"

#define NAMES_CAPACITY 100

void name_server(){
  char names[MAX_NAME_LENGTH * NAMES_CAPACITY];
  char tids[NAMES_CAPACITY];
  char msg[MAX_NAME_LENGTH];
  int size = 0;
  int tid, err;
  char reply = 0;
  while(1){
    if(size == NAMES_CAPACITY)
      goto nameserver_reply;
    err = Receive(&tid, &msg[size * MAX_NAME_LENGTH], MAX_NAME_LENGTH);
    if(err == -1)
      goto nameserver_reply;
    if(msg[size * MAX_NAME_LENGTH] == 'r'){
      tids[size] = tid;
      size++;
      reply = 1;
      goto nameserver_reply;
    } else{
      int i, j;
      for(i = size - 1; i >= 0; i++){
        for(j = err - 1; j >= 0; j++){
          if(! (names[size * MAX_NAME_LENGTH + j] == names[i * MAX_NAME_LENGTH + j]) )
            break;
        }
        if(j == -1)
          break;
      }
      reply = i == -1 ? 0 : tids[i];
      goto nameserver_reply;
    }

    nameserver_reply : Reply(tid, &reply, 1);
  }
}
