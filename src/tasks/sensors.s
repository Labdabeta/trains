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
	.file	"sensors.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	toSensorId, %function
toSensorId:
.LFB0:
	.file 1 "src/tasks/sensors.h"
	.loc 1 21 0
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
	mov	r3, r0
	str	r1, [fp, #-12]
	strb	r3, [fp, #-5]
	.loc 1 22 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #65
	lsl	r2, r3, #4
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	.loc 1 23 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	toSensorId, .-toSensorId
	.align	2
	.global	sensor_courier
	.syntax unified
	.arm
	.fpu softvfp
	.type	sensor_courier, %function
sensor_courier:
.LFB2:
	.file 2 "src/tasks/sensors.c"
	.loc 2 15 0
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
	sub	sp, sp, #24
	.loc 2 16 0
	bl	Service(PLT)
	.loc 2 17 0
	bl	MyParentTid(PLT)
	str	r0, [fp, #-12]
.L6:
.LBB2:
	.loc 2 21 0
	mov	r0, #133
	bl	tputc(PLT)
	.loc 2 22 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L4
.L5:
.LBB3:
	.loc 2 23 0 discriminator 3
	bl	tgetc(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	.loc 2 24 0 discriminator 3
	sub	r1, fp, #16
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-12]
	bl	Send(PLT)
.LBE3:
	.loc 2 22 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	.loc 2 22 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L5
.LBE2:
	.loc 2 19 0 is_stmt 1
	b	.L6
	.cfi_endproc
.LFE2:
	.size	sensor_courier, .-sensor_courier
	.section	.rodata
	.align	2
.LC0:
	.ascii	"SENSOR\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB3:
	.loc 2 36 0
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
	ldr	r1, .L10
.LPIC0:
	add	r1, pc, r1
	.loc 2 38 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #64]
	.loc 2 40 0
	mov	r2, #4
	ldr	r3, .L10+4
	ldr	r3, [r1, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	.loc 2 42 0
	ldr	r3, .L10+8
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 2 44 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L8
.L9:
	.loc 2 45 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #68
	mov	r2, #0
	strb	r2, [r3]
	.loc 2 44 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	.loc 2 44 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L9
	.loc 2 47 0 is_stmt 1
	ldr	r3, [fp, #-16]
	mvn	r2, #0
	str	r2, [r3, #80]
	.loc 2 48 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	sensor_courier(GOT)
	.word	.LC0-(.LPIC1+8)
	.cfi_endproc
.LFE3:
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	toClusterId, %function
toClusterId:
.LFB4:
	.loc 2 51 0
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
	.loc 2 52 0
	ldr	r3, [fp, #-8]
	asr	r3, r3, #4
	ldr	r2, [fp, #-8]
	and	r2, r2, #15
	cmp	r2, #8
	movgt	r2, #1
	movle	r2, #0
	and	r2, r2, #255
	add	r3, r3, r2
	.loc 2 53 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE4:
	.size	toClusterId, .-toClusterId
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	toClusterMask, %function
toClusterMask:
.LFB5:
	.loc 2 56 0
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
	.loc 2 57 0
	ldr	r3, [fp, #-8]
	mvn	r3, r3
	and	r3, r3, #7
	mov	r2, #1
	lsl	r3, r2, r3
	.loc 2 58 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE5:
	.size	toClusterMask, .-toClusterMask
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB6:
	.loc 2 61 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #68
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	str	r2, [fp, #-64]
	str	r3, [fp, #-68]
	.loc 2 64 0
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	beq	.L18
	cmp	r3, #1
	beq	.L19
	b	.L33
.L18:
	.loc 2 66 0
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #64]
	add	r1, r3, #1
	ldr	r2, [fp, #-56]
	str	r1, [r2, #64]
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-60]
	str	r1, [r2, r3, lsl #2]
	.loc 2 67 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-60]
	bl	Reply(PLT)
	.loc 2 68 0
	b	.L20
.L19:
	.loc 2 70 0
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r0, r3
	bl	toClusterId(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	mov	r4, r3
	.loc 2 71 0
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r0, r3
	bl	toClusterMask(PLT)
	mov	r3, r0
	.loc 2 70 0
	and	r3, r3, r4
	str	r3, [fp, #-44]
	.loc 2 72 0
	sub	r3, fp, #44
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-60]
	bl	Reply(PLT)
	.loc 2 73 0
	b	.L20
.L33:
	.loc 2 75 0
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	add	r1, r3, #1
	ldr	r3, .L34
	smull	r2, r3, r1, r3
	asr	r2, r3, #2
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	sub	r2, r1, r3
	ldr	r3, [fp, #-56]
	str	r2, [r3, #80]
	.loc 2 76 0
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	and	r3, r3, #255
	str	r3, [fp, #-44]
	.loc 2 77 0
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	mvn	r3, r3
	and	r3, r3, r2
	str	r3, [fp, #-40]
	.loc 2 79 0
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L21
.LBB4:
	.loc 2 81 0
	mov	r3, #128
	str	r3, [fp, #-20]
	.loc 2 82 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L22
.L26:
	.loc 2 83 0
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L23
.LBB5:
	.loc 2 84 0
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	and	r3, r3, #255
	add	r3, r3, #65
	and	r0, r3, #255
	.loc 2 85 0
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	lsl	r3, r3, #3
	and	r3, r3, #8
	.loc 2 84 0
	add	r3, r2, r3
	mov	r1, r3
	bl	toSensorId(PLT)
	mov	r3, r0
	.loc 2 85 0
	add	r3, r3, #1
	.loc 2 84 0
	str	r3, [fp, #-48]
	.loc 2 87 0
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L24
.L25:
	.loc 2 88 0 discriminator 3
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-24]
	ldr	r0, [r3, r2, lsl #2]
	sub	r1, fp, #48
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	bl	Send(PLT)
	.loc 2 87 0 discriminator 3
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L24:
	.loc 2 87 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-56]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L25
.L23:
.LBE5:
	.loc 2 90 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-20]
	asr	r3, r3, #1
	str	r3, [fp, #-20]
	.loc 2 82 0 discriminator 2
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L22:
	.loc 2 82 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L26
.L21:
.LBE4:
	.loc 2 93 0 is_stmt 1
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	mvn	r2, r3
	ldr	r3, [fp, #-44]
	and	r3, r3, r2
	str	r3, [fp, #-40]
	.loc 2 95 0
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L27
.LBB6:
	.loc 2 97 0
	mov	r3, #128
	str	r3, [fp, #-32]
	.loc 2 98 0
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L28
.L32:
	.loc 2 99 0
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L29
.LBB7:
	.loc 2 100 0
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	and	r3, r3, #255
	add	r3, r3, #65
	and	r0, r3, #255
	.loc 2 101 0
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	lsl	r3, r3, #3
	and	r3, r3, #8
	.loc 2 100 0
	add	r3, r2, r3
	mov	r1, r3
	bl	toSensorId(PLT)
	mov	r3, r0
	mvn	r3, r3
	str	r3, [fp, #-52]
	.loc 2 103 0
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L30
.L31:
	.loc 2 104 0 discriminator 3
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-36]
	ldr	r0, [r3, r2, lsl #2]
	sub	r1, fp, #52
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	bl	Send(PLT)
	.loc 2 103 0 discriminator 3
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L30:
	.loc 2 103 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-56]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L31
.L29:
.LBE7:
	.loc 2 106 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-32]
	asr	r3, r3, #1
	str	r3, [fp, #-32]
	.loc 2 98 0 discriminator 2
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L28:
	.loc 2 98 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-28]
	cmp	r3, #7
	ble	.L32
.L27:
.LBE6:
	.loc 2 110 0 is_stmt 1
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	ldr	r2, [fp, #-44]
	and	r1, r2, #255
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3, #68]
	.loc 2 111 0
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #80]
	ldr	r2, [fp, #-44]
	and	r1, r2, #255
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3, #68]
	.loc 2 112 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-60]
	bl	Reply(PLT)
.L20:
	.loc 2 114 0
	nop
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L35:
	.align	2
.L34:
	.word	1717986919
	.cfi_endproc
.LFE6:
	.size	handle, .-handle
	.align	2
	.global	registerForSensorFlips
	.syntax unified
	.arm
	.fpu softvfp
	.type	registerForSensorFlips, %function
registerForSensorFlips:
.LFB7:
	.loc 2 117 0
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
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	.loc 2 118 0
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-8]
	bl	Send(PLT)
	.loc 2 119 0
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
.LFE7:
	.size	registerForSensorFlips, .-registerForSensorFlips
	.align	2
	.global	getSensorState
	.syntax unified
	.arm
	.fpu softvfp
	.type	getSensorState, %function
getSensorState:
.LFB8:
	.loc 2 122 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	.loc 2 124 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	strb	r3, [fp, #-9]
	.loc 2 125 0
	sub	r2, fp, #8
	sub	r1, fp, #9
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #1
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 2 126 0
	ldr	r3, [fp, #-8]
	.loc 2 127 0
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
	.size	getSensorState, .-getSensorState
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB9:
	.loc 2 129 0
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
	.loc 2 129 0
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	initialize(PLT)
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
.LFE9:
	.size	server_initialize, .-server_initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_work, %function
server_work:
.LFB10:
	.loc 2 129 0
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
	.loc 2 129 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #84
	sub	r3, fp, #12
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #84
	ldr	r3, [fp, #-8]
	bl	handle(PLT)
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
.LFE10:
	.size	server_work, .-server_work
	.section	.rodata
	.align	2
.LC1:
	.ascii	"sensors\000"
	.align	2
.LC2:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	sensors
	.syntax unified
	.arm
	.fpu softvfp
	.type	sensors, %function
sensors:
.LFB11:
	.loc 2 129 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #88
	.loc 2 129 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L43
.LPIC2:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L43+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #92
	mov	r0, r3
	bl	server_initialize(PLT)
.L42:
	.loc 2 129 0 is_stmt 0 discriminator 2
	sub	r3, fp, #92
	mov	r0, r3
	bl	server_work(PLT)
	b	.L42
.L44:
	.align	2
.L43:
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.cfi_endproc
.LFE11:
	.size	sensors, .-sensors
.Letext0:
	.file 3 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x427
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0xc
	.4byte	.LASF38
	.4byte	.LASF39
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x1
	.4byte	0x62
	.byte	0x3
	.byte	0x8
	.4byte	0x62
	.uleb128 0x5
	.4byte	.LASF1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x54
	.byte	0x2
	.byte	0x7
	.4byte	0xa6
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x2
	.byte	0x8
	.4byte	0xa6
	.byte	0
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x9
	.4byte	0x2c
	.byte	0x40
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0xa
	.4byte	0xbd
	.byte	0x44
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0xb
	.4byte	0x2c
	.byte	0x50
	.byte	0
	.uleb128 0x8
	.4byte	0x2c
	.4byte	0xb6
	.uleb128 0x9
	.4byte	0xb6
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x8
	.4byte	0xcd
	.4byte	0xcd
	.uleb128 0x9
	.4byte	0xb6
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x4
	.byte	0x2
	.byte	0x1d
	.4byte	0xed
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x2
	.byte	0x20
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x58
	.byte	0x2
	.byte	0x81
	.4byte	0x112
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x2
	.byte	0x81
	.4byte	0x69
	.byte	0
	.uleb128 0xa
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x81
	.4byte	0xd4
	.byte	0x54
	.byte	0
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x2
	.byte	0x81
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x137
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x2
	.byte	0x81
	.4byte	0xed
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x2
	.byte	0x81
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x177
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x2
	.byte	0x81
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x81
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x2
	.byte	0x81
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.4byte	0xed
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x2
	.byte	0x81
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a1
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x2
	.byte	0x81
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF41
	.byte	0x2
	.byte	0x79
	.4byte	0x2c
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f2
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x79
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii	"id\000"
	.byte	0x2
	.byte	0x79
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.ascii	"ret\000"
	.byte	0x2
	.byte	0x7b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.ascii	"cid\000"
	.byte	0x2
	.byte	0x7c
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x2
	.byte	0x74
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x216
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x74
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x2
	.byte	0x3c
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31c
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x2
	.byte	0x3c
	.4byte	0x31c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x3c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x12
	.ascii	"m\000"
	.byte	0x2
	.byte	0x3c
	.4byte	0x322
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x2
	.byte	0x3c
	.4byte	0x2c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x2
	.byte	0x3e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.ascii	"tmp\000"
	.byte	0x2
	.byte	0x3f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x2cf
	.uleb128 0xf
	.ascii	"bit\000"
	.byte	0x2
	.byte	0x50
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x2
	.byte	0x51
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x2
	.byte	0x54
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x2
	.byte	0x56
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0xf
	.ascii	"bit\000"
	.byte	0x2
	.byte	0x60
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x2
	.byte	0x61
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x2
	.byte	0x64
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x2
	.byte	0x66
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x69
	.uleb128 0x10
	.byte	0x4
	.4byte	0xd4
	.uleb128 0x15
	.4byte	.LASF29
	.byte	0x2
	.byte	0x37
	.4byte	0x2c
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34f
	.uleb128 0x12
	.ascii	"id\000"
	.byte	0x2
	.byte	0x37
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x2
	.byte	0x32
	.4byte	0x2c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x376
	.uleb128 0x12
	.ascii	"id\000"
	.byte	0x2
	.byte	0x32
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x2
	.byte	0x23
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a6
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x2
	.byte	0x23
	.4byte	0x31c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x2
	.byte	0x25
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x2
	.byte	0xe
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f8
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x2
	.byte	0x11
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x2
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0xf
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x17
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x1
	.byte	0x14
	.4byte	0x2c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x1
	.byte	0x14
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x1
	.byte	0x14
	.4byte	0x2c
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
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
.LASF27:
	.ascii	"reply\000"
.LASF21:
	.ascii	"server_initialize\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"last_sensor\000"
.LASF9:
	.ascii	"sensors\000"
.LASF34:
	.ascii	"toSensorId\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF7:
	.ascii	"client_tids\000"
.LASF25:
	.ascii	"sensor\000"
.LASF33:
	.ascii	"parent\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF30:
	.ascii	"toClusterId\000"
.LASF19:
	.ascii	"datalen\000"
.LASF28:
	.ascii	"client\000"
.LASF13:
	.ascii	"Data\000"
.LASF31:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF38:
	.ascii	"src/tasks/sensors.c\000"
.LASF35:
	.ascii	"group\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF32:
	.ascii	"sensor_courier\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF39:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF17:
	.ascii	"user\000"
.LASF36:
	.ascii	"number\000"
.LASF12:
	.ascii	"char\000"
.LASF14:
	.ascii	"Message\000"
.LASF18:
	.ascii	"data\000"
.LASF15:
	.ascii	"query\000"
.LASF40:
	.ascii	"TaskSize\000"
.LASF8:
	.ascii	"num_clients\000"
.LASF41:
	.ascii	"getSensorState\000"
.LASF23:
	.ascii	"handle\000"
.LASF24:
	.ascii	"size\000"
.LASF22:
	.ascii	"registerForSensorFlips\000"
.LASF26:
	.ascii	"mask\000"
.LASF16:
	.ascii	"server_Data\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF37:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF20:
	.ascii	"server_work\000"
.LASF29:
	.ascii	"toClusterMask\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
