#ifndef PQ_H
#define PQ_H

#ifndef PQ_CAPACITY
#error Capacity must be defined as PQ_CAPACITY before including pq.h
#endif

struct PriorityQueueElement{
	int priority;
	int data; /* If necessary, make this a pointer! */
};

typedef struct PriorityQueue {
	int size;
	struct PriorityQueueElement data[PQ_CAPACITY];
} PriorityQueue;

/* Initializes the priority queue.
 *
 * This initializes the priority queue (or sorted heap) to an empty list.
 *
 * \param[out] pq              The priority queue to initialize.
 */
static inline void pqInit(PriorityQueue *pq) { pq->size = 0; }

/* Returns the size of the priority queue.
 *
 * This can be used to find out if the queue is empty by comparing the size with
 * 0.
 *
 * \param[in] pq               The priority queue whose size to query.
 *
 * \return The number of elements in the queue.
 */
static inline int pqSize(const PriorityQueue *pq) { return pq->size; }

/* Return the lowest priority element of the queue.
 *
 * This returns the lowest priority element of the priority queue.
 *
 * \param[in] pq               The priority queue whose element to return.
 *
 * \return The minimum priority element.
 */
static inline int pqGetMin(const PriorityQueue *pq) { return pq->data[0].data; }

/* Return the lowest priority of the queue.
 *
 * This returns the lowest priority of any element in the priority queue.
 *
 * \param[in] pq               The priority queue whose priority to return.
 *
 * \return The minimum priority.
 */
static inline int pqGetMinPriority(const PriorityQueue *pq) { return pq->data[0].priority; }

/* Remove the lowest priority element from the queue.
 *
 * This removes the lowest priority element from the given priority queue.
 *
 * \param[in,out] pq           The priority queue whose element to remove.
 */
void pqPop(PriorityQueue *pq);

/* Insert the given data with the given priority into the priority queue.
 *
 * This adds the given element to the heap.
 *
 * \param[in,out] pq           The priority queue to add the element to.
 * \param[in] prio             The priority of the inserted data.
 * \param[in] data             The data to store in the element.
 */
void pqInsert(PriorityQueue *pq, int prio, int data);

#endif
