// Prints whatever is typed to the trains
// Prints train input to cout
// in unix syntax: cin > tout; tin > cout
#include "tasks.h"
#include "fuzzy.h"
#include "rand.h"

void sensorloop(void)
{
    int tout = WhoIs("TOUT");
    int tin = WhoIs("TIN");

    for (ever) {
        Putc(tout, 1, 133);

        for (int i = 0; i < 10; ++i) {
            int val = Getc(tin, 1);
            printf("%c%c%c%c%c%c%c%c",
                    '0' + !!(val & 1),
                    '0' + !!(val & 2),
                    '0' + !!(val & 4),
                    '0' + !!(val & 8),
                    '0' + !!(val & 16),
                    '0' + !!(val & 32),
                    '0' + !!(val & 64),
                    '0' + !!(val & 128));
        }
        printf("\n\r");
    }
}

void cin_to_tout(void)
{
	int cin = WhoIs("CIN");
	int tout = WhoIs("TOUT");

    int byte = 0;
    for (ever) {
        int ch = Getc(cin, 2);

        if (ch >= '0' && ch <= '9') {
            byte *= 10;
            byte += ch - '0';
        } else if (ch == 'q' || ch == 'Q') {
            Exit();
        } else {
            printf("Sending: %d\n\r", byte);
            Putc(tout, 1, byte);
            byte = 0;
        }
    }
}

void cout_to_tin(void)
{
    Service();
	int tin = WhoIs("TIN");

    for (ever)
        printf("%d\n\r", 0xFF & Getc(tin, 1));
}

void hello()
{
    Create(1, sensorloop);
    Create(1, cin_to_tout);
    //Create(1, cout_to_tin);

	Exit();
}
