#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[])
{
    int com2 = open("/dev/ttyS0", O_RDWR | O_NOCTTY);

    struct termios tty;
    struct termios tty_old;
    memset(&tty, 0, sizeof(tty));

    if (tcgetattr(com2, &tty))
        printf("Error %d from tcgetattr: %s\n", errno, strerror(errno));

    tty_old = tty;

    /* Set Baud Rate */
    cfsetospeed(&tty, (speed_t)B9600);
    cfsetispeed(&tty, (speed_t)B9600);

    /* Set other info */
    tty.c_cflag &= ~PARENB & ~CSTOPB & ~CSIZE & ~CRTSCTS;
    tty.c_cflag |= CS8;

    tty.c_cc[VMIN] = 1;
    tty.c_cc[VTIME] = 5;
    tty.c_cflag |= CREAD | CLOCAL;

    cfmakeraw(&tty);

    tcflush(com2, TCIFLUSH);

    if (tcsetattr(com2, TCSANOW, &tty))
        printf("Error %d from tcsetattr\n", errno);


    /* WRITE */
    char ch = '!';
    write(com2, &ch, 1);

    while (1) {
        char rd;
        int n = read(com2, &rd, 1);
        if (n < 0)
            printf("Error %d from read: %s\n", errno, strerror(errno));
        if (n)
            printf("%c", rd);
    }

    return 0;
}

