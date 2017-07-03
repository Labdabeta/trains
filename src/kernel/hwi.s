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
	.file	"hwi.c"
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
	.bss
	.align	2
scheduler:
	.space	4
	.size	scheduler, 4
	.align	2
event_blocks:
	.space	1008
	.size	event_blocks, 1008
	.text
	.align	2
	.global	initEventBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEventBlocks, %function
initEventBlocks:
.LFB6:
	.file 2 "src/kernel/hwi.c"
	.loc 2 15 0
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
	.loc 2 17 0
	ldr	r3, .L7
.LPIC0:
	add	r3, pc, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	.loc 2 18 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	.loc 2 19 0 discriminator 3
	ldr	r3, .L7+4
.LPIC1:
	add	r3, pc, r3
	ldr	r2, [fp, #-8]
	mov	r1, #0
	str	r1, [r3, r2, lsl #4]
	.loc 2 20 0 discriminator 3
	ldr	r2, .L7+8
.LPIC2:
	add	r2, pc, r2
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 2 18 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	.loc 2 18 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #62
	ble	.L6
	.loc 2 22 0 is_stmt 1
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L8:
	.align	2
.L7:
	.word	scheduler-(.LPIC0+8)
	.word	event_blocks-(.LPIC1+8)
	.word	event_blocks-(.LPIC2+8)
	.cfi_endproc
.LFE6:
	.size	initEventBlocks, .-initEventBlocks
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableEventInterrupt, %function
enableEventInterrupt:
.LFB7:
	.loc 2 25 0
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
	strb	r3, [fp, #-5]
	.loc 2 26 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L10
	.loc 2 27 0
	ldr	r1, .L13
	ldr	r3, .L13
	ldr	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #32
	mov	r0, #1
	lsl	r3, r0, r3
	orr	r3, r2, r3
	str	r3, [r1]
	.loc 2 30 0
	b	.L12
.L10:
	.loc 2 29 0
	ldr	r1, .L13+4
	ldr	r3, .L13+4
	ldr	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r3, r0, r3
	orr	r3, r2, r3
	str	r3, [r1]
.L12:
	.loc 2 30 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L14:
	.align	2
.L13:
	.word	-2146697200
	.word	-2146762736
	.cfi_endproc
.LFE7:
	.size	enableEventInterrupt, .-enableEventInterrupt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	disableEventInterrupt, %function
disableEventInterrupt:
.LFB8:
	.loc 2 33 0
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
	strb	r3, [fp, #-5]
	.loc 2 34 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L16
	.loc 2 35 0
	ldr	r1, .L19
	ldr	r3, .L19
	ldr	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #32
	mov	r0, #1
	lsl	r3, r0, r3
	orr	r3, r2, r3
	str	r3, [r1]
	.loc 2 38 0
	b	.L18
.L16:
	.loc 2 37 0
	ldr	r1, .L19+4
	ldr	r3, .L19+4
	ldr	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r3, r0, r3
	orr	r3, r2, r3
	str	r3, [r1]
.L18:
	.loc 2 38 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L20:
	.align	2
.L19:
	.word	-2146697196
	.word	-2146762732
	.cfi_endproc
.LFE8:
	.size	disableEventInterrupt, .-disableEventInterrupt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleEvent, %function
handleEvent:
.LFB9:
	.loc 2 41 0
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
	.loc 2 42 0
	ldr	r3, .L22
.LPIC3:
	add	r3, pc, r3
	ldr	r0, [r3]
	ldr	r3, .L22+4
.LPIC4:
	add	r3, pc, r3
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #4]
	mov	r1, r3
	bl	unblockTask(PLT)
	.loc 2 43 0
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	mov	r0, r3
	bl	disableEventInterrupt(PLT)
	.loc 2 44 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L23:
	.align	2
.L22:
	.word	scheduler-(.LPIC3+8)
	.word	event_blocks-(.LPIC4+8)
	.cfi_endproc
.LFE9:
	.size	handleEvent, .-handleEvent
	.global	__ctzsi2
	.align	2
	.global	EnterHWI
	.syntax unified
	.arm
	.fpu softvfp
	.type	EnterHWI, %function
EnterHWI:
.LFB10:
	.loc 2 47 0
	.cfi_startproc
	@ Interrupt Service Routine.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	sub	lr, lr, #4
	push	{r0, r1, r2, r3, fp, ip, lr}
	.cfi_def_cfa_offset 28
	.cfi_offset 0, -28
	.cfi_offset 1, -24
	.cfi_offset 2, -20
	.cfi_offset 3, -16
	.cfi_offset 11, -12
	.cfi_offset 12, -8
	.cfi_offset 14, -4
	add	fp, sp, #24
	.cfi_def_cfa 11, 4
	sub	sp, sp, #12
	.loc 2 49 0
	b	.L25
.L26:
	.loc 2 50 0
	ldr	r3, [fp, #-32]
	mov	r0, r3
	bl	__ctzsi2(PLT)
.LVL0:
	mov	r3, r0
	mov	r0, r3
	bl	handleEvent(PLT)
.L25:
	.loc 2 49 0
	ldr	r3, .L29
	ldr	r3, [r3]
	str	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L26
	.loc 2 51 0
	b	.L27
.L28:
	.loc 2 52 0
	ldr	r3, [fp, #-32]
	mov	r0, r3
	bl	__ctzsi2(PLT)
.LVL1:
	mov	r3, r0
	add	r3, r3, #32
	mov	r0, r3
	bl	handleEvent(PLT)
.L27:
	.loc 2 51 0
	ldr	r3, .L29+4
	ldr	r3, [r3]
	str	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L28
	.loc 2 53 0
	nop
	sub	sp, fp, #24
	.cfi_def_cfa 13, 28
	@ sp needed
	ldmfd	sp!, {r0, r1, r2, r3, fp, ip, pc}^
.L30:
	.align	2
.L29:
	.word	-2146762752
	.word	-2146697216
	.cfi_endproc
.LFE10:
	.size	EnterHWI, .-EnterHWI
	.align	2
	.global	addAwait
	.syntax unified
	.arm
	.fpu softvfp
	.type	addAwait, %function
addAwait:
.LFB11:
	.loc 2 56 0
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
	mov	r3, r0
	str	r1, [fp, #-12]
	strb	r3, [fp, #-5]
	.loc 2 58 0
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldr	r3, .L32
.LPIC5:
	add	r3, pc, r3
	ldr	r1, [fp, #-12]
	str	r1, [r3, r2, lsl #4]
	.loc 2 59 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L32+4
.LPIC6:
	add	r2, pc, r2
	lsl	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 2 60 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	enableEventInterrupt(PLT)
	.loc 2 61 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L33:
	.align	2
.L32:
	.word	event_blocks-(.LPIC5+8)
	.word	event_blocks-(.LPIC6+8)
	.cfi_endproc
.LFE11:
	.size	addAwait, .-addAwait
	.align	2
	.global	addTransmit
	.syntax unified
	.arm
	.fpu softvfp
	.type	addTransmit, %function
addTransmit:
.LFB12:
	.loc 2 64 0
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
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	mov	r3, r0
	strb	r3, [fp, #-5]
	.loc 2 65 0
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldr	r3, .L35
.LPIC7:
	add	r3, pc, r3
	ldr	r1, [fp, #-12]
	str	r1, [r3, r2, lsl #4]
	.loc 2 66 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L35+4
.LPIC8:
	add	r2, pc, r2
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	.loc 2 67 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L35+8
.LPIC9:
	add	r2, pc, r2
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #8]
	.loc 2 68 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L35+12
.LPIC10:
	add	r2, pc, r2
	lsl	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #12]
	.loc 2 69 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	enableEventInterrupt(PLT)
	.loc 2 70 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L36:
	.align	2
.L35:
	.word	event_blocks-(.LPIC7+8)
	.word	event_blocks-(.LPIC8+8)
	.word	event_blocks-(.LPIC9+8)
	.word	event_blocks-(.LPIC10+8)
	.cfi_endproc
.LFE12:
	.size	addTransmit, .-addTransmit
	.align	2
	.global	addReceive
	.syntax unified
	.arm
	.fpu softvfp
	.type	addReceive, %function
addReceive:
.LFB13:
	.loc 2 73 0
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
	mov	r3, r0
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	strb	r3, [fp, #-5]
	.loc 2 74 0
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldr	r3, .L38
.LPIC11:
	add	r3, pc, r3
	ldr	r1, [fp, #-12]
	str	r1, [r3, r2, lsl #4]
	.loc 2 75 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L38+4
.LPIC12:
	add	r2, pc, r2
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
	.loc 2 76 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L38+8
.LPIC13:
	add	r2, pc, r2
	lsl	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #12]
	.loc 2 77 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	enableEventInterrupt(PLT)
	.loc 2 78 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L39:
	.align	2
.L38:
	.word	event_blocks-(.LPIC11+8)
	.word	event_blocks-(.LPIC12+8)
	.word	event_blocks-(.LPIC13+8)
	.cfi_endproc
.LFE13:
	.size	addReceive, .-addReceive
.Letext0:
	.file 3 "src/util/data/buffer.h"
	.file 4 "src/kernel/task.h"
	.file 5 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6d5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0xc
	.4byte	.LASF124
	.4byte	.LASF125
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF69
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
	.4byte	0x5f
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x8
	.4byte	.LASF71
	.byte	0x1
	.4byte	0x6b
	.byte	0x5
	.byte	0x11
	.4byte	0x203
	.uleb128 0x9
	.4byte	.LASF5
	.byte	0
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x9
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0xa
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0xb
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0xd
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0xe
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0xf
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x11
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x12
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x13
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x15
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x17
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x19
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x1a
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x1b
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x1d
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x1e
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x1f
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x21
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x22
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x23
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x25
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x26
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x27
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF46
	.byte	0x29
	.uleb128 0x9
	.4byte	.LASF47
	.byte	0x2a
	.uleb128 0x9
	.4byte	.LASF48
	.byte	0x2b
	.uleb128 0x9
	.4byte	.LASF49
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF50
	.byte	0x2d
	.uleb128 0x9
	.4byte	.LASF51
	.byte	0x2e
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x2f
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x31
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x32
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x33
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0x35
	.uleb128 0x9
	.4byte	.LASF59
	.byte	0x36
	.uleb128 0x9
	.4byte	.LASF60
	.byte	0x37
	.uleb128 0x9
	.4byte	.LASF61
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF62
	.byte	0x39
	.uleb128 0x9
	.4byte	.LASF63
	.byte	0x3a
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x3b
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x3c
	.uleb128 0x9
	.4byte	.LASF66
	.byte	0x3d
	.uleb128 0x9
	.4byte	.LASF67
	.byte	0x3e
	.uleb128 0x9
	.4byte	.LASF68
	.byte	0x3f
	.byte	0
	.uleb128 0xa
	.4byte	.LASF71
	.byte	0x5
	.byte	0x28
	.4byte	0x72
	.uleb128 0x2
	.4byte	.LASF70
	.byte	0x2c
	.byte	0x4
	.byte	0x25
	.4byte	0x296
	.uleb128 0xb
	.ascii	"pc\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x5f
	.byte	0
	.uleb128 0xb
	.ascii	"r4\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x5f
	.byte	0x4
	.uleb128 0xb
	.ascii	"r5\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x5f
	.byte	0x8
	.uleb128 0xb
	.ascii	"r6\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x5f
	.byte	0xc
	.uleb128 0xb
	.ascii	"r7\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x5f
	.byte	0x10
	.uleb128 0xb
	.ascii	"r8\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x5f
	.byte	0x14
	.uleb128 0xb
	.ascii	"r9\000"
	.byte	0x4
	.byte	0x27
	.4byte	0x5f
	.byte	0x18
	.uleb128 0xb
	.ascii	"r10\000"
	.byte	0x4
	.byte	0x27
	.4byte	0x5f
	.byte	0x1c
	.uleb128 0xb
	.ascii	"r11\000"
	.byte	0x4
	.byte	0x27
	.4byte	0x5f
	.byte	0x20
	.uleb128 0xb
	.ascii	"fp\000"
	.byte	0x4
	.byte	0x27
	.4byte	0x5f
	.byte	0x24
	.uleb128 0xb
	.ascii	"lr\000"
	.byte	0x4
	.byte	0x27
	.4byte	0x5f
	.byte	0x28
	.byte	0
	.uleb128 0x8
	.4byte	.LASF72
	.byte	0x1
	.4byte	0x6b
	.byte	0x4
	.byte	0x2a
	.4byte	0x2dd
	.uleb128 0x9
	.4byte	.LASF73
	.byte	0
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF75
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF76
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF77
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF79
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF80
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF81
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.4byte	.LASF72
	.byte	0x4
	.byte	0x34
	.4byte	0x296
	.uleb128 0x2
	.4byte	.LASF82
	.byte	0x58
	.byte	0x4
	.byte	0x36
	.4byte	0x3cd
	.uleb128 0xb
	.ascii	"tid\000"
	.byte	0x4
	.byte	0x37
	.4byte	0x5f
	.byte	0
	.uleb128 0x3
	.4byte	.LASF83
	.byte	0x4
	.byte	0x3a
	.4byte	0x5f
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF84
	.byte	0x4
	.byte	0x3b
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF85
	.byte	0x4
	.byte	0x3c
	.4byte	0x56
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x4
	.byte	0x3d
	.4byte	0x3cd
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF86
	.byte	0x4
	.byte	0x40
	.4byte	0x3d3
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF87
	.byte	0x4
	.byte	0x41
	.4byte	0x5f
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF88
	.byte	0x4
	.byte	0x44
	.4byte	0x3d3
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF89
	.byte	0x4
	.byte	0x47
	.4byte	0x3d3
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF90
	.byte	0x4
	.byte	0x48
	.4byte	0x3d3
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF91
	.byte	0x4
	.byte	0x49
	.4byte	0x3d3
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF92
	.byte	0x4
	.byte	0x4a
	.4byte	0x3d3
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF93
	.byte	0x4
	.byte	0x4b
	.4byte	0x3d3
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF94
	.byte	0x4
	.byte	0x4c
	.4byte	0x3d3
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF95
	.byte	0x4
	.byte	0x4d
	.4byte	0x3d9
	.byte	0x38
	.uleb128 0xb
	.ascii	"buf\000"
	.byte	0x4
	.byte	0x4e
	.4byte	0x3f0
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF96
	.byte	0x4
	.byte	0x4f
	.4byte	0x2dd
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF97
	.byte	0x4
	.byte	0x52
	.4byte	0x406
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x20e
	.uleb128 0xc
	.byte	0x4
	.4byte	0x2e8
	.uleb128 0xd
	.4byte	0x56
	.4byte	0x3e9
	.uleb128 0xe
	.4byte	0x3e9
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF98
	.uleb128 0xd
	.4byte	0x400
	.4byte	0x400
	.uleb128 0xe
	.4byte	0x3e9
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x25
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF99
	.uleb128 0x2
	.4byte	.LASF100
	.byte	0x24
	.byte	0x1
	.byte	0x9
	.4byte	0x432
	.uleb128 0x3
	.4byte	.LASF101
	.byte	0x1
	.byte	0xb
	.4byte	0x3d3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF102
	.byte	0x1
	.byte	0xe
	.4byte	0x432
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.4byte	0x442
	.4byte	0x442
	.uleb128 0xe
	.4byte	0x3e9
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x40d
	.uleb128 0xf
	.4byte	.LASF103
	.2byte	0x124
	.byte	0x1
	.byte	0x11
	.4byte	0x46f
	.uleb128 0x3
	.4byte	.LASF102
	.byte	0x1
	.byte	0x12
	.4byte	0x46f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF104
	.byte	0x1
	.byte	0x13
	.4byte	0x442
	.2byte	0x120
	.byte	0
	.uleb128 0xd
	.4byte	0x40d
	.4byte	0x47f
	.uleb128 0xe
	.4byte	0x3e9
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.4byte	.LASF105
	.byte	0x10
	.byte	0x2
	.byte	0x4
	.4byte	0x4bc
	.uleb128 0x3
	.4byte	.LASF106
	.byte	0x2
	.byte	0x5
	.4byte	0x3d3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF107
	.byte	0x2
	.byte	0x6
	.4byte	0x4bc
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF108
	.byte	0x2
	.byte	0x7
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF109
	.byte	0x2
	.byte	0x8
	.4byte	0x5f
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x5f
	.uleb128 0x11
	.4byte	.LASF110
	.byte	0x2
	.byte	0xb
	.4byte	0x4d3
	.uleb128 0x5
	.byte	0x3
	.4byte	scheduler
	.uleb128 0xc
	.byte	0x4
	.4byte	0x448
	.uleb128 0xd
	.4byte	0x47f
	.4byte	0x4e9
	.uleb128 0xe
	.4byte	0x3e9
	.byte	0x3e
	.byte	0
	.uleb128 0x11
	.4byte	.LASF111
	.byte	0x2
	.byte	0xc
	.4byte	0x4d9
	.uleb128 0x5
	.byte	0x3
	.4byte	event_blocks
	.uleb128 0x12
	.4byte	.LASF113
	.byte	0x2
	.byte	0x48
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x53a
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x2
	.byte	0x48
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0x2
	.byte	0x48
	.4byte	0x3d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.4byte	.LASF107
	.byte	0x2
	.byte	0x48
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.4byte	.LASF114
	.byte	0x2
	.byte	0x3f
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x588
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x2
	.byte	0x3f
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0x2
	.byte	0x3f
	.4byte	0x3d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.4byte	.LASF0
	.byte	0x2
	.byte	0x3f
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF107
	.byte	0x2
	.byte	0x3f
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.4byte	.LASF115
	.byte	0x2
	.byte	0x37
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ba
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x2
	.byte	0x37
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0x2
	.byte	0x37
	.4byte	0x3d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x12
	.4byte	.LASF116
	.byte	0x2
	.byte	0x2e
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5de
	.uleb128 0x14
	.ascii	"vic\000"
	.byte	0x2
	.byte	0x30
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x15
	.4byte	.LASF118
	.byte	0x2
	.byte	0x28
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x602
	.uleb128 0x13
	.4byte	.LASF117
	.byte	0x2
	.byte	0x28
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF119
	.byte	0x2
	.byte	0x20
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x626
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x2
	.byte	0x20
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.4byte	.LASF120
	.byte	0x2
	.byte	0x18
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x64a
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x2
	.byte	0x18
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x17
	.4byte	.LASF121
	.byte	0x2
	.byte	0xe
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x678
	.uleb128 0x18
	.ascii	"s\000"
	.byte	0x2
	.byte	0xe
	.4byte	0x4d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii	"i\000"
	.byte	0x2
	.byte	0x10
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF122
	.byte	0x1
	.byte	0x55
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6aa
	.uleb128 0x13
	.4byte	.LASF96
	.byte	0x1
	.byte	0x55
	.4byte	0x4d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0x1
	.byte	0x55
	.4byte	0x3d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF126
	.byte	0x1
	.byte	0x22
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF96
	.byte	0x1
	.byte	0x22
	.4byte	0x4d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0x1
	.byte	0x22
	.4byte	0x3d3
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
	.uleb128 0x35
	.byte	0
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
	.uleb128 0xb
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
.LASF68:
	.ascii	"EVENT_TYPE_MAX\000"
.LASF94:
	.ascii	"nextObt\000"
.LASF110:
	.ascii	"scheduler\000"
.LASF31:
	.ascii	"EVENT_TYPE_UART2_TX\000"
.LASF112:
	.ascii	"type\000"
.LASF42:
	.ascii	"EVENT_TYPE_RTC\000"
.LASF80:
	.ascii	"STATE_RESPOND_BLOCKED\000"
.LASF99:
	.ascii	"long long unsigned int\000"
.LASF107:
	.ascii	"addr\000"
.LASF90:
	.ascii	"recvQueueTail\000"
.LASF41:
	.ascii	"EVENT_TYPE_WATCHDOG_EXPIRED\000"
.LASF86:
	.ascii	"next\000"
.LASF117:
	.ascii	"event\000"
.LASF29:
	.ascii	"EVENT_TYPE_UART1_TX\000"
.LASF115:
	.ascii	"addAwait\000"
.LASF109:
	.ascii	"isSend\000"
.LASF40:
	.ascii	"EVENT_TYPE_TICK_64HZ\000"
.LASF104:
	.ascii	"active\000"
.LASF88:
	.ascii	"parent\000"
.LASF96:
	.ascii	"state\000"
.LASF125:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF5:
	.ascii	"EVENT_TYPE_UNUSED_0\000"
.LASF6:
	.ascii	"EVENT_TYPE_UNUSED_1\000"
.LASF65:
	.ascii	"EVENT_TYPE_UNUSED_2\000"
.LASF66:
	.ascii	"EVENT_TYPE_UNUSED_3\000"
.LASF67:
	.ascii	"EVENT_TYPE_UNUSED_4\000"
.LASF71:
	.ascii	"EventType\000"
.LASF64:
	.ascii	"EVENT_TYPE_I2S\000"
.LASF49:
	.ascii	"EVENT_TYPE_V_FIFO\000"
.LASF113:
	.ascii	"addReceive\000"
.LASF22:
	.ascii	"EVENT_TYPE_DMA2M_I0\000"
.LASF23:
	.ascii	"EVENT_TYPE_DMA2M_I1\000"
.LASF95:
	.ascii	"share\000"
.LASF37:
	.ascii	"EVENT_TYPE_EXTERNAL_0\000"
.LASF38:
	.ascii	"EVENT_TYPE_EXTERNAL_1\000"
.LASF39:
	.ascii	"EVENT_TYPE_EXTERNAL_2\000"
.LASF91:
	.ascii	"nextRecv\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF73:
	.ascii	"STATE_ACTIVE\000"
.LASF2:
	.ascii	"truncated\000"
.LASF59:
	.ascii	"EVENT_TYPE_UART2_INT\000"
.LASF60:
	.ascii	"EVENT_TYPE_UART3_INT\000"
.LASF103:
	.ascii	"Scheduler\000"
.LASF0:
	.ascii	"data\000"
.LASF8:
	.ascii	"EVENT_TYPE_COMM_TX\000"
.LASF76:
	.ascii	"STATE_RECV_BLOCKED\000"
.LASF87:
	.ascii	"priority\000"
.LASF82:
	.ascii	"TaskDescriptor\000"
.LASF43:
	.ascii	"EVENT_TYPE_IrDA\000"
.LASF44:
	.ascii	"EVENT_TYPE_MAC\000"
.LASF93:
	.ascii	"obtQueueTail\000"
.LASF9:
	.ascii	"EVENT_TYPE_TIMER_1\000"
.LASF10:
	.ascii	"EVENT_TYPE_TIMER_2\000"
.LASF56:
	.ascii	"EVENT_TYPE_TIMER_3\000"
.LASF62:
	.ascii	"EVENT_TYPE_DSP\000"
.LASF77:
	.ascii	"STATE_REPL_BLOCKED\000"
.LASF98:
	.ascii	"sizetype\000"
.LASF97:
	.ascii	"ticks\000"
.LASF61:
	.ascii	"EVENT_TYPE_PME\000"
.LASF50:
	.ascii	"EVENT_TYPE_SSP_RX\000"
.LASF63:
	.ascii	"EVENT_TYPE_GPIO\000"
.LASF108:
	.ascii	"send\000"
.LASF102:
	.ascii	"queues\000"
.LASF47:
	.ascii	"EVENT_TYPE_TICK_1HZ\000"
.LASF24:
	.ascii	"EVENT_TYPE_RESERVED_0\000"
.LASF25:
	.ascii	"EVENT_TYPE_RESERVED_1\000"
.LASF26:
	.ascii	"EVENT_TYPE_RESERVED_2\000"
.LASF27:
	.ascii	"EVENT_TYPE_RESERVED_3\000"
.LASF36:
	.ascii	"EVENT_TYPE_RESERVED_4\000"
.LASF45:
	.ascii	"EVENT_TYPE_RESERVED_5\000"
.LASF52:
	.ascii	"EVENT_TYPE_RESERVED_6\000"
.LASF53:
	.ascii	"EVENT_TYPE_RESERVED_7\000"
.LASF54:
	.ascii	"EVENT_TYPE_RESERVED_8\000"
.LASF55:
	.ascii	"EVENT_TYPE_RESERVED_9\000"
.LASF79:
	.ascii	"STATE_OBTAIN_BLOCKED\000"
.LASF58:
	.ascii	"EVENT_TYPE_SSP_INT\000"
.LASF105:
	.ascii	"HWIBlock\000"
.LASF7:
	.ascii	"EVENT_TYPE_COMM_RX\000"
.LASF119:
	.ascii	"disableEventInterrupt\000"
.LASF89:
	.ascii	"recvQueueHead\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF51:
	.ascii	"EVENT_TYPE_SSP_TX\000"
.LASF75:
	.ascii	"STATE_SEND_BLOCKED\000"
.LASF32:
	.ascii	"EVENT_TYPE_UART3_RX\000"
.LASF122:
	.ascii	"unblockTask\000"
.LASF123:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF100:
	.ascii	"RunQueue\000"
.LASF92:
	.ascii	"obtQueueHead\000"
.LASF83:
	.ascii	"cpsr\000"
.LASF126:
	.ascii	"scheduleTask\000"
.LASF1:
	.ascii	"data_len\000"
.LASF57:
	.ascii	"EVENT_TYPE_UART1_INT\000"
.LASF101:
	.ascii	"head\000"
.LASF11:
	.ascii	"EVENT_TYPE_AUDIO_CODEC\000"
.LASF121:
	.ascii	"initEventBlocks\000"
.LASF30:
	.ascii	"EVENT_TYPE_UART2_RX\000"
.LASF48:
	.ascii	"EVENT_TYPE_V_SYNC\000"
.LASF70:
	.ascii	"TaskFrame\000"
.LASF81:
	.ascii	"STATE_EVENT_BLOCKED\000"
.LASF118:
	.ascii	"handleEvent\000"
.LASF106:
	.ascii	"task\000"
.LASF114:
	.ascii	"addTransmit\000"
.LASF120:
	.ascii	"enableEventInterrupt\000"
.LASF35:
	.ascii	"EVENT_TYPE_TOUCH_SCREEN\000"
.LASF84:
	.ascii	"rval\000"
.LASF69:
	.ascii	"Buffer\000"
.LASF116:
	.ascii	"EnterHWI\000"
.LASF111:
	.ascii	"event_blocks\000"
.LASF46:
	.ascii	"EVENT_TYPE_RASTER\000"
.LASF28:
	.ascii	"EVENT_TYPE_UART1_RX\000"
.LASF34:
	.ascii	"EVENT_TYPE_KEYBOARD\000"
.LASF74:
	.ascii	"STATE_ZOMBIE\000"
.LASF124:
	.ascii	"src/kernel/hwi.c\000"
.LASF33:
	.ascii	"EVENT_TYPE_UART3_TX\000"
.LASF72:
	.ascii	"TaskState\000"
.LASF78:
	.ascii	"STATE_SHARE_BLOCKED\000"
.LASF85:
	.ascii	"stack\000"
.LASF12:
	.ascii	"EVENT_TYPE_DMA2P_I0\000"
.LASF13:
	.ascii	"EVENT_TYPE_DMA2P_I1\000"
.LASF14:
	.ascii	"EVENT_TYPE_DMA2P_I2\000"
.LASF15:
	.ascii	"EVENT_TYPE_DMA2P_I3\000"
.LASF16:
	.ascii	"EVENT_TYPE_DMA2P_I4\000"
.LASF17:
	.ascii	"EVENT_TYPE_DMA2P_I5\000"
.LASF18:
	.ascii	"EVENT_TYPE_DMA2P_I6\000"
.LASF19:
	.ascii	"EVENT_TYPE_DMA2P_I7\000"
.LASF20:
	.ascii	"EVENT_TYPE_DMA2P_I8\000"
.LASF21:
	.ascii	"EVENT_TYPE_DMA2P_I9\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
