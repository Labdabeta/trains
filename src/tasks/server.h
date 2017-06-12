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
	struct Buffer buf; \
	struct m_str msg; \
}; \
ENTRY server_initialize(struct server_Data *data) { \
	init(&data->user); \
	loadBuffer(&data->buf, &data->msg, sizeof(data->msg)); \
} \
ENTRY server_work(struct server_Data *data) { \
	int tid; \
	int datalen = ReceiveBuffer(&tid, &data->buf); \
	handle(&data->user, tid, &data->msg, datalen); \
} \
MAKE_SERVICE_LONG(name, server_Data, server_initialize, server_work)

#define MAKE_SERVER(name) MAKE_SERVER_LONG(name, Data, Message, initialize, handle)

#endif /* SERVER_H */
