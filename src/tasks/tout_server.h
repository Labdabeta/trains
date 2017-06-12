#ifndef TOUT_SERVER_H
#define TOUT_SERVER_H

char sendToutReady(int tid);
void sendToutByte(int tid, char b1);
void sendToutBytePair(int tid, char b1, char b2);

#endif /* TOUT_SERVER_H */
