#ifndef CIN_SERVER_H
#define CIN_SERVER_H

/* Send the cin server a notification that data is available.
 *
 * This should only be used by the cin courier.
 *
 * \param[in] tid              The tid of the cin server.
 * \param[in] ch               The character as read from the UART.
 */
void sendCinData(int tid, int ch);

/* Send the cin server a getc request.
 *
 * This is the internal send used by the Getc command.
 *
 * \param[in] tid              The tid of the cin server.
 *
 * \return The next character read from the UART.
 */
int sendCinGetc(int tid);

#endif /* CIN_SERVER_H */
