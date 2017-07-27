#include "tasks.h"
#include "util/async_delay.h"
#include "logging.h"
#include "transmission.h"
#include "trains/transit_schedule.h"
#include "track_server.h"

struct Data {
  int client, caller, clock_tid, track_tid, transmission_tid;
  struct TransitSchedule schedule;
  struct TrackServerMessage activ, timeout;
  struct TransmitMessage control;
};

static inline void initialize(struct Data *d)
{
  d->clock_tid = WhoIs("CLOCK");
  d->track_tid = WhoIs("TRACK");
  d->timeout.type = TSMT_NONE;
  Receive(&d->client, (char *) &d->transmission_tid, sizeof(d->transmission_tid));
	Reply(d->client, 0, 0);
  Receive(&d->client, (char *) &d->schedule, sizeof(d->schedule));
	Reply(d->client, 0, 0);
  registerForSensorDown(d->track_tid, d->schedule.train);
  d->control.code = TRANSMIT_TYPE_SET;
  d->control.arg = 10;
  Send(d->transmission_tid, (char *) &d->control, sizeof(d->control), 0, 0);
	d->control.code = TRANSMIT_TYPE_ADJUST;
}

void conform()
{
	struct Data d;
	initialize(&d);
	printf("Beginning to conform\n\r");
  while(1){
		Receive(&d.caller, (char *) &d.activ, sizeof(d.activ));
		Reply(d.caller, 0, 0);
    if(d.activ.type == TSMT_SENSOR_DOWN){
      int cur_time = Time(d.clock_tid);
      int error = transit_register_hit(&d.schedule, S_ID(d.activ.data.sensor.sensor), cur_time);
			int velocity = transit_vel_from(&d.schedule, 1);
			struct RestrictedPath *path = &d.schedule.route;
			int pathIdx = d.schedule.last_ind + 1;
			for (int i = 0; i < SWITCH_MAX; ++i)
				if (IS_CURVED(path->masks[pathIdx], i))
					notifySwitch(d.track_tid, i, IS_CURVED(path->states[pathIdx], i));
			pathIdx = (d.schedule.last_ind + 1) %  d.schedule.route.length + 1;
			for (int i = 0; i < SWITCH_MAX; ++i)
				if (IS_CURVED(path->masks[pathIdx], i))
					notifySwitch(d.track_tid, i, IS_CURVED(path->states[pathIdx], i));
      printf("Ind: %d. Train %d is off by %dmm. Velocity: %d\n\r", d.schedule.last_ind, d.schedule.train, error, velocity);
			velocity = velocity - d.schedule.target_velocity;
			int abs_err = (error < 0) ? -error : error;
			int permissible_bound = (abs_err <= 50) ? 15 :
				((abs_err <= 100) ? 50 : ((abs_err <= 300) ? 100 : 150));
			if(error > 50 && velocity > -permissible_bound){
				d.control.arg = -permissible_bound / 50;
				Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
			} else if(error < -50 && velocity < permissible_bound){
				d.control.arg = permissible_bound / 50;
				Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
			} else {
				int velocity = transit_vel_from(&d.schedule, 2) - d.schedule.target_velocity;
				if(velocity > permissible_bound || velocity < -permissible_bound){
					d.control.arg = (velocity > 0) ? -1 : 1;
					Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
				}
			}
    }
  }
}

void conformTest()
{
  int tramsmission_tid = CreateSize(2, transmission, TASK_SIZE_TINY);
	int train, index, client;
	Receive(&client, (char *) &train, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &index, sizeof(int));
	Reply(client, 0, 0);
  int init_speed = 0;
	Send(tramsmission_tid, (char *) &train, sizeof(train), 0, 0);
	Send(tramsmission_tid, (char *) &init_speed, sizeof(init_speed), 0, 0);
  struct TransitSchedule ts;
  struct RestrictedPath part;
  struct Restrictions no_restrictions;
  for (int i = 0; i < TRACK_MAX; ++i) {
		no_restrictions.isEnabled[i] = 1;
	}
	int route_segemnts[8] =
		{S_INDEX('B', 15), S_INDEX('E', 16), S_INDEX('D', 16), S_INDEX('D', 8),
		S_INDEX('C', 5), S_INDEX('E', 6), S_INDEX('B', 4), S_INDEX('B', 15)};
  findRestrictedPath(route_segemnts[0], route_segemnts[1], &no_restrictions, &ts.route);
	for(int j = 2; j < 8; j++){
		findRestrictedPath(route_segemnts[j-1], route_segemnts[j], &no_restrictions, &part);
	  restrictedPathAppend(&ts.route, &part);
	}
  ts.train = train;
  init_schedule_times(&ts, index, 200, 420);
  int conform_tid = CreateSize(2, conform, TASK_SIZE_TINY);
  Send(conform_tid, (char *) &tramsmission_tid, sizeof(tramsmission_tid), 0, 0);
  Send(conform_tid, (char *) &ts, sizeof(ts), 0, 0);
}
