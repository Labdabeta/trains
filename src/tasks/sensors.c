#include "sensors.h"
#include <server.h>

/* I don't think we'll have more than 16 clients? */
#define MAX_CLIENTS 0x10

struct Data {
	int client_tids[MAX_CLIENTS];
	int num_clients;
	char sensors[NUM_SENSOR_BLOCKS];
	int last_sensor;
};

void sensor_courier(void)
{
	Service();
	int parent = MyParentTid();

	for (ever) {
		int i;
		tputc(133);
		for (i = 0; i < NUM_SENSOR_BLOCKS; ++i) {
			int msg = tgetc();
			Send(parent, (char*)&msg, sizeof(msg), 0, 0);
		}
	}
}

struct Message {
	/* The size matters here, all 4 bytes means a response from the tin server.
	 * 0 bytes indicates a registration, 1 byte indicates a poll. */
	int query;
};

ENTRY initialize(struct Data *data)
{
	int i;
	data->num_clients = 0;

	CreateSize(1, sensor_courier, TASK_SIZE_TINY);

	RegisterAs("SENSOR");

	for (i = 0; i < NUM_SENSOR_BLOCKS; ++i)
		data->sensors[i] = 0;

	data->last_sensor = -1;
}

static inline int toClusterId(int id)
{
	return (id >> 4) + ((id & 0xF) > 8);
}

static inline int toClusterMask(int id)
{
	return 1 << (7 - (id & 7));
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	int sensor;
	int tmp;
	switch (size) {
		case 0: /* Register */
			data->client_tids[data->num_clients++] = tid;
			Reply(tid, 0, 0);
			break;
		case 1: /* Query */
			sensor = data->sensors[toClusterId(m->query & 0xFF)] &
				toClusterMask(m->query & 0xFF);
			Reply(tid, (char*)&sensor, sizeof(sensor));
			break;
		default: /* Update */
			data->last_sensor = (data->last_sensor + 1) % NUM_SENSOR_BLOCKS;
			sensor = m->query;
			tmp = data->sensors[data->last_sensor] & ~sensor;

			if (tmp) {
				int bit;
				int mask = 1 << 7;
				for (bit = 0; bit < 8; ++bit) {
				   if (tmp & mask) {
					   int reply = toSensorId('A' + (data->last_sensor / 2),
							   1 + bit + ((data->last_sensor & 1) << 3)) + 1;
					   int client;
					   for (client = 0; client < data->num_clients; ++client)
						   Send(data->client_tids[client], (char*)&reply, sizeof(reply), 0, 0);
				   }
				   mask >>= 1;
				}
			}
			tmp = ~data->sensors[data->last_sensor] & sensor;

			if (tmp) {
				int bit;
				int mask = 1 << 7;
				for (bit = 0; bit < 8; ++bit) {
				   if (tmp & mask) {
					   int reply = -(toSensorId('A' + (data->last_sensor / 2),
							   1 + bit + ((data->last_sensor & 1) << 3)) + 1);
					   int client;
					   for (client = 0; client < data->num_clients; ++client)
						   Send(data->client_tids[client], (char*)&reply, sizeof(reply), 0, 0);
				   }
				   mask >>= 1;
				}
			}

			data->sensors[data->last_sensor] = sensor;
			data->sensors[data->last_sensor] = sensor;
			Reply(tid, 0, 0);
	}
}

void registerForSensorFlips(int tid)
{
	Send(tid, 0, 0, 0, 0);
}

int getSensorState(int tid, int id)
{
	int ret;
	char cid = (char)id;
	Send(tid, (char*)&cid, 1, (char*)&ret, sizeof(ret));
	return ret;
}

MAKE_SERVER(sensors)

