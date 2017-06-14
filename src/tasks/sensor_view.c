#include <service.h>

struct Data { IGNORED };

ENTRY initialize(struct Data *data) { }

ENTRY work(struct Data *d)
{
	int tid;
	char data[2];
	Receive(&tid, data, 2);
	Reply(tid, 0, 0);

	printf("Sensor %c %c\n\r", data[0] + '0', data[1] + '0');
}

MAKE_SERVICE(sensor_view)
