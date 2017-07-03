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
	.file	"clock_server.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqInit, %function
pqInit:
.LFB1:
	.file 1 "src/util/data/pq.h"
	.loc 1 24 0
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
	.loc 1 24 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3]
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
	.size	pqInit, .-pqInit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqSize, %function
pqSize:
.LFB2:
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
	.loc 1 35 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	pqSize, .-pqSize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqGetMin, %function
pqGetMin:
.LFB3:
	.loc 1 45 0
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
	.loc 1 45 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE3:
	.size	pqGetMin, .-pqGetMin
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqGetMinPriority, %function
pqGetMinPriority:
.LFB4:
	.loc 1 55 0
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
	.loc 1 55 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
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
	.size	pqGetMinPriority, .-pqGetMinPriority
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CLOCK\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB5:
	.file 2 "src/tasks/drivers/clock_server.c"
	.loc 2 26 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r4, .L9
.LPIC1:
	add	r4, pc, r4
	.loc 2 27 0
	ldr	r3, .L9+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 2 28 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3]
	.loc 2 29 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	mov	r0, r3
	bl	pqInit(PLT)
	.loc 2 31 0
	mov	r2, #4
	ldr	r3, .L9+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	.loc 2 32 0
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
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+8)
	.word	.LC0-(.LPIC0+8)
	.word	clock_courier(GOT)
	.cfi_endproc
.LFE5:
	.size	initialize, .-initialize
	.section	.rodata
	.align	2
.LC1:
	.ascii	"src/tasks/drivers/clock_server.c\000"
	.align	2
.LC2:
	.ascii	"%s@%s:%d\012\015\000"
	.align	2
.LC3:
	.ascii	"ERROR: Invalid code (%d) passed to clock server fro"
	.ascii	"m %d.\000"
	.align	2
.LC4:
	.ascii	"\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB6:
	.loc 2 35 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	.loc 2 37 0
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L12
.L14:
	b	.L13
	b	.L15
	b	.L16
	b	.L17
	.p2align 1
.L13:
	.loc 2 39 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-12]
	bl	Reply(PLT)
	.loc 2 40 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 2 41 0
	b	.L18
.L20:
	.loc 2 42 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r0, r3
	bl	pqGetMin(PLT)
	mov	r3, r0
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 2 43 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r0, r3
	bl	pqPop(PLT)
