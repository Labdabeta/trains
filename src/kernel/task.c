#include "task.h"

#define WORD_SIZE 4

void setupTaskArray(struct TaskDescriptor *ta)
{
    int addresses[NUM_SUPPORTED_TASKS] = {
        0x2000000, /* giant task 1  */ 0x1E00000, /* giant task 2  */
        0x1C00000, /* giant task 3  */ 0x1A00000, /* giant task 4  */
        0x1800000, /* big task 1    */ 0x1700000, /* big task 2    */
        0x1600000, /* big task 3    */ 0x1500000, /* big task 4    */
        0x1400000, /* big task 5    */ 0x1300000, /* big task 6    */
        0x1200000, /* big task 7    */ 0x1100000, /* big task 8    */
        0x1000000, /* big task 9    */ 0x0F00000, /* big task 10   */
        0x0E00000, /* big task 11   */ 0x0D00000, /* big task 12   */
        0x0C00000, /* big task 13   */ 0x0B00000, /* big task 14   */
        0x0A00000, /* task 1        */ 0x09C0000, /* task 2        */
        0x0980000, /* task 3        */ 0x0940000, /* task 4        */
        0x0900000, /* task 5        */ 0x08C0000, /* task 6        */
        0x0880000, /* task 7        */ 0x0840000, /* task 8        */
        0x0800000, /* task 9        */ 0x07C0000, /* task 10       */
        0x0780000, /* task 11       */ 0x0740000, /* task 12       */
        0x0700000, /* task 13       */ 0x06C0000, /* task 14       */
        0x0680000, /* task 15       */ 0x0640000, /* task 16       */
        0x0600000, /* task 17       */ 0x05C0000, /* task 18       */
        0x0580000, /* task 19       */ 0x0540000, /* task 20       */
        0x0500000, /* task 21       */ 0x04C0000, /* task 22       */
        0x0480000, /* task 23       */ 0x0440000, /* task 24       */
        0x0400000, /* small task 1  */ 0x03F0000, /* small task 2  */
        0x03E0000, /* small task 3  */ 0x03D0000, /* small task 4  */
        0x03C0000, /* small task 5  */ 0x03B0000, /* small task 6  */
        0x03A0000, /* small task 7  */ 0x0390000, /* small task 8  */
        0x0380000, /* small task 9  */ 0x0370000, /* small task 10 */
        0x0360000, /* small task 11 */ 0x0350000, /* small task 12 */
        0x0340000, /* small task 13 */ 0x0330000, /* small task 14 */
        0x0320000, /* small task 15 */ 0x0310000, /* small task 16 */
        0x0300000, /* small task 17 */ 0x02F0000, /* small task 18 */
        0x02E0000, /* small task 19 */ 0x02D0000, /* small task 20 */
        0x02C0000, /* small task 21 */ 0x02B0000, /* small task 22 */
        0x02A0000, /* small task 23 */ 0x0290000, /* small task 24 */
        0x0280000, /* small task 25 */ 0x0270000, /* small task 26 */
        0x0260000, /* small task 27 */ 0x0250000, /* small task 28 */
        0x0240000, /* tiny task 1   */ 0x023C000, /* tiny task 2   */
        0x0238000, /* tiny task 3   */ 0x0234000, /* tiny task 4   */
        0x0230000, /* tiny task 5   */ 0x022C000, /* tiny task 6   */
        0x0228000, /* tiny task 7   */ 0x0224000, /* tiny task 8   */
        0x0220000, /* tiny task 9   */ 0x021C000, /* tiny task 10  */
        0x0218000, /* tiny task 11  */ 0x0214000, /* tiny task 12  */
        0x0210000, /* tiny task 13  */ 0x020C000, /* tiny task 14  */
        0x0208000, /* tiny task 15  */ 0x0204000, /* tiny task 16  */
    };
    int i;

    for (i = 0; i < NUM_SUPPORTED_TASKS; ++i) {
        ta[i].tid = i;
        ta[i].priority = -1;
        ta[i].cpsr = -1;
        ta[i].stack = (void*)addresses[i];
        ta[i].next = 0;
        ta[i].parent = 0;
		ta[i].rval = 0;
		ta[i].sp = 0; /* computed later. */
		ta[i].data = 0; /* computed later. */
    }
}

void activateTask(struct TaskDescriptor *td, void (*entry)())
{
	td->cpsr = 0xd0; /* mode set */
	td->sp = ((int)td->stack) + sizeof(struct TaskFrame) - WORD_SIZE;
	td->data = (struct TaskFrame*)td->stack;

	td->data->lr = 0; /* TODO: assign exit syscall address */
	td->data->pc = (int)entry;
}

extern void asm_EnterTask(struct TaskFrame *sp, int cpsr, int rval);

void enterTask(struct TaskDescriptor *td) {
	asm_EnterTask((struct TaskFrame*)td->sp, td->cpsr, td->rval);
	asm (
		"str r1, [%0]"
		: /* TODO: use outputs to write cpsr instead */
		: "r" (& td->cpsr)
	);
}
