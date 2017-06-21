#define PQ_CAPACITY 0 /* Null-column hack! */
#include "pq.h"
#include "debugio.h"

#define SWAP(X,Y) do { \
	struct PriorityQueueElement tmp = (X); \
	X = (Y); \
	Y = tmp; \
} while (0)

static inline void pq_swap(struct PriorityQueueElement *q1, struct PriorityQueueElement *q2)
{
	int temp = q1->priority;
	q1->priority = q2->priority;
	q2->priority = temp;
	temp = q1->data;
	q1->data = q2->data;
	q2->data = temp;
}

static inline void bubbleDown(PriorityQueue *pq, int i)
{
	/* Index of min node. */
	int min = i;

	while (min != i) {
		int left = 2*i + 1;
		int right = 2*i + 2;

		if (left < pq->size &&
			pq->data[left].priority < pq->data[min].priority)
			min = left;
		if (right < pq->size &&
			pq->data[right].priority < pq->data[min].priority)
			min = right;

		if (min != i) {
			pq_swap(&pq->data[i], &pq->data[min]);
			i = min;
		}
	}
}

void pqPop(PriorityQueue *pq)
{
	pq->size--;
	if (pq->size) {
		pq_swap(&pq->data[0], &pq->data[pq->size]);
		bubbleDown(pq, 0);
	}
}

void pqInsert(PriorityQueue *pq, int prio, int data)
{
	int nodeIndex = pq->size++;
	pq->data[nodeIndex].priority = prio;
	pq->data[nodeIndex].data = data;
	while (nodeIndex > 0 && prio < pq->data[(nodeIndex - 1)>>1].priority) {
		pq_swap(&pq->data[nodeIndex], &pq->data[(nodeIndex - 1)>>1]);
		nodeIndex = (nodeIndex - 1) >> 1;
	}
}
