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
	.file	"memcpy.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	memcpy
	.syntax unified
	.arm
	.fpu softvfp
	.type	memcpy, %function
memcpy:
.LFB0:
	.file 1 "src/memcpy.c"
	.loc 1 3 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #44
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	.loc 1 5 0
	ldr	r3, [fp, #-32]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L2
	.loc 1 6 0 discriminator 1
	ldr	r3, [fp, #-36]
	and	r3, r3, #3
	.loc 1 5 0 discriminator 1
	cmp	r3, #0
	bne	.L2
	.loc 1 7 0
	ldr	r3, [fp, #-40]
	and	r3, r3, #3
	.loc 1 6 0
	cmp	r3, #0
	bne	.L2
.LBB2:
	.loc 1 8 0
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
	.loc 1 9 0
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	.loc 1 10 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L4:
	.loc 1 11 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-16]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 10 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	.loc 1 10 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-40]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bhi	.L4
.LBE2:
	.loc 1 7 0 is_stmt 1
	b	.L5
.L2:
.LBB3:
	.loc 1 15 0
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	.loc 1 16 0
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-24]
	.loc 1 17 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	.loc 1 18 0 discriminator 3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	.loc 1 17 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	.loc 1 17 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bcc	.L7
.L5:
.LBE3:
	.loc 1 21 0 is_stmt 1
	ldr	r3, [fp, #-32]
	.loc 1 22 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	memcpy, .-memcpy
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xfa
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF3
	.byte	0xc
	.4byte	.LASF4
	.4byte	.LASF5
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.4byte	0xbd
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbd
	.uleb128 0x3
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x2
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.ascii	"src\000"
	.byte	0x1
	.byte	0x2
	.4byte	0xbf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.ascii	"len\000"
	.byte	0x1
	.byte	0x2
	.4byte	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4
	.4byte	0xc6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x9a
	.uleb128 0x4
	.ascii	"d\000"
	.byte	0x1
	.byte	0x8
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x4
	.ascii	"s\000"
	.byte	0x1
	.byte	0x9
	.4byte	0xdf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x4
	.ascii	"d\000"
	.byte	0x1
	.byte	0xf
	.4byte	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.ascii	"s\000"
	.byte	0x1
	.byte	0x10
	.4byte	0xf7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x8
	.byte	0x4
	.4byte	0xc5
	.uleb128 0x9
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xd3
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0xb
	.4byte	0xd3
	.uleb128 0x8
	.byte	0x4
	.4byte	0xda
	.uleb128 0x8
	.byte	0x4
	.4byte	0xeb
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0xb
	.4byte	0xeb
	.uleb128 0x8
	.byte	0x4
	.4byte	0xf2
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
.LASF0:
	.ascii	"unsigned int\000"
.LASF2:
	.ascii	"char\000"
.LASF5:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF4:
	.ascii	"src/memcpy.c\000"
.LASF1:
	.ascii	"long int\000"
.LASF3:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF6:
	.ascii	"memcpy\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
