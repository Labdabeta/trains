/* Prints the logs generated DEBUG_PRINT */
#define LOG_BASE 0x50000

int main(int argc, char *argv[])
{
    /* UART2 Pointers */
    volatile int *flags = (int*)(0x808d0018);
    //volatile int *receive_status = (int*)(0x808d0004);
    volatile int *line_control_high = (int*)(0x808d0008);
    //volatile int *line_control_mid = (int*)(0x808d000c);
    //volatile int *line_control_low = (int*)(0x808d0010);
    volatile int *data = (int*)(0x808d0000);

    /* Set uart info. */
    *line_control_high |= 0x60;
    //*line_control_mid |= 0x00;
    //*line_control_low |= 191;

    volatile char *ch;
    for (ch = (char*)LOG_BASE; *ch; ++ch) {
        /* Busy wait until we can send what we want. */
        while (*flags & 0x20);
        *data = *ch; /* enable lights */
    }

    return 0;
}

