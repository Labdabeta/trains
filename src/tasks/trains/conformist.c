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
  registerForSensorDown(d->track_tid, /*d->schedule.train*/ -1);
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
      printf("Train %d is off by %dmm. Velocity: %d\n\r", d.schedule.train, error, velocity);
			velocity = velocity - d.schedule.target_velocity;
			if(error > 50 && velocity > -30){
				d.control.arg = (error > 100) ? -2 : -1;
				Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
			} else if(error < -50 && velocity < 30){
				d.control.arg = (error < -100) ? 2 : 1;
				Send(d.transmission_tid, (char *) &d.control, sizeof(d.control), 0, 0);
			} else {
				int velocity = transit_vel_from(&d.schedule, 2) - d.schedule.target_velocity;
				if(velocity > 20 || velocity < -20){
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
	int train = 24;
  int init_speed = 0;
	Send(tramsmission_tid, (char *) &train, sizeof(train), 0, 0);
	Send(tramsmission_tid, (char *) &init_speed, sizeof(init_speed), 0, 0);
  struct TransitSchedule ts;
  struct RestrictedPath part;
  struct Restrictions no_restrictions;
  for (int i = 0; i < TRACK_MAX; ++i) {
		no_restrictions.isEnabled[i] = 1;
	}
	printf("%c%d\n\r", SID_PRINT(S_INDEX('C', 9)));
  findRestrictedPath(S_INDEX('C', 9), S_INDEX('C', 11), &no_restrictions, &ts.route);
  findRestrictedPath(S_INDEX('C', 11), S_INDEX('C', 9), &no_restrictions, &part);
  restrictedPathAppend(&ts.route, &part);
  ts.train = train;
  init_schedule_times(&ts, 0, 350, 420);
	//printSchedule(&ts);
  int conform_tid = CreateSize(2, conform, TASK_SIZE_TINY);
  Send(conform_tid, (char *) &tramsmission_tid, sizeof(tramsmission_tid), 0, 0);
  Send(conform_tid, (char *) &ts, sizeof(ts), 0, 0);
}
