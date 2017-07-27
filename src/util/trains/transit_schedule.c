#include "transit_schedule.h"
#include "logging.h"
#include "string.h"

#ifndef REMOTE
#include "tasks.h"
#else
#include <stdio.h>
#endif

#define SII static inline int

SII ind_plus(struct TransitSchedule *ts, int ind, int diff)
{
	return (ind + diff + ts->route.length - 1) % (ts->route.length - 1);
}

SII ind_to_id(struct TransitSchedule *ts, int ind)
{
	return S_ID(ts->route.sensors[ind]);
}

SII id_to_ind(struct TransitSchedule *ts, int id)
{
	int count, ind;
	for(count = 0, ind = ts->last_ind; ind_to_id(ts, ind) != id && count < 3;
		ind = ind_plus(ts, ind, 1), ++count);
	return (count == 3) ? -1 : ind;
}

SII dist_circindex(struct TransitSchedule *ts, int ind)
{
  return ts->route.distances[ind];
}

SII dist_circbetween(struct TransitSchedule *ts, int i1, int i2)
{
	if(i1 <= i2){
		return dist_circindex(ts, i2) - dist_circindex(ts, i1);
	} else{
		int dist = ts->route.distances[ts->route.length - 1];
		return dist - dist_circindex(ts, i1) + dist_circindex(ts, i2);
	}
}

int transit_vel_from(struct TransitSchedule *ts, int num)
{
	int prev_ind = ind_plus(ts, ts->last_ind, -1 * num);
	while(ts->observed_times[prev_ind] < 0)
		prev_ind = ind_plus(ts, prev_ind, -1);
	return 100 * dist_circbetween(ts, prev_ind, ts->last_ind) / (ts->observed_times[ts->last_ind] - ts->observed_times[prev_ind]);
}

void rotate_schedule(struct TransitSchedule *ts, int new_ind)
{
  int diff = ind_plus(ts, new_ind, -1 * ts->last_ind);
  for(int i = 1; i <= diff; i++){
		int i1 = ind_plus(ts, ts->last_ind, i-1);
    int i2 = ind_plus(ts, ts->last_ind, i);
    ts->expected_times[i2] = ts->expected_times[i1] + 100 * dist_circbetween(ts, i1, i2) / ts->target_velocity;
    if(i < diff){
      ts->observed_times[i2] = -1;
    }
	}
  ts->last_ind = new_ind;
}

void init_schedule_times(struct TransitSchedule *ts, int last_ind, int last_time, int velocity)
{
  ts->last_ind = last_ind;
  ts->target_velocity = velocity;
  ts->expected_times[last_ind] = last_time;
  ts->observed_times[last_ind] = last_time;
  rotate_schedule(ts, ind_plus(ts, last_ind, -1));
  rotate_schedule(ts, last_ind);
	printSchedule(ts);
}

int transit_register_hit(struct TransitSchedule *ts, int id, int cur_time)
{
  int new_ind = id_to_ind(ts, id);
  if(new_ind < 0)
    ERROR("Public transit misatribution or off path!");
	printf("Expected_time: %d, Obs_time: %d\n\r", ts->expected_times[new_ind], cur_time);
  int delta = (ts->expected_times[new_ind] - cur_time) * ts->target_velocity / 100;
  rotate_schedule(ts, new_ind);
  ts->observed_times[new_ind] = cur_time;
	printSchedule(ts);
  return delta;
}

static char tsprintbuf[1000];
char *printSchedule(struct TransitSchedule *ts)
{
    int i;
    tsprintbuf[0] = 0;
    char tmp[100];

    for (i = 0; i < ts->route.length; ++i) {
        sprintf(tmp, i ? " -> %c%d (E: %d, O: %d)" : "%c% (E: %d, O: %d)d",
                S_PRINT(ts->route.sensors[i]),
                ts->expected_times[i], ts->observed_times[i]);
        strcat(tsprintbuf, tmp);
    }
    return tsprintbuf;
}
