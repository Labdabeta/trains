#ifndef NAME_SERVER_H
#define NAME_SERVER_H

/* Send the name server a registration message.
 *
 * This is the wrapped send in the RegisterAs command.
 *
 * \param[in] tid              The tid of the name server.
 * \param[in] name             The name to register.
 *
 * \return 0 if successful, -1 on error.
 */
int sendRegisterAs(int tid, char *name);

/* Send the name server a who is message.
 *
 * This is the wrapped send in the WhoIs command.
 *
 * \param[in] tid              The tid of the name server.
 * \param[in] name             The name to check.
 *
 * \return The tid with the name, or -1 on failure.
 */
int sendWhoIs(int tid, char *name);

#endif /* NAME_SERVER_H */
