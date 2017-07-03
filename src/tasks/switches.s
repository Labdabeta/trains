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
	.file	"switches.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CLOCK\000"
	.align	2
.LC1:
	.ascii	"SWITCH\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB0:
	.file 1 "src/tasks/switches.c"
	.loc 1 19 0
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
	.loc 1 21 0
	ldr	r3, .L4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-12]
	.loc 1 22 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #64]
	.loc 1 24 0
	ldr	r3, .L4+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 1 26 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	.loc 1 27 0 discriminator 3
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	add	r3, r3, #1
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, #33
	bl	tput2(PLT)
	.loc 1 28 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #68
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 29 0 discriminator 3
	mov	r1, #5
	ldr	r0, [fp, #-12]
	bl	Delay(PLT)
	.loc 1 26 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 26 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #21
	ble	.L3
	.loc 1 31 0 is_stmt 1
	mov	r0, #32
	bl	tputc(PLT)
	.loc 1 32 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE0:
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB1:
	.loc 1 35 0
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
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 38 0
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L8
	cmp	r3, #1
	beq	.L9
	b	.L7
.L8:
	.loc 1 40 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #64]
	add	r1, r3, #1
	ldr	r2, [fp, #-24]
	str	r1, [r2, #64]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-28]
	str	r1, [r2, r3, lsl #2]
	.loc 1 41 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
	.loc 1 42 0
	b	.L10
.L9:
	.loc 1 44 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	str	r3, [fp, #-12]
	.loc 1 45 0
	sub	r3, fp, #12
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
.L7:
	.loc 1 47 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L11
	.loc 1 48 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
	b	.L12
.L11:
	.loc 1 50 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
.L12:
	.loc 1 51 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r2, [fp, #-32]
	ldr	r2, [r2]
	mvn	r2, r2
	lsr	r2, r2, #31
	and	r2, r2, #255
	mov	r1, r2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3, #68]
	.loc 1 53 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L14:
.LBB2:
	.loc 1 54 0 discriminator 3
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	strb	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	strb	r3, [fp, #-15]
	.loc 1 55 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r0, [r3, r2, lsl #2]
	sub	r1, fp, #16
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #2
	bl	Send(PLT)
.LBE2:
	.loc 1 53 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	.loc 1 53 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L14
	.loc 1 58 0 is_stmt 1
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
.L10:
	.loc 1 60 0
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
.LFE1:
	.size	handle, .-handle
	.align	2
	.global	flipSwitch
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipSwitch, %function
flipSwitch:
.LFB2:
	.loc 1 63 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	.loc 1 64 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L16
	.loc 1 64 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
.L16:
	.loc 1 65 0 is_stmt 1
	sub	r1, fp, #12
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-8]
	bl	Send(PLT)
	.loc 1 66 0
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
.LFE2:
	.size	flipSwitch, .-flipSwitch
	.align	2
	.global	registerForSwitchFlips
	.syntax unified
	.arm
	.fpu softvfp
	.type	registerForSwitchFlips, %function
registerForSwitchFlips:
.LFB3:
	.loc 1 69 0
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
	.loc 1 70 0
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-8]
	bl	Send(PLT)
	.loc 1 71 0
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
	.size	registerForSwitchFlips, .-registerForSwitchFlips
	.align	2
	.global	getSwitchState
	.syntax unified
	.arm
	.fpu softvfp
	.type	getSwitchState, %function
getSwitchState:
.LFB4:
	.loc 1 74 0
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
	.loc 1 76 0
	sub	r2, fp, #8
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 77 0
	ldr	r3, [fp, #-8]
	.loc 1 78 0
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
.LFE4:
	.size	getSwitchState, .-getSwitchState
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 1 80 0
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
	.loc 1 80 0
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
	.loc 1 80 0
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
	.loc 1 80 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #92
	sub	r3, fp, #12
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #92
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
.LC2:
	.ascii	"switches\000"
	.align	2
.LC3:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	switches
	.syntax unified
	.arm
	.fpu softvfp
	.type	switches, %function
switches:
.LFB7:
	.loc 1 80 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #96
	.loc 1 80 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L24
.LPIC2:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L24+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #100
	mov	r0, r3
	bl	server_initialize(PLT)
.L23:
	.loc 1 80 0 is_stmt 0 discriminator 2
	sub	r3, fp, #100
	mov	r0, r3
	bl	server_work(PLT)
	b	.L23
.L25:
	.align	2
.L24:
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC3+8)
	.cfi_endproc
.LFE7:
	.size	switches, .-switches
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2df
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0xc
	.4byte	.LASF23
	.4byte	.LASF24
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
	.4byte	.LASF7
	.byte	0x5c
	.byte	0x1
	.byte	0x6
	.4byte	0x6b
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x1
	.byte	0x7
	.4byte	0x6b
	.byte	0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.byte	0x40
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x9
	.4byte	0x82
	.byte	0x44
	.byte	0
	.uleb128 0x6
	.4byte	0x2c
	.4byte	0x7b
	.uleb128 0x7
	.4byte	0x7b
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x6
	.4byte	0x92
	.4byte	0x92
	.uleb128 0x7
	.4byte	0x7b
	.byte	0x15
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.4byte	0xb2
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x60
	.byte	0x1
	.byte	0x50
	.4byte	0xd7
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x1
	.byte	0x50
	.4byte	0x3a
	.byte	0
	.uleb128 0x8
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x99
	.byte	0x5c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF4
	.byte	0x1
	.byte	0x50
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfc
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x50
	.4byte	0xb2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x50
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13c
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x50
	.4byte	0x13c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x50
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0xb2
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x50
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x166
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x50
	.4byte	0x13c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0x49
	.4byte	0x2c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a9
	.uleb128 0x10
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii	"sw\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x4b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x44
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cd
	.uleb128 0x10
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3e
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20c
	.uleb128 0x10
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii	"sw\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x22
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28c
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x22
	.4byte	0x28c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.ascii	"m\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x292
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x25
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xd
	.ascii	"rpl\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x298
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x3a
	.uleb128 0xe
	.byte	0x4
	.4byte	0x99
	.uleb128 0x6
	.4byte	0x92
	.4byte	0x2a8
	.uleb128 0x7
	.4byte	0x7b
	.byte	0x1
	.byte	0
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x1
	.byte	0x12
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x12
	.4byte	0x28c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"i\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.ascii	"cid\000"
	.byte	0x1
	.byte	0x15
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
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
.LASF23:
	.ascii	"src/tasks/switches.c\000"
.LASF15:
	.ascii	"server_initialize\000"
.LASF5:
	.ascii	"sizetype\000"
.LASF2:
	.ascii	"client_tids\000"
.LASF17:
	.ascii	"flipSwitch\000"
.LASF4:
	.ascii	"switches\000"
.LASF13:
	.ascii	"datalen\000"
.LASF21:
	.ascii	"client\000"
.LASF18:
	.ascii	"curved\000"
.LASF7:
	.ascii	"Data\000"
.LASF26:
	.ascii	"initialize\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF24:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF11:
	.ascii	"user\000"
.LASF6:
	.ascii	"char\000"
.LASF12:
	.ascii	"data\000"
.LASF9:
	.ascii	"query\000"
.LASF25:
	.ascii	"getSwitchState\000"
.LASF3:
	.ascii	"num_clients\000"
.LASF16:
	.ascii	"registerForSwitchFlips\000"
.LASF19:
	.ascii	"handle\000"
.LASF20:
	.ascii	"size\000"
.LASF10:
	.ascii	"server_Data\000"
.LASF8:
	.ascii	"Message\000"
.LASF22:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF14:
	.ascii	"server_work\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
