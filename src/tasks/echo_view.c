#include <service.h>

struct Data {
	int pos;
	char byte;
};

ENTRY initialize(struct Data *data)
{
	data->pos = 0;
}

ENTRY work(struct Data *data)
{
	int tid;
	Receive(&tid, &data->byte, sizeof(data->byte));
	Reply(tid, 0, 0);

	if (data->byte == '\r') {
		data->pos = 0;
		printf("Clearing\n\r");
	} else {
		printf("%c@%d\n\r", data->byte, data->pos++);
	}
}

MAKE_SERVICE(echo_view)
