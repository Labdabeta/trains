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
	.file	"precise_stop.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"SENSOR\000"
	.align	2
.LC1:
	.ascii	"CLOCK\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB2:
	.file 1 "src/tasks/data_collection/precise_stop.c"
	.loc 1 41 0
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
	.loc 1 42 0
	ldr	r3, .L2
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	.loc 1 43 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	registerForSensorFlips(PLT)
	.loc 1 45 0
	ldr	r3, .L2+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 1 46 0
	ldr	r3, [fp, #-8]
	mvn	r2, #0
	str	r2, [r3, #12]
	.loc 1 47 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	strb	r2, [r3, #368]
	.loc 1 48 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE2:
	.size	initialize, .-initialize
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Sensor %c%d at time %d\012\015\000"
	.align	2
.LC3:
	.ascii	"Stopping train at time %d\012\015\000"
	.align	2
.LC4:
	.ascii	"Got a timer return without an active job!\012\015\000"
	.align	2
.LC5:
	.ascii	"Welcome to the percise stopper!\012\015\000"
	.align	2
.LC6:
	.ascii	"Today, we will use train %d at speed %d.\012\015\000"
	.align	2
.LC7:
	.ascii	"PATH\000"
	.align	2
.LC8:
	.ascii	"The distance from A to B is: %dmm\012\015\000"
	.align	2
.LC9:
	.ascii	"We will try a delay of: %d*10ms\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB3:
	.loc 1 56 0
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
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	.loc 1 57 0
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	bne	.L5
	.loc 1 58 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r0, r3
	bl	Time(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	.loc 1 59 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	add	r2, r3, #15
	cmp	r3, #0
	movlt	r3, r2
	movge	r3, r3
	asr	r3, r3, #4
	add	r1, r3, #65
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	asr	r3, r2, #31
	lsr	r3, r3, #28
	add	r2, r2, r3
	and	r2, r2, #15
	sub	r3, r2, r3
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	ldr	r0, .L18
.LPIC2:
	add	r0, pc, r0
	bl	tfp_dprintf(PLT)
	.loc 1 60 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	blt	.L6
	.loc 1 60 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L6
	.loc 1 61 0 is_stmt 1
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #204]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-16]
	str	r2, [r3, #28]
	.loc 1 62 0
	ldr	r3, [fp, #-16]
	mov	r2, #1
	strb	r2, [r3, #368]
	.loc 1 63 0
	ldr	r3, [fp, #-16]
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #32]
	mov	r3, #0
	mov	r2, #0
	bl	async_delay(PLT)
.L6:
	.loc 1 65 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #28]
	b	.L7
.L5:
	.loc 1 66 0
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L8
	.loc 1 67 0
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #368]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L10
	cmp	r3, #2
	beq	.L11
	b	.L17
.L10:
	.loc 1 69 0
	ldr	r3, [fp, #-16]
	ldr	r0, [r3]
	mov	r3, #0
	mov	r2, #0
	mov	r1, #500
	bl	async_delay(PLT)
	.loc 1 70 0
	ldr	r3, [fp, #-16]
	mov	r2, #2
	strb	r2, [r3, #368]
	.loc 1 71 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, #0
	bl	tput2(PLT)
	.loc 1 72 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r0, r3
	bl	Time(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L18+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 73 0
	b	.L7
.L11:
	.loc 1 75 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	strb	r2, [r3, #368]
	.loc 1 76 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	getSensorState(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	.loc 1 77 0
	ldr	r3, [fp, #-16]
	ldr	r0, [r3, #36]
	ldr	r3, [fp, #-16]
	add	r3, r3, #32
	mov	r2, #4
	mov	r1, r3
	bl	Reply(PLT)
	.loc 1 78 0
	ldr	r3, [fp, #-16]
	mvn	r2, #0
	str	r2, [r3, #36]
	.loc 1 79 0
	ldr	r3, [fp, #-16]
	mvn	r2, #0
	str	r2, [r3, #12]
	.loc 1 80 0
	mov	r3, #1
	b	.L14
.L13:
	.loc 1 82 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bge	.L15
	.loc 1 82 0 is_stmt 0 discriminator 1
	mov	r3, #5
	b	.L16
.L15:
	.loc 1 82 0 discriminator 2
	mvn	r3, #4
.L16:
	.loc 1 82 0 discriminator 4
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #32]
	.loc 1 83 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #24]
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, r2
	bl	tput2(PLT)
	.loc 1 85 0 discriminator 4
	b	.L7
.L17:
	.loc 1 87 0
	ldr	r3, .L18+8
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	b	.L7
.L8:
.LBB2:
	.loc 1 90 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	.loc 1 91 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #16]
	.loc 1 92 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #20]
	.loc 1 93 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #24]
	.loc 1 94 0
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #36]
	.loc 1 96 0
	ldr	r3, .L18+12
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 97 0
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, .L18+16
.LPIC6:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 100 0
	ldr	r3, [fp, #-16]
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #16]
	ldr	r3, [fp, #-16]
	add	r2, r3, #204
	ldr	r3, [fp, #-16]
	add	r3, r3, #40
	bl	findPath(PLT)
	str	r0, [fp, #-8]
	.loc 1 101 0
	ldr	r3, .L18+20
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	ldr	r3, [fp, #-16]
	add	r1, r3, #40
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #164
	bl	Send(PLT)
	.loc 1 103 0
	ldr	r3, [fp, #-8]
	ldr	r2, .L18+24
	smull	r1, r2, r3, r2
	asr	r2, r2, #1
	asr	r3, r3, #31
	sub	r3, r2, r3
	sub	r2, r3, #80
	ldr	r3, [fp, #-16]
	str	r2, [r3, #32]
	.loc 1 105 0
	ldr	r1, [fp, #-8]
	ldr	r3, .L18+28
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 106 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #32]
	mov	r1, r3
	ldr	r3, .L18+32
.LPIC9:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 108 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #24]
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, r2
	bl	tput2(PLT)
.L7:
.LBE2:
	.loc 1 110 0
	mov	r3, #0
.L14:
	.loc 1 111 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC3+8)
	.word	.LC4-(.LPIC4+8)
	.word	.LC5-(.LPIC5+8)
	.word	.LC6-(.LPIC6+8)
	.word	.LC7-(.LPIC7+8)
	.word	1717986919
	.word	.LC8-(.LPIC8+8)
	.word	.LC9-(.LPIC9+8)
	.cfi_endproc
.LFE3:
	.size	handle, .-handle
	.align	2
	.global	precise_stop_task
	.syntax unified
	.arm
	.fpu softvfp
	.type	precise_stop_task, %function
precise_stop_task:
.LFB4:
	.loc 1 114 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 400
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #400
	.loc 1 119 0
	sub	r3, fp, #380
	mov	r0, r3
	bl	initialize(PLT)
.L21:
	.loc 1 122 0 discriminator 1
	sub	r1, fp, #396
	sub	r3, fp, #400
	mov	r2, #16
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	.loc 1 123 0 discriminator 1
	ldr	r1, [fp, #-400]
	sub	r2, fp, #396
	sub	r0, fp, #380
	ldr	r3, [fp, #-8]
	bl	handle(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L21
	.loc 1 125 0
	bl	Exit(PLT)
	.loc 1 126 0
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
	.size	precise_stop_task, .-precise_stop_task
	.align	2
	.global	getAccurateStopTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	getAccurateStopTime, %function
getAccurateStopTime:
.LFB5:
	.loc 1 129 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #48
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r1, .L24
.LPIC10:
	add	r1, pc, r1
	.loc 1 130 0
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-12]
	.loc 1 131 0
	mov	r2, #4
	ldr	r3, .L24+4
	ldr	r3, [r1, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	str	r0, [fp, #-8]
	.loc 1 133 0
	sub	r2, fp, #28
	sub	r1, fp, #24
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #16
	ldr	r0, [fp, #-8]
	bl	Send(PLT)
	.loc 1 134 0
	ldr	r3, [fp, #-28]
	.loc 1 135 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L25:
	.align	2
.L24:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+8)
	.word	precise_stop_task(GOT)
	.cfi_endproc
.LFE5:
	.size	getAccurateStopTime, .-getAccurateStopTime
.Letext0:
	.file 2 "src/util/trains/track_data.h"
	.file 3 "src/util/trains/path_finder.h"
	.file 4 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x479
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0xc
	.4byte	.LASF54
	.4byte	.LASF55
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
	.4byte	.LASF30
	.byte	0x1
	.4byte	0x62
	.byte	0x4
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
	.byte	0x1
	.4byte	0x62
	.byte	0x2
	.byte	0x4
	.4byte	0x9a
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0xb
	.4byte	0x69
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x12
	.4byte	0xb0
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x30
	.byte	0x2
	.byte	0x1b
	.4byte	0xf9
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x2
	.byte	0x1c
	.4byte	0x14d
	.byte	0
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0x1d
	.4byte	0x9a
	.byte	0x4
	.uleb128 0xa
	.ascii	"num\000"
	.byte	0x2
	.byte	0x1e
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x2
	.byte	0x1f
	.4byte	0x147
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x2
	.byte	0x20
	.4byte	0x15f
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x2
	.byte	0x13
	.4byte	0x104
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x10
	.byte	0x2
	.byte	0x15
	.4byte	0x141
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x2
	.byte	0x16
	.4byte	0x141
	.byte	0
	.uleb128 0xa
	.ascii	"src\000"
	.byte	0x2
	.byte	0x17
	.4byte	0x147
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x2
	.byte	0x17
	.4byte	0x147
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x2
	.byte	0x18
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xf9
	.uleb128 0xb
	.byte	0x4
	.4byte	0xa5
	.uleb128 0xb
	.byte	0x4
	.4byte	0x15a
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.uleb128 0xc
	.4byte	0x153
	.uleb128 0xd
	.4byte	0xf9
	.4byte	0x16f
	.uleb128 0xe
	.4byte	0x16f
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF23
	.uleb128 0xd
	.4byte	0xa5
	.4byte	0x186
	.uleb128 0xe
	.4byte	0x16f
	.byte	0x8f
	.byte	0
	.uleb128 0xf
	.4byte	.LASF56
	.byte	0x2
	.byte	0x29
	.4byte	0x176
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0xa4
	.byte	0x3
	.byte	0x8
	.4byte	0x1c2
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.byte	0x9
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x3
	.byte	0xa
	.4byte	0x1c2
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.byte	0xb
	.4byte	0x1c2
	.byte	0x54
	.byte	0
	.uleb128 0xd
	.4byte	0x2c
	.4byte	0x1d2
	.uleb128 0xe
	.4byte	0x16f
	.byte	0x13
	.byte	0
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0xa4
	.byte	0x3
	.byte	0xe
	.4byte	0x203
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x3
	.byte	0x10
	.4byte	0x1c2
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x3
	.byte	0x11
	.4byte	0x1c2
	.byte	0x54
	.byte	0
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0x1
	.4byte	0x62
	.byte	0x1
	.byte	0xb
	.4byte	0x226
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0
	.uleb128 0x5
	.4byte	.LASF33
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x1
	.byte	0xf
	.4byte	0x203
	.uleb128 0x10
	.4byte	.LASF35
	.2byte	0x174
	.byte	0x1
	.byte	0x11
	.4byte	0x2dc
	.uleb128 0xa
	.ascii	"cid\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"sid\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x1
	.byte	0x14
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x1
	.byte	0x15
	.4byte	0x2c
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x1
	.byte	0x16
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x1
	.byte	0x17
	.4byte	0x2c
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x1
	.byte	0x18
	.4byte	0x2c
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x1
	.byte	0x19
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x1
	.byte	0x1b
	.4byte	0x2c
	.byte	0x24
	.uleb128 0xa
	.ascii	"psp\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x1d2
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x1
	.byte	0x1d
	.4byte	0x191
	.byte	0xcc
	.uleb128 0x11
	.4byte	.LASF45
	.byte	0x1
	.byte	0x1e
	.4byte	0x226
	.2byte	0x170
	.byte	0
	.uleb128 0x8
	.4byte	.LASF46
	.byte	0x10
	.byte	0x1
	.byte	0x21
	.4byte	0x319
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x1
	.byte	0x23
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x1
	.byte	0x24
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x1
	.byte	0x25
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0x12
	.4byte	.LASF57
	.byte	0x1
	.byte	0x80
	.4byte	0x2c
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x395
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.byte	0x80
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.4byte	.LASF37
	.byte	0x1
	.byte	0x80
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0x80
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x1
	.byte	0x80
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x2dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.byte	0x83
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF49
	.byte	0x1
	.byte	0x84
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x16
	.4byte	.LASF58
	.byte	0x1
	.byte	0x71
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e6
	.uleb128 0x15
	.4byte	.LASF50
	.byte	0x1
	.byte	0x73
	.4byte	0x231
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x14
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x74
	.4byte	0x2dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x75
	.4byte	0x2c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -404
	.uleb128 0x15
	.4byte	.LASF51
	.byte	0x1
	.byte	0x76
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF59
	.byte	0x1
	.byte	0x37
	.4byte	0x2c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x450
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0x37
	.4byte	0x450
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x456
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF52
	.byte	0x1
	.byte	0x37
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x15
	.4byte	.LASF21
	.byte	0x1
	.byte	0x64
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x231
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2dc
	.uleb128 0x1a
	.4byte	.LASF60
	.byte	0x1
	.byte	0x28
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0x28
	.4byte	0x450
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
	.uleb128 0x4
	.byte	0x1
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
	.uleb128 0x9
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
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x10
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
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
.LASF11:
	.ascii	"NODE_ENTER\000"
.LASF39:
	.ascii	"train\000"
.LASF58:
	.ascii	"precise_stop_task\000"
.LASF19:
	.ascii	"track_edge\000"
.LASF20:
	.ascii	"dest\000"
.LASF45:
	.ascii	"state\000"
.LASF54:
	.ascii	"src/tasks/data_collection/precise_stop.c\000"
.LASF23:
	.ascii	"sizetype\000"
.LASF32:
	.ascii	"PS_NEITHER\000"
.LASF42:
	.ascii	"delay\000"
.LASF18:
	.ascii	"edge\000"
.LASF10:
	.ascii	"NODE_MERGE\000"
.LASF8:
	.ascii	"NODE_SENSOR\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF47:
	.ascii	"sensor\000"
.LASF31:
	.ascii	"PreciseState\000"
.LASF28:
	.ascii	"PathSwitchPositions\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF14:
	.ascii	"track_node\000"
.LASF51:
	.ascii	"datalen\000"
.LASF29:
	.ascii	"positions\000"
.LASF9:
	.ascii	"NODE_BRANCH\000"
.LASF26:
	.ascii	"stations\000"
.LASF22:
	.ascii	"char\000"
.LASF33:
	.ascii	"PS_STOP\000"
.LASF27:
	.ascii	"distances\000"
.LASF37:
	.ascii	"source\000"
.LASF35:
	.ascii	"Data\000"
.LASF15:
	.ascii	"name\000"
.LASF57:
	.ascii	"getAccurateStopTime\000"
.LASF25:
	.ascii	"length\000"
.LASF7:
	.ascii	"NODE_NONE\000"
.LASF60:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF41:
	.ascii	"overshot\000"
.LASF16:
	.ascii	"type\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF40:
	.ascii	"speed\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF55:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF21:
	.ascii	"dist\000"
.LASF36:
	.ascii	"prevtime\000"
.LASF17:
	.ascii	"reverse\000"
.LASF34:
	.ascii	"PS_INSPECT\000"
.LASF49:
	.ascii	"answer\000"
.LASF24:
	.ascii	"TrackPath\000"
.LASF46:
	.ascii	"Message\000"
.LASF50:
	.ascii	"data\000"
.LASF30:
	.ascii	"TaskSize\000"
.LASF38:
	.ascii	"destination\000"
.LASF48:
	.ascii	"child\000"
.LASF59:
	.ascii	"handle\000"
.LASF52:
	.ascii	"size\000"
.LASF43:
	.ascii	"client\000"
.LASF56:
	.ascii	"track_nodes\000"
.LASF12:
	.ascii	"NODE_EXIT\000"
.LASF44:
	.ascii	"path\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF53:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF13:
	.ascii	"node_type\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
