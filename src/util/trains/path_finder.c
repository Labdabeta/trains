#include "path_finder.h"
#include "limits.h"

#define PQ_CAPACITY 300
#include "data/pq.h"

static inline void visit(const track_edge *edge, PriorityQueue *q, int *distance,
	int *previous, int current)
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

	switches->length = 0;
	path->length = 0;
	while (current != -1) {
		if (track_nodes[current].type == NODE_BRANCH) {
			switches->stations[switches->length] = track_nodes[current].num;
			switches->positions[switches->length++] = 33
			+ (successor[current] != (track_nodes[current].edge[DIR_STRAIGHT].dest - track_nodes));
		} else if (track_nodes[current].type == NODE_SENSOR ||
				   track_nodes[current].type == NODE_ENTER ||
				   track_nodes[current].type == NODE_EXIT) {
			path->stations[path->length] = track_nodes[current].num;
			path->distances[path->length++] = distance[current];
		}
		current = successor[current];
	}
}

static inline void reasonableCompileRoute(int *distance, int *visited, int *previous,
	int *successor, int source, int destination, struct ReasonablePath *path)
{
	int current;
	if (!visited[destination]) return;

	current = destination;
	successor[current] = -1;
	while (current != source) {
		successor[previous[current]] = current;
		current = previous[current];
	}
	for(int i = 0; i < MAX_PATH_LENGTH; i++){
		path->positions[i] = 0;
		path->switches[i] = 0;
	}
	path->length = 0;
	while (current != -1) {
		if (track_nodes[current].type == NODE_BRANCH) {
			path->switches[path->length-1] = track_nodes[current].num;
			path->positions[path->length-1] = 33
				+ (successor[current] != (track_nodes[current].edge[DIR_STRAIGHT].dest - track_nodes));
		} else if (track_nodes[current].type == NODE_SENSOR ||
				   track_nodes[current].type == NODE_ENTER ||
				   track_nodes[current].type == NODE_EXIT) {
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
			case NODE_ENTER:
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

int findReasonablePath(int source, int destination, struct ReasonablePath *path)
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
			reasonableCompileRoute(distance, visited, previous, successor, source, destination, path);
			return dist;
		}

		pqPop(&q);

		if (visited[current])
			continue;

		visited[current] = 1;

		switch (track_nodes[current].type) {
			case NODE_SENSOR:
			case NODE_MERGE:
			case NODE_ENTER:
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

static inline void visitRestricted(const track_edge *edge, PriorityQueue *q,
        int *distance, int *previous, int current, struct Restrictions *rest)
{
    int destination_id = edge->dest - track_nodes;
    int new_dist = edge->dist + distance[current];
    if (new_dist < distance[destination_id] && rest->isEnabled[destination_id]) {
        distance[destination_id] = new_dist;
        previous[destination_id] = current;
        pqInsert(q, new_dist, destination_id);
    }

    // Allow reversing over a sensor.
    /*if (edge->src->type == NODE_SENSOR) {
        destination_id = edge->reverse->dest - track_nodes;
        new_dist = edge->reverse->dist + distance[current] + REVERSE_COST;
        if (new_dist < distance[destination_id] && rest->isEnabled[destination_id]) {
            distance[destination_id] = new_dist;
            previous[destination_id] = current;
            pqInsert(q, new_dist, destination_id);
        }
    }*/
}

static inline void compileRestrictedRoute(int *distance,
                                          int *visited,
                                          int *previous,
                                          int *successor,
                                          int source,
                                          int destination,
                                          struct RestrictedPath *path)
{
    int current;
    if (!visited[destination]) return;

    current = destination;
    successor[current] = -1;
    while (current != source) {
        successor[previous[current]] = current;
        current = previous[current];
    }

    path->length = 0;
    path->states[0] = 0;
    path->masks[0] = 0;
    path->trueLength = 0;

    while (current != -1) {
        if (track_nodes[current].type == NODE_BRANCH) {
            int which = NUM_TO_SW_ID(track_nodes[current].num);

            if (successor[current] !=
                track_nodes[current].edge[DIR_STRAIGHT].dest - track_nodes) {
                // Curved
                SET_CURVED(path->states[path->length], which);
            } else {
                // Straight
                SET_STRAIGHT(path->states[path->length], which);
            }
            SET_CURVED(path->masks[path->length], which);
		} else if (track_nodes[current].type == NODE_SENSOR ||
				   track_nodes[current].type == NODE_ENTER ||
				   track_nodes[current].type == NODE_EXIT) {
            path->sensors[path->length].group = track_nodes[current].num >> 4;
            path->sensors[path->length].id = track_nodes[current].num & 0xF;
            path->distances[path->length] = distance[current];
            path->length++;
            path->states[path->length] = 0;
            path->masks[path->length] = 0;
        }
        path->trueLength++;
        current = successor[current];
    }
}

int findRestrictedPath(int source,
                       int destination,
                       struct Restrictions *rest,
                       struct RestrictedPath *path)
{
    int i;
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
            compileRestrictedRoute(distance, visited, previous, successor,
                    source, destination, path);
            return dist;
        }

        pqPop(&q);

        /*if (visited[current])
            continue;*/

        visited[current] = 1;

        switch (track_nodes[current].type) {
            case NODE_SENSOR:
            case NODE_MERGE:
            case NODE_ENTER:
                visitRestricted(&track_nodes[current].edge[DIR_AHEAD], &q,
                        distance, previous, current, rest);
                break;
            case NODE_BRANCH:
                visitRestricted(&track_nodes[current].edge[DIR_STRAIGHT], &q,
                        distance, previous, current, rest);
                visitRestricted(&track_nodes[current].edge[DIR_CURVED], &q,
                        distance, previous, current, rest);
                break;
            default:
                break; // Don't add anything for ends because they have no outs
        }
    }

    return -1;
}
