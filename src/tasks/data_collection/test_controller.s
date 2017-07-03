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
	.file	"test_controller.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TOUT\000"
	.align	2
.LC1:
	.ascii	"TIN\000"
	.text
	.align	2
	.global	test_sensor_controller
	.syntax unified
	.arm
	.fpu softvfp
	.type	test_sensor_controller, %function
test_sensor_controller:
.LFB0:
	.file 1 "src/tasks/data_collection/test_controller.c"
	.loc 1 5 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #44
	.loc 1 6 0
	bl	Service(PLT)
	.loc 1 9 0
	ldr	r3, .L5
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-16]
	.loc 1 10 0
	ldr	r3, .L5+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-20]
	.loc 1 12 0
	mov	r3, #0
	strb	r3, [fp, #-44]
	.loc 1 14 0
	sub	r1, fp, #28
	sub	r3, fp, #24
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 15 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
.L4:
	.loc 1 18 0
	mov	r2, #133
	mov	r1, #1
	ldr	r0, [fp, #-16]
	bl	Putc(PLT)
	.loc 1 19 0
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L2
.L3:
	.loc 1 20 0 discriminator 3
	ldr	r4, [fp, #-24]
	mov	r1, #1
	ldr	r0, [fp, #-20]
	bl	Getc(PLT)
	mov	r3, r0
	and	r2, r3, #255
	sub	r3, fp, #12
	add	r3, r3, r4
	strb	r2, [r3, #-28]
	.loc 1 19 0 discriminator 3
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	.loc 1 19 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	ble	.L3
	.loc 1 22 0 is_stmt 1
	ldr	r0, [fp, #-28]
	sub	r1, fp, #44
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	bl	Send(PLT)
	.loc 1 18 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE0:
	.size	test_sensor_controller, .-test_sensor_controller
	.align	2
	.global	test_controller
	.syntax unified
	.arm
	.fpu softvfp
	.type	test_controller, %function
test_controller:
.LFB1:
	.loc 1 27 0
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
	sub	sp, sp, #20
	ldr	r4, .L8
.LPIC2:
	add	r4, pc, r4
	.loc 1 28 0
	ldr	r3, .L8+4
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	.loc 1 29 0
	ldr	r3, .L8+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	Create(PLT)
	str	r0, [fp, #-16]
	.loc 1 30 0
	sub	r1, fp, #20
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 31 0
	bl	Exit(PLT)
	.loc 1 32 0
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
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+8)
	.word	conductor(GOT)
	.word	test_sensor_controller(GOT)
	.cfi_endproc
.LFE1:
	.size	test_controller, .-test_controller
.Letext0:
	.file 2 "src/tasks/data_collection/conductor.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x14b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0xc
	.4byte	.LASF15
	.4byte	.LASF16
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
	.4byte	.LASF17
	.byte	0x1
	.4byte	0x33
	.byte	0x2
	.byte	0x8
	.4byte	0x57
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x2
	.byte	0xb
	.4byte	0x3a
	.uleb128 0x7
	.byte	0xc
	.byte	0x2
	.byte	0xf
	.4byte	0x81
	.uleb128 0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x10
	.4byte	0x81
	.uleb128 0x8
	.4byte	.LASF5
	.byte	0x2
	.byte	0x11
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	0x98
	.4byte	0x91
	.uleb128 0xa
	.4byte	0x91
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x10
	.byte	0x2
	.byte	0xd
	.4byte	0xc4
	.uleb128 0xc
	.4byte	.LASF8
	.byte	0x2
	.byte	0xe
	.4byte	0x57
	.byte	0
	.uleb128 0xc
	.4byte	.LASF9
	.byte	0x2
	.byte	0x12
	.4byte	0x62
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1a
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf6
	.uleb128 0xe
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.4byte	.LASF11
	.byte	0x1
	.byte	0x1d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xe
	.4byte	.LASF13
	.byte	0x1
	.byte	0x9
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii	"tin\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
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
	.uleb128 0x7
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x10
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
.LASF3:
	.ascii	"CODE_Queary\000"
.LASF8:
	.ascii	"type\000"
.LASF10:
	.ascii	"model_tid\000"
.LASF19:
	.ascii	"test_controller\000"
.LASF18:
	.ascii	"test_message\000"
.LASF4:
	.ascii	"bytes\000"
.LASF9:
	.ascii	"data\000"
.LASF5:
	.ascii	"sensor\000"
.LASF15:
	.ascii	"src/tasks/data_collection/test_controller.c\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF7:
	.ascii	"char\000"
.LASF17:
	.ascii	"test_message_code\000"
.LASF16:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF20:
	.ascii	"test_sensor_controller\000"
.LASF12:
	.ascii	"parity\000"
.LASF11:
	.ascii	"sensors\000"
.LASF13:
	.ascii	"tout\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF6:
	.ascii	"sizetype\000"
.LASF2:
	.ascii	"CODE_SensorBytes\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
