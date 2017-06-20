#ifndef SYSCALL_H
#define SYSCALL_H

#include "buffer.h"
#define NAMESERVER_TID 18 /* Magic number. */
#define MAX_NAME_LENGTH 32

typedef enum TaskSize {
	TASK_SIZE_GIANT = 0,
	TASK_SIZE_BIG,
	TASK_SIZE_NORMAL,
	TASK_SIZE_SMALL,
	TASK_SIZE_TINY
} TaskSize;

/* EVENT_TYPE_ */
typedef enum EventType {
	EVENT_TYPE_UNUSED_0 = 0, EVENT_TYPE_UNUSED_1, EVENT_TYPE_COMM_RX,
	EVENT_TYPE_COMM_TX,	EVENT_TYPE_TIMER_1, EVENT_TYPE_TIMER_2,
	EVENT_TYPE_AUDIO_CODEC, EVENT_TYPE_DMA2P_I0, EVENT_TYPE_DMA2P_I1,
	EVENT_TYPE_DMA2P_I2, EVENT_TYPE_DMA2P_I3, EVENT_TYPE_DMA2P_I4,
	EVENT_TYPE_DMA2P_I5, EVENT_TYPE_DMA2P_I6, EVENT_TYPE_DMA2P_I7,
	EVENT_TYPE_DMA2P_I8, EVENT_TYPE_DMA2P_I9, EVENT_TYPE_DMA2M_I0,
	EVENT_TYPE_DMA2M_I1, EVENT_TYPE_RESERVED_0, EVENT_TYPE_RESERVED_1,
	EVENT_TYPE_RESERVED_2, EVENT_TYPE_RESERVED_3, EVENT_TYPE_UART1_RX,
	EVENT_TYPE_UART1_TX, EVENT_TYPE_UART2_RX, EVENT_TYPE_UART2_TX,
	EVENT_TYPE_UART3_RX, EVENT_TYPE_UART3_TX, EVENT_TYPE_KEYBOARD,
	EVENT_TYPE_TOUCH_SCREEN, EVENT_TYPE_RESERVED_4, EVENT_TYPE_EXTERNAL_0,
	EVENT_TYPE_EXTERNAL_1, EVENT_TYPE_EXTERNAL_2, EVENT_TYPE_TICK_64HZ,
	EVENT_TYPE_WATCHDOG_EXPIRED, EVENT_TYPE_RTC, EVENT_TYPE_IrDA,
	EVENT_TYPE_MAC, EVENT_TYPE_RESERVED_5, EVENT_TYPE_RASTER,
	EVENT_TYPE_TICK_1HZ, EVENT_TYPE_V_SYNC, EVENT_TYPE_V_FIFO,
	EVENT_TYPE_SSP_RX, EVENT_TYPE_SSP_TX, EVENT_TYPE_RESERVED_6,
	EVENT_TYPE_RESERVED_7, EVENT_TYPE_RESERVED_8, EVENT_TYPE_RESERVED_9,
	EVENT_TYPE_TIMER_3, EVENT_TYPE_UART1_INT, EVENT_TYPE_SSP_INT,
	EVENT_TYPE_UART2_INT, EVENT_TYPE_UART3_INT, EVENT_TYPE_PME,
	EVENT_TYPE_DSP, EVENT_TYPE_GPIO, EVENT_TYPE_I2S,
	EVENT_TYPE_UNUSED_2, EVENT_TYPE_UNUSED_3, EVENT_TYPE_UNUSED_4,
	EVENT_TYPE_MAX
} EventType;

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

/* Await the given event to occur.
 *
 * This event blocks the task to be unblocked by the given event.
 *
 * \param[in] type             The type of the event to wait for.
 */
void AwaitEvent(EventType type);

/* Await the given transmission event to occur.
 *
 * This event blocks the task then writes the given value to the given address.
 *
 * \param[in] type             The type of the event to wait for.
 * \param[in] value            The value to write to the address.
 * \param[in] addr             The address to write to.
 */
void AwaitTransmission(EventType type, int value, int *addr);

/* Await the given receive event to occur.
 *
 * This event blocks the task then returns the value at the given address.
 *
 * \param[in] type             The type of the event to wait for.
 * \param[in] addr             The address to read from.
 *
 * \return The value in the given address, once the event occurs.
 */
int AwaitReceive(EventType type, int *addr);

/* Returns the time in centiseconds since the program started.
 *
 * This requires you to know the clock server's tid. Its name is "CLOCK".
 *
 * \param[in] tid              The tid of the clock server.
 *
 * \return The number of centiseconds since execution started.
 */
int Time(int tid);

/* Blocks the task for a specified duration.
 *
 * This blocks the current user task for the specified number of centiseconds.
 *
 * \param[in] tid              The tid of the clock server.
 * \param[in] ticks            The number of ticks to delay for.
 */
void Delay(int tid, int ticks);

/* Blocks the task until a specified time.
 *
 * This blocks the current user task until the specified tick occurs.
 *
 * \param[in] tid              The tid of the clock server.
 * \param[in] ticks            The time in ticks to delay until.
 */
void DelayUntil(int tid, int ticks);

typedef enum KernelTimer {
	KERNEL_TIMER_TASK = 0, /* Ticks spent in your task. */
	KERNEL_TIMER_USER, /* Ticks spent in userspace. */
	KERNEL_TIMER_KERN, /* Ticks spent doing kernel stuff. */
	KERNEL_TIMER_HAND, /* Ticks spent in kernel handlers. */
	KERNEL_TIMER_INIT, /* Ticks spent in initialization. */
} KernelTimer;

/* Returns the number of ticks spent in the current task.
 *
 * This is based off of timer 4 as maintained by the kernel.
 *
 * \param[in] timer            The timer to query.
 *
 * \return The number of ticks on the given timer.
 */
unsigned long long int UTime(KernelTimer kt);

/* Returns a character from the given UART.
 *
 * The uart parameter is just used to verify the tid. Use either "CIN" or "TIN"
 * to select the correct server.
 *
 * \param[in] tid              The tid of the I/O server.
 * \param[in] uart             The UART to read (either 1 or 2)
 *
 * \return The next unreturned character on the specified UART or -1 if the tid
 * is wrong.
 */
int Getc(int tid, int uart);

/* Puts a character on the given UART.
 *
 * The uart parameter is just used to verify the tid. Use either "COUT" or
 * "TOUT" to select the correct server.
 *
 * \param[in] tid              The tid of the I/O server.
 * \param[in] uart             The UART to send to (either 1 or 2)
 * \param[in] ch               The character to send.
 *
 * \return 0 on success or -1 on failure.
 */
int Putc(int tid, int uart, char ch);

/* Puts a string on the given UART.
 *
 * The uart parameter is just used to verify the tid. Use either "COUT" or
 * "TOUT" to select the correct server.
 *
 * \param[in] tid              The tid of the I/O server.
 * \param[in] uart             The UART to send to (either 1 or 2)
 * \param[in] str              The string to send.
 *
 * \return 0 on success or -1 on failure.
 */
int Putstr(int tid, int uart, char *str);

/* Registers the current task as a service.
 *
 * The kernel will exit when only services are still running.
 */
void Service(void);

/* Quit the kernel.
 *
 * This literally quits the kernel, good bye.
 */
void KQuit(void);

#endif /* SYSCALL_H */
