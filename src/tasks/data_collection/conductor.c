#include "conductor.h"
#include "tasks.h"

void conductor()
{
	int clock_tid = WhoIs("CLOCK");
	int caller;
	char sensors[10];
	for(int i = 0; i < 10; ++i)
		sensors[i] = 0;
	struct test_message msg;
	struct delay_args args;
	args.clock_tid = clock_tid;
	char temp, group;
	int number, child_tid;
	int speed = 0;
	int length = 0;
	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct test_message));
		Reply(caller, 0, 0);
		switch(msg.type){
			case CODE_SensorBytes:
				for (int i = 0; i < 10; ++i) {
					if (msg.bytes[i] != sensors[i]) {
						temp = msg.bytes[i] & ~sensors[i];
						if(temp){
							for(int j = 0; j <= 7; j++){
								if(temp & (1 << (7-j)) ){
									group = 'A' + (i / 2);
									number = 1 + j + (i % 2)*8;
									dprintf("Sensor %c%d at time %d\n\r", group, number, Time(clock_tid));
									if(group == 'B' && number == 5){
										args.length = length;
										length += 30;
										child_tid = CreateSize(0, delay_controller, TASK_SIZE_TINY);
										Send(child_tid, (char *) &args, sizeof(struct delay_args), 0, 0);
									}
								}
							}
						}
						sensors[i] = msg.bytes[i];
					}
				}
			break;
			case CODE_Timeout:
				tput2(speed, 76);
				if(speed == 0){
					dprintf("Stopping at: %d\n\r", Time(clock_tid));
					args.length = 400;
					child_tid = CreateSize(0, delay_controller, TASK_SIZE_TINY);
					Send(child_tid, (char *) &args, sizeof(struct delay_args), 0, 0);
					speed = 10;
				} else{
					dprintf("Restarting at: %d\n\r", Time(clock_tid));
					speed = 0;
				}
			break;
		}
	}
}

void delay_controller()
{
	int caller;
	struct delay_args args;
	struct test_message msg;
	msg.type = CODE_Timeout;

	Receive(&caller, (char *) &args, sizeof(struct delay_args));
	Reply(caller, 0, 0);

	Delay(args.clock_tid, args.length);
	Send(caller, (char *) &msg, sizeof(struct test_message), 0, 0);
	Exit();
}
