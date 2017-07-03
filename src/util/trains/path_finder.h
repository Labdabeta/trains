#ifndef PATH_FINDER_H
#define PATH_FINDER_H

#include "track_data.h"

#define MAX_PATH_LENGTH 20

struct TrackPath {
	int length;
	int stations[MAX_PATH_LENGTH];
	int distances[MAX_PATH_LENGTH];
};

struct PathSwitchPositions {
	int length;
	int stations[MAX_PATH_LENGTH];
	int positions[MAX_PATH_LENGTH];
};

/* Finds a path on the track from the source node to the destination node.
 *
 * This uses dijkstra's algorithm to find a path on the track without reversing
 * the train.
 *
 * \param[in] source           The id of the source node on the track.
 * \param[in] destination      The id of the destination node on the track.
 * \param[out] path            The path found by the algorithm.
 * \param[out] switches        The necessary switch positions for the path.
 *
 * \return Distance on success or -1 on failure. */
int findPath(int source,
             int destination,
             struct TrackPath *path,
             struct PathSwitchPositions *switches);

#endif /* PATH_FINDER_H */
