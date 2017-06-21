#include "tasks.h"
#include "conductor.h"

void test_sensor_controller()
{
	Service();
	int parity;
	int model_tid;
	int tout = WhoIs("TOUT");
	int tin = WhoIs("TIN");
	struct test_message msg;
	msg.type = CODE_SensorBytes;

	Receive(&parity, (char*)&model_tid, sizeof(model_tid));
	Reply(parity, 0, 0);

	for (ever) {
		Putc(tout, 1, 133);
		for (parity = 0; parity < 10; ++parity) {
			msg.bytes[parity] =  Getc(tin, 1);
		}
		Send(model_tid, (char *) &msg, sizeof(struct test_message), 0, 0);
	}
}

void test_controller()
{
	int model_tid = Create(1, conductor);
	int sensors = Create(1, test_sensor_controller);
	Send(sensors, (char*)&model_tid, sizeof(model_tid), 0, 0);
	Exit();
}
