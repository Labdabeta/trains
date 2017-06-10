#include "tasks.h"
#include "debugio.h"

void main_task(void)
{
	CreateSize(0, name_server, TASK_SIZE_TINY);
	int cs_tid = CreateSize(0, clock_server, TASK_SIZE_TINY);
	while(WhoIs("CLOCK") < 0)
		Pass();
	int rs_tid = CreateSize(0, uart_recieve_server, TASK_SIZE_TINY);
	while(WhoIs("COM2rcv") < 0)
		Pass();
	int ts_tid = CreateSize(0, uart_transmit_server, TASK_SIZE_TINY);
	while(WhoIs("COM2tmt") < 0)
		Pass();
	char ch[5];
	for(int i = 0; i<5; i++){
		ch[i] = Getc(rs_tid, 2);
	}
	for(int i = 0; i<5; i++){
		Putc(ts_tid, 2, ch[i]);
	}
	Delay(cs_tid, 100);
	debugio_putstr("\n\rWe're done here.\n\r");
	Exit();
}
