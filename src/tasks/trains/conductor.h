#ifndef CONDUCTOR_H
#define CONDUCTOR_H

struct route_request{
	int source, dest;
};

struct flip_request {
	int switch_id;
	int position;
};

/*struct track_calibration{
	int speeds[80][2];
};

int stopping_dist(struct *track_calibration);*/

#endif
