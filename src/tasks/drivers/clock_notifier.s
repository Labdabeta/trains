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
	.file	"clock_notifier.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB0:
	.file 1 "src/tasks/drivers/clock_notifier.c"
	.loc 1 10 0
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
	.loc 1 11 0
	ldr	r3, [fp, #-8]
	ldr	r2, .L2
	str	r2, [r3, #4]
	.loc 1 12 0
	bl	MyParentTid(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 1 14 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	mov	r2, #19
	str	r2, [r3]
	.loc 1 15 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #8]
	orr	r2, r2, #192
	str	r2, [r3, #8]
	.loc 1 16 0
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
	.word	-2139029504
	.cfi_endproc
.LFE0:
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	work, %function
work:
.LFB1:
	.loc 1 19 0
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
	.loc 1 20 0
	mov	r0, #4
	bl	AwaitEvent(PLT)
	.loc 1 21 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	mov	r2, #0
	str	r2, [r3, #12]
	.loc 1 22 0
	ldr	r3, [fp, #-8]
	ldr	r0, [r3]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	mov	r1, #0
	bl	Send(PLT)
	.loc 1 23 0
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
	.size	work, .-work
	.section	.rodata
	.align	2
.LC0:
	.ascii	"clock_notifier\000"
	.align	2
.LC1:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	clock_notifier
	.syntax unified
	.arm
	.fpu softvfp
	.type	clock_notifier, %function
clock_notifier:
.LFB2:
	.loc 1 25 0
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
	.loc 1 25 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L7
.LPIC0:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L7+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #12
	mov	r0, r3
	bl	initialize(PLT)
.L6:
	.loc 1 25 0 is_stmt 0 discriminator 2
	sub	r3, fp, #12
	mov	r0, r3
	bl	work(PLT)
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE2:
	.size	clock_notifier, .-clock_notifier
.Letext0:
	.file 2 "src/util/trains/ts7200.h"
	.file 3 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2a7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0xc
	.4byte	.LASF75
	.4byte	.LASF76
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
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	.LASF77
	.byte	0x1
	.4byte	0x38
	.byte	0x3
	.byte	0x11
	.4byte	0x1d0
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x9
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0xa
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0xb
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0xd
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0xe
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0xf
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x11
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x12
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x13
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x17
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x19
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x1a
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x1b
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x1d
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x1e
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x1f
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x20
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x21
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x22
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x23
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x24
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x25
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x26
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x27
	.uleb128 0x6
	.4byte	.LASF42
	.byte	0x28
	.uleb128 0x6
	.4byte	.LASF43
	.byte	0x29
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x2a
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x2b
	.uleb128 0x6
	.4byte	.LASF46
	.byte	0x2c
	.uleb128 0x6
	.4byte	.LASF47
	.byte	0x2d
	.uleb128 0x6
	.4byte	.LASF48
	.byte	0x2e
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0x2f
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x30
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x31
	.uleb128 0x6
	.4byte	.LASF52
	.byte	0x32
	.uleb128 0x6
	.4byte	.LASF53
	.byte	0x33
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x34
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x35
	.uleb128 0x6
	.4byte	.LASF56
	.byte	0x36
	.uleb128 0x6
	.4byte	.LASF57
	.byte	0x37
	.uleb128 0x6
	.4byte	.LASF58
	.byte	0x38
	.uleb128 0x6
	.4byte	.LASF59
	.byte	0x39
	.uleb128 0x6
	.4byte	.LASF60
	.byte	0x3a
	.uleb128 0x6
	.4byte	.LASF61
	.byte	0x3b
	.uleb128 0x6
	.4byte	.LASF62
	.byte	0x3c
	.uleb128 0x6
	.4byte	.LASF63
	.byte	0x3d
	.uleb128 0x6
	.4byte	.LASF64
	.byte	0x3e
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.4byte	.LASF70
	.byte	0x10
	.byte	0x2
	.byte	0x12
	.4byte	0x20d
	.uleb128 0x8
	.4byte	.LASF66
	.byte	0x2
	.byte	0x13
	.4byte	0x33
	.byte	0
	.uleb128 0x8
	.4byte	.LASF67
	.byte	0x2
	.byte	0x14
	.4byte	0x33
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF68
	.byte	0x2
	.byte	0x15
	.4byte	0x33
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x2
	.byte	0x16
	.4byte	0x33
	.byte	0xc
	.byte	0
	.uleb128 0x4
	.4byte	0x1d0
	.uleb128 0x7
	.4byte	.LASF71
	.byte	0x8
	.byte	0x1
	.byte	0x4
	.4byte	0x236
	.uleb128 0x8
	.4byte	.LASF72
	.byte	0x1
	.byte	0x5
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.ascii	"t1\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x236
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x20d
	.uleb128 0xb
	.4byte	.LASF78
	.byte	0x1
	.byte	0x19
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x260
	.uleb128 0xc
	.4byte	.LASF73
	.byte	0x1
	.byte	0x19
	.4byte	0x212
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF79
	.byte	0x1
	.byte	0x12
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x284
	.uleb128 0xe
	.4byte	.LASF73
	.byte	0x1
	.byte	0x12
	.4byte	0x284
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x212
	.uleb128 0xf
	.4byte	.LASF80
	.byte	0x1
	.byte	0x9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF73
	.byte	0x1
	.byte	0x9
	.4byte	0x284
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
.LASF30:
	.ascii	"EVENT_TYPE_UART3_TX\000"
.LASF26:
	.ascii	"EVENT_TYPE_UART1_TX\000"
.LASF79:
	.ascii	"work\000"
.LASF47:
	.ascii	"EVENT_TYPE_SSP_RX\000"
.LASF39:
	.ascii	"EVENT_TYPE_RTC\000"
.LASF61:
	.ascii	"EVENT_TYPE_I2S\000"
.LASF57:
	.ascii	"EVENT_TYPE_UART3_INT\000"
.LASF67:
	.ascii	"value\000"
.LASF27:
	.ascii	"EVENT_TYPE_UART2_RX\000"
.LASF40:
	.ascii	"EVENT_TYPE_IrDA\000"
.LASF9:
	.ascii	"EVENT_TYPE_DMA2P_I0\000"
.LASF10:
	.ascii	"EVENT_TYPE_DMA2P_I1\000"
.LASF11:
	.ascii	"EVENT_TYPE_DMA2P_I2\000"
.LASF12:
	.ascii	"EVENT_TYPE_DMA2P_I3\000"
.LASF13:
	.ascii	"EVENT_TYPE_DMA2P_I4\000"
.LASF14:
	.ascii	"EVENT_TYPE_DMA2P_I5\000"
.LASF15:
	.ascii	"EVENT_TYPE_DMA2P_I6\000"
.LASF16:
	.ascii	"EVENT_TYPE_DMA2P_I7\000"
.LASF17:
	.ascii	"EVENT_TYPE_DMA2P_I8\000"
.LASF18:
	.ascii	"EVENT_TYPE_DMA2P_I9\000"
.LASF78:
	.ascii	"clock_notifier\000"
.LASF68:
	.ascii	"ctrl\000"
.LASF72:
	.ascii	"parent\000"
.LASF75:
	.ascii	"src/tasks/drivers/clock_notifier.c\000"
.LASF69:
	.ascii	"clear\000"
.LASF4:
	.ascii	"EVENT_TYPE_COMM_RX\000"
.LASF71:
	.ascii	"Data\000"
.LASF6:
	.ascii	"EVENT_TYPE_TIMER_1\000"
.LASF7:
	.ascii	"EVENT_TYPE_TIMER_2\000"
.LASF53:
	.ascii	"EVENT_TYPE_TIMER_3\000"
.LASF77:
	.ascii	"EventType\000"
.LASF54:
	.ascii	"EVENT_TYPE_UART1_INT\000"
.LASF29:
	.ascii	"EVENT_TYPE_UART3_RX\000"
.LASF58:
	.ascii	"EVENT_TYPE_PME\000"
.LASF31:
	.ascii	"EVENT_TYPE_KEYBOARD\000"
.LASF80:
	.ascii	"initialize\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"EVENT_TYPE_DMA2M_I0\000"
.LASF20:
	.ascii	"EVENT_TYPE_DMA2M_I1\000"
.LASF59:
	.ascii	"EVENT_TYPE_DSP\000"
.LASF70:
	.ascii	"Timer\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF45:
	.ascii	"EVENT_TYPE_V_SYNC\000"
.LASF76:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF41:
	.ascii	"EVENT_TYPE_MAC\000"
.LASF48:
	.ascii	"EVENT_TYPE_SSP_TX\000"
.LASF32:
	.ascii	"EVENT_TYPE_TOUCH_SCREEN\000"
.LASF65:
	.ascii	"EVENT_TYPE_MAX\000"
.LASF73:
	.ascii	"data\000"
.LASF60:
	.ascii	"EVENT_TYPE_GPIO\000"
.LASF55:
	.ascii	"EVENT_TYPE_SSP_INT\000"
.LASF2:
	.ascii	"EVENT_TYPE_UNUSED_0\000"
.LASF3:
	.ascii	"EVENT_TYPE_UNUSED_1\000"
.LASF23:
	.ascii	"EVENT_TYPE_RESERVED_2\000"
.LASF24:
	.ascii	"EVENT_TYPE_RESERVED_3\000"
.LASF33:
	.ascii	"EVENT_TYPE_RESERVED_4\000"
.LASF42:
	.ascii	"EVENT_TYPE_RESERVED_5\000"
.LASF49:
	.ascii	"EVENT_TYPE_RESERVED_6\000"
.LASF50:
	.ascii	"EVENT_TYPE_RESERVED_7\000"
.LASF51:
	.ascii	"EVENT_TYPE_RESERVED_8\000"
.LASF52:
	.ascii	"EVENT_TYPE_RESERVED_9\000"
.LASF34:
	.ascii	"EVENT_TYPE_EXTERNAL_0\000"
.LASF35:
	.ascii	"EVENT_TYPE_EXTERNAL_1\000"
.LASF56:
	.ascii	"EVENT_TYPE_UART2_INT\000"
.LASF36:
	.ascii	"EVENT_TYPE_EXTERNAL_2\000"
.LASF62:
	.ascii	"EVENT_TYPE_UNUSED_2\000"
.LASF43:
	.ascii	"EVENT_TYPE_RASTER\000"
.LASF63:
	.ascii	"EVENT_TYPE_UNUSED_3\000"
.LASF64:
	.ascii	"EVENT_TYPE_UNUSED_4\000"
.LASF21:
	.ascii	"EVENT_TYPE_RESERVED_0\000"
.LASF8:
	.ascii	"EVENT_TYPE_AUDIO_CODEC\000"
.LASF28:
	.ascii	"EVENT_TYPE_UART2_TX\000"
.LASF66:
	.ascii	"load\000"
.LASF74:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF38:
	.ascii	"EVENT_TYPE_WATCHDOG_EXPIRED\000"
.LASF5:
	.ascii	"EVENT_TYPE_COMM_TX\000"
.LASF25:
	.ascii	"EVENT_TYPE_UART1_RX\000"
.LASF37:
	.ascii	"EVENT_TYPE_TICK_64HZ\000"
.LASF44:
	.ascii	"EVENT_TYPE_TICK_1HZ\000"
.LASF46:
	.ascii	"EVENT_TYPE_V_FIFO\000"
.LASF22:
	.ascii	"EVENT_TYPE_RESERVED_1\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
