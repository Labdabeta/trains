#ifndef CONDUCTOR_H
#define CONDUCTOR_H

struct route_request{
	int train;
	struct Sensor src, dest;
};

struct flip_request {
	int switch_id;
	int position;
};

/*int stopping_dist(struct *track_calibration);*/

#endif
