#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
	CreateSize(0, name_server, TASK_SIZE_TINY);
	/*int cs_tid = CreateSize(0, clock_server, TASK_SIZE_TINY);
	while(WhoIs("CLOCK") < 0)
		Pass();*/
	debugio_putstr("Creating rs\n\r");
	int rs_tid = CreateSize(0, uart_recieve_server, TASK_SIZE_TINY);
	char name[8] = "COM2rcv";
	Send(rs_tid, name, 8, 0, 0);
	struct intandflag msg;
	msg.val = (int) uart_recieve_notifier;
	Send(rs_tid, (char *) &msg, sizeof(struct intandflag), 0, 0);
	debugio_putstr("Returned\n\r");
	while(WhoIs(name) < 0)
		Pass();
	debugio_putstr("Creating ts\n\r");
	int ts_tid = CreateSize(0, uart_transmit_server, TASK_SIZE_TINY);
	char name2[] = "COM2tmt";
	Send(ts_tid, name2, 8, 0, 0);
	msg.val = (int) uart_transmit_notifier;
	Send(ts_tid, (char *) &msg, sizeof(struct intandflag), 0, 0);
	while(WhoIs("COM2tmt") < 0)
		Pass();
	debugio_putstr("Done initializing\n\r");
	char ch[5];
	for(int i = 0; i<5; i++){
		ch[i] = Getc(rs_tid, 2);
	}
	for(int i = 0; i<5; i++){
		Putc(ts_tid, 2, ch[i]);
		debugio_putc(ch[i]);
	}
	Putc(ts_tid, 2, '\n');
	Putc(ts_tid, 2, '\r');
	debugio_putstr("\n\r");
	//Delay(cs_tid, 100);
	//debugio_putstr("\n\rWe're done here.\n\r");
	Exit();
}
