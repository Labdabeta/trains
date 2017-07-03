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
	.file	"handlers.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	scheduleTask, %function
scheduleTask:
.LFB1:
	.file 1 "src/kernel/scheduler.h"
	.loc 1 35 0
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
	.loc 1 36 0
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
	.loc 1 37 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #288]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #24]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 1 38 0
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
	.type	unblockTask, %function
unblockTask:
.LFB3:
	.loc 1 86 0
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
	str	r1, [fp, #-12]
	.loc 1 87 0
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #20]
	cmp	r3, #1
	bne	.L3
	.loc 1 88 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	scheduleTask(PLT)
.L3:
	.loc 1 89 0
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #72]
	.loc 1 90 0
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
.LFE3:
	.size	unblockTask, .-unblockTask
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleCreate, %function
handleCreate:
.LFB6:
	.file 2 "src/kernel/handlers.c"
	.loc 2 9 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r1, .L9
.LPIC0:
	add	r1, pc, r1
	.loc 2 10 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	.loc 2 11 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r2, .L9+4
	ldr	r2, [r1, r2]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	.loc 2 12 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	.loc 2 14 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L5
	.loc 2 14 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L6
.L5:
	.loc 2 15 0 is_stmt 1
	mvn	r3, #0
	b	.L7
.L6:
	.loc 2 17 0
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-40]
	bl	newTID(PLT)
	str	r0, [fp, #-28]
	.loc 2 21 0
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L8
.LBB2:
	.loc 2 22 0
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #16
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	.loc 2 23 0
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #24]
	.loc 2 24 0
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	str	r2, [r3, #28]
	.loc 2 25 0
	ldr	r3, [fp, #-32]
	mov	r2, #0
	strb	r2, [r3, #72]
	.loc 2 26 0
	ldr	r2, [fp, #-32]
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #80]
	str	r4, [r2, #84]
	.loc 2 27 0
	ldr	r3, [fp, #-20]
	mov	r1, r3
	ldr	r0, [fp, #-32]
	bl	activateTask(PLT)
	.loc 2 29 0
	ldr	r3, [fp, #-40]
	add	r3, r3, #6592
	add	r3, r3, #24
	ldr	r1, [fp, #-32]
	mov	r0, r3
	bl	scheduleTask(PLT)
	.loc 2 30 0
	ldr	r3, [fp, #-40]
	add	r3, r3, #4096
	ldr	r3, [r3, #2864]
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	add	r2, r2, #4096
	str	r3, [r2, #2864]
.L8:
.LBE2:
	.loc 2 34 0
	ldr	r3, [fp, #-28]
	cmn	r3, #1
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, [fp, #-28]
	sub	r3, r3, r2
.L7:
	.loc 2 35 0
	mov	r0, r3
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	CODE_BASE(GOT)
	.cfi_endproc
.LFE6:
	.size	handleCreate, .-handleCreate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleSend, %function
handleSend:
.LFB7:
	.loc 2 38 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 2 39 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 40 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 41 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	.loc 2 42 0
	mov	r3, #0
	str	r3, [fp, #-20]
	.loc 2 44 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	blt	.L12
	.loc 2 44 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #75
	bgt	.L12
	.loc 2 46 0 is_stmt 1
	ldr	r1, [fp, #-24]
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
	.loc 2 45 0
	cmp	r3, #7
	ble	.L13
.L12:
	.loc 2 47 0
	mvn	r3, #1
	b	.L14
.L13:
	.loc 2 50 0
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #64]
	.loc 2 51 0
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #68]
	.loc 2 54 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #16
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 2 55 0
	ldr	r3, [fp, #-28]
	mov	r2, #0
	str	r2, [r3, #40]
	.loc 2 56 0
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L15
	.loc 2 57 0
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #40]
.L15:
	.loc 2 58 0
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L16
	.loc 2 59 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #32]
.L16:
	.loc 2 60 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #36]
	.loc 2 64 0
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L17
	.loc 2 65 0
	ldr	r3, [fp, #-24]
	add	r3, r3, #6592
	add	r3, r3, #24
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	unblockTask(PLT)
.L17:
	.loc 2 68 0
	ldr	r3, [fp, #-28]
	mov	r2, #2
	strb	r2, [r3, #72]
	.loc 2 70 0
	mov	r3, #0
.L14:
	.loc 2 71 0
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
.LFE7:
	.size	handleSend, .-handleSend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleShare, %function
handleShare:
.LFB8:
	.loc 2 74 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 2 75 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 76 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 77 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	.loc 2 78 0
	mov	r3, #0
	str	r3, [fp, #-20]
	.loc 2 80 0
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #56]
	.loc 2 81 0
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #60]
	.loc 2 83 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #16
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 2 84 0
	ldr	r3, [fp, #-28]
	mov	r2, #0
	str	r2, [r3, #52]
	.loc 2 85 0
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L19
	.loc 2 86 0
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #52]
.L19:
	.loc 2 87 0
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L20
	.loc 2 88 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #44]
.L20:
	.loc 2 89 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #48]
	.loc 2 91 0
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	cmp	r3, #6
	bne	.L21
	.loc 2 92 0
	ldr	r3, [fp, #-24]
	add	r3, r3, #6592
	add	r3, r3, #24
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	unblockTask(PLT)
.L21:
	.loc 2 95 0
	ldr	r3, [fp, #-28]
	mov	r2, #5
	strb	r2, [r3, #72]
	.loc 2 97 0
	mov	r3, #0
	.loc 2 98 0
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
.LFE8:
	.size	handleShare, .-handleShare
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleReceive, %function
handleReceive:
.LFB9:
	.loc 2 101 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 2 102 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 103 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 105 0
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L24
.LBB3:
	.loc 2 106 0
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #32]
	str	r3, [fp, #-16]
	.loc 2 107 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #64]
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	writeBuffer(PLT)
	.loc 2 108 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 2 109 0
	ldr	r3, [fp, #-16]
	mov	r2, #4
	strb	r2, [r3, #72]
	.loc 2 111 0
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #36]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #32]
	cmp	r2, r3
	bne	.L25
	.loc 2 111 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-28]
	mov	r2, #0
	str	r2, [r3, #36]
.L25:
	.loc 2 112 0 is_stmt 1
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #32]
	.loc 2 114 0
	mov	r3, #1
	b	.L26
.L24:
.LBE3:
	.loc 2 116 0
	ldr	r3, [fp, #-28]
	mov	r2, #3
	strb	r2, [r3, #72]
	.loc 2 117 0
	mov	r3, #0
.L26:
	.loc 2 119 0
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
.LFE9:
	.size	handleReceive, .-handleReceive
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleObtain, %function
handleObtain:
.LFB10:
	.loc 2 122 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 2 123 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 124 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 126 0
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L28
.LBB4:
	.loc 2 127 0
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #44]
	str	r3, [fp, #-16]
	.loc 2 128 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-12]
	str	r2, [r3]
	.loc 2 129 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 2 130 0
	ldr	r3, [fp, #-16]
	mov	r2, #7
	strb	r2, [r3, #72]
	.loc 2 132 0
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #44]
	cmp	r2, r3
	bne	.L29
	.loc 2 132 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-28]
	mov	r2, #0
	str	r2, [r3, #48]
.L29:
	.loc 2 133 0 is_stmt 1
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #52]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #44]
	.loc 2 135 0
	mov	r3, #1
	b	.L30
.L28:
.LBE4:
	.loc 2 137 0
	ldr	r3, [fp, #-28]
	mov	r2, #6
	strb	r2, [r3, #72]
	.loc 2 138 0
	mov	r3, #0
.L30:
	.loc 2 140 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE10:
	.size	handleObtain, .-handleObtain
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleReply, %function
handleReply:
.LFB11:
	.loc 2 143 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 2 144 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 145 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 148 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	blt	.L32
	.loc 2 148 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #75
	bgt	.L32
	.loc 2 150 0 is_stmt 1
	ldr	r1, [fp, #-24]
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
	.loc 2 149 0
	cmp	r3, #7
	ble	.L33
.L32:
	.loc 2 151 0
	mvn	r3, #1
	b	.L34
.L33:
	.loc 2 153 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #16
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 2 155 0
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L35
	.loc 2 156 0
	mvn	r3, #2
	b	.L34
.L35:
	.loc 2 158 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #68]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	writeBuffer(PLT)
	.loc 2 159 0
	ldr	r3, [fp, #-24]
	add	r3, r3, #6592
	add	r3, r3, #24
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	unblockTask(PLT)
	.loc 2 161 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #68]
	ldr	r3, [r3, #8]
	rsb	r3, r3, #0
.L34:
	.loc 2 162 0
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
.LFE11:
	.size	handleReply, .-handleReply
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleRespond, %function
handleRespond:
.LFB12:
	.loc 2 165 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 2 166 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 167 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 169 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #16
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 2 171 0
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #60]
	.loc 2 172 0
	ldr	r3, [fp, #-24]
	add	r3, r3, #6592
	add	r3, r3, #24
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	unblockTask(PLT)
	.loc 2 174 0
	mov	r3, #0
	.loc 2 175 0
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
.LFE12:
	.size	handleRespond, .-handleRespond
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleUtime, %function
handleUtime:
.LFB13:
	.loc 2 178 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 11, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	.loc 2 179 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 2 180 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 2 182 0
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L39
.L41:
	b	.L40
	b	.L42
	b	.L43
	b	.L44
	b	.L45
	.p2align 1
.L40:
	.loc 2 183 0
	ldr	r3, [fp, #-20]
	add	r4, r3, #80
	ldmia	r4, {r3-r4}
	ldr	r2, [fp, #-8]
	stm	r2, {r3-r4}
	b	.L46
.L42:
	.loc 2 184 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #6912
	add	r3, r3, #32
	ldmdb	r3, {r3-r4}
	ldr	r2, [fp, #-8]
	stm	r2, {r3-r4}
	b	.L46
.L43:
	.loc 2 185 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #6912
	add	r3, r3, #16
	ldmia	r3, {r3-r4}
	ldr	r2, [fp, #-8]
	stm	r2, {r3-r4}
	b	.L46
.L44:
	.loc 2 186 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #6912
	add	r3, r3, #32
	ldmia	r3, {r3-r4}
	ldr	r2, [fp, #-8]
	stm	r2, {r3-r4}
	b	.L46
.L45:
	.loc 2 187 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #6912
	ldmia	r3, {r3-r4}
	ldr	r2, [fp, #-8]
	stm	r2, {r3-r4}
	b	.L46
.L39:
	.loc 2 188 0
	ldr	r2, [fp, #-8]
	mov	r3, #0
	mov	r4, #0
	stm	r2, {r3-r4}
.L46:
	.loc 2 190 0
	mov	r3, #0
	.loc 2 191 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{r4, fp}
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE13:
	.size	handleUtime, .-handleUtime
	.section	.rodata
	.align	2
.LC0:
	.ascii	"src/kernel/handlers.c\000"
	.align	2
.LC1:
	.ascii	"%s@%s:%d\012\015\000"
	.align	2
.LC2:
	.ascii	"Invalid syscall...\012\015\000"
	.align	2
.LC3:
	.ascii	"%s\000"
	.align	2
.LC4:
	.ascii	"\012\015\000"
	.text
	.align	2
	.global	handleSyscall
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleSyscall, %function
handleSyscall:
.LFB14:
	.loc 2 194 0
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
	str	r1, [fp, #-12]
	.loc 2 195 0
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #16
	addls	pc, pc, r3, asl #2
	b	.L49
.L51:
	b	.L50
	b	.L52
	b	.L53
	b	.L54
	b	.L55
	b	.L56
	b	.L57
	b	.L58
	b	.L59
	b	.L60
	b	.L61
	b	.L62
	b	.L63
	b	.L64
	b	.L65
	b	.L66
	b	.L67
	.p2align 1
.L50:
	.loc 2 197 0
	ldr	r3, [fp, #-12]
	mov	r2, #1
	strb	r2, [r3, #72]
	.loc 2 198 0
	ldr	r3, [fp, #-12]
	mvn	r2, #0
	str	r2, [r3, #24]
	.loc 2 199 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #4096
	ldr	r3, [r3, #2864]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	add	r2, r2, #4096
	str	r3, [r2, #2864]
	.loc 2 200 0
	mov	r3, #0
	b	.L68
.L52:
	.loc 2 202 0
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	b	.L68
.L53:
	.loc 2 204 0
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L69
	.loc 2 205 0
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #28]
	ldr	r3, [r3]
	b	.L68
.L69:
	.loc 2 207 0
	mvn	r3, #0
	b	.L68
.L54:
	.loc 2 209 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleCreate(PLT)
	mov	r3, r0
	b	.L68
.L55:
	.loc 2 211 0
	mov	r3, #0
	b	.L68
.L56:
	.loc 2 213 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleSend(PLT)
	mov	r3, r0
	b	.L68
.L57:
	.loc 2 215 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleReceive(PLT)
	mov	r3, r0
	b	.L68
.L58:
	.loc 2 217 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleReply(PLT)
	mov	r3, r0
	b	.L68
.L59:
	.loc 2 219 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleShare(PLT)
	mov	r3, r0
	b	.L68
.L60:
	.loc 2 221 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleObtain(PLT)
	mov	r3, r0
	b	.L68
.L61:
	.loc 2 223 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleRespond(PLT)
	mov	r3, r0
	b	.L68
.L62:
	.loc 2 225 0
	ldr	r3, [fp, #-12]
	mov	r2, #8
	strb	r2, [r3, #72]
	.loc 2 226 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #255
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	addAwait(PLT)
	.loc 2 227 0
	mov	r3, #0
	b	.L68
.L63:
	.loc 2 229 0
	ldr	r3, [fp, #-12]
	mov	r2, #8
	strb	r2, [r3, #72]
	.loc 2 230 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r0, r3, #255
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	ldr	r1, [fp, #-12]
	bl	addTransmit(PLT)
	.loc 2 231 0
	mov	r3, #0
	b	.L68
.L64:
	.loc 2 233 0
	ldr	r3, [fp, #-12]
	mov	r2, #8
	strb	r2, [r3, #72]
	.loc 2 234 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r0, r3, #255
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r1, [fp, #-12]
	bl	addReceive(PLT)
	.loc 2 235 0
	mov	r3, #0
	b	.L68
.L65:
	.loc 2 237 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	handleUtime(PLT)
	mov	r3, r0
	b	.L68
.L66:
	.loc 2 239 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #4096
	ldr	r3, [r3, #2864]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	add	r2, r2, #4096
	str	r3, [r2, #2864]
	.loc 2 240 0
	mov	r3, #0
	b	.L68
.L67:
	.loc 2 242 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #4096
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #2864]
	.loc 2 243 0
	mov	r3, #0
	b	.L68
.L49:
	.loc 2 245 0
	mov	r3, #245
	ldr	r2, .L70
.LPIC1:
	add	r2, pc, r2
	ldr	r1, .L70+4
.LPIC2:
	add	r1, pc, r1
	ldr	r0, .L70+8
.LPIC3:
	add	r0, pc, r0
	bl	tfp_dprintf(PLT)
	ldr	r3, .L70+12
.LPIC4:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L70+16
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	ldr	r3, .L70+20
.LPIC6:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 2 246 0
	mvn	r3, #0
.L68:
	.loc 2 248 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L71:
	.align	2
.L70:
	.word	__func__.4553-(.LPIC1+8)
	.word	.LC0-(.LPIC2+8)
	.word	.LC1-(.LPIC3+8)
	.word	.LC2-(.LPIC4+8)
	.word	.LC3-(.LPIC5+8)
	.word	.LC4-(.LPIC6+8)
	.cfi_endproc
.LFE14:
	.size	handleSyscall, .-handleSyscall
	.section	.rodata
	.align	2
	.type	__func__.4553, %object
	.size	__func__.4553, 14
__func__.4553:
	.ascii	"handleSyscall\000"
	.text
.Letext0:
	.file 3 "src/util/data/buffer.h"
	.file 4 "src/kernel/handlers.h"
	.file 5 "src/kernel/task.h"
	.file 6 "src/kernel/kernel.h"
	.file 7 "src/linker.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x85e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0xc
	.4byte	.LASF88
	.4byte	.LASF89
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0xc
	.byte	0x3
	.byte	0x5
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x6
	.4byte	0x56
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x3
	.byte	0x7
	.4byte	0x58
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x3
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
	.4byte	.LASF22
	.byte	0x3
	.byte	0x9
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x1
	.4byte	0xe8
	.byte	0x4
	.byte	0x9
	.4byte	0xe8
	.uleb128 0x9
	.4byte	.LASF4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF5
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x9
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0xa
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0xb
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0xd
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0xe
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0xf
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF21
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.byte	0x1b
	.4byte	0x71
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x2c
	.byte	0x5
	.byte	0x25
	.4byte	0x182
	.uleb128 0xa
	.ascii	"pc\000"
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.byte	0
	.uleb128 0xa
	.ascii	"r4\000"
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.byte	0x4
	.uleb128 0xa
	.ascii	"r5\000"
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.byte	0x8
	.uleb128 0xa
	.ascii	"r6\000"
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.byte	0xc
	.uleb128 0xa
	.ascii	"r7\000"
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.byte	0x10
	.uleb128 0xa
	.ascii	"r8\000"
	.byte	0x5
	.byte	0x26
	.4byte	0x5f
	.byte	0x14
	.uleb128 0xa
	.ascii	"r9\000"
	.byte	0x5
	.byte	0x27
	.4byte	0x5f
	.byte	0x18
	.uleb128 0xa
	.ascii	"r10\000"
	.byte	0x5
	.byte	0x27
	.4byte	0x5f
	.byte	0x1c
	.uleb128 0xa
	.ascii	"r11\000"
	.byte	0x5
	.byte	0x27
	.4byte	0x5f
	.byte	0x20
	.uleb128 0xa
	.ascii	"fp\000"
	.byte	0x5
	.byte	0x27
	.4byte	0x5f
	.byte	0x24
	.uleb128 0xa
	.ascii	"lr\000"
	.byte	0x5
	.byte	0x27
	.4byte	0x5f
	.byte	0x28
	.byte	0
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x1
	.4byte	0xe8
	.byte	0x5
	.byte	0x2a
	.4byte	0x1c9
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x5
	.byte	0x34
	.4byte	0x182
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x58
	.byte	0x5
	.byte	0x36
	.4byte	0x2b9
	.uleb128 0xa
	.ascii	"tid\000"
	.byte	0x5
	.byte	0x37
	.4byte	0x5f
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x5
	.byte	0x3a
	.4byte	0x5f
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x5
	.byte	0x3b
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x5
	.byte	0x3c
	.4byte	0x56
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x5
	.byte	0x3d
	.4byte	0x2b9
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x5
	.byte	0x40
	.4byte	0x2bf
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x5
	.byte	0x41
	.4byte	0x5f
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x5
	.byte	0x44
	.4byte	0x2bf
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x5
	.byte	0x47
	.4byte	0x2bf
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF43
	.byte	0x5
	.byte	0x48
	.4byte	0x2bf
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x5
	.byte	0x49
	.4byte	0x2bf
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF45
	.byte	0x5
	.byte	0x4a
	.4byte	0x2bf
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF46
	.byte	0x5
	.byte	0x4b
	.4byte	0x2bf
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF47
	.byte	0x5
	.byte	0x4c
	.4byte	0x2bf
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x5
	.byte	0x4d
	.4byte	0x2c5
	.byte	0x38
	.uleb128 0xa
	.ascii	"buf\000"
	.byte	0x5
	.byte	0x4e
	.4byte	0x2dc
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x5
	.byte	0x4f
	.4byte	0x1c9
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF50
	.byte	0x5
	.byte	0x52
	.4byte	0x2f2
	.byte	0x50
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xfa
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1d4
	.uleb128 0xc
	.4byte	0x56
	.4byte	0x2d5
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF51
	.uleb128 0xc
	.4byte	0x2ec
	.4byte	0x2ec
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x25
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF52
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x24
	.byte	0x1
	.byte	0x9
	.4byte	0x31e
	.uleb128 0x3
	.4byte	.LASF54
	.byte	0x1
	.byte	0xb
	.4byte	0x2bf
	.byte	0
	.uleb128 0x3
	.4byte	.LASF55
	.byte	0x1
	.byte	0xe
	.4byte	0x31e
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	0x32e
	.4byte	0x32e
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2f9
	.uleb128 0xe
	.4byte	.LASF56
	.2byte	0x124
	.byte	0x1
	.byte	0x11
	.4byte	0x35b
	.uleb128 0x3
	.4byte	.LASF55
	.byte	0x1
	.byte	0x12
	.4byte	0x35b
	.byte	0
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x1
	.byte	0x13
	.4byte	0x32e
	.2byte	0x120
	.byte	0
	.uleb128 0xc
	.4byte	0x2f9
	.4byte	0x36b
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.4byte	.LASF58
	.2byte	0x1b38
	.byte	0x6
	.byte	0xb
	.4byte	0x404
	.uleb128 0x3
	.4byte	.LASF59
	.byte	0x6
	.byte	0xd
	.4byte	0x404
	.byte	0
	.uleb128 0xa
	.ascii	"fn\000"
	.byte	0x6
	.byte	0xe
	.4byte	0xef
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x6
	.byte	0x11
	.4byte	0x414
	.byte	0x10
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x6
	.byte	0x14
	.4byte	0x334
	.2byte	0x19d8
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x6
	.byte	0x17
	.4byte	0x2f2
	.2byte	0x1b00
	.uleb128 0xf
	.4byte	.LASF63
	.byte	0x6
	.byte	0x17
	.4byte	0x2f2
	.2byte	0x1b08
	.uleb128 0xf
	.4byte	.LASF64
	.byte	0x6
	.byte	0x17
	.4byte	0x2f2
	.2byte	0x1b10
	.uleb128 0xf
	.4byte	.LASF65
	.byte	0x6
	.byte	0x17
	.4byte	0x2f2
	.2byte	0x1b18
	.uleb128 0xf
	.4byte	.LASF66
	.byte	0x6
	.byte	0x17
	.4byte	0x2f2
	.2byte	0x1b20
	.uleb128 0x10
	.ascii	"tmp\000"
	.byte	0x6
	.byte	0x17
	.4byte	0x2f2
	.2byte	0x1b28
	.uleb128 0xf
	.4byte	.LASF67
	.byte	0x6
	.byte	0x1a
	.4byte	0x5f
	.2byte	0x1b30
	.byte	0
	.uleb128 0xc
	.4byte	0x5f
	.4byte	0x414
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.4byte	0x1d4
	.4byte	0x424
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0x4a
	.byte	0
	.uleb128 0x11
	.4byte	.LASF90
	.byte	0x7
	.byte	0x4
	.4byte	0x42f
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF68
	.uleb128 0x12
	.4byte	0x42f
	.uleb128 0x13
	.4byte	.LASF91
	.byte	0x2
	.byte	0xc1
	.4byte	0x5f
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x480
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0xc1
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0xc1
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x15
	.4byte	.LASF92
	.4byte	0x496
	.uleb128 0x5
	.byte	0x3
	.4byte	__func__.4553
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x36b
	.uleb128 0xc
	.4byte	0x436
	.4byte	0x496
	.uleb128 0xd
	.4byte	0x2d5
	.byte	0xd
	.byte	0
	.uleb128 0x12
	.4byte	0x486
	.uleb128 0x16
	.4byte	.LASF70
	.byte	0x2
	.byte	0xb1
	.4byte	0x5f
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4ed
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0xb1
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0xb1
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.ascii	"ret\000"
	.byte	0x2
	.byte	0xb3
	.4byte	0x4ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LASF69
	.byte	0x2
	.byte	0xb4
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2f2
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x2
	.byte	0xa4
	.4byte	0x5f
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x553
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0xa4
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0xa4
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x2
	.byte	0xa6
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"ret\000"
	.byte	0x2
	.byte	0xa7
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LASF72
	.byte	0x2
	.byte	0xa9
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.4byte	.LASF73
	.byte	0x2
	.byte	0x8e
	.4byte	0x5f
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b3
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0x8e
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x8e
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x90
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LASF74
	.byte	0x2
	.byte	0x91
	.4byte	0x5b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LASF72
	.byte	0x2
	.byte	0x92
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x66
	.uleb128 0x16
	.4byte	.LASF75
	.byte	0x2
	.byte	0x79
	.4byte	0x5f
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x623
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0x79
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x79
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x7b
	.4byte	0x623
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"ret\000"
	.byte	0x2
	.byte	0x7c
	.4byte	0x629
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x2
	.byte	0x7f
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x5f
	.uleb128 0xb
	.byte	0x4
	.4byte	0x56
	.uleb128 0x19
	.4byte	.LASF77
	.byte	0x2
	.byte	0x64
	.4byte	0x5f
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x699
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0x64
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x64
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x66
	.4byte	0x623
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x67
	.4byte	0x5b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x2
	.byte	0x6a
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF78
	.byte	0x2
	.byte	0x49
	.4byte	0x5f
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x707
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0x49
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x49
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x4b
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x4c
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.ascii	"rpl\000"
	.byte	0x2
	.byte	0x4d
	.4byte	0x629
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.4byte	.LASF72
	.byte	0x2
	.byte	0x4e
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF79
	.byte	0x2
	.byte	0x25
	.4byte	0x5f
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x775
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0x25
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x25
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x27
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x28
	.4byte	0x5b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.4byte	.LASF74
	.byte	0x2
	.byte	0x29
	.4byte	0x5b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.4byte	.LASF72
	.byte	0x2
	.byte	0x2a
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF80
	.byte	0x2
	.byte	0x8
	.4byte	0x5f
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7fb
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x2
	.byte	0x8
	.4byte	0x480
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x8
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.4byte	.LASF81
	.byte	0x2
	.byte	0xa
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.4byte	.LASF82
	.byte	0x2
	.byte	0xb
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.4byte	.LASF83
	.byte	0x2
	.byte	0xc
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.4byte	.LASF84
	.byte	0x2
	.byte	0x11
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x18
	.4byte	.LASF85
	.byte	0x2
	.byte	0x16
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF93
	.byte	0x1
	.byte	0x55
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x82d
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0x55
	.4byte	0x82d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF86
	.byte	0x1
	.byte	0x55
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x334
	.uleb128 0x1c
	.4byte	.LASF94
	.byte	0x1
	.byte	0x22
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0x22
	.4byte	0x82d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF86
	.byte	0x1
	.byte	0x22
	.4byte	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1
	.uleb128 0x13
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
.LASF10:
	.ascii	"CODE_RECEIVE\000"
.LASF47:
	.ascii	"nextObt\000"
.LASF61:
	.ascii	"scheduler\000"
.LASF90:
	.ascii	"CODE_BASE\000"
.LASF67:
	.ascii	"alive\000"
.LASF78:
	.ascii	"handleShare\000"
.LASF33:
	.ascii	"STATE_RESPOND_BLOCKED\000"
.LASF52:
	.ascii	"long long unsigned int\000"
.LASF43:
	.ascii	"recvQueueTail\000"
.LASF39:
	.ascii	"next\000"
.LASF7:
	.ascii	"CODE_CREATE\000"
.LASF62:
	.ascii	"inittime\000"
.LASF46:
	.ascii	"obtQueueTail\000"
.LASF57:
	.ascii	"active\000"
.LASF41:
	.ascii	"parent\000"
.LASF49:
	.ascii	"state\000"
.LASF89:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF15:
	.ascii	"CODE_AWAIT\000"
.LASF26:
	.ascii	"STATE_ACTIVE\000"
.LASF29:
	.ascii	"STATE_RECV_BLOCKED\000"
.LASF56:
	.ascii	"Scheduler\000"
.LASF4:
	.ascii	"CODE_EXIT\000"
.LASF23:
	.ascii	"SyscallCode\000"
.LASF6:
	.ascii	"CODE_PARENT_ID\000"
.LASF66:
	.ascii	"handtime\000"
.LASF48:
	.ascii	"share\000"
.LASF25:
	.ascii	"TaskState\000"
.LASF75:
	.ascii	"handleObtain\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF65:
	.ascii	"usertime\000"
.LASF2:
	.ascii	"truncated\000"
.LASF63:
	.ascii	"lasttick\000"
.LASF85:
	.ascii	"newtask\000"
.LASF0:
	.ascii	"data\000"
.LASF83:
	.ascii	"size\000"
.LASF71:
	.ascii	"handleRespond\000"
.LASF5:
	.ascii	"CODE_MY_ID\000"
.LASF73:
	.ascii	"handleReply\000"
.LASF40:
	.ascii	"priority\000"
.LASF72:
	.ascii	"target\000"
.LASF35:
	.ascii	"TaskDescriptor\000"
.LASF69:
	.ascii	"which\000"
.LASF77:
	.ascii	"handleReceive\000"
.LASF18:
	.ascii	"CODE_UTIME\000"
.LASF20:
	.ascii	"CODE_QUIT\000"
.LASF74:
	.ascii	"reply\000"
.LASF81:
	.ascii	"prio\000"
.LASF76:
	.ascii	"sender\000"
.LASF60:
	.ascii	"tasks\000"
.LASF30:
	.ascii	"STATE_REPL_BLOCKED\000"
.LASF51:
	.ascii	"sizetype\000"
.LASF50:
	.ascii	"ticks\000"
.LASF44:
	.ascii	"nextRecv\000"
.LASF8:
	.ascii	"CODE_PASS\000"
.LASF55:
	.ascii	"queues\000"
.LASF27:
	.ascii	"STATE_ZOMBIE\000"
.LASF32:
	.ascii	"STATE_OBTAIN_BLOCKED\000"
.LASF58:
	.ascii	"KernelData\000"
.LASF19:
	.ascii	"CODE_SERVICE\000"
.LASF17:
	.ascii	"CODE_AWAIT_RX\000"
.LASF42:
	.ascii	"recvQueueHead\000"
.LASF21:
	.ascii	"unsigned char\000"
.LASF12:
	.ascii	"CODE_SHARE\000"
.LASF13:
	.ascii	"CODE_OBTAIN\000"
.LASF28:
	.ascii	"STATE_SEND_BLOCKED\000"
.LASF91:
	.ascii	"handleSyscall\000"
.LASF93:
	.ascii	"unblockTask\000"
.LASF87:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF53:
	.ascii	"RunQueue\000"
.LASF45:
	.ascii	"obtQueueHead\000"
.LASF36:
	.ascii	"cpsr\000"
.LASF94:
	.ascii	"scheduleTask\000"
.LASF92:
	.ascii	"__func__\000"
.LASF1:
	.ascii	"data_len\000"
.LASF14:
	.ascii	"CODE_RESPOND\000"
.LASF54:
	.ascii	"head\000"
.LASF68:
	.ascii	"char\000"
.LASF79:
	.ascii	"handleSend\000"
.LASF9:
	.ascii	"CODE_SEND\000"
.LASF80:
	.ascii	"handleCreate\000"
.LASF24:
	.ascii	"TaskFrame\000"
.LASF34:
	.ascii	"STATE_EVENT_BLOCKED\000"
.LASF86:
	.ascii	"task\000"
.LASF88:
	.ascii	"src/kernel/handlers.c\000"
.LASF64:
	.ascii	"kerntime\000"
.LASF82:
	.ascii	"code\000"
.LASF37:
	.ascii	"rval\000"
.LASF22:
	.ascii	"Buffer\000"
.LASF16:
	.ascii	"CODE_AWAIT_TX\000"
.LASF11:
	.ascii	"CODE_REPLY\000"
.LASF70:
	.ascii	"handleUtime\000"
.LASF31:
	.ascii	"STATE_SHARE_BLOCKED\000"
.LASF38:
	.ascii	"stack\000"
.LASF84:
	.ascii	"newid\000"
.LASF59:
	.ascii	"argv\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
