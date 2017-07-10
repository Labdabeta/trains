#ifndef ASYNCSEND_H
#define ASYNCSEND_H

#define ASYNC_CODE 0x15DA7AFULL

// This is what the recepient gets
struct AsyncSendMessage {
    int asyncCode; // used to distinguish messages
    int source_tid; // since the sent tid will be the courier
    int data_len;
    char data[0];
};

/* Sends without waiting for a receive or blocking using a courier. */
int async_send(int tid, char *msg, int msglen);

#endif /* ASYNCSEND_H */
