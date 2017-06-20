#ifndef TIN_SERVER_H
#define TIN_SERVER_H

/* Send the tin server a notification that data is available.
 *
 * This should only be used by the tin courier.
 *
 * \param[in] tid              The tid of the tin server.
 * \param[in] ch               The character as read from the UART.
 */
void sendTinData(int tid, int ch);

/* Send the tin server a getc request.
 *
 * This is the internal send used by the Getc command.
 *
 * \param[in] tid              The tid of the tin server.
 *
 * \return The next character read from the UART.
 */
int sendTinGetc(int tid);

#endif /* TIN_SERVER_H */