.L18:
	.loc 2 41 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r0, r3
	bl	pqSize(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L22
	.loc 2 41 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r0, r3
	bl	pqGetMinPriority(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L20
	.loc 2 45 0 is_stmt 1
	b	.L22
.L15:
	.loc 2 47 0
	ldr	r3, [fp, #-8]
	add	r0, r3, #4
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	mov	r1, r3
	bl	pqInsert(PLT)
	.loc 2 48 0
	b	.L21
.L16:
	.loc 2 50 0
	ldr	r3, [fp, #-8]
	add	r0, r3, #4
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	mov	r1, r3
	bl	pqInsert(PLT)
	.loc 2 51 0
	b	.L21
.L17:
	.loc 2 53 0
	ldr	r3, [fp, #-8]
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	Reply(PLT)
	.loc 2 54 0
	b	.L21
.L12:
	.loc 2 56 0
	mov	r3, #56
	ldr	r2, .L23
.LPIC2:
	add	r2, pc, r2
	ldr	r1, .L23+4
.LPIC3:
	add	r1, pc, r1
	ldr	r0, .L23+8
.LPIC4:
	add	r0, pc, r0
	bl	tfp_dprintf(PLT)
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	mov	r1, r3
	ldr	r3, .L23+12
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	ldr	r3, .L23+16
.LPIC6:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 2 58 0
	b	.L21
.L22:
	.loc 2 45 0
	nop
.L21:
	.loc 2 58 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L24:
	.align	2
.L23:
	.word	__func__.4509-(.LPIC2+8)
	.word	.LC1-(.LPIC3+8)
	.word	.LC2-(.LPIC4+8)
	.word	.LC3-(.LPIC5+8)
	.word	.LC4-(.LPIC6+8)
	.cfi_endproc
.LFE6:
	.size	handle, .-handle
	.align	2
	.global	sendTick
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendTick, %function
sendTick:
.LFB7:
	.loc 2 61 0
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
	.loc 2 63 0
	mov	r3, #0
	strb	r3, [fp, #-8]
	.loc 2 65 0
	sub	r1, fp, #12
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #8
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 2 66 0
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
	.size	sendTick, .-sendTick
	.align	2
	.global	sendDelay
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendDelay, %function
sendDelay:
.LFB8:
	.loc 2 69 0
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
	.loc 2 71 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	.loc 2 72 0
	mov	r3, #1
	strb	r3, [fp, #-8]
	.loc 2 74 0
	sub	r1, fp, #12
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #8
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 2 75 0
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
.LFE8:
	.size	sendDelay, .-sendDelay
	.align	2
	.global	sendDelayUntil
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendDelayUntil, %function
sendDelayUntil:
.LFB9:
	.loc 2 78 0
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
	.loc 2 80 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	.loc 2 81 0
	mov	r3, #2
	strb	r3, [fp, #-8]
	.loc 2 83 0
	sub	r1, fp, #12
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #8
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 2 84 0
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
	.size	sendDelayUntil, .-sendDelayUntil
	.align	2
	.global	sendGetTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendGetTime, %function
sendGetTime:
.LFB10:
	.loc 2 87 0
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
	str	r0, [fp, #-24]
	.loc 2 91 0
	mov	r3, #3
	strb	r3, [fp, #-8]
	.loc 2 93 0
	sub	r2, fp, #16
	sub	r1, fp, #12
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #8
	ldr	r0, [fp, #-24]
	bl	Send(PLT)
	.loc 2 95 0
	ldr	r3, [fp, #-16]
	.loc 2 96 0
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
.LFE10:
	.size	sendGetTime, .-sendGetTime
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB11:
	.loc 2 98 0
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
	.loc 2 98 0
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
.LFE11:
	.size	server_initialize, .-server_initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_work, %function
server_work:
.LFB12:
	.loc 2 98 0
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
	.loc 2 98 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #608
	sub	r3, fp, #12
	mov	r2, #8
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #608
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
.LFE12:
	.size	server_work, .-server_work
	.section	.rodata
	.align	2
.LC5:
	.ascii	"clock_server\000"
	.align	2
.LC6:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	clock_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	clock_server, %function
clock_server:
.LFB13:
	.loc 2 98 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 616
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #616
	.loc 2 98 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L34
.LPIC7:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L34+4
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #620
	mov	r0, r3
	bl	server_initialize(PLT)
.L33:
	.loc 2 98 0 is_stmt 0 discriminator 2
	sub	r3, fp, #620
	mov	r0, r3
	bl	server_work(PLT)
	b	.L33
.L35:
	.align	2
.L34:
	.word	.LC5-(.LPIC7+8)
	.word	.LC6-(.LPIC8+8)
	.cfi_endproc
.LFE13:
	.size	clock_server, .-clock_server
	.section	.rodata
	.align	2
	.type	__func__.4509, %object
	.size	__func__.4509, 7
__func__.4509:
	.ascii	"handle\000"
	.text
.Letext0:
	.file 3 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x45a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0xc
	.4byte	.LASF43
	.4byte	.LASF44
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
	.4byte	.LASF17
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	0x9c
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x9
	.4byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0xa
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	.LASF12
	.2byte	0x25c
	.byte	0x1
	.byte	0xd
	.4byte	0xc2
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0xe
	.4byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0xf
	.4byte	0xc2
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	0x77
	.4byte	0xd2
	.uleb128 0xa
	.4byte	0x69
	.byte	0x4a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x1
	.byte	0x10
	.4byte	0x9c
	.uleb128 0xc
	.4byte	0xd2
	.uleb128 0x8
	.4byte	.LASF14
	.2byte	0x260
	.byte	0x2
	.byte	0x8
	.4byte	0x108
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x2
	.byte	0x9
	.4byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x2
	.byte	0xa
	.4byte	0x9c
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.4byte	0x62
	.byte	0x2
	.byte	0xd
	.4byte	0x131
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x2
	.byte	0x12
	.4byte	0x108
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x8
	.byte	0x2
	.byte	0x14
	.4byte	0x161
	.uleb128 0xd
	.ascii	"val\000"
	.byte	0x2
	.byte	0x15
	.4byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x2
	.byte	0x16
	.4byte	0x131
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	.LASF25
	.2byte	0x268
	.byte	0x2
	.byte	0x62
	.4byte	0x188
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x2
	.byte	0x62
	.4byte	0xe2
	.byte	0
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x62
	.4byte	0x13c
	.2byte	0x260
	.byte	0
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x2
	.byte	0x62
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ad
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x2
	.byte	0x62
	.4byte	0x161
	.uleb128 0x3
	.byte	0x91
	.sleb128 -624
	.byte	0
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x2
	.byte	0x62
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ed
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x2
	.byte	0x62
	.4byte	0x1ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x62
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0x62
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x161
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x2
	.byte	0x62
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x217
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x2
	.byte	0x62
	.4byte	0x1ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF45
	.byte	0x2
	.byte	0x56
	.4byte	0x2c
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25b
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x56
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x58
	.4byte	0x13c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x2
	.byte	0x59
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.4byte	.LASF32
	.byte	0x2
	.byte	0x4d
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29b
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x4d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x2
	.byte	0x4d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x4f
	.4byte	0x13c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x2
	.byte	0x44
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2db
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x44
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x2
	.byte	0x44
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x46
	.4byte	0x13c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x2
	.byte	0x3c
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30d
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x3c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x3e
	.4byte	0x13c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x2
	.byte	0x22
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x368
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x2
	.byte	0x22
	.4byte	0x368
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.ascii	"m\000"
	.byte	0x2
	.byte	0x22
	.4byte	0x36e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x2
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LASF46
	.4byte	0x384
	.uleb128 0x5
	.byte	0x3
	.4byte	__func__.4509
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0xe2
	.uleb128 0x14
	.byte	0x4
	.4byte	0x13c
	.uleb128 0x9
	.4byte	0x390
	.4byte	0x384
	.uleb128 0xa
	.4byte	0x69
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.4byte	0x374
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF36
	.uleb128 0xc
	.4byte	0x389
	.uleb128 0x11
	.4byte	.LASF37
	.byte	0x2
	.byte	0x19
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b9
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x2
	.byte	0x19
	.4byte	0x368
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.4byte	.LASF38
	.byte	0x1
	.byte	0x37
	.4byte	0x2c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e0
	.uleb128 0x16
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x3e0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0xdd
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.byte	0x2d
	.4byte	0x2c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x40d
	.uleb128 0x16
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x3e0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF40
	.byte	0x1
	.byte	0x23
	.4byte	0x2c
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x434
	.uleb128 0x16
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x3e0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF41
	.byte	0x1
	.byte	0x18
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x457
	.uleb128 0x16
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x457
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0xd2
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
.LASF15:
	.ascii	"ticks\000"
.LASF9:
	.ascii	"priority\000"
.LASF19:
	.ascii	"TMT_TICK\000"
.LASF29:
	.ascii	"server_initialize\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF31:
	.ascii	"clock_server\000"
.LASF38:
	.ascii	"pqGetMinPriority\000"
.LASF20:
	.ascii	"TMT_DELAY\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF27:
	.ascii	"datalen\000"
.LASF33:
	.ascii	"sendDelay\000"
.LASF11:
	.ascii	"PriorityQueueElement\000"
.LASF14:
	.ascii	"Data\000"
.LASF16:
	.ascii	"queue\000"
.LASF37:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF40:
	.ascii	"pqSize\000"
.LASF39:
	.ascii	"pqGetMin\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF24:
	.ascii	"type\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF45:
	.ascii	"sendGetTime\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF30:
	.ascii	"time\000"
.LASF44:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF18:
	.ascii	"TimerMessageType\000"
.LASF26:
	.ascii	"user\000"
.LASF32:
	.ascii	"sendDelayUntil\000"
.LASF36:
	.ascii	"char\000"
.LASF23:
	.ascii	"Message\000"
.LASF10:
	.ascii	"data\000"
.LASF22:
	.ascii	"TMT_TIME\000"
.LASF46:
	.ascii	"__func__\000"
.LASF17:
	.ascii	"TaskSize\000"
.LASF41:
	.ascii	"pqInit\000"
.LASF12:
	.ascii	"PriorityQueue\000"
.LASF34:
	.ascii	"sendTick\000"
.LASF35:
	.ascii	"handle\000"
.LASF13:
	.ascii	"size\000"
.LASF25:
	.ascii	"server_Data\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF43:
	.ascii	"src/tasks/drivers/clock_server.c\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF42:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF28:
	.ascii	"server_work\000"
.LASF21:
	.ascii	"TMT_DELAY_UNTIL\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
