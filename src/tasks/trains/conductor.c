#include "tasks.h"
#include "parse_server.h"
#include "trains/track_server.h"
#include "string.h"
#include "routing.h"
#include "gui.h"

void async_router(void)
{
    int caller;
    int train;
    struct Sensor destination;

    Receive(&caller, (char*)&train, sizeof(train));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&destination, sizeof(destination));
    Reply(caller, 0, 0);

    routeTrain(train, destination);
    Exit();
}

void conductor(void)
{
    display("Hello");
    int parse_id = WhoIs(PARSE_SERVER_NAME);
    int track_id = WhoIs(TRACK_SERVER_NAME);

    const char *commands[] = {
        "quit", "q",
        "add is", "a is",
        "tr ii", "t ii",
        "goto is", "g is",
        "help", "h"
    };

    int i;
    for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i) {
        dprintf("Registering %s\n", commands[i]);
        registerForCommand(parse_id, commands[i]);
    }

    for (ever) {
        struct Command cmd;
        Receive(&i, (char*)&cmd, sizeof(cmd));
        Reply(i, 0, 0);

        if (!strcmp(cmd.name, "q") || !strcmp(cmd.name, "quit")) {
            display("Goodbye");
            Exit();
        }

        if (!strcmp(cmd.name, "h") || !strcmp(cmd.name, "help")) {
            for (i = 0; i < (sizeof(commands) / sizeof(*commands)); ++i)
                display(commands[i]);
        }

        if (!strcmp(cmd.name, "a") || !strcmp(cmd.name, "add")) {
            display("Adding %d to %c%d", cmd.args[0].data.i, S_PRINT(parseSensor(cmd.args[1].data.string)));
            insertTrain(track_id, cmd.args[0].data.i, parseSensor(cmd.args[1].data.string));
        }

        if (!strcmp(cmd.name, "g") || !strcmp(cmd.name, "goto")) {
            int child = CreateSize(1, async_router, TASK_SIZE_TINY);
            struct Sensor dest = parseSensor(cmd.args[1].data.string);
            display("Moving %d to %c%d", cmd.args[0].data.i, S_PRINT(dest));
            Send(child, (char*)&cmd.args[0].data.i, sizeof(cmd.args[0].data.i), 0, 0);
            Send(child, (char*)&dest, sizeof(dest), 0, 0);
        }

        if (!strcmp(cmd.name, "t") || !strcmp(cmd.name, "tr"))
            tput2(cmd.args[1].data.i, cmd.args[0].data.i);
    }
}


#if 0
#include "tasks.h"
#include "parse_server.h"
#include "precise_stopper.h"
#include "trains/calibration_master.h"

#define T70RA 149
#define T70RB 10224

#define T69RA 140
#define T69RB 5577

void path_maker(void){
	Service();

	int caller;
	struct flip_request req;
	int clock_tid = WhoIs("CLOCK");
	int track = WhoIs(TRACK_SERVER_NAME);

	while(1){
		Receive(&caller, (char *) &req, sizeof(struct flip_request));
		Reply(caller, 0, 0);
		dprintf("Flipping %d to %d\n", req.switch_id, req.position);
		notifySwitch(track, req.switch_id, req.position == 34);
		tput2(req.position, req.switch_id);
		Delay(clock_tid, 6);
		tputc(32);
	}
}

void conductor(void)
{
	struct Command cmd;
	registerForCommand(WhoIs(PARSE_SERVER_NAME, "path iss"));
	registerForCommand(WhoIs(PARSE_SERVER_NAME, "quit"));

	track_calibration cal70, cal69, calX;
	track_calibration *ptr_cal70 = &cal70;
	track_calibration *ptr_cal69 = &cal69;
	track_calibration *ptr_calX = &calX;
	init_cal(&cal70, 70, T70RA, T70RB);
	init_cal(&cal69, 69, T69RA, T69RB);
	init_cal(&calX, 0, (T69RA + T70RA)/2, (T69RB + T70RB)/2);


	int pather = CreateSize(1, path_maker, TASK_SIZE_TINY);

	for (ever) {
		int tid;
		Receive(&tid, (char*)&cmd, sizeof(cmd));

		if (!strcmp(cmd.name, "path")) {
			int train = cmd.args[0].data.i;
			struct Sensor src = parseSensor(cmd.args[1].data.string);
			struct Sensor dst = parseSensor(cmd.args[2].data.string);
			struct route_request req = {.train = train, .src = src, .dest = dst};

			int stopper = Create(1, precise_stop);
			Send(stopper, (char*)&maker_tid, sizeof(maker_tid), 0, 0);

			switch (train) {
				case 70:
					Send(stopper, (char*)&ptr_cal70, sizeof(ptr_cal70), 0, 0);
					break;
				case 69:
					Send(stopper, (char*)&ptr_cal69, sizeof(ptr_cal69), 0, 0);
					break;
				default:
					Send(stopper, (char*)&ptr_calX, sizeof(ptr_calX), 0, 0);
					break;
			}

			Send(stopper, (char*)&req, sizeof(req), 0, 0);
		}

		if (!strcmp(cmd.name, "quit")) {
			Exit();
		}
	}
}
#endif
