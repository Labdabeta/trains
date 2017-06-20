#ifndef COUT_SERVER_H
#define	COUT_SERVER_H

/* Send the cout server a notification that sending is available.
 *
 * This returns the byte the server wishes to send, but blocks until that byte
 * is ready.
 *
 * This should only be used by the cout courier.
 *
 * \param[in] tid              The tid of the cout server.
 *
 * \return The next byte to transmit.
 */
char sendCoutReady(int tid);

/* Send the cout server a putstr request.
 *
 * This is the internal send used by the Putc and related commands.
 *
 * \param[in] tid              The tid of the cout server.
 * \param[in] str              The null-terminated string to send.
 */
void sendCoutPutstr(int tid, char *str);

#endif /* COUT_SERVER_H */
