#include "tasks.h"
#include "model.h"

void sensor_controller(void)
{
	Service();
	int i;
	int mid;
	int tout = WhoIs("TOUT");
	int tin = WhoIs("TIN");
	struct A0_model_message msg;
	Receive(&i, (char*)&mid, sizeof(mid));
	Reply(i, 0, 0);

	dprintf("Model TID: %d\n\r", mid);

	msg.code = CODE_MarklinBytes;

	for (ever) {
		Putc(tout, 1, 133);

		for (i = 0; i < 10; ++i) {
			int senin = Getc(tin, 1);
			dprintf("Sensor %d: %d\n\r", i, senin);
			msg.marklin.data[i] = senin;
		}

		Send(mid, (char*)&msg, sizeof(msg), 0, 0);
	}
}

void keyboard_controller(void)
{
	Service();
	int mid;
	int tid;
	int cin = WhoIs("CIN");
	struct A0_model_message msg;
	msg.code = CODE_COM2byte;

	Receive(&tid, (char*)&mid, sizeof(mid));
	Reply(tid, 0, 0);

	dprintf("Model TID: %d\n\r", mid);

	for (ever) {
		char ch = Getc(cin, 2);
		msg.echo.val = ch;
		Send(mid, (char*)&msg, sizeof(msg), 0, 0);
	}
}

void controller()
{
	dprintf("Controller TID: %d\n\r", MyTid());
	int mid = Create(1, model);
	dprintf("Model TID should be: %d\n\r", mid);
	int sensors = Create(1, sensor_controller);
	int keyboard = Create(1, keyboard_controller);
	Send(sensors, (char*)&mid, sizeof(mid), 0, 0);
	Send(keyboard, (char*)&mid, sizeof(mid), 0, 0);
	Exit();
}
