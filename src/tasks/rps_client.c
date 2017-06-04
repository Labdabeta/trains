#include "tasks.h"

#include "debugio.h"

void printResult(Buffer *b)
{
    char *msg = b->data;
    switch (msg[0]) {
        case 'w': debugio_putstr("I won!\n\r"); break;
        case 'l': debugio_putstr("I lost.\n\r"); break;
        case 't': debugio_putstr("Great minds think alike.\n\r"); break;
        case 'q': debugio_putstr("Sore loser.\n\r"); break;
        default: debugio_putc(msg[0]); break;
    }
}

void rps_client(void)
{
    Buffer snd, rpl;
    char snd_buf[3]; char rpl_buf[2];
    volatile int server;
    while ((server = WhoIs("RPS")) < 0) {
        Pass();
    }

    //DEBUG_DUMP_VAL(server);
    DEBUG_PRINT("Joined");
    loadBuffer(&snd, snd_buf, 3);
    loadBuffer(&rpl, rpl_buf, 2);

    /* Signup */
    snd_buf[0] = 's';
    snd_buf[1] = 0;

    SendBuffer(server, &snd, &rpl);
    debugio_putstr("Signed up!\n\r");

    if (MyTid() % 2) {
        /* Rock */
        debugio_putstr("P1: R\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 'r'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("P1: ");
        printResult(&rpl);
        /*debugio_putstr("Press any key to continue...\n\r");
        debugio_getc();*/

        /* Paper */
        debugio_putstr("P1: P\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 'p'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("p1: ");
        printResult(&rpl);
        /*debugio_putstr("Press any key to continue...\n\r");
        debugio_getc();*/

        /* Scissors */
        debugio_putstr("P1: S\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 's'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("p1: ");
        printResult(&rpl);
        /*debugio_putstr("Press any key to continue...\n\r");
        debugio_getc();*/

        /* Rock */
        debugio_putstr("P1: R\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 'r'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("p1: ");
        printResult(&rpl);
        /*debugio_putstr("Press any key to continue...\n\r");
        debugio_getc();*/

    } else {
        /* Scissors */
        debugio_putstr("P2: S\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 's'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("p2: ");
        printResult(&rpl);

        /* Paper */
        debugio_putstr("P2: P\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 'p'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("p2: ");
        printResult(&rpl);

        /* Paper */
        debugio_putstr("P2: P\n\r");
        snd_buf[0] = 'p'; snd_buf[1] = 'p'; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
        debugio_putstr("p2: ");
        printResult(&rpl);

        /* Quit */
        debugio_putstr("P2: Q\n\r");
        snd_buf[0] = 'q'; snd_buf[1] = 0; snd_buf[2] = 0;
        SendBuffer(server, &snd, &rpl);
    }
    while(1){
      Pass();
    }
    Exit();
}
