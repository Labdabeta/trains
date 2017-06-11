#ifndef CLOCK_SERVER_H
#define CLOCK_SERVER_H

/* Send the clock server a notification that a tick happened.
 *
 * This should only be used by the clock courier.
 *
 * \param[in] tid              The tid of the clock server.
 */
void sendTick(int tid);

/* Register a delay with the clock server.
 *
 * \param[in] tid              The tid of the clock server.
 * \param[in] ticks            The number of ticks to delay.
 */
void sendDelay(int tid, int ticks);

/* Register a delay until with the clock server.
 *
 * \param[in] tid              The tid of the clock server.
 * \param[in] ticks            The number of ticks to delay until.
 */
void sendDelayUntil(int tid, int ticks);

/* Request the time from the clock server.
 *
 * \param[in] tid              The tid of the clock server.
 *
 * \return The current time of the clock server.
 */
int sendGetTime(int tid);

#endif /* CLOCK_SERVER_H */
