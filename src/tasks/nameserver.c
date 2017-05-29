#include "tasks.h"
#include "debugio.h"

#define NAMES_CAPACITY 100

void name_server()
{
	volatile char names[MAX_NAME_LENGTH * NAMES_CAPACITY];
	volatile char tids[NAMES_CAPACITY];
	char msg[MAX_NAME_LENGTH];
	volatile int size = 0;
	int tid, err;
	char reply = 0;
	volatile int i;

	for (i = 0; i < NAMES_CAPACITY; ++i)
		tids[i] = 0x13;

	for (ever) {
		if(size == NAMES_CAPACITY)
			goto nameserver_reply;
		err = Receive(&tid, &msg[size * MAX_NAME_LENGTH], MAX_NAME_LENGTH);
		debugio_putstr("Recieved in nameserv\n\r");
		if(err == -1)
			goto nameserver_reply;
		if(msg[size * MAX_NAME_LENGTH] == 'r'){
			DEBUG_PRINT("Register case");
			DEBUG_DUMP_VAL(tid);
			tids[size] = tid;
			DEBUG_DUMP_UVAL(size);
			DEBUG_DUMP_UVAL(tids[size]);
			size++;
			reply = 1;
			goto nameserver_reply;
		} else{
			DEBUG_PRINT("WhoIs case");
			int i, j;
			for(i = size - 1; i >= 0; i--){
				for(j = err - 1; j >= 0; j--){
					if(! (names[size * MAX_NAME_LENGTH + j] == names[i * MAX_NAME_LENGTH + j]) )
						break;
				}
				if(j == -1)
					break;
			}
			DEBUG_DUMP_VAL(i);
			DEBUG_DUMP_VAL(tids[0]);
			DEBUG_DUMP_VAL(tids[i]);
			reply = i == -1 ? 0 : tids[i];
			DEBUG_DUMP_UVAL(reply);
			DEBUG_DUMP_UVAL(tids[0]);
			goto nameserver_reply;
		}

		nameserver_reply : Reply(tid, &reply, 1);
	}
}
