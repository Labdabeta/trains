#ifndef CONIO_H
#define CONIO_H

#warning TODO: make this a user-mode tool, should hook to kernel which maintains the 'true buffer'

/** Initializes the console
 *
 * This function sets the appropriate flags on the console UART for I/O.
 * It also initializes a circular buffer and associated information.
 *
 * \param[in,out] buffer        This will be the buffer used for console output.
 * \param[in] buffer_size       This is the size of the output buffer, in bytes.
 * \param[in] busy_threshold    This is the threshold after which the buffer is
 *                              said to be 'busy'.
 *
 * \return EXIT_SUCCESS if the operation was successful, EXIT_FAILURE otherwise.
 */
int conio_init_console(char *buffer, size_t buffer_size, size_t busy_threshold);

/** Outputs a clear screen escape.
 *
 * This function adds a clear screen escape sequence to the output buffer.
 */
void conio_clear_screen(void);

/** Outputs a hide cursor escape.
 *
 * This function outputs a hide cursor escape sequence to the output buffer.
 */
void conio_hide_cursor(void);

/** Outputs a show cursor escape.
 *
 * This function outputs a show cursor escape sequence to the output buffer.
 */
void conio_show_cursor(void);

/** Outputs a move cursor escape.
 *
 * This function moves the cursor to the specified x and y coordinates on
 * screen by outputting an escape sequence.
 *
 * Note: Coordinates are 1-indexed. (1,1) is the top left of the screen.
 *
 * \param[in] x                The x coordinate to move the cursor to.
 * \param[in] y                The y coordinate to move the cursor to.
 */
void conio_move_cursor(int x, int y);

/** Outputs a foreground colour escape.
 *
 * This function sets the foreground colour of text to the specified value.
 * For example, `conio_set_foreground(1,1,1)` sets the foreground to white.
 *
 * \param[in] r                If 0 have no red in the foreground, otherwise
 *                             have red.
 * \param[in] g                If 0 have no green in the foreground, otherwise
 *                             have green.
 * \param[in] b                If 0 have no blue in the foreground, otherwise
 *                             have blue.
 */
void conio_set_foreground(int r, int g, int b);

/** Outputs a background colour escape.
 *
 * This function sets the background colour of text to the specified value.
 * For example, `conio_set_background(0,0,0)` sets the background to black.
 *
 * \param[in] r                If 0 have no red in the background, otherwise
 *                             have red.
 * \param[in] g                If 0 have no green in the background, otherwise
 *                             have green.
 * \param[in] b                If 0 have no blue in the background, otherwise
 *                             have blue.
 */
void conio_set_background(int r, int g, int b);

/** Outputs an underline escape.
 *
 * This function sets whether text should be underlined or not.
 *
 * \param[in] u                If 0 do not underline, otherwise underline.
 */
void conio_set_underline(int u);

/** Outputs a bold escape.
 *
 * This function sets whether text should be bolded or not.
 *
 * \param[in] b                If 0 do not bold, otherwise bold.
 */
void conio_set_bold(int b);

/** Outputs a reset escape.
 *
 * This resets the formatting of the text, including colour, bolding,
 * underlining, etc. It does *not* reset position however.
 */
void conio_reset_format(void);

/** Outputs a character.
 *
 * This adds the specified character to the output queue, or forces it if set to
 * busy wait.
 *
 * \param[in] c                The character to output.
 */
void conio_putc(char c);

/** Outputs a string.
 *
 * This adds the specified null-terminated string to the output queue, or forces
 * it if set to busy wait.
 *
 * \param[in] s                The string to print.
 */
void conio_putstr(const char *s);

/** Outputs an integer in decimal format.
 *
 * This adds characters representing the specified integer in decimal format to
 * the output queue, or forces them if set to busy wait.
 *
 * \param[in] x                The integer to print.
 */
void conio_putd(int x);

/** Outputs an integer in hexadecimal format.
 *
 * This adds characters representing the specified integer in hexadecimal format
 * to the output queue, or forces them if set to busy wait.
 *
 * \param[in] x                The integer to print.
 */
void conio_putx(int x);

/** Sets console busy waiting.
 *
 * When busy waiting is enabled the output buffer will be forcibly flushed and
 * any new output will be printed immediately.
 *
 * \param[in] bw               If 0 do not busy wait, otherwise busy wait.
 */
void conio_set_busy_wait(int bw);

/** Gets the current capacity of the buffer.
 *
 * This returns the total number of characters waiting to be printed to the
 * console.
 *
 * \return The number of non-empty elements of the output buffer.
 */
size_t conio_get_size(void);

/** Steps the console.
 *
 * This function will attempt to print a character from the buffer. It will
 * return the character in the input register if it exists. Otherwise it will
 * return 0 if the buffer is below the busy threshold or -1 if it is above or at
 * the busy threshold.
 *
 * \return The inputted character, 0, or -1.
 */
int conio_step(void);

/** Quits the console.
 *
 * This forcibly clears the output buffer, then clears the screen and resets
 * formatting.
 */
void quit_console(void);

#endif /* CONIO_H */
