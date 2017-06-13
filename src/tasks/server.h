#if 0 /* Server template */
#include <server.h>

struct Data {
	/* Static data here. */
};

struct Message {
	/* Message format here. */
};

ENTRY initialize(struct Data *data)
{
	/* Initialization code here. */
}

ENTRY handle(struct Data *data, int tid, struct Message *m)
{
	/* Handle m here. */
}

MAKE_SERVER(name)
#endif


#ifndef SERVER_H
#define SERVER_H

#include <service.h>

#define MAKE_SERVER_LONG(name, d_str, m_str, init, handle) \
struct server_Data { \
	struct d_str user; \
	struct m_str msg; \
}; \
ENTRY server_initialize(struct server_Data *data) { \
	init(&data->user); \
} \
ENTRY server_work(struct server_Data *data) { \
	int tid; \
	int datalen = Receive(&tid, (char*)&data->msg, sizeof(struct m_str)); \
	handle(&data->user, tid, &data->msg, datalen); \
} \
MAKE_SERVICE_LONG(name, server_Data, server_initialize, server_work)

	// TODO: figure out why the ReceiveBuffer strategy of yore didn't work.

#define MAKE_SERVER(name) MAKE_SERVER_LONG(name, Data, Message, initialize, handle)

#endif /* SERVER_H */
