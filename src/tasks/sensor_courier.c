#include <service.h>

struct Data {
    int parent;
};

ENTRY initialize(struct Data *data)
{
    data->parent = MyParentTid();
}

ENTRY work(struct Data *data)
{
    int i;
    tputc(133);

    for (i = 0; i < 10; ++i) {
        int msg = tgetc();
        Send(data->parent, (char*)&msg, sizeof(msg), 0, 0);
    }
}

MAKE_SERVICE(sensor_courier)
