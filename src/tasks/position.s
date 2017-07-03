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
	.global	__aeabi_fcmplt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	float_abs, %function
float_abs:
.LFB2:
	.file 1 "src/tasks/position.c"
	.loc 1 18 0
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
	str	r0, [fp, #-8]	@ float
	.loc 1 18 0
	mov	r1, #0
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fcmplt(PLT)
.LVL0:
	mov	r3, r0
	cmp	r3, #0
	beq	.L6
	.loc 1 18 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	eor	r3, r3, #-2147483648
	b	.L4
.L6:
	.loc 1 18 0 discriminator 2
	ldr	r3, [fp, #-8]	@ float
.L4:
	.loc 1 18 0
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
	.size	float_abs, .-float_abs
	.global	__aeabi_i2f
	.global	__aeabi_f2d
	.global	__aeabi_ddiv
	.global	__aeabi_d2f
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CLOCK\000"
	.align	2
.LC1:
	.ascii	"SENSOR\000"
	.align	2
.LC2:
	.ascii	"SWITCH\000"
	.align	2
.LC3:
	.ascii	"POSITION\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB3:
	.loc 1 21 0 is_stmt 1
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	.loc 1 23 0
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	.loc 1 24 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L8
.L9:
	.loc 1 25 0 discriminator 3
	ldr	r1, [fp, #-20]
	mov	r2, r1
	lsl	r2, r2, #9
	sub	r2, r2, r1
	lsl	r2, r2, #2
	add	r2, r2, r1
	lsl	r3, r2, #9
	sub	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	add	r3, r3, #12288
	add	r3, r3, #57
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	__aeabi_i2f(PLT)
.LVL1:
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d(PLT)
.LVL2:
	ldr	r2, .L12
	ldr	r3, .L12+4
	bl	__aeabi_ddiv(PLT)
.LVL3:
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f(PLT)
.LVL4:
	mov	r3, r0
	mov	r0, r3
	bl	float_abs(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	str	r1, [r3, r2, lsl #2]	@ float
	.loc 1 24 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L8:
	.loc 1 24 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	ldr	r2, .L12+8
	cmp	r3, r2
	ble	.L9
	.loc 1 26 0 is_stmt 1
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L10
.L11:
	.loc 1 27 0 discriminator 3
	ldr	r1, [fp, #-20]
	mov	r2, r1
	lsl	r2, r2, #9
	sub	r2, r2, r1
	lsl	r2, r2, #2
	add	r2, r2, r1
	lsl	r3, r2, #9
	sub	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	add	r3, r3, #12288
	add	r3, r3, #57
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	__aeabi_i2f(PLT)
.LVL5:
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d(PLT)
.LVL6:
	ldr	r2, .L12
	ldr	r3, .L12+4
	bl	__aeabi_ddiv(PLT)
.LVL7:
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f(PLT)
.LVL8:
	mov	r3, r0
	mov	r0, r3
	bl	float_abs(PLT)
	mov	r1, r0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2432
	add	r3, r3, #8
	str	r1, [r2, r3, lsl #2]	@ float
	.loc 1 26 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	.loc 1 26 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #19
	ble	.L11
	.loc 1 29 0 is_stmt 1
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	initPositionCalculator(PLT)
	.loc 1 31 0
	ldr	r3, .L12+12
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	add	r3, r3, #16384
	str	r2, [r3, #1960]
	.loc 1 33 0
	ldr	r3, .L12+16
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	registerForSensorFlips(PLT)
	.loc 1 34 0
	ldr	r3, .L12+20
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	registerForSwitchFlips(PLT)
	.loc 1 36 0
	ldr	r3, .L12+24
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 1 37 0
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
.L13:
	.align	2
.L12:
	.word	-4194304
	.word	1105199103
	.word	2439
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC3+8)
	.cfi_endproc
.LFE3:
	.size	initialize, .-initialize
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Hit %d at %d\012\015\000"
	.align	2
.LC5:
	.ascii	"Expect to hit next sensor at t+%d\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB4:
	.loc 1 40 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #12
	.cfi_def_cfa 11, 4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 41 0
	ldr	r3, [fp, #-36]
	cmp	r3, #4
	bne	.L15
	.loc 1 42 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
	.loc 1 43 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L19
	.loc 1 44 0
	ldr	r3, [fp, #-32]
	ldr	r4, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #16384
	ldr	r3, [r3, #1960]
	mov	r0, r3
	bl	Time(PLT)
	mov	r3, r0
	mov	r2, r3
	mov	r1, r4
	ldr	r3, .L20
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 45 0
	ldr	r4, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	sub	r5, r3, #1
	ldr	r3, [fp, #-24]
	add	r3, r3, #16384
	ldr	r3, [r3, #1960]
	mov	r0, r3
	bl	Time(PLT)
	mov	r2, r0
	mov	r3, #1
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #70
	mov	r1, r5
	mov	r0, r4
	bl	registerSensorTrigger(PLT)
	.loc 1 46 0
	ldr	r3, [fp, #-24]
	mov	r1, #70
	mov	r0, r3
	bl	getExpectedNextSensorTime(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L20+4
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 55 0
	b	.L19
.L15:
	.loc 1 48 0
	ldr	r3, [fp, #-36]
	cmp	r3, #2
	bne	.L18
	.loc 1 49 0
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	and	r1, r3, #255
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	and	r3, r3, #256
	mov	r2, r3
	bl	registerSwitchState(PLT)
	.loc 1 50 0
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	learnPositions(PLT)
	.loc 1 55 0
	b	.L19
.L18:
.LBB2:
	.loc 1 52 0
	ldr	r4, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #16384
	ldr	r3, [r3, #1960]
	mov	r0, r3
	bl	Time(PLT)
	mov	r3, r0
	sub	r0, fp, #20
	mov	r2, #70
	mov	r1, r4
	bl	getPosition(PLT)
	.loc 1 53 0
	sub	r3, fp, #20
	mov	r2, #8
	mov	r1, r3
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
.L19:
.LBE2:
	.loc 1 55 0
	nop
	sub	sp, fp, #12
	.cfi_def_cfa 13, 16
	@ sp needed
	pop	{r4, r5, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LC4-(.LPIC4+8)
	.word	.LC5-(.LPIC5+8)
	.cfi_endproc
.LFE4:
	.size	handle, .-handle
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 1 57 0
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
	.loc 1 57 0
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
.LFE5:
	.size	server_initialize, .-server_initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_work, %function
server_work:
.LFB6:
	.loc 1 57 0
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
	.loc 1 57 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #18176
	add	r3, r3, #172
	sub	r0, fp, #12
	mov	r2, #4
	mov	r1, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #18176
	add	r2, r2, #172
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
.LFE6:
	.size	server_work, .-server_work
	.section	.rodata
	.align	2
.LC6:
	.ascii	"position_server\000"
	.align	2
.LC7:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	position_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	position_server, %function
position_server:
.LFB7:
	.loc 1 57 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 18352
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #18176
	sub	sp, sp, #176
	.loc 1 57 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L26
.LPIC6:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L26+4
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #18176
	sub	r3, r3, #4
	sub	r3, r3, #176
	mov	r0, r3
	bl	server_initialize(PLT)
.L25:
	.loc 1 57 0 is_stmt 0 discriminator 2
	sub	r3, fp, #18176
	sub	r3, r3, #4
	sub	r3, r3, #176
	mov	r0, r3
	bl	server_work(PLT)
	b	.L25
.L27:
	.align	2
.L26:
	.word	.LC6-(.LPIC6+8)
	.word	.LC7-(.LPIC7+8)
	.cfi_endproc
.LFE7:
	.size	position_server, .-position_server
.Letext0:
	.file 2 "src/util/ai/mlp.h"
	.file 3 "src/util/ai/intersensorTime.h"
	.file 4 "src/util/ai/position.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5b4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0xc
	.4byte	.LASF65
	.4byte	.LASF66
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x14
	.byte	0x2
	.byte	0x4
	.4byte	0x83
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x5
	.4byte	0x2c
	.byte	0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x6
	.4byte	0x83
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x7
	.4byte	0x89
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.4byte	0x89
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x9
	.4byte	0x89
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x89
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF7
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x2
	.byte	0xa
	.4byte	0x9b
	.uleb128 0x6
	.byte	0x4
	.4byte	0x3a
	.uleb128 0x8
	.4byte	.LASF67
	.byte	0x1
	.4byte	0x33
	.byte	0x2
	.byte	0xc
	.4byte	0xca
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.4byte	0x12b
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x2
	.byte	0x14
	.4byte	0x12b
	.byte	0
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x2
	.byte	0x15
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x2
	.byte	0x16
	.4byte	0x131
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x2
	.byte	0x17
	.4byte	0x137
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x2
	.byte	0x18
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x2
	.byte	0x19
	.4byte	0x2c
	.byte	0x14
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x2
	.byte	0x1a
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x90
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x6
	.byte	0x4
	.4byte	0xa1
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x2
	.byte	0x1b
	.4byte	0xca
	.uleb128 0xa
	.4byte	.LASF23
	.2byte	0x284c
	.byte	0x3
	.byte	0x10
	.4byte	0x1c9
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x3
	.byte	0x11
	.4byte	0x1c9
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.byte	0x12
	.4byte	0x1e1
	.2byte	0x2620
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.byte	0x13
	.4byte	0x1f1
	.2byte	0x2670
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.byte	0x14
	.4byte	0x201
	.2byte	0x2800
	.uleb128 0xc
	.ascii	"nn\000"
	.byte	0x3
	.byte	0x15
	.4byte	0x13d
	.2byte	0x2814
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x3
	.byte	0x16
	.4byte	0x211
	.2byte	0x2830
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x3
	.byte	0x17
	.4byte	0x221
	.2byte	0x2838
	.uleb128 0xb
	.4byte	.LASF3
	.byte	0x3
	.byte	0x18
	.4byte	0x231
	.2byte	0x2840
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.byte	0x19
	.4byte	0x241
	.2byte	0x2848
	.byte	0
	.uleb128 0xd
	.4byte	0x89
	.4byte	0x1da
	.uleb128 0xe
	.4byte	0x1da
	.2byte	0x987
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF29
	.uleb128 0xd
	.4byte	0x89
	.4byte	0x1f1
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.4byte	0x3a
	.4byte	0x201
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.4byte	0x3a
	.4byte	0x211
	.uleb128 0xf
	.4byte	0x1da
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x2c
	.4byte	0x221
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x9b
	.4byte	0x231
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x83
	.4byte	0x241
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0xa1
	.4byte	0x251
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x3
	.byte	0x1a
	.4byte	0x148
	.uleb128 0xa
	.4byte	.LASF30
	.2byte	0x1e8
	.byte	0x3
	.byte	0x1c
	.4byte	0x29d
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x3
	.byte	0x1d
	.4byte	0x29d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x3
	.byte	0x1e
	.4byte	0x2ad
	.2byte	0x140
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x3
	.byte	0x1f
	.4byte	0x2bd
	.2byte	0x198
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x3
	.byte	0x20
	.4byte	0x2cd
	.2byte	0x1b0
	.byte	0
	.uleb128 0xd
	.4byte	0x89
	.4byte	0x2ad
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x4f
	.byte	0
	.uleb128 0xd
	.4byte	0x89
	.4byte	0x2bd
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x15
	.byte	0
	.uleb128 0xd
	.4byte	0x89
	.4byte	0x2cd
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x5
	.byte	0
	.uleb128 0xd
	.4byte	0x89
	.4byte	0x2dd
	.uleb128 0xf
	.4byte	0x1da
	.byte	0xd
	.byte	0
	.uleb128 0xa
	.4byte	.LASF35
	.2byte	0x1ec
	.byte	0x4
	.byte	0x8
	.4byte	0x304
	.uleb128 0x5
	.4byte	.LASF36
	.byte	0x4
	.byte	0x9
	.4byte	0x25c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x4
	.byte	0xa
	.4byte	0x2c
	.2byte	0x1e8
	.byte	0
	.uleb128 0xa
	.4byte	.LASF38
	.2byte	0x47a8
	.byte	0x4
	.byte	0xd
	.4byte	0x3a1
	.uleb128 0x10
	.ascii	"n\000"
	.byte	0x4
	.byte	0xe
	.4byte	0x251
	.byte	0
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x4
	.byte	0xf
	.4byte	0x3a1
	.2byte	0x284c
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x4
	.byte	0x10
	.4byte	0x3a1
	.2byte	0x2864
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x4
	.byte	0x11
	.4byte	0x3a1
	.2byte	0x287c
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x4
	.byte	0x12
	.4byte	0x3a1
	.2byte	0x2894
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x4
	.byte	0x13
	.4byte	0x3a1
	.2byte	0x28ac
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x4
	.byte	0x14
	.4byte	0x3a1
	.2byte	0x28c4
	.uleb128 0x11
	.4byte	.LASF68
	.byte	0x4
	.byte	0x15
	.4byte	0x25
	.byte	0x4
	.byte	0x16
	.byte	0xa
	.2byte	0x28dc
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x4
	.byte	0x18
	.4byte	0x3b1
	.2byte	0x28e0
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x4
	.byte	0x19
	.4byte	0x2c
	.2byte	0x47a0
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x4
	.byte	0x1a
	.4byte	0x2c
	.2byte	0x47a4
	.byte	0
	.uleb128 0xd
	.4byte	0x2c
	.4byte	0x3b1
	.uleb128 0xf
	.4byte	0x1da
	.byte	0x5
	.byte	0
	.uleb128 0xd
	.4byte	0x2dd
	.4byte	0x3c1
	.uleb128 0xf
	.4byte	0x1da
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.4byte	.LASF38
	.byte	0x4
	.byte	0x1b
	.4byte	0x304
	.uleb128 0x4
	.4byte	.LASF48
	.byte	0x8
	.byte	0x4
	.byte	0x1d
	.4byte	0x3f1
	.uleb128 0x5
	.4byte	.LASF49
	.byte	0x4
	.byte	0x1e
	.4byte	0x2c
	.byte	0
	.uleb128 0x5
	.4byte	.LASF50
	.byte	0x4
	.byte	0x1f
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF51
	.2byte	0x47ac
	.byte	0x1
	.byte	0x9
	.4byte	0x417
	.uleb128 0x10
	.ascii	"pc\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x3c1
	.byte	0
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x1
	.byte	0xb
	.4byte	0x2c
	.2byte	0x47a8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF53
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.4byte	0x430
	.uleb128 0x5
	.4byte	.LASF54
	.byte	0x1
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF55
	.2byte	0x47b0
	.byte	0x1
	.byte	0x39
	.4byte	0x457
	.uleb128 0x5
	.4byte	.LASF56
	.byte	0x1
	.byte	0x39
	.4byte	0x3f1
	.byte	0
	.uleb128 0xc
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x417
	.2byte	0x47ac
	.byte	0
	.uleb128 0x12
	.4byte	.LASF69
	.byte	0x1
	.byte	0x39
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47d
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x1
	.byte	0x39
	.4byte	0x430
	.uleb128 0x4
	.byte	0x91
	.sleb128 -18360
	.byte	0
	.uleb128 0x14
	.4byte	.LASF59
	.byte	0x1
	.byte	0x39
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4bd
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x39
	.4byte	0x4bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.byte	0x39
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x430
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x1
	.byte	0x39
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e7
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x39
	.4byte	0x4bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF61
	.byte	0x1
	.byte	0x27
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x54d
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x27
	.4byte	0x54d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.4byte	.LASF2
	.byte	0x1
	.byte	0x27
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x16
	.ascii	"pos\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x3cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x3f1
	.uleb128 0x6
	.byte	0x4
	.4byte	0x417
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x1
	.byte	0x14
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x595
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x14
	.4byte	0x54d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii	"r\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF63
	.byte	0x1
	.byte	0x12
	.4byte	0x89
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.ascii	"x\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x89
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
.LASF8:
	.ascii	"AF_RELU\000"
.LASF7:
	.ascii	"float\000"
.LASF11:
	.ascii	"AF_LINEAR\000"
.LASF38:
	.ascii	"PositionCalculator\000"
.LASF31:
	.ascii	"isLast\000"
.LASF23:
	.ascii	"ISTNetwork\000"
.LASF60:
	.ascii	"server_initialize\000"
.LASF46:
	.ascii	"history_size\000"
.LASF29:
	.ascii	"sizetype\000"
.LASF20:
	.ascii	"maxLayer\000"
.LASF22:
	.ascii	"NeuralNetwork\000"
.LASF45:
	.ascii	"history\000"
.LASF63:
	.ascii	"float_abs\000"
.LASF36:
	.ascii	"value\000"
.LASF9:
	.ascii	"AF_SOFTPLUS\000"
.LASF54:
	.ascii	"sensor\000"
.LASF50:
	.ascii	"sensorId\000"
.LASF4:
	.ascii	"bias\000"
.LASF12:
	.ascii	"PerceptronNode\000"
.LASF28:
	.ascii	"layerSizes\000"
.LASF58:
	.ascii	"datalen\000"
.LASF44:
	.ascii	"initTimes\000"
.LASF68:
	.ascii	"switches\000"
.LASF51:
	.ascii	"Data\000"
.LASF6:
	.ascii	"last_doutput\000"
.LASF33:
	.ascii	"isTrain\000"
.LASF69:
	.ascii	"position_server\000"
.LASF26:
	.ascii	"layer\000"
.LASF62:
	.ascii	"initialize\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF34:
	.ascii	"isSpeed\000"
.LASF21:
	.ascii	"NNLayer\000"
.LASF10:
	.ascii	"AF_SIGMOID\000"
.LASF18:
	.ascii	"outputs\000"
.LASF32:
	.ascii	"isCurved\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF40:
	.ascii	"speed\000"
.LASF19:
	.ascii	"inputs\000"
.LASF66:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF56:
	.ascii	"user\000"
.LASF49:
	.ascii	"distance\000"
.LASF14:
	.ascii	"layers\000"
.LASF67:
	.ascii	"ActivationFunction\000"
.LASF30:
	.ascii	"ISTNetworkInputs\000"
.LASF25:
	.ascii	"layer_weights\000"
.LASF24:
	.ascii	"input_weights\000"
.LASF16:
	.ascii	"numNodes\000"
.LASF39:
	.ascii	"lastSensor\000"
.LASF53:
	.ascii	"Message\000"
.LASF57:
	.ascii	"data\000"
.LASF52:
	.ascii	"clock\000"
.LASF41:
	.ascii	"newSpeed\000"
.LASF5:
	.ascii	"last_output\000"
.LASF3:
	.ascii	"weights\000"
.LASF47:
	.ascii	"history_idx\000"
.LASF61:
	.ascii	"handle\000"
.LASF2:
	.ascii	"size\000"
.LASF35:
	.ascii	"PositionDatum\000"
.LASF27:
	.ascii	"output_layer\000"
.LASF55:
	.ascii	"server_Data\000"
.LASF42:
	.ascii	"newSpeedTime\000"
.LASF37:
	.ascii	"time\000"
.LASF17:
	.ascii	"activators\000"
.LASF48:
	.ascii	"Position\000"
.LASF13:
	.ascii	"MultilayerPerceptron\000"
.LASF64:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF65:
	.ascii	"src/tasks/position.c\000"
.LASF59:
	.ascii	"server_work\000"
.LASF43:
	.ascii	"expectedTimes\000"
.LASF15:
	.ascii	"numLayers\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
