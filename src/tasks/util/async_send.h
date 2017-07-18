#ifndef ASYNCSEND_H
#define ASYNCSEND_H

/* Sends without waiting for a receive or blocking using a courier. */
void async_send(int tid, char *msg, int msglen);

#endif /* ASYNCSEND_H */
