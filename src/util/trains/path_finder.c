#include "path_finder.h"
#include "limits.h"
#include "debugio.h"

#define PQ_CAPACITY 300
#include "data/pq.h"

static inline void visit(const track_edge *edge, PriorityQueue *q, int *distance, int *previous, int current)
{
	int destination_id = edge->dest - track_nodes;
	int new_dist = edge->dist + distance[current];
	if (new_dist < distance[destination_id]) {
		distance[destination_id] = new_dist;
		previous[destination_id] = current;
		pqInsert(q, new_dist, destination_id);
	}
}

static inline void compileRoute(int *distance,
                                int *visited,
                                int *previous,
                                int *successor,
                                int source,
                                int destination,
                                struct TrackPath *path,
                                struct PathSwitchPositions *switches)
{
	int current;
	if (!visited[destination]) return;

	current = destination;
	successor[current] = -1;
	while (current != source) {
		successor[previous[current]] = current;
		current = previous[current];
	}

	while (current != -1) {
		if (track_nodes[current].type == NODE_BRANCH) {
			switches->stations[switches->length] = track_nodes[current].num;
			switches->positions[switches->length++] = 33 + (successor[current] != (track_nodes[current].edge[DIR_STRAIGHT].dest - track_nodes));
		} else if (track_nodes[current].type == NODE_SENSOR ||
				   track_nodes[current].type == NODE_ENTER ||
				   track_nodes[current].type == NODE_EXIT) {
			dprintf("Path: %s\n\r", track_nodes[current].name);
			dprintf("Values; station %d, dist %d\n\r", track_nodes[current].num, distance[current]);
			path->stations[path->length] = track_nodes[current].num;
			path->distances[path->length++] = distance[current];
		}
		current = successor[current];
	}
}

int findPath(int source,
             int destination,
             struct TrackPath *path,
             struct PathSwitchPositions *switches)
{
	int i;
	/* These allocations are not inefficient as they compile (with optimization)
	 * to a simple sp subtraction. */
	int distance[TRACK_MAX];
	int visited[TRACK_MAX];
	int previous[TRACK_MAX];
	int successor[TRACK_MAX];
	int current;
	PriorityQueue q;

	pqInit(&q);

	for (i = 0; i < TRACK_MAX; ++i) {
		distance[i] = INT_MAX;
		visited[i] = 0;
	}

	distance[source] = 0;
	previous[source] = source;

	pqInsert(&q, 0, source);

	while (pqSize(&q)) {
		current = pqGetMin(&q);
		int dist = pqGetMinPriority(&q);

		if (current == destination) {
			visited[current] = 1;
			compileRoute(distance, visited, previous, successor,
                                source, destination, path, switches);
			return dist;
		}

		pqPop(&q);

		if (visited[current])
			continue;

		visited[current] = 1;

		switch (track_nodes[current].type) {
			case NODE_SENSOR:
			case NODE_MERGE:
				visit(&track_nodes[current].edge[DIR_AHEAD], &q, distance, previous, current);
				break;
			case NODE_BRANCH:
				visit(&track_nodes[current].edge[DIR_STRAIGHT], &q, distance, previous, current);
				visit(&track_nodes[current].edge[DIR_CURVED], &q, distance, previous, current);
				break;
			default:
				break;
		}
	}

	return -1;
}
