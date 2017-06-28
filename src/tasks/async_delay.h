#ifndef ASYNC_DELAY_H
#define ASYNC_DELAY_H

/* Asynchronously delay for the specified time.
 *
 * This creates a tiny task to handle the wait for you and replies with the
 * given reply when done.
 *
 * \param[in] clockid          The id of the clock server.
 * \param[in] delay            The number of ticks to delay for.
 * \param[in] reply            The message to reply with.
 * \param[in] reply_size       The size of the message to reply with.
 */
void async_delay(int clockid, int delay, char *reply, int reply_size);

#endif /* ASYNC_DELAY_H */
