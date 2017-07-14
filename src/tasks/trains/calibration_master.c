#include "tasks.h"
#include "trains/path_finder.h"

struct track_calibration{
	int edge_times[80][2];
	int is_dead[80];
};
