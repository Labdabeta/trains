#include "task.h"
#include "debugio.h"
#include "syscall.h"
#include "linker.h"

#define WORD_SIZE 4

void setupTaskArray(struct TaskDescriptor *ta)
{
    int i;
    int addresses[NUM_SUPPORTED_TASKS] = {0};
	addresses[0] = 0x2000000; /* giant task 1  */
	addresses[1] = 0x1E00000; /* giant task 2  */
	addresses[2] = 0x1C00000; /* giant task 3  */
	addresses[3] = 0x1A00000; /* giant task 4  */
	addresses[4] = 0x1800000; /* big task 1    */
	addresses[5] = 0x1700000; /* big task 2    */
	addresses[6] = 0x1600000; /* big task 3    */
	addresses[7] = 0x1500000; /* big task 4    */
	addresses[8] = 0x1400000; /* big task 5    */
	addresses[9] = 0x1300000; /* big task 6    */
	addresses[10] = 0x1200000; /* big task 7    */
	addresses[11] = 0x1100000; /* big task 8    */
	addresses[12] = 0x1000000; /* big task 9    */
	addresses[13] = 0x0F00000; /* big task 10   */
	addresses[14] = 0x0E00000; /* big task 11   */
	addresses[15] = 0x0D00000; /* big task 12   */
	addresses[16] = 0x0C00000; /* big task 13   */
	addresses[17] = 0x0B00000; /* big task 14   */
	addresses[18] = 0x0A00000; /* task 1        */
	addresses[19] = 0x09C0000; /* task 2        */
	addresses[20] = 0x0980000; /* task 3        */
	addresses[21] = 0x0940000; /* task 4        */
	addresses[22] = 0x0900000; /* task 5        */
	addresses[23] = 0x08C0000; /* task 6        */
	addresses[24] = 0x0880000; /* task 7        */
	addresses[25] = 0x0840000; /* task 8        */
	addresses[26] = 0x0800000; /* task 9        */
	addresses[27] = 0x07C0000; /* task 10       */
	addresses[28] = 0x0780000; /* task 11       */
	addresses[29] = 0x0740000; /* task 12       */
	addresses[30] = 0x0700000; /* task 13       */
	addresses[31] = 0x06C0000; /* task 14       */
	addresses[32] = 0x0680000; /* task 15       */
	addresses[33] = 0x0640000; /* task 16       */
	addresses[34] = 0x0600000; /* task 17       */
	addresses[35] = 0x05C0000; /* task 18       */
	addresses[36] = 0x0580000; /* task 19       */
	addresses[37] = 0x0540000; /* task 20       */
	addresses[38] = 0x0500000; /* task 21       */
	addresses[39] = 0x04C0000; /* task 22       */
	addresses[40] = 0x0480000; /* task 23       */
	addresses[41] = 0x0440000; /* task 24       */
	addresses[42] = 0x0400000; /* small task 1  */
	addresses[43] = 0x03F0000; /* small task 2  */
	addresses[44] = 0x03E0000; /* small task 3  */
	addresses[45] = 0x03D0000; /* small task 4  */
	addresses[46] = 0x03C0000; /* small task 5  */
	addresses[47] = 0x03B0000; /* small task 6  */
	addresses[48] = 0x03A0000; /* small task 7  */
	addresses[49] = 0x0390000; /* small task 8  */
	addresses[50] = 0x0380000; /* small task 9  */
	addresses[51] = 0x0370000; /* small task 10 */
	addresses[52] = 0x0360000; /* small task 11 */
	addresses[53] = 0x0350000; /* small task 12 */
	addresses[54] = 0x0340000; /* small task 13 */
	addresses[55] = 0x0330000; /* small task 14 */
	addresses[56] = 0x0320000; /* small task 15 */
	addresses[57] = 0x0310000; /* small task 16 */
	addresses[58] = 0x0300000; /* small task 17 */
	addresses[59] = 0x02F0000; /* small task 18 */
	addresses[60] = 0x02E0000; /* small task 19 */
	addresses[61] = 0x02D0000; /* small task 20 */
	addresses[62] = 0x02C0000; /* small task 21 */
	addresses[63] = 0x02B0000; /* small task 22 */
	addresses[64] = 0x02A0000; /* small task 23 */
	addresses[65] = 0x0290000; /* small task 24 */
	addresses[66] = 0x0280000; /* small task 25 */
	addresses[67] = 0x0270000; /* small task 26 */
	addresses[68] = 0x0260000; /* small task 27 */
	addresses[69] = 0x0250000; /* small task 28 */
	addresses[70] = 0x0240000; /* tiny task 1   */
	addresses[71] = 0x023C000; /* tiny task 2   */
	addresses[72] = 0x0238000; /* tiny task 3   */
	addresses[73] = 0x0234000; /* tiny task 4   */
	addresses[74] = 0x0230000; /* tiny task 5   */
	addresses[75] = 0x022C000; /* tiny task 6   */
	addresses[76] = 0x0228000; /* tiny task 7   */
	addresses[77] = 0x0224000; /* tiny task 8   */
	addresses[78] = 0x0220000; /* tiny task 9   */
	addresses[79] = 0x021C000; /* tiny task 10  */
	addresses[80] = 0x0218000; /* tiny task 11  */
	addresses[81] = 0x0214000; /* tiny task 12  */
	addresses[82] = 0x0210000; /* tiny task 13  */
	addresses[83] = 0x020C000; /* tiny task 14  */
	addresses[84] = 0x0208000; /* tiny task 15  */
	addresses[85] = 0x0204000; /* tiny task 16  */

    for (i = 0; i < NUM_SUPPORTED_TASKS; ++i) {
        ta[i].tid = i;
        ta[i].priority = -1;
        ta[i].cpsr = -1;
        ta[i].stack = (void*)(addresses[i]);
        ta[i].next = 0;
        ta[i].parent = 0;
		ta[i].rval = 0;
		ta[i].data = 0; /* computed later. */
    }
}

void activateTask(struct TaskDescriptor *td, void (*entry)())
{
	td->cpsr = 0xd0; /* mode set */
	td->data = (struct TaskFrame*)((int)td->stack - sizeof(struct TaskFrame) + WORD_SIZE);

	td->data->lr = (int)fn_ptr(Exit);
	td->data->pc = (int)entry;
}

extern int asm_EnterTask(struct TaskFrame *sp, int cpsr, int rval);

void enterTask(struct TaskDescriptor *td) {
	td->data = (struct TaskFrame*)asm_EnterTask((struct TaskFrame*)td->data, td->cpsr, td->rval);
	asm ("mov %0, r1" : "=r"(td->cpsr));
}
