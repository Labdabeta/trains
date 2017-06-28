#include "precise_stop.h"
#include <server.h> /* Though we aren't actually a server. */
#include "sensors.h"
#include "async_delay.h"
#include "path_finder.h"

#define DELAY_INCREMENT 5
#define DELAY_OFFSET 80
#define printf_sname(X) 'A' + (X / 16), X % 16 + 1

typedef enum PreciseState {
	PS_NEITHER,
	PS_STOP,
	PS_INSPECT
} PreciseState;

struct Data {
	int cid; /* Clock TID */
	int sid; /* Sensor TID */
	int prevtime;
	int source; /* -1 = no current source */
	int destination;
	int train;
	int speed;
	int overshot;
	int delay;
	int client;
	struct PathSwitchPositions psp;
	struct TrackPath path;
	PreciseState state;
};

struct Message {
	int source;
	int destination;
	int train;
	int speed;
};

ENTRY initialize(struct Data *data)
{
	data->sid = WhoIs("SENSOR");
	registerForSensorFlips(data->sid);

	data->cid = WhoIs("CLOCK");
	data->source = -1;
	data->state = PS_NEITHER;
}

struct delay_args{
	int clock_tid;
	int length;
};

static inline int handle(struct Data *data, int tid, struct Message *msg, int size)
{
	if (size == sizeof(int)) { /* Sensor readback */
		data->prevtime = Time(data->cid);
		dprintf("Sensor %c%d at time %d\n\r", printf_sname(*(int*)msg), data->prevtime);
		if (data->source >= 0 && *(int*)msg == data->source) {
			data->overshot = -data->path.length;
			data->state = PS_STOP;
			async_delay(data->cid, data->delay, 0, 0);
		}
		data->overshot++;
	} else if (size == 0) { /* Timeout */
		switch (data->state) {
			case PS_STOP:
				async_delay(data->cid, 500, 0, 0);
				data->state = PS_INSPECT;
				tput2(0, data->train);
				dprintf("Stopping train at time %d\n\r", Time(data->cid));
				break;
			case PS_INSPECT:
				data->state = PS_NEITHER;
				if (getSensorState(data->sid, data->destination)) {
					Reply(data->client, (char*)&data->delay, sizeof(data->delay));
					data->client = -1;
					data->source = -1;
					return 1;
				} else {
					data->delay = data->delay + (data->overshot < 0 ? DELAY_INCREMENT : -DELAY_INCREMENT);
					tput2(data->speed, data->train);
				}
				break;
			default:
				dprintf("Got a timer return without an active job!\n\r");
		}
	} else { /* Request */
		data->source = msg->source;
		data->destination = msg->destination;
		data->train = msg->train;
		data->speed = msg->speed;
		data->client = tid;

		dprintf("Welcome to the percise stopper!\n\r");
		dprintf("Today, we will use train %d at speed %d.\n\r", msg->train, msg->speed);

		/* Determine the path, and set it up. */
		int dist = findPath(data->source, data->destination, &data->path, &data->psp);
		Send(WhoIs("PATH"), (char*)&data->psp, sizeof(data->psp), 0, 0);

		data->delay = dist / DELAY_INCREMENT - DELAY_OFFSET;

		dprintf("The distance from A to B is: %dmm\n\r", dist);
		dprintf("We will try a delay of: %d*10ms\n\r", data->delay);

		tput2(data->speed, data->train);
	}
	return 0;
}

void precise_stop_task(void)
{
	struct Data data;
	struct Message msg;
	int tid;
	int datalen;
	initialize(&data);

	do {
		datalen = Receive(&tid, (char*)&msg, sizeof(msg));
	} while (!handle(&data, tid, &msg, datalen));

	Exit(); /* This is similar to a server but it DOES die! */
}

int getAccurateStopTime(int sensor, int source, int train, int speed)
{
	struct Message msg = {source, sensor, train, speed};
	int child = CreateSize(1, precise_stop_task, TASK_SIZE_TINY);
	int answer;
	Send(child, (char*)&msg, sizeof(msg), (char*)&answer, sizeof(answer));
	return answer;
}
