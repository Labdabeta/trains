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
	.file	"debugio.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.bss
	.align	2
location:
	.space	4
	.size	location, 4
	.text
	.align	2
	.global	debug_putc
	.syntax unified
	.arm
	.fpu softvfp
	.type	debug_putc, %function
debug_putc:
.LFB0:
	.file 1 "src/util/debugio.c"
	.loc 1 10 0
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
	mov	r3, r1
	strb	r3, [fp, #-9]
	.loc 1 12 0
	ldr	r3, .L3
.LPIC0:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r2, .L3+4
.LPIC1:
	add	r2, pc, r2
	str	r1, [r2]
	ldrb	r2, [fp, #-9]
	strb	r2, [r3]
	.loc 1 13 0
	ldr	r3, .L3+8
.LPIC2:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #1048576
	ble	.L2
	.loc 1 14 0
	ldr	r3, .L3+12
.LPIC3:
	add	r3, pc, r3
	mov	r2, #327680
	str	r2, [r3]
.L2:
	.loc 1 15 0
	ldr	r3, .L3+16
.LPIC4:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 16 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	location-(.LPIC0+8)
	.word	location-(.LPIC1+8)
	.word	location-(.LPIC2+8)
	.word	location-(.LPIC3+8)
	.word	location-(.LPIC4+8)
	.cfi_endproc
.LFE0:
	.size	debug_putc, .-debug_putc
	.align	2
	.global	init_debugio
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_debugio, %function
init_debugio:
.LFB1:
	.loc 1 19 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	ldr	r3, .L6
.LPIC6:
	add	r3, pc, r3
	.loc 1 20 0
	ldr	r2, .L6+4
.LPIC5:
	add	r2, pc, r2
	mov	r1, #327680
	str	r1, [r2]
	.loc 1 21 0
	ldr	r2, .L6+8
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, .L6+12
	ldr	r3, [r3, r2]
	add	r3, r1, r3
	mov	r1, r3
	mov	r0, #0
	bl	init_dprintf(PLT)
	.loc 1 22 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC6+8)
	.word	location-(.LPIC5+8)
	.word	CODE_BASE(GOT)
	.word	debug_putc(GOT)
	.cfi_endproc
.LFE1:
	.size	init_debugio, .-init_debugio
.Letext0:
	.file 2 "src/linker.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x97
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF2
	.byte	0xc
	.4byte	.LASF3
	.4byte	.LASF4
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4
	.4byte	0x39
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x6
	.4byte	0x39
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x5
	.4byte	0x56
	.uleb128 0x5
	.byte	0x3
	.4byte	location
	.uleb128 0x8
	.byte	0x4
	.4byte	0x40
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x1
	.byte	0x12
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0x9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x1
	.byte	0x9
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x39
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x2117
	.uleb128 0x19
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
.LASF6:
	.ascii	"location\000"
.LASF1:
	.ascii	"data\000"
.LASF5:
	.ascii	"CODE_BASE\000"
.LASF8:
	.ascii	"debug_putc\000"
.LASF0:
	.ascii	"char\000"
.LASF4:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF7:
	.ascii	"init_debugio\000"
.LASF2:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF3:
	.ascii	"src/util/debugio.c\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
