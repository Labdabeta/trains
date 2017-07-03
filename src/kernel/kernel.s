	.cpu arm920t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"kernel.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	enterTask, %function
enterTask:
.LFB0:
	.file 1 "src/kernel/task.h"
	.loc 1 114 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	.loc 1 116 0
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #16]
	ldr	r3, [fp, #-8]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	mov	r2, r3
	bl	asm_EnterTask(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #16]
	.loc 1 117 0
	.syntax divided
@ 117 "src/kernel/task.h" 1
	mov r2, r1
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	.loc 1 118 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	enterTask, .-enterTask
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	scheduleTask, %function
scheduleTask:
.LFB1:
	.file 2 "src/kernel/scheduler.h"
	.loc 2 35 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	.loc 2 36 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #288]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #24]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #20]
	.loc 2 37 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #288]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #24]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 2 38 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	scheduleTask, .-scheduleTask
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	reschedule, %function
reschedule:
.LFB2:
	.loc 2 52 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	.loc 2 54 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #288]
	str	r3, [fp, #-8]
	.loc 2 56 0
	b	.L4
.L6:
	.loc 2 57 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #288]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #288]
	.loc 2 58 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #288]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bne	.L4
	.loc 2 59 0
	mov	r3, #0
	b	.L5
.L4:
	.loc 2 56 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #288]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L6
	.loc 2 63 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #288]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	.loc 2 64 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #288]
	ldr	r2, [fp, #-16]
	ldr	r2, [r2, #288]
	ldr	r2, [r2]
	ldr	r2, [r2, #20]
	str	r2, [r3]
	.loc 2 67 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L7
	.loc 2 68 0
	ldr	r3, [fp, #-12]
	mov	r2, #1
	str	r2, [r3, #20]
	b	.L4
.L7:
	.loc 2 72 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-16]
	bl	scheduleTask(PLT)
	.loc 2 73 0
	ldr	r3, [fp, #-12]
.L5:
	.loc 2 76 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	reschedule, .-reschedule
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanupTimer1, %function
cleanupTimer1:
.LFB4:
	.file 3 "src/setup.h"
	.loc 3 6 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #12
	.loc 3 7 0
	ldr	r3, .L12
	str	r3, [fp, #-8]
	.loc 3 8 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	bic	r2, r3, #192
	ldr	r3, [fp, #-8]
	str	r2, [r3, #8]
	.loc 3 9 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #12]
	.loc 3 10 0
	ldr	r2, .L12+4
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r3, r3, #16
	str	r3, [r2]
	.loc 3 11 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	-2139029504
	.word	-2146762732
	.cfi_endproc
.LFE4:
	.size	cleanupTimer1, .-cleanupTimer1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	t4t, %function
t4t:
.LFB5:
	.file 4 "src/kernel/kernel.h"
	.loc 4 48 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 11, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	.loc 4 49 0
	ldr	r3, .L16
	ldmia	r3, {r3-r4}
	mvn	r1, #0
	mov	r2, #255
	and	r3, r3, r1
	and	r4, r4, r2
	.loc 4 50 0
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{r4, fp}
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L17:
	.align	2
.L16:
	.word	-2139029408
	.cfi_endproc
.LFE5:
	.size	t4t, .-t4t
	.align	2
	.global	newTID
	.syntax unified
	.arm
	.fpu softvfp
	.type	newTID, %function
newTID:
.LFB6:
	.file 5 "src/kernel/kernel.c"
	.loc 5 12 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	.loc 5 14 0
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L19
.L21:
	b	.L20
	b	.L22
	b	.L23
	b	.L24
	b	.L25
	.p2align 1
.L20:
	.loc 5 15 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L26
.L22:
	.loc 5 16 0
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L26
.L23:
	.loc 5 17 0
	mov	r3, #13
	str	r3, [fp, #-8]
	b	.L26
.L24:
	.loc 5 18 0
	mov	r3, #28
	str	r3, [fp, #-8]
	b	.L26
.L25:
	.loc 5 19 0
	mov	r3, #45
	str	r3, [fp, #-8]
	b	.L26
.L19:
	.loc 5 20 0
	mvn	r3, #0
	b	.L27
.L26:
	.loc 5 23 0
	b	.L28
.L30:
	.loc 5 24 0
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	add	r3, r3, #40
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L29
	.loc 5 25 0
	ldr	r3, [fp, #-8]
	b	.L27
.L29:
	.loc 5 23 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L28:
	.loc 5 23 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #74
	ble	.L30
	.loc 5 27 0 is_stmt 1
	mvn	r3, #0
.L27:
	.loc 5 28 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE6:
	.size	newTID, .-newTID
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableT4, %function
enableT4:
.LFB7:
	.loc 5 31 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 11, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	.loc 5 32 0
	ldr	r3, .L32
	str	r3, [fp, #-8]
	.loc 5 34 0
	ldr	r2, [fp, #-8]
	mov	r3, #0
	mov	r4, #0
	stm	r2, {r3-r4}
	.loc 5 35 0
	ldr	r3, [fp, #-8]
	ldmia	r3, {r3-r4}
	mov	r1, #0
	mov	r2, #256
	orr	r3, r3, r1
	orr	r4, r4, r2
	ldr	r2, [fp, #-8]
	stm	r2, {r3-r4}
	.loc 5 36 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{r4, fp}
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L33:
	.align	2
.L32:
	.word	-2139029408
	.cfi_endproc
.LFE7:
	.size	enableT4, .-enableT4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"src/kernel/kernel.c\000"
	.align	2
.LC1:
	.ascii	"%s@%s:%d\012\015\000"
	.align	2
.LC2:
	.ascii	"Louis Burke 32c6b60  (HEAD -> isolation)\000"
	.align	2
.LC3:
	.ascii	"%s\000"
	.align	2
.LC4:
	.ascii	"\012\015\000"
	.global	__aeabi_uldivmod
	.align	2
.LC5:
	.ascii	"\012\015Kernel time: %u%u\012\015Handler time: %u%u"
	.ascii	"\012\015User time: %u%u\012\015Idle time: %u%u\012\015"
	.ascii	"Total time: %u%u\012\015Percent idle: %u%%\012\015\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
.LFB8:
	.loc 5 39 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 7424
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #32
	.cfi_def_cfa 11, 4
	sub	sp, sp, #7424
	sub	sp, sp, #36
	sub	r3, fp, #4096
	sub	r3, r3, #36
	str	r0, [r3, #-3292]
	sub	r3, fp, #4096
	sub	r3, r3, #36
	str	r1, [r3, #-3296]
	ldr	r5, .L40
.LPIC6:
	add	r5, pc, r5
	.loc 5 44 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #3624]
	str	r4, [r2, #3628]
	.loc 5 45 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
	.loc 5 46 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #3640]
	str	r4, [r2, #3644]
	.loc 5 47 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #3648]
	str	r4, [r2, #3652]
	.loc 5 48 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #3656]
	str	r4, [r2, #3660]
	.loc 5 50 0
	bl	enableT4(PLT)
	.loc 5 51 0
	bl	t4t(PLT)
	mov	r2, r1
	mov	r1, r0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	str	r1, [r3, #3632]
	str	r2, [r3, #3636]
	.loc 5 54 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #1
	str	r3, [r2, #3672]
	.loc 5 56 0
	bl	init_debugio(PLT)
	.loc 5 57 0
	mov	r3, #57
	ldr	r2, .L40+4
.LPIC0:
	add	r2, pc, r2
	ldr	r1, .L40+8
.LPIC1:
	add	r1, pc, r1
	ldr	r0, .L40+12
.LPIC2:
	add	r0, pc, r0
	bl	tfp_dprintf(PLT)
	ldr	r3, .L40+16
.LPIC3:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L40+20
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	ldr	r3, .L40+24
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 5 58 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #6592
	add	r3, r3, #24
	mov	r0, r3
	bl	initScheduler(PLT)
	.loc 5 60 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #6592
	add	r3, r3, #24
	mov	r0, r3
	bl	initEventBlocks(PLT)
	.loc 5 62 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #16
	mov	r0, r3
	bl	setupTaskArray(PLT)
	.loc 5 63 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	str	r3, [r2, #-3260]
	.loc 5 64 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #-3248]
	.loc 5 67 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #7
	str	r3, [r2, #-3160]
	.loc 5 68 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, #0
	strb	r2, [r3, #-3112]
	.loc 5 69 0
	ldr	r3, .L40+28
	ldr	r3, [r5, r3]
	mov	r2, r3
	ldr	r3, .L40+32
	ldr	r3, [r5, r3]
	add	r2, r2, r3
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #104
	mov	r1, r2
	mov	r0, r3
	bl	activateTask(PLT)
	.loc 5 70 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r2, r3, #104
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #6592
	add	r3, r3, #24
	mov	r1, r2
	mov	r0, r3
	bl	scheduleTask(PLT)
	.loc 5 73 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	mov	r2, r3
	mov	r3, #9
	str	r3, [r2, #3264]
	.loc 5 74 0
	ldr	r3, .L40+28
	ldr	r3, [r5, r3]
	mov	r2, r3
	ldr	r3, .L40+36
	ldr	r3, [r5, r3]
	add	r2, r2, r3
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #6528
	mov	r1, r2
	mov	r0, r3
	bl	activateTask(PLT)
	.loc 5 77 0
	ldr	r3, .L40+28
	ldr	r3, [r5, r3]
	mov	r2, r3
	ldr	r3, .L40+40
	ldr	r3, [r5, r3]
	add	r1, r2, r3
	sub	r3, fp, #452
	add	r2, r3, #396
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #12
	mov	r0, r3
	bl	asm_SetupTrap(PLT)
	.loc 5 80 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3624]
	str	r4, [r2, #3628]
	.loc 5 81 0
	bl	t4t(PLT)
	mov	r3, r0
	mov	r4, r1
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
	.loc 5 82 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3632
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3628]
	ldr	r3, [r3, #3624]
	subs	r3, r1, r3
	sbc	r4, r2, r4
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3624]
	str	r4, [r2, #3628]
	.loc 5 85 0
	b	.L35
.L37:
	.loc 5 89 0
	bl	t4t(PLT)
	mov	r3, r0
	mov	r4, r1
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3664]
	str	r4, [r2, #3668]
	.loc 5 90 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r5, [r3, #3640]
	ldr	r6, [r3, #3644]
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3664
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	adds	r3, r3, r5
	adc	r4, r4, r6
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3640]
	str	r4, [r2, #3644]
	.loc 5 91 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3664
	ldmia	r4, {r3-r4}
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
	.loc 5 95 0
	ldr	r0, [fp, #-40]
	bl	enterTask(PLT)
	.loc 5 98 0
	bl	t4t(PLT)
	mov	r3, r0
	mov	r4, r1
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3664]
	str	r4, [r2, #3668]
	.loc 5 99 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r6, r3, #3648
	ldmia	r6, {r5-r6}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3664
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	adds	r3, r3, r5
	adc	r4, r4, r6
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3648]
	str	r4, [r2, #3652]
	.loc 5 100 0
	ldr	r3, [fp, #-40]
	add	r6, r3, #80
	ldmia	r6, {r5-r6}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3664
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	adds	r3, r3, r5
	adc	r4, r4, r6
	ldr	r2, [fp, #-40]
	str	r3, [r2, #80]
	str	r4, [r2, #84]
	.loc 5 101 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3664
	ldmia	r4, {r3-r4}
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
	.loc 5 104 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	ldr	r1, [fp, #-40]
	mov	r0, r3
	bl	handleSyscall(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-40]
	str	r2, [r3, #8]
	.loc 5 107 0
	bl	t4t(PLT)
	mov	r3, r0
	mov	r4, r1
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3664]
	str	r4, [r2, #3668]
	.loc 5 108 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r5, [r3, #3656]
	ldr	r6, [r3, #3660]
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3664
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	adds	r3, r3, r5
	adc	r4, r4, r6
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3656]
	str	r4, [r2, #3660]
	.loc 5 109 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3664
	ldmia	r4, {r3-r4}
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
.L36:
	.loc 5 87 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #6592
	add	r3, r3, #24
	mov	r0, r3
	bl	reschedule(PLT)
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L37
	.loc 5 115 0
	bl	t4t(PLT)
	mov	r3, r0
	mov	r4, r1
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3664]
	str	r4, [r2, #3668]
	.loc 5 116 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r5, [r3, #3320]
	ldr	r6, [r3, #3324]
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3664
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	adds	r3, r3, r5
	adc	r4, r4, r6
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3320]
	str	r4, [r2, #3324]
	.loc 5 117 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3664
	ldmia	r4, {r3-r4}
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
	.loc 5 119 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r3, r3, #6528
	mov	r0, r3
	bl	enterTask(PLT)
	.loc 5 121 0
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	add	r2, r3, #6528
	sub	r3, fp, #7360
	sub	r3, r3, #36
	sub	r3, r3, #24
	mov	r1, r2
	mov	r0, r3
	bl	handleSyscall(PLT)
	mov	r2, r0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	str	r2, [r3, #3248]
	.loc 5 125 0
	bl	t4t(PLT)
	mov	r3, r0
	mov	r4, r1
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3664]
	str	r4, [r2, #3668]
	.loc 5 126 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r5, [r3, #3320]
	ldr	r6, [r3, #3324]
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3664
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3632
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	adds	r3, r3, r5
	adc	r4, r4, r6
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3320]
	str	r4, [r2, #3324]
	.loc 5 127 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3664
	ldmia	r4, {r3-r4}
	sub	r2, fp, #4096
	sub	r2, r2, #36
	str	r3, [r2, #3632]
	str	r4, [r2, #3636]
.L35:
	.loc 5 85 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r3, [r3, #3672]
	cmp	r3, #0
	bgt	.L36
	.loc 5 132 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r2, r3, #3632
	ldmia	r2, {r1-r2}
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3628]
	ldr	r3, [r3, #3624]
	subs	r3, r1, r3
	sbc	r4, r2, r4
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	.loc 5 134 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3644]
	ldr	r3, [r3, #3640]
	mov	r3, r4
	sub	r2, fp, #7424
	sub	r2, r2, #12
	str	r3, [r2]
	mov	r3, #0
	sub	r2, fp, #7424
	sub	r2, r2, #8
	str	r3, [r2]
	.loc 5 133 0
	sub	r3, fp, #7424
	sub	r3, r3, #12
	ldr	r3, [r3]
	sub	r2, fp, #7424
	sub	r2, r2, #12
	str	r3, [r2]
	.loc 5 134 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3644]
	ldr	r3, [r3, #3640]
	.loc 5 133 0
	sub	r2, fp, #7424
	sub	r2, r2, #32
	str	r3, [r2]
	.loc 5 135 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3660]
	ldr	r3, [r3, #3656]
	mov	r0, r4
	sub	r3, fp, #7424
	sub	r3, r3, #20
	str	r0, [r3]
	mov	r0, #0
	sub	r3, fp, #7424
	sub	r3, r3, #16
	str	r0, [r3]
	.loc 5 133 0
	sub	r3, fp, #7424
	sub	r3, r3, #20
	ldr	r0, [r3]
	sub	r3, fp, #7424
	sub	r3, r3, #20
	str	r0, [r3]
	.loc 5 135 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3660]
	ldr	r3, [r3, #3656]
	.loc 5 133 0
	mov	r6, r3
	.loc 5 136 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3648
	ldmia	r4, {r3-r4}
	mov	r7, r4
	mov	r8, #0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	add	r4, r3, #3648
	ldmia	r4, {r3-r4}
	.loc 5 133 0
	mov	r8, r3
	.loc 5 137 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3324]
	ldr	r3, [r3, #3320]
	mov	r9, r4
	mov	r10, #0
	.loc 5 138 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3324]
	ldr	r3, [r3, #3320]
	.loc 5 133 0
	mov	r10, r3
	.loc 5 139 0
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	mov	ip, r4
	sub	r3, fp, #7424
	sub	r3, r3, #28
	str	ip, [r3]
	mov	ip, #0
	sub	r3, fp, #7424
	sub	r3, r3, #24
	str	ip, [r3]
	.loc 5 133 0
	sub	r3, fp, #7424
	sub	r3, r3, #28
	ldr	ip, [r3]
	sub	r3, fp, #7424
	sub	r3, r3, #28
	str	ip, [r3]
	ldr	r5, [fp, #-52]
	.loc 5 140 0
	sub	r3, fp, #4096
	sub	r3, r3, #36
	ldr	r4, [r3, #3324]
	ldr	r3, [r3, #3320]
	mov	r2, #100
	mul	r1, r2, r4
	mov	r2, #0
	mul	r2, r3, r2
	add	ip, r1, r2
	mov	r2, #100
	umull	r0, r1, r3, r2
	add	r3, ip, r1
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod(PLT)
.LVL0:
	mov	r3, r0
	mov	r4, r1
	.loc 5 133 0
	str	r3, [sp, #28]
	str	r5, [sp, #24]
	sub	r3, fp, #7424
	sub	r3, r3, #28
	ldr	ip, [r3]
	str	ip, [sp, #20]
	str	r10, [sp, #16]
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	str	r7, [sp, #4]
	str	r6, [sp]
	sub	r3, fp, #7424
	sub	r3, r3, #20
	ldr	r3, [r3]
	sub	r2, fp, #7424
	sub	r2, r2, #32
	ldr	r2, [r2]
	sub	r1, fp, #7424
	sub	r1, r1, #12
	ldr	r1, [r1]
	ldr	r0, .L40+44
.LPIC7:
	add	r0, pc, r0
	bl	tfp_dprintf(PLT)
	.loc 5 143 0
	bl	cleanupTimer1(PLT)
	.loc 5 145 0
	mov	r3, #0
	.loc 5 146 0
	mov	r0, r3
	sub	sp, fp, #32
	.cfi_def_cfa 13, 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L41:
	.align	2
.L40:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC6+8)
	.word	__func__.4578-(.LPIC0+8)
	.word	.LC0-(.LPIC1+8)
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.word	.LC3-(.LPIC4+8)
	.word	.LC4-(.LPIC5+8)
	.word	CODE_BASE(GOT)
	.word	main_task(GOT)
	.word	idle(GOT)
	.word	EnterHWI(GOT)
	.word	.LC5-(.LPIC7+8)
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align	2
	.type	__func__.4578, %object
	.size	__func__.4578, 5
__func__.4578:
	.ascii	"main\000"
	.text
.Letext0:
	.file 6 "src/util/data/buffer.h"
	.file 7 "src/kernel/handlers.h"
	.file 8 "src/util/trains/ts7200.h"
	.file 9 "src/linker.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x68b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0xc
	.4byte	.LASF87
	.4byte	.LASF88
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0xc
	.byte	0x6
	.byte	0x5
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x6
	.byte	0x6
	.4byte	0x56
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x6
	.byte	0x7
	.4byte	0x58
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x6
	.byte	0x8
	.4byte	0x5f
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.4byte	0x5f
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2c
	.byte	0x1
	.byte	0x25
	.4byte	0xf3
	.uleb128 0x8
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.byte	0
	.uleb128 0x8
	.ascii	"r4\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.byte	0x4
	.uleb128 0x8
	.ascii	"r5\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x8
	.ascii	"r6\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.byte	0xc
	.uleb128 0x8
	.ascii	"r7\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.byte	0x10
	.uleb128 0x8
	.ascii	"r8\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.byte	0x14
	.uleb128 0x8
	.ascii	"r9\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x5f
	.byte	0x18
	.uleb128 0x8
	.ascii	"r10\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x5f
	.byte	0x1c
	.uleb128 0x8
	.ascii	"r11\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x5f
	.byte	0x20
	.uleb128 0x8
	.ascii	"fp\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x5f
	.byte	0x24
	.uleb128 0x8
	.ascii	"lr\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x5f
	.byte	0x28
	.byte	0
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x1
	.4byte	0x13a
	.byte	0x1
	.byte	0x2a
	.4byte	0x13a
	.uleb128 0xa
	.4byte	.LASF6
	.byte	0
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.uleb128 0xa
	.4byte	.LASF8
	.byte	0x2
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x3
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x6
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x7
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x1
	.byte	0x34
	.4byte	0xf3
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x58
	.byte	0x1
	.byte	0x36
	.4byte	0x231
	.uleb128 0x8
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x5f
	.byte	0
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3a
	.4byte	0x5f
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3b
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3c
	.4byte	0x56
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3d
	.4byte	0x231
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x1
	.byte	0x40
	.4byte	0x237
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1
	.byte	0x41
	.4byte	0x5f
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x1
	.byte	0x44
	.4byte	0x237
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x1
	.byte	0x47
	.4byte	0x237
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x1
	.byte	0x48
	.4byte	0x237
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x1
	.byte	0x49
	.4byte	0x237
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x1
	.byte	0x4a
	.4byte	0x237
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x1
	.byte	0x4b
	.4byte	0x237
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x1
	.byte	0x4c
	.4byte	0x237
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x1
	.byte	0x4d
	.4byte	0x23d
	.byte	0x38
	.uleb128 0x8
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0x254
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x1
	.byte	0x4f
	.4byte	0x141
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x1
	.byte	0x52
	.4byte	0x26a
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x6b
	.uleb128 0xc
	.byte	0x4
	.4byte	0x14c
	.uleb128 0xd
	.4byte	0x56
	.4byte	0x24d
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF32
	.uleb128 0xd
	.4byte	0x264
	.4byte	0x264
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x25
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF33
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0x24
	.byte	0x2
	.byte	0x9
	.4byte	0x296
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x2
	.byte	0xb
	.4byte	0x237
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x2
	.byte	0xe
	.4byte	0x296
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.4byte	0x2a6
	.4byte	0x2a6
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x271
	.uleb128 0xf
	.4byte	.LASF37
	.2byte	0x124
	.byte	0x2
	.byte	0x11
	.4byte	0x2d3
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x2
	.byte	0x12
	.4byte	0x2d3
	.byte	0
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0x2
	.byte	0x13
	.4byte	0x2a6
	.2byte	0x120
	.byte	0
	.uleb128 0xd
	.4byte	0x271
	.4byte	0x2e3
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x1
	.4byte	0x13a
	.byte	0x7
	.byte	0x9
	.4byte	0x35a
	.uleb128 0xa
	.4byte	.LASF41
	.byte	0
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x1
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x2
	.uleb128 0xa
	.4byte	.LASF44
	.byte	0x3
	.uleb128 0xa
	.4byte	.LASF45
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF47
	.byte	0x6
	.uleb128 0xa
	.4byte	.LASF48
	.byte	0x7
	.uleb128 0xa
	.4byte	.LASF49
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x9
	.uleb128 0xa
	.4byte	.LASF51
	.byte	0xa
	.uleb128 0xa
	.4byte	.LASF52
	.byte	0xb
	.uleb128 0xa
	.4byte	.LASF53
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0xd
	.uleb128 0xa
	.4byte	.LASF55
	.byte	0xe
	.uleb128 0xa
	.4byte	.LASF56
	.byte	0xf
	.uleb128 0xa
	.4byte	.LASF57
	.byte	0x10
	.byte	0
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x7
	.byte	0x1b
	.4byte	0x2e3
	.uleb128 0x2
	.4byte	.LASF58
	.byte	0x10
	.byte	0x8
	.byte	0x12
	.4byte	0x3a2
	.uleb128 0x3
	.4byte	.LASF59
	.byte	0x8
	.byte	0x13
	.4byte	0x66
	.byte	0
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x8
	.byte	0x14
	.4byte	0x66
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF61
	.byte	0x8
	.byte	0x15
	.4byte	0x66
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF62
	.byte	0x8
	.byte	0x16
	.4byte	0x66
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.4byte	0x365
	.uleb128 0xf
	.4byte	.LASF63
	.2byte	0x1b38
	.byte	0x4
	.byte	0xb
	.4byte	0x440
	.uleb128 0x3
	.4byte	.LASF64
	.byte	0x4
	.byte	0xd
	.4byte	0x440
	.byte	0
	.uleb128 0x8
	.ascii	"fn\000"
	.byte	0x4
	.byte	0xe
	.4byte	0x35a
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x4
	.byte	0x11
	.4byte	0x450
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0x4
	.byte	0x14
	.4byte	0x2ac
	.2byte	0x19d8
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x4
	.byte	0x17
	.4byte	0x26a
	.2byte	0x1b00
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x4
	.byte	0x17
	.4byte	0x26a
	.2byte	0x1b08
	.uleb128 0x10
	.4byte	.LASF69
	.byte	0x4
	.byte	0x17
	.4byte	0x26a
	.2byte	0x1b10
	.uleb128 0x10
	.4byte	.LASF70
	.byte	0x4
	.byte	0x17
	.4byte	0x26a
	.2byte	0x1b18
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x4
	.byte	0x17
	.4byte	0x26a
	.2byte	0x1b20
	.uleb128 0x11
	.ascii	"tmp\000"
	.byte	0x4
	.byte	0x17
	.4byte	0x26a
	.2byte	0x1b28
	.uleb128 0x10
	.4byte	.LASF72
	.byte	0x4
	.byte	0x1a
	.4byte	0x5f
	.2byte	0x1b30
	.byte	0
	.uleb128 0xd
	.4byte	0x5f
	.4byte	0x450
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.4byte	0x14c
	.4byte	0x460
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x4a
	.byte	0
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x9
	.byte	0x4
	.4byte	0x46b
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF73
	.uleb128 0x13
	.4byte	0x46b
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f8
	.uleb128 0x15
	.4byte	.LASF74
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -7428
	.uleb128 0x15
	.4byte	.LASF64
	.byte	0x5
	.byte	0x26
	.4byte	0x4f8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -7432
	.uleb128 0x16
	.4byte	.LASF75
	.byte	0x5
	.byte	0x28
	.4byte	0x504
	.uleb128 0x3
	.byte	0x91
	.sleb128 -456
	.uleb128 0x16
	.4byte	.LASF0
	.byte	0x5
	.byte	0x29
	.4byte	0x3a7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -7424
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x5
	.byte	0x2a
	.4byte	0x237
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x17
	.4byte	.LASF90
	.4byte	0x524
	.uleb128 0x5
	.byte	0x3
	.4byte	__func__.4578
	.uleb128 0x16
	.4byte	.LASF76
	.byte	0x5
	.byte	0x84
	.4byte	0x26a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x4fe
	.uleb128 0xc
	.byte	0x4
	.4byte	0x46b
	.uleb128 0xd
	.4byte	0x5f
	.4byte	0x514
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x63
	.byte	0
	.uleb128 0xd
	.4byte	0x472
	.4byte	0x524
	.uleb128 0xe
	.4byte	0x24d
	.byte	0x4
	.byte	0
	.uleb128 0x13
	.4byte	0x514
	.uleb128 0x18
	.4byte	.LASF81
	.byte	0x5
	.byte	0x1e
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x54c
	.uleb128 0x19
	.ascii	"t4\000"
	.byte	0x5
	.byte	0x20
	.4byte	0x54c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x26a
	.uleb128 0x1a
	.4byte	.LASF78
	.byte	0x5
	.byte	0xb
	.4byte	0x5f
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x594
	.uleb128 0x15
	.4byte	.LASF0
	.byte	0x5
	.byte	0xb
	.4byte	0x594
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF79
	.byte	0x5
	.byte	0xb
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x5
	.byte	0xd
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x3a7
	.uleb128 0x1b
	.ascii	"t4t\000"
	.byte	0x4
	.byte	0x2f
	.4byte	0x26a
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF84
	.byte	0x3
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d2
	.uleb128 0x19
	.ascii	"t1\000"
	.byte	0x3
	.byte	0x7
	.4byte	0x5d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x3a2
	.uleb128 0x1d
	.4byte	.LASF91
	.byte	0x2
	.byte	0x33
	.4byte	0x237
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61c
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x2
	.byte	0x33
	.4byte	0x61c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"ret\000"
	.byte	0x2
	.byte	0x35
	.4byte	0x237
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF80
	.byte	0x2
	.byte	0x36
	.4byte	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x2ac
	.uleb128 0x18
	.4byte	.LASF82
	.byte	0x2
	.byte	0x22
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x654
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x2
	.byte	0x22
	.4byte	0x61c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF83
	.byte	0x2
	.byte	0x22
	.4byte	0x237
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF85
	.byte	0x1
	.byte	0x71
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.ascii	"td\000"
	.byte	0x1
	.byte	0x71
	.4byte	0x237
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x20
	.4byte	.LASF92
	.byte	0x1
	.byte	0x73
	.4byte	0x5f
	.uleb128 0x21
	.4byte	0x231
	.uleb128 0x21
	.4byte	0x5f
	.uleb128 0x21
	.4byte	0x5f
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"nextObt\000"
.LASF66:
	.ascii	"scheduler\000"
.LASF89:
	.ascii	"CODE_BASE\000"
.LASF72:
	.ascii	"alive\000"
.LASF13:
	.ascii	"STATE_RESPOND_BLOCKED\000"
.LASF33:
	.ascii	"long long unsigned int\000"
.LASF24:
	.ascii	"recvQueueTail\000"
.LASF20:
	.ascii	"next\000"
.LASF44:
	.ascii	"CODE_CREATE\000"
.LASF67:
	.ascii	"inittime\000"
.LASF27:
	.ascii	"obtQueueTail\000"
.LASF38:
	.ascii	"active\000"
.LASF22:
	.ascii	"parent\000"
.LASF30:
	.ascii	"state\000"
.LASF88:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF52:
	.ascii	"CODE_AWAIT\000"
.LASF6:
	.ascii	"STATE_ACTIVE\000"
.LASF9:
	.ascii	"STATE_RECV_BLOCKED\000"
.LASF77:
	.ascii	"main\000"
.LASF37:
	.ascii	"Scheduler\000"
.LASF41:
	.ascii	"CODE_EXIT\000"
.LASF92:
	.ascii	"asm_EnterTask\000"
.LASF40:
	.ascii	"SyscallCode\000"
.LASF43:
	.ascii	"CODE_PARENT_ID\000"
.LASF71:
	.ascii	"handtime\000"
.LASF29:
	.ascii	"share\000"
.LASF84:
	.ascii	"cleanupTimer1\000"
.LASF39:
	.ascii	"TaskState\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF70:
	.ascii	"usertime\000"
.LASF2:
	.ascii	"truncated\000"
.LASF68:
	.ascii	"lasttick\000"
.LASF81:
	.ascii	"enableT4\000"
.LASF0:
	.ascii	"data\000"
.LASF79:
	.ascii	"size\000"
.LASF42:
	.ascii	"CODE_MY_ID\000"
.LASF21:
	.ascii	"priority\000"
.LASF85:
	.ascii	"enterTask\000"
.LASF16:
	.ascii	"TaskDescriptor\000"
.LASF76:
	.ascii	"ttime\000"
.LASF75:
	.ascii	"HWIstackspace\000"
.LASF59:
	.ascii	"load\000"
.LASF55:
	.ascii	"CODE_UTIME\000"
.LASF57:
	.ascii	"CODE_QUIT\000"
.LASF58:
	.ascii	"Timer\000"
.LASF87:
	.ascii	"src/kernel/kernel.c\000"
.LASF65:
	.ascii	"tasks\000"
.LASF10:
	.ascii	"STATE_REPL_BLOCKED\000"
.LASF32:
	.ascii	"sizetype\000"
.LASF31:
	.ascii	"ticks\000"
.LASF25:
	.ascii	"nextRecv\000"
.LASF78:
	.ascii	"newTID\000"
.LASF45:
	.ascii	"CODE_PASS\000"
.LASF36:
	.ascii	"queues\000"
.LASF47:
	.ascii	"CODE_RECEIVE\000"
.LASF7:
	.ascii	"STATE_ZOMBIE\000"
.LASF91:
	.ascii	"reschedule\000"
.LASF12:
	.ascii	"STATE_OBTAIN_BLOCKED\000"
.LASF63:
	.ascii	"KernelData\000"
.LASF56:
	.ascii	"CODE_SERVICE\000"
.LASF54:
	.ascii	"CODE_AWAIT_RX\000"
.LASF23:
	.ascii	"recvQueueHead\000"
.LASF15:
	.ascii	"unsigned char\000"
.LASF49:
	.ascii	"CODE_SHARE\000"
.LASF50:
	.ascii	"CODE_OBTAIN\000"
.LASF8:
	.ascii	"STATE_SEND_BLOCKED\000"
.LASF86:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF34:
	.ascii	"RunQueue\000"
.LASF26:
	.ascii	"obtQueueHead\000"
.LASF17:
	.ascii	"cpsr\000"
.LASF82:
	.ascii	"scheduleTask\000"
.LASF90:
	.ascii	"__func__\000"
.LASF1:
	.ascii	"data_len\000"
.LASF60:
	.ascii	"value\000"
.LASF51:
	.ascii	"CODE_RESPOND\000"
.LASF35:
	.ascii	"head\000"
.LASF73:
	.ascii	"char\000"
.LASF46:
	.ascii	"CODE_SEND\000"
.LASF5:
	.ascii	"TaskFrame\000"
.LASF14:
	.ascii	"STATE_EVENT_BLOCKED\000"
.LASF83:
	.ascii	"task\000"
.LASF61:
	.ascii	"ctrl\000"
.LASF69:
	.ascii	"kerntime\000"
.LASF18:
	.ascii	"rval\000"
.LASF4:
	.ascii	"Buffer\000"
.LASF80:
	.ascii	"initial\000"
.LASF53:
	.ascii	"CODE_AWAIT_TX\000"
.LASF48:
	.ascii	"CODE_REPLY\000"
.LASF74:
	.ascii	"argc\000"
.LASF62:
	.ascii	"clear\000"
.LASF11:
	.ascii	"STATE_SHARE_BLOCKED\000"
.LASF19:
	.ascii	"stack\000"
.LASF64:
	.ascii	"argv\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
