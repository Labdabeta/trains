#define PQ_CAPACITY 0 /* Null-column hack! */
#include "pq.h"

static inline void pq_swap(struct PriorityQueueElement *q1, struct PriorityQueueElement *q2)
{
	int temp = q1->priority;
	q1->priority = q2->priority;
	q2->priority = temp;
	temp = q1->data;
	q1->data = q2->data;
	q2->data = temp;
}

static inline void bubbleDown(PriorityQueue *pq)
{
	int prev = -1;
	int current = 0;

	while (prev != current) {
		prev = current;
		int left = 2*prev + 1;
		int right = 2*prev + 2;

		if (left < pq->size &&
			pq->data[left].priority < pq->data[prev].priority)
			current = left;
		if (right < pq->size &&
			pq->data[right].priority < pq->data[prev].priority)
			current = right;

		if (current != prev)
			pq_swap(&pq->data[current], &pq->data[prev]);
	}
}

void pqPop(PriorityQueue *pq)
{
	pq->size--;
	if (pq->size) {
		pq_swap(&pq->data[0], &pq->data[pq->size]);
		bubbleDown(pq);
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
