#include <service.h>

struct Data { IGNORED };

ENTRY initialize(struct Data *data) { }

ENTRY work(struct Data *d)
{
	int tid;
	char data[2];
	Receive(&tid, data, 2);
	Reply(tid, 0, 0);

	printf("Switch %d %c\n\r", (int)data[0], data[1]);
}

MAKE_SERVICE(flip_view)
