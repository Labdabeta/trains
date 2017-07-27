#include "tasks.h"
#include "util/async_delay.h"
#include "logging.h"
#include "transmission.h"
#include "trains/transit_schedule.h"
#include "track_server.h"
#include <server.h>

struct Data {
    int client, caller, clock_tid, track_tid, transmission_tid;
    struct TransitSchedule schedule;
    struct TrackServerMessage activ;
    struct TransmitMessage control;
};

struct Message {
    struct TrackServerMessage data;
};

ENTRY initialize(struct Data *d)
{
    d->clock_tid = WhoIs("CLOCK");
    d->track_tid = WhoIs("TRACK");

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

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    if (msg_size) { // actual message
        if (msg->data.type == TSMT_SENSOR_DOWN) {
            int cur_time = Time(data->clock_tid);
            int error = transit_register_hit(&data->schedule, S_ID(msg->data.data.sensor.sensor), cur_time);
            int velocity = transit_vel_from(&data->schedule, 1);

            struct RestrictedPath *path = &data->schedule.route;
            int pathIdx = data->schedule.last_ind + 1;

            for (int i = 0; i < SWITCH_MAX; ++i)
                if (IS_CURVED(path->masks[pathIdx], i))
                    notifySwitch(data->track_tid, i, IS_CURVED(path->states[pathIdx], i));

            pathIdx = (data->schedule.last_ind + 1) % data->schedule.route.length + 1;
            for (int i = 0; i < SWITCH_MAX; ++i)
                if (IS_CURVED(path->masks[pathIdx], i))
                    notifySwitch(data->track_tid, i, IS_CURVED(path->states[pathIdx], i));

            LOG(LOG_CONFORM, "Ind: %d, Train %d is off by %dmm. Velocity: %d",
                    data->schedule.last_ind, data->schedule.train,
                    error, velocity);

            velocity = velocity - data->schedule.target_velocity;
            int abs_err = (error < 0) ? -error : error;
            int permissible_bound = (abs_err <= 50) ? 15 :
                ((abs_err <= 100) ? 50 : ((abs_err <= 300) ? 100 : 150));
            if(error > 50 && velocity > -permissible_bound){
                data->control.arg = -permissible_bound / 50;
                Send(data->transmission_tid, (char *) &data->control, sizeof(data->control), 0, 0);
            } else if(error < -50 && velocity < permissible_bound){
                data->control.arg = permissible_bound / 50;
                Send(data->transmission_tid, (char *) &data->control, sizeof(data->control), 0, 0);
            } else {
                int velocity = transit_vel_from(&data->schedule, 2) - data->schedule.target_velocity;
                if(velocity > permissible_bound || velocity < -permissible_bound){
                    data->control.arg = (velocity > 0) ? -1 : 1;
                    Send(data->transmission_tid, (char *) &data->control, sizeof(data->control), 0, 0);
                }
            }
        }
    }
}

MAKE_SERVER(conform)

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
