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
	.file	"tin_courier.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TIN_C\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB0:
	.file 1 "src/tasks/drivers/tin_courier.c"
	.loc 1 11 0
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
	ldr	r1, .L2
.LPIC0:
	add	r1, pc, r1
	.loc 1 12 0
	mov	r2, #4
	ldr	r3, .L2+4
	ldr	r3, [r1, r3]
	mov	r1, r3
	mov	r0, #0
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 1 13 0
	bl	MyParentTid(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	.loc 1 14 0
	ldr	r3, .L2+8
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 1 15 0
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
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	tin_notifier(GOT)
	.word	.LC0-(.LPIC1+8)
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
	.loc 1 18 0
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
	.loc 1 23 0
	sub	r1, fp, #9
	sub	r3, fp, #8
	mov	r2, #1
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 24 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 27 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	sendTinData(PLT)
	.loc 1 28 0
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
.LC1:
	.ascii	"tin_courier\000"
	.align	2
.LC2:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	tin_courier
	.syntax unified
	.arm
	.fpu softvfp
	.type	tin_courier, %function
tin_courier:
.LFB2:
	.loc 1 30 0
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
	.loc 1 30 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L7
.LPIC2:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L7+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #12
	mov	r0, r3
	bl	initialize(PLT)
.L6:
	.loc 1 30 0 is_stmt 0 discriminator 2
	sub	r3, fp, #12
	mov	r0, r3
	bl	work(PLT)
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.cfi_endproc
.LFE2:
	.size	tin_courier, .-tin_courier
.Letext0:
	.file 2 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x11a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF12
	.4byte	.LASF13
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
	.4byte	.LASF14
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
	.4byte	.LASF15
	.byte	0x8
	.byte	0x1
	.byte	0x5
	.4byte	0x8e
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6
	.4byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1e
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb2
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1e
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x11
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf0
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.byte	0x11
	.4byte	0xf0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"c\000"
	.byte	0x1
	.byte	0x14
	.4byte	0xf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x69
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0xa
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa
	.4byte	0xf0
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
.LASF12:
	.ascii	"src/tasks/drivers/tin_courier.c\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF17:
	.ascii	"work\000"
.LASF14:
	.ascii	"TaskSize\000"
.LASF16:
	.ascii	"tin_courier\000"
.LASF15:
	.ascii	"Data\000"
.LASF7:
	.ascii	"notifier\000"
.LASF9:
	.ascii	"data\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF18:
	.ascii	"initialize\000"
.LASF11:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF13:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF8:
	.ascii	"parent\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF10:
	.ascii	"char\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
