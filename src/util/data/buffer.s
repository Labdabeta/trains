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
	.file	"buffer.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	writeBuffer
	.syntax unified
	.arm
	.fpu softvfp
	.type	writeBuffer, %function
writeBuffer:
.LFB0:
	.file 1 "src/util/data/buffer.c"
	.loc 1 6 0
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
	str	r1, [fp, #-20]
	.loc 1 7 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	movcc	r3, #1
	movcs	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
	.loc 1 8 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L2
	.loc 1 8 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	b	.L3
.L2:
	.loc 1 8 0 discriminator 2
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
.L3:
	.loc 1 8 0 discriminator 4
	str	r3, [fp, #-12]
	.loc 1 9 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #-16]
	ldr	r0, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	mov	r1, r3
	bl	memcpy(PLT)
	.loc 1 10 0 discriminator 4
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	.loc 1 11 0 discriminator 4
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
	.loc 1 12 0 discriminator 4
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
	.size	writeBuffer, .-writeBuffer
	.align	2
	.global	loadBuffer
	.syntax unified
	.arm
	.fpu softvfp
	.type	loadBuffer, %function
loadBuffer:
.LFB1:
	.loc 1 15 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	.loc 1 16 0
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 1 17 0
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
	.loc 1 18 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 19 0
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
	.size	loadBuffer, .-loadBuffer
.Letext0:
	.file 2 "src/util/data/buffer.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xfe
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0xc
	.4byte	.LASF7
	.4byte	.LASF8
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0xc
	.byte	0x2
	.byte	0x5
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x6
	.4byte	0x56
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x7
	.4byte	0x58
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
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
	.4byte	.LASF9
	.byte	0x2
	.byte	0x9
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0xe
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb1
	.uleb128 0x9
	.ascii	"buf\000"
	.byte	0x1
	.byte	0xe
	.4byte	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF0
	.byte	0x1
	.byte	0xe
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.ascii	"len\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x66
	.uleb128 0xc
	.4byte	.LASF11
	.byte	0x1
	.byte	0x5
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x5
	.4byte	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x1
	.byte	0x5
	.4byte	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0x7
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0x8
	.4byte	0x58
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xd
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
.LASF10:
	.ascii	"loadBuffer\000"
.LASF1:
	.ascii	"data_len\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF2:
	.ascii	"truncated\000"
.LASF4:
	.ascii	"trunc\000"
.LASF8:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF9:
	.ascii	"Buffer\000"
.LASF5:
	.ascii	"smallerSize\000"
.LASF6:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF7:
	.ascii	"src/util/data/buffer.c\000"
.LASF0:
	.ascii	"data\000"
.LASF11:
	.ascii	"writeBuffer\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
