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
	.file	"async_delay.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	async_delay_task
	.syntax unified
	.arm
	.fpu softvfp
	.type	async_delay_task, %function
async_delay_task:
.LFB0:
	.file 1 "src/tasks/util/async_delay.c"
	.loc 1 12 0
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
	.loc 1 15 0
	sub	r1, fp, #20
	sub	r3, fp, #24
	mov	r2, #16
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 16 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 18 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	mov	r1, r2
	mov	r0, r3
	bl	Delay(PLT)
	.loc 1 20 0
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	.loc 1 21 0
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	bl	Send(PLT)
	.loc 1 23 0
	bl	Exit(PLT)
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
	.size	async_delay_task, .-async_delay_task
	.align	2
	.global	async_delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	async_delay, %function
async_delay:
.LFB1:
	.loc 1 27 0
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
	ldr	r1, .L3
.LPIC0:
	add	r1, pc, r1
	.loc 1 28 0
	mov	r2, #4
	ldr	r3, .L3+4
	ldr	r3, [r1, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	str	r0, [fp, #-8]
	.loc 1 29 0
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-12]
	.loc 1 30 0
	sub	r1, fp, #24
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	ldr	r0, [fp, #-8]
	bl	Send(PLT)
	.loc 1 31 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	async_delay_task(GOT)
	.cfi_endproc
.LFE1:
	.size	async_delay, .-async_delay
.Letext0:
	.file 2 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x148
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0xc
	.4byte	.LASF14
	.4byte	.LASF15
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
	.4byte	.LASF16
	.byte	0x1
	.4byte	0x62
	.byte	0x2
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
	.4byte	.LASF17
	.byte	0x10
	.byte	0x1
	.byte	0x4
	.4byte	0xa6
	.uleb128 0x7
	.ascii	"cid\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x2c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x7
	.4byte	0xa6
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xac
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1a
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11d
	.uleb128 0xb
	.4byte	.LASF11
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1a
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
.LASF0:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"async_delay\000"
.LASF12:
	.ascii	"child\000"
.LASF13:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF17:
	.ascii	"AsyncMessage\000"
.LASF14:
	.ascii	"src/tasks/util/async_delay.c\000"
.LASF11:
	.ascii	"clockid\000"
.LASF19:
	.ascii	"async_delay_task\000"
.LASF15:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF16:
	.ascii	"TaskSize\000"
.LASF9:
	.ascii	"reply_size\000"
.LASF8:
	.ascii	"reply\000"
.LASF7:
	.ascii	"delay\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF10:
	.ascii	"char\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
