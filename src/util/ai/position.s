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
	.file	"position.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initPositionCalculator
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPositionCalculator, %function
initPositionCalculator:
.LFB0:
	.file 1 "src/util/ai/position.c"
	.loc 1 8 0
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
	.loc 1 11 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	.loc 1 12 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2576
	add	r3, r3, #2
	lsl	r3, r3, #2
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3, #4]
	.loc 1 13 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2576
	add	r3, r3, #8
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 1 14 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2576
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 1 15 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2592
	add	r3, r3, #4
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 1 16 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2592
	add	r3, r3, #10
	lsl	r3, r3, #2
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3, #4]
	.loc 1 17 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2608
	lsl	r3, r3, #2
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3, #4]
	.loc 1 11 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 11 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L3
	.loc 1 20 0 is_stmt 1
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	initIST(PLT)
	.loc 1 22 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #16384
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #1952]
	.loc 1 23 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #16384
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #1956]
	.loc 1 24 0
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
	.size	initPositionCalculator, .-initPositionCalculator
	.align	2
	.global	registerSensorTrigger
	.syntax unified
	.arm
	.fpu softvfp
	.type	registerSensorTrigger, %function
registerSensorTrigger:
.LFB1:
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 520
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #520
	str	r0, [fp, #-512]
	str	r1, [fp, #-516]
	str	r2, [fp, #-520]
	str	r3, [fp, #-524]
	.loc 1 30 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 1 31 0
	ldr	r2, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2592
	add	r3, r3, #10
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	cmn	r3, #1
	beq	.L5
	.loc 1 32 0
	ldr	r2, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2592
	add	r3, r3, #10
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-524]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
.L5:
	.loc 1 36 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L9:
	.loc 1 37 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-516]
	cmp	r2, r3
	bne	.L7
	.loc 1 37 0 is_stmt 0 discriminator 1
	mov	r2, #1065353216
	b	.L8
.L7:
	.loc 1 37 0 discriminator 2
	mov	r2, #0
.L8:
	.loc 1 37 0 discriminator 4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-504]	@ float
	.loc 1 36 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	.loc 1 36 0 is_stmt 0 discriminator 2
	ldr	r3, [fp, #-8]
	cmp	r3, #79
	ble	.L9
	.loc 1 38 0 is_stmt 1
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L13:
	.loc 1 39 0
	ldr	r3, [fp, #-512]
	add	r3, r3, #8192
	ldr	r3, [r3, #2268]
	bic	r3, r3, #-16777216
	bic	r3, r3, #12582912
	mov	r2, r3
	ldr	r3, [fp, #-8]
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L11
	.loc 1 39 0 is_stmt 0 discriminator 1
	mov	r2, #1065353216
	b	.L12
.L11:
	.loc 1 39 0 discriminator 2
	mov	r2, #0
.L12:
	.loc 1 39 0 discriminator 4
	ldr	r3, [fp, #-8]
	add	r3, r3, #80
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-504]	@ float
	.loc 1 38 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	.loc 1 38 0 is_stmt 0 discriminator 2
	ldr	r3, [fp, #-8]
	cmp	r3, #21
	ble	.L13
	.loc 1 40 0 is_stmt 1
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L14
.L17:
	.loc 1 41 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-520]
	cmp	r2, r3
	bne	.L15
	.loc 1 41 0 is_stmt 0 discriminator 1
	mov	r2, #1065353216
	b	.L16
.L15:
	.loc 1 41 0 discriminator 2
	mov	r2, #0
.L16:
	.loc 1 41 0 discriminator 4
	ldr	r3, [fp, #-8]
	add	r3, r3, #102
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-504]	@ float
	.loc 1 40 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L14:
	.loc 1 40 0 is_stmt 0 discriminator 2
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L17
	.loc 1 42 0 is_stmt 1
	sub	r3, fp, #508
	add	r3, r3, #432
	ldr	r2, [fp, #-524]
	ldr	r1, [fp, #-520]
	ldr	r0, [fp, #-512]
	bl	getEffectiveSpeeds(PLT)
	.loc 1 44 0
	ldr	r3, [fp, #-512]
	sub	r2, fp, #508
	mov	r1, r2
	mov	r0, r3
	bl	getIST(PLT)
	str	r0, [fp, #-16]
	.loc 1 45 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-524]
	add	r2, r2, r3
	ldr	r1, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2592
	add	r3, r3, #10
	lsl	r3, r3, #2
	add	r3, r1, r3
	str	r2, [r3, #4]
	.loc 1 48 0
	ldr	r2, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2576
	add	r3, r3, #2
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	cmp	r3, #0
	blt	.L18
	.loc 1 48 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #4]
	cmp	r3, #0
	beq	.L18
.LBB2:
	.loc 1 49 0 is_stmt 1
	ldr	r3, [fp, #-512]
	add	r3, r3, #16384
	ldr	r2, [r3, #1952]
	ldr	r3, [fp, #-512]
	add	r3, r3, #16384
	ldr	r3, [r3, #1956]
	add	r2, r2, r3
	asr	r3, r2, #31
	lsr	r3, r3, #28
	add	r2, r2, r3
	and	r2, r2, #15
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 1 50 0
	ldr	r1, [fp, #-512]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #10432
	add	r3, r3, #32
	mov	r0, r3
	sub	r3, fp, #508
	mov	r2, #488
	mov	r1, r3
	bl	memcpy(PLT)
	.loc 1 51 0
	ldr	r2, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2608
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-524]
	sub	r1, r2, r3
	ldr	r0, [fp, #-512]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r0, r3
	add	r3, r3, #10944
	add	r3, r3, #8
	str	r1, [r3]
.L18:
.LBE2:
	.loc 1 54 0
	ldr	r2, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2608
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-524]
	str	r2, [r3, #4]
	.loc 1 55 0
	ldr	r2, [fp, #-512]
	ldr	r3, [fp, #-520]
	add	r3, r3, #2576
	add	r3, r3, #2
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-516]
	str	r2, [r3, #4]
	.loc 1 58 0
	ldr	r3, [fp, #-12]
	.loc 1 59 0
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
.LFE1:
	.size	registerSensorTrigger, .-registerSensorTrigger
	.align	2
	.global	registerTrainSpeed
	.syntax unified
	.arm
	.fpu softvfp
	.type	registerTrainSpeed, %function
registerTrainSpeed:
.LFB2:
	.loc 1 62 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	.loc 1 63 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2576
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
	.loc 1 64 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2592
	add	r3, r3, #4
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	.loc 1 65 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	registerTrainSpeed, .-registerTrainSpeed
	.align	2
	.global	registerSwitchState
	.syntax unified
	.arm
	.fpu softvfp
	.type	registerSwitchState, %function
registerSwitchState:
.LFB3:
	.loc 1 68 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	.loc 1 69 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L22
	.loc 1 70 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	ldr	r3, [r3, #2268]
	bic	r3, r3, #-16777216
	bic	r3, r3, #12582912
	mov	r1, r3
	mov	r2, #1
	ldr	r3, [fp, #-12]
	lsl	r3, r2, r3
	orr	r3, r1, r3
	bic	r2, r3, #-16777216
	bic	r2, r2, #12582912
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	mov	r1, r3
	ldr	r3, [r1, #2268]
	lsl	r2, r2, #10
	lsr	r3, r3, #22
	orr	r3, r3, r2
	ror	r3, r3, #10
	str	r3, [r1, #2268]
	.loc 1 73 0
	b	.L24
.L22:
	.loc 1 72 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	ldr	r3, [r3, #2268]
	bic	r3, r3, #-16777216
	bic	r3, r3, #12582912
	mov	r1, r3
	mov	r2, #1
	ldr	r3, [fp, #-12]
	lsl	r3, r2, r3
	mvn	r3, r3
	and	r3, r3, r1
	bic	r2, r3, #-16777216
	bic	r2, r2, #12582912
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	mov	r1, r3
	ldr	r3, [r1, #2268]
	lsl	r2, r2, #10
	lsr	r3, r3, #22
	orr	r3, r3, r2
	ror	r3, r3, #10
	str	r3, [r1, #2268]
.L24:
	.loc 1 73 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE3:
	.size	registerSwitchState, .-registerSwitchState
	.align	2
	.global	learnPositions
	.syntax unified
	.arm
	.fpu softvfp
	.type	learnPositions, %function
learnPositions:
.LFB4:
	.loc 1 76 0
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
	.loc 1 78 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L26
.L27:
.LBB3:
	.loc 1 79 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #16384
	ldr	r2, [r3, #1956]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 1 80 0 discriminator 3
	ldr	r0, [fp, #-16]
	ldr	r2, [fp, #-12]
	asr	r3, r2, #31
	lsr	r3, r3, #28
	add	r2, r2, r3
	and	r2, r2, #15
	sub	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #10432
	add	r3, r3, #32
	ldr	r2, [fp, #-16]
	add	ip, r2, r3
	ldr	r2, [fp, #-12]
	asr	r3, r2, #31
	lsr	r3, r3, #28
	add	r2, r2, r3
	and	r2, r2, #15
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r1, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #10944
	add	r3, r3, #8
	ldr	r3, [r3]
	mov	r2, r3
	mov	r1, ip
	bl	trainIST(PLT)
	.loc 1 81 0 discriminator 3
	bl	Pass(PLT)
.LBE3:
	.loc 1 78 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L26:
	.loc 1 78 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	add	r3, r3, #16384
	ldr	r2, [r3, #1952]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L27
	.loc 1 83 0 is_stmt 1
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
.LFE4:
	.size	learnPositions, .-learnPositions
	.global	__aeabi_idiv
	.align	2
	.global	getPosition
	.syntax unified
	.arm
	.fpu softvfp
	.type	getPosition, %function
getPosition:
.LFB5:
	.loc 1 86 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 87 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #2592
	add	r3, r3, #10
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	.loc 1 88 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #2608
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	.loc 1 92 0
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	__aeabi_idiv(PLT)
.LVL0:
	mov	r3, r0
	str	r3, [fp, #-20]
	.loc 1 93 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #2576
	add	r3, r3, #2
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	.loc 1 94 0
	ldr	r3, [fp, #-24]
	mov	r2, r3
	sub	r3, fp, #20
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 96 0
	ldr	r0, [fp, #-24]
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE5:
	.size	getPosition, .-getPosition
	.align	2
	.global	getExpectedNextSensorTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	getExpectedNextSensorTime, %function
getExpectedNextSensorTime:
.LFB6:
	.loc 1 99 0
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
	.loc 1 100 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2592
	add	r3, r3, #10
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	.loc 1 101 0
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
	.size	getExpectedNextSensorTime, .-getExpectedNextSensorTime
	.align	2
	.global	getPositionNetworkReference
	.syntax unified
	.arm
	.fpu softvfp
	.type	getPositionNetworkReference, %function
getPositionNetworkReference:
.LFB7:
	.loc 1 104 0
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
	.loc 1 105 0
	ldr	r3, [fp, #-8]
	.loc 1 106 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE7:
	.size	getPositionNetworkReference, .-getPositionNetworkReference
	.align	2
	.global	getEffectiveSpeeds
	.syntax unified
	.arm
	.fpu softvfp
	.type	getEffectiveSpeeds, %function
getEffectiveSpeeds:
.LFB8:
	.loc 1 109 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	.loc 1 110 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2576
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	mov	r2, #1065353216
	str	r2, [r3]	@ float
	.loc 1 112 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE8:
	.size	getEffectiveSpeeds, .-getEffectiveSpeeds
.Letext0:
	.file 2 "src/util/ai/mlp.h"
	.file 3 "src/util/ai/intersensorTime.h"
	.file 4 "src/util/ai/position.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6bf
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0xc
	.4byte	.LASF67
	.4byte	.LASF68
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x14
	.byte	0x2
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x5
	.4byte	0x6e
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x6
	.4byte	0x75
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x7
	.4byte	0x7b
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x8
	.4byte	0x7b
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.4byte	0x7b
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.4byte	0x7b
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF5
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x2
	.byte	0xa
	.4byte	0x8d
	.uleb128 0x5
	.byte	0x4
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x1
	.4byte	0xbc
	.byte	0x2
	.byte	0xc
	.4byte	0xbc
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.4byte	0x124
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x14
	.4byte	0x124
	.byte	0
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x15
	.4byte	0x6e
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x16
	.4byte	0x12a
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.4byte	0x130
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0x18
	.4byte	0x6e
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x2
	.byte	0x19
	.4byte	0x6e
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x2
	.byte	0x1a
	.4byte	0x6e
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x82
	.uleb128 0x5
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x5
	.byte	0x4
	.4byte	0x93
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x2
	.byte	0x1b
	.4byte	0xc3
	.uleb128 0xa
	.4byte	.LASF22
	.2byte	0x284c
	.byte	0x3
	.byte	0x10
	.4byte	0x1c2
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.byte	0x11
	.4byte	0x1c2
	.byte	0
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.byte	0x12
	.4byte	0x1da
	.2byte	0x2620
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.byte	0x13
	.4byte	0x1ea
	.2byte	0x2670
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.byte	0x14
	.4byte	0x1fa
	.2byte	0x2800
	.uleb128 0xc
	.ascii	"nn\000"
	.byte	0x3
	.byte	0x15
	.4byte	0x136
	.2byte	0x2814
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.byte	0x16
	.4byte	0x20a
	.2byte	0x2830
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.byte	0x17
	.4byte	0x21a
	.2byte	0x2838
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x3
	.byte	0x18
	.4byte	0x22a
	.2byte	0x2840
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.byte	0x19
	.4byte	0x23a
	.2byte	0x2848
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x1d3
	.uleb128 0xe
	.4byte	0x1d3
	.2byte	0x987
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF28
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x1ea
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.4byte	0x25
	.4byte	0x1fa
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.4byte	0x25
	.4byte	0x20a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x6e
	.4byte	0x21a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x8d
	.4byte	0x22a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x75
	.4byte	0x23a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x93
	.4byte	0x24a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x3
	.byte	0x1a
	.4byte	0x141
	.uleb128 0xa
	.4byte	.LASF29
	.2byte	0x1e8
	.byte	0x3
	.byte	0x1c
	.4byte	0x296
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x3
	.byte	0x1d
	.4byte	0x296
	.byte	0
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x3
	.byte	0x1e
	.4byte	0x2a6
	.2byte	0x140
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x3
	.byte	0x1f
	.4byte	0x2b6
	.2byte	0x198
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x3
	.byte	0x20
	.4byte	0x2c6
	.2byte	0x1b0
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2a6
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x4f
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2b6
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x15
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2c6
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x5
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2d6
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0xd
	.byte	0
	.uleb128 0xa
	.4byte	.LASF34
	.2byte	0x1ec
	.byte	0x4
	.byte	0x8
	.4byte	0x2fd
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x4
	.byte	0x9
	.4byte	0x255
	.byte	0
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x4
	.byte	0xa
	.4byte	0x6e
	.2byte	0x1e8
	.byte	0
	.uleb128 0xa
	.4byte	.LASF37
	.2byte	0x47a8
	.byte	0x4
	.byte	0xd
	.4byte	0x39a
	.uleb128 0x10
	.ascii	"n\000"
	.byte	0x4
	.byte	0xe
	.4byte	0x24a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x4
	.byte	0xf
	.4byte	0x39a
	.2byte	0x284c
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x4
	.byte	0x10
	.4byte	0x39a
	.2byte	0x2864
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x4
	.byte	0x11
	.4byte	0x39a
	.2byte	0x287c
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x4
	.byte	0x12
	.4byte	0x39a
	.2byte	0x2894
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x4
	.byte	0x13
	.4byte	0x39a
	.2byte	0x28ac
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x4
	.byte	0x14
	.4byte	0x39a
	.2byte	0x28c4
	.uleb128 0x11
	.4byte	.LASF70
	.byte	0x4
	.byte	0x15
	.4byte	0x3aa
	.byte	0x4
	.byte	0x16
	.byte	0xa
	.2byte	0x28dc
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x4
	.byte	0x18
	.4byte	0x3b1
	.2byte	0x28e0
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x4
	.byte	0x19
	.4byte	0x6e
	.2byte	0x47a0
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x4
	.byte	0x1a
	.4byte	0x6e
	.2byte	0x47a4
	.byte	0
	.uleb128 0xd
	.4byte	0x6e
	.4byte	0x3aa
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF47
	.uleb128 0xd
	.4byte	0x2d6
	.4byte	0x3c1
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0x4
	.byte	0x1b
	.4byte	0x2fd
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x8
	.byte	0x4
	.byte	0x1d
	.4byte	0x3f1
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x4
	.byte	0x1e
	.4byte	0x6e
	.byte	0
	.uleb128 0x3
	.4byte	.LASF50
	.byte	0x4
	.byte	0x1f
	.4byte	0x6e
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.4byte	.LASF57
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43e
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x6c
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x6c
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.byte	0x6c
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x6c
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x3c1
	.uleb128 0x15
	.4byte	.LASF52
	.byte	0x1
	.byte	0x67
	.4byte	0x46b
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46b
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x67
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x24a
	.uleb128 0x15
	.4byte	.LASF53
	.byte	0x1
	.byte	0x62
	.4byte	0x6e
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4a6
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x62
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x62
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x16
	.4byte	.LASF54
	.byte	0x1
	.byte	0x55
	.4byte	0x3cc
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x513
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x55
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x55
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.byte	0x55
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.4byte	.LASF55
	.byte	0x1
	.byte	0x57
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF56
	.byte	0x1
	.byte	0x58
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.ascii	"pos\000"
	.byte	0x1
	.byte	0x5b
	.4byte	0x3cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF58
	.byte	0x1
	.byte	0x4b
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55a
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x4b
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x18
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF59
	.byte	0x1
	.byte	0x43
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x598
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii	"sw\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0x1
	.byte	0x43
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x3d
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e5
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x3d
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x1
	.byte	0x3d
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.byte	0x3d
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.4byte	.LASF61
	.byte	0x1
	.byte	0x1a
	.4byte	0x6e
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x697
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x43e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -516
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x1
	.byte	0x1a
	.4byte	0x6e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x1a
	.4byte	0x6e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -524
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.byte	0x1a
	.4byte	0x6e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x1
	.byte	0x1a
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.ascii	"i\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF64
	.byte	0x1
	.byte	0x1e
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x23
	.4byte	0x255
	.uleb128 0x3
	.byte	0x91
	.sleb128 -512
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.byte	0x2c
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x18
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x31
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF71
	.byte	0x1
	.byte	0x7
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x43e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
.LASF6:
	.ascii	"AF_RELU\000"
.LASF51:
	.ascii	"train\000"
.LASF5:
	.ascii	"float\000"
.LASF9:
	.ascii	"AF_LINEAR\000"
.LASF37:
	.ascii	"PositionCalculator\000"
.LASF30:
	.ascii	"isLast\000"
.LASF22:
	.ascii	"ISTNetwork\000"
.LASF45:
	.ascii	"history_size\000"
.LASF28:
	.ascii	"sizetype\000"
.LASF64:
	.ascii	"delta\000"
.LASF19:
	.ascii	"maxLayer\000"
.LASF54:
	.ascii	"getPosition\000"
.LASF21:
	.ascii	"NeuralNetwork\000"
.LASF44:
	.ascii	"history\000"
.LASF67:
	.ascii	"src/util/ai/position.c\000"
.LASF7:
	.ascii	"AF_SOFTPLUS\000"
.LASF62:
	.ascii	"sensor\000"
.LASF50:
	.ascii	"sensorId\000"
.LASF2:
	.ascii	"bias\000"
.LASF11:
	.ascii	"PerceptronNode\000"
.LASF27:
	.ascii	"layerSizes\000"
.LASF43:
	.ascii	"initTimes\000"
.LASF58:
	.ascii	"learnPositions\000"
.LASF70:
	.ascii	"switches\000"
.LASF60:
	.ascii	"registerTrainSpeed\000"
.LASF71:
	.ascii	"initPositionCalculator\000"
.LASF53:
	.ascii	"getExpectedNextSensorTime\000"
.LASF4:
	.ascii	"last_doutput\000"
.LASF57:
	.ascii	"getEffectiveSpeeds\000"
.LASF32:
	.ascii	"isTrain\000"
.LASF25:
	.ascii	"layer\000"
.LASF10:
	.ascii	"unsigned char\000"
.LASF33:
	.ascii	"isSpeed\000"
.LASF20:
	.ascii	"NNLayer\000"
.LASF8:
	.ascii	"AF_SIGMOID\000"
.LASF17:
	.ascii	"outputs\000"
.LASF31:
	.ascii	"isCurved\000"
.LASF47:
	.ascii	"unsigned int\000"
.LASF39:
	.ascii	"speed\000"
.LASF18:
	.ascii	"inputs\000"
.LASF68:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF63:
	.ascii	"learn\000"
.LASF49:
	.ascii	"distance\000"
.LASF13:
	.ascii	"layers\000"
.LASF69:
	.ascii	"ActivationFunction\000"
.LASF29:
	.ascii	"ISTNetworkInputs\000"
.LASF52:
	.ascii	"getPositionNetworkReference\000"
.LASF24:
	.ascii	"layer_weights\000"
.LASF23:
	.ascii	"input_weights\000"
.LASF15:
	.ascii	"numNodes\000"
.LASF38:
	.ascii	"lastSensor\000"
.LASF61:
	.ascii	"registerSensorTrigger\000"
.LASF55:
	.ascii	"expected\000"
.LASF40:
	.ascii	"newSpeed\000"
.LASF3:
	.ascii	"last_output\000"
.LASF1:
	.ascii	"weights\000"
.LASF46:
	.ascii	"history_idx\000"
.LASF0:
	.ascii	"size\000"
.LASF34:
	.ascii	"PositionDatum\000"
.LASF26:
	.ascii	"output_layer\000"
.LASF65:
	.ascii	"exptime\000"
.LASF41:
	.ascii	"newSpeedTime\000"
.LASF36:
	.ascii	"time\000"
.LASF16:
	.ascii	"activators\000"
.LASF48:
	.ascii	"Position\000"
.LASF12:
	.ascii	"MultilayerPerceptron\000"
.LASF66:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF35:
	.ascii	"value\000"
.LASF42:
	.ascii	"expectedTimes\000"
.LASF14:
	.ascii	"numLayers\000"
.LASF56:
	.ascii	"initial\000"
.LASF59:
	.ascii	"registerSwitchState\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
