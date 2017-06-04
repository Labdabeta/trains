#ifndef SYSCALL_H
#define SYSCALL_H

#include "buffer.h"
#define NAMESERVER_TID 70
#define MAX_NAME_LENGTH 32

typedef enum TaskSize {
	TASK_SIZE_GIANT = 0,
	TASK_SIZE_BIG,
	TASK_SIZE_NORMAL,
	TASK_SIZE_SMALL,
	TASK_SIZE_TINY
} TaskSize;

/* Exits the task.
 *
 * This exits the task and should be called as the last action of every user
 * task. The kernel will only exit once all tasks have exited.
 */
void Exit(void);

/* Creates a new child task.
 *
 * This creates a new child task with the specified size and beginning execution
 * at the specified function.
 *
 * \param[in] priority         The priority to create the new task at.
 * \param[in] code             The code of the new task.
 * \param[in] size             The maximum size of the new task's stack.
 *
 * \return -1 if the priority is invalid, -2 if the kernel is out of task
 * descriptors.
 */
int CreateSize(int priority, void (*code)(), TaskSize size);

/* Creates a new child task.
 *
 * This is the same as calling CreateSize with the default size of
 * TASK_SIZE_NORMAL.
 *
 * \param[in] priority         The priority to create the new task at.
 * \param[in] code             The code of the new task.
 * \return -1 if the priority is invalid, -2 if the kernel is out of task
 * descriptors.
 */
int Create(int priority, void (*code)());

/* Returns your task ID.
 *
 * This returns your current task id.
 *
 * \return Your current task id.
 */
int MyTid(void);

/* Returns your parent's task ID.
 *
 * This returns your parent's task id.
 *
 * \return Your parents task id.
 */
int MyParentTid(void);

/* Relinquishes control to the scheduler.
 *
 * This reschedules the current task.
 */
void Pass(void);

/* Sends a message to the given tid.
 *
 * This sends the given message to the given tid and awaits a reply.
 * Control does not return to the callor until such a reply is provided.
 *
 * \param[in] tid              The tid to send to.
 * \param[in] msg              The message to send.
 * \param[in,out] reply        The message reply.
 *
 * \return The number of bytes sent, or -1 if the message was truncated, or -2
 * if the tid is bad, or -3 on other errors.
 */
int SendBuffer(int tid, Buffer *msg, Buffer *reply);

/* Sends a message to the given tid.
 *
 * This wraps the message in a buffer initialization.
 *
 * \param[in] tid              The tid to send to.
 * \param[in] msg              The raw message to send.
 * \param[in] msglen           The length of the message, in bytes.
 * \param[out] reply           The raw message reply.
 * \param[in] rplen            The length of the reply, in bytes.
 *
 * \return The number of bytes sent, or -1 if the message was truncated, or -2
 * if the tid is bad, or -3 on other errors.
 */
int Send(int tid, char *msg, int msglen, char *reply, int rplen);

/* Shares a pointer with the given tid.
 *
 * This is faster than Send, but acts similarly.
 *
 * \param[in] tid              The tid to share with.
 * \param[in] msg              The message to share.
 *
 * \return The replied pointer.
 */
void *Share(int tid, void *msg);

/* Receives a message from any tid.
 *
 * This blocks until a message is received from any task.
 *
 * \param[out] tid             The sender's tid.
 * \param[in,out] msg          The message sent.
 *
 * \return The number of bytes received, or -1 if the message was truncated.
 */
int ReceiveBuffer(int *tid, Buffer *msg);

/* Receives a message from any tid.
 *
 * This wraps the message in a buffer and calls ReceiveBuffer.
 *
 * \param[out] tid             The sender's tid.
 * \param[out] msg             The raw message sent.
 * \param[in] msglen           The length of the raw message, in bytes.
 *
 * \return The number of bytes received, or -1 if the message was truncated.
 */
int Receive(int *tid, char *msg, int msglen);

/* Obtains a shared pointer from any tid.
 *
 * This is faster than Receive, but acts similarly.
 *
 * \param[out] tid             The sender's tid.
 *
 * \return The shared pointer.
 */
void *Obtain(int *tid);

/* Replies to the given tid.
 *
 * This sends a reply to the tid, which should have previously sent a message to
 * the current task.
 *
 * \param[in] tid              The tid to reply to.
 * \param[in] reply            The reply to send.
 *
 * \return 0 on succes, -1 if the reply was truncated, -2 if the tid doesn't
 * exist, and -3 if the tid is not waiting for a reply.
 */
int ReplyBuffer(int tid, Buffer *reply);

/* Replies to the given tid.
 *
 * This wraps the message in a buffer and calls ReplyBuffer.
 *
 * \param[in] tid              The tid to reply to.
 * \param[in] reply            The reply to send.
 * \param[in] rplen            The length of the reply, in bytes.
 *
 * \return 0 on succes, -1 if the reply was truncated, -2 if the tid doesn't
 * exist, and -3 if the tid is not waiting for a reply.
 */
int Reply(int tid, char *reply, int rplen);

/* Respond with a shared pointer to the given tid.
 *
 * This is faster than Reply, but acts similarly.
 *
 * \param[in] tid              The tid to respond to.
 * \param[in] rpl              The pointer to share.
 */
void Respond(int tid, void *rpl);

/* Registers the current task with the name server.
 *
 * This registers the provided name to the current task's id.
 *
 * \param[in] name             The name to provide.
 *
 * \return 0 on success, -1 on failure.
 */
int RegisterAs(char *name);

/* Finds the tid with the given name.
 *
 * This queries the name server to find the task with the provided name.
 *
 * \param[in] name             The name to query.
 *
 * \return The correct tid, or -1 on failure.
 */
int WhoIs(char *name);

int AwaitEvent(void);

int Time(int tid);

void Delay(int tid, int ticks);

void DelayUntil(int tid, int ticks);

#endif /* SYSCALL_H */
