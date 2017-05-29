#include "tasks.h"
#include "debugio.h"

#define NAMES_CAPACITY 100

void name_server()
{
	volatile char names[MAX_NAME_LENGTH * NAMES_CAPACITY];
	volatile char tids[NAMES_CAPACITY];
	volatile int size = 0;
	int tid, err;
	char reply = 0;
	volatile int i;

	for (i = 0; i < NAMES_CAPACITY; ++i)
		tids[i] = 0x13;

	for (ever) {
		if(size == NAMES_CAPACITY)
			goto nameserver_reply;
		err = Receive(&tid, &names[size * MAX_NAME_LENGTH], MAX_NAME_LENGTH);
		if(err == -1)
			goto nameserver_reply;
		if(names[size * MAX_NAME_LENGTH] == 'r'){
			tids[size] = tid;
			size++;
			reply = 1;
			goto nameserver_reply;
		} else{
			int i, j;
			for(i = size - 1; i >= 0; i--){
				for(j = err - 1; j >= 1; j--){
					if(! (names[size * MAX_NAME_LENGTH + j] == names[i * MAX_NAME_LENGTH + j]) )
						break;
				}
				if(j == 0)
					break;
			}
			reply = i == -1 ? 0 : tids[i];
			goto nameserver_reply;
		}

		nameserver_reply : Reply(tid, &reply, 1);
	}
}
