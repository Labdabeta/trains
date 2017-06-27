#ifndef PATHF_H
#define PATHF_H

#define MAX_PATH_LENGTH 20

void path_finder(void);
void path_maker(void);

struct route_request{
  int source, dest;
};

struct path{
	int length;
	int dist;
	int stations[MAX_PATH_LENGTH];
	int distances[MAX_PATH_LENGTH];
};

struct path_sw_pos{
	int length;
	int stations[MAX_PATH_LENGTH];
	char positions[MAX_PATH_LENGTH];
};

#endif
