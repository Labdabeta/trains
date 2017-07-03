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
	.file	"path_finder.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqInit, %function
pqInit:
.LFB0:
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
.LFE0:
	.size	pqInit, .-pqInit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqSize, %function
pqSize:
.LFB1:
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
.LFE1:
	.size	pqSize, .-pqSize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqGetMin, %function
pqGetMin:
.LFB2:
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
.LFE2:
	.size	pqGetMin, .-pqGetMin
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqGetMinPriority, %function
pqGetMinPriority:
.LFB3:
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
.LFE3:
	.size	pqGetMinPriority, .-pqGetMinPriority
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	visit, %function
visit:
.LFB4:
	.file 2 "src/util/trains/path_finder.c"
	.loc 2 9 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
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
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, .L11
.LPIC0:
	add	r2, pc, r2
	.loc 2 10 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	mov	r1, r3
	ldr	r3, .L11+4
	ldr	r3, [r2, r3]
	sub	r3, r1, r3
	asr	r2, r3, #4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r1, r3, #4
	add	r3, r3, r1
	lsl	r1, r3, #8
	add	r3, r3, r1
	lsl	r1, r3, #16
	add	r3, r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r2
	str	r3, [fp, #-8]
	.loc 2 11 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #4]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 2 12 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L10
	.loc 2 13 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 2 14 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #4]
	str	r2, [r3]
	.loc 2 15 0
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-20]
	bl	pqInsert(PLT)
.L10:
	.loc 2 17 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	track_nodes(GOT)
	.cfi_endproc
.LFE4:
	.size	visit, .-visit
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Path: %s\012\015\000"
	.align	2
.LC1:
	.ascii	"Values; station %d, dist %d\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	compileRoute, %function
compileRoute:
.LFB5:
	.loc 2 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r4, .L26
.LPIC1:
	add	r4, pc, r4
	.loc 2 29 0
	ldr	r3, [fp, #8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L25
	.loc 2 31 0
	ldr	r3, [fp, #8]
	str	r3, [fp, #-16]
	.loc 2 32 0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3]
	.loc 2 33 0
	b	.L16
.L17:
	.loc 2 34 0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	.loc 2 35 0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
.L16:
	.loc 2 33 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	bne	.L17
	.loc 2 38 0
	b	.L18
.L24:
	.loc 2 39 0
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L19
	.loc 2 40 0
	ldr	r3, [fp, #16]
	ldr	r0, [r3]
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r1, [fp, #16]
	lsl	r3, r0, #2
	add	r3, r1, r3
	str	r2, [r3, #4]
	.loc 2 41 0
	ldr	r3, [fp, #16]
	ldr	r1, [r3]
	add	r2, r1, #1
	ldr	r3, [fp, #16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, .L26+4
	ldr	ip, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, ip, r3
	add	r3, r3, #24
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L26+4
	ldr	r3, [r4, r3]
	sub	r3, r2, r3
	asr	r2, r3, #4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	ip, r3, #4
	add	r3, r3, ip
	lsl	ip, r3, #8
	add	r3, r3, ip
	lsl	ip, r3, #16
	add	r3, r3, ip
	lsl	r3, r3, #1
	add	r3, r3, r2
	cmp	r0, r3
	beq	.L20
	.loc 2 41 0 is_stmt 0 discriminator 1
	mov	r2, #34
	b	.L21
.L20:
	.loc 2 41 0 discriminator 2
	mov	r2, #33
.L21:
	.loc 2 41 0 discriminator 4
	ldr	r0, [fp, #16]
	add	r3, r1, #20
	lsl	r3, r3, #2
	add	r3, r0, r3
	str	r2, [r3, #4]
	b	.L22
.L19:
	.loc 2 42 0 is_stmt 1
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L23
	.loc 2 43 0 discriminator 1
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 2 42 0 discriminator 1
	cmp	r3, #4
	beq	.L23
	.loc 2 44 0
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 2 43 0
	cmp	r3, #5
	bne	.L22
.L23:
	.loc 2 45 0
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r3, .L26+8
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 2 46 0
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #8
	ldr	r1, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L26+12
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 2 47 0
	ldr	r3, [fp, #12]
	ldr	r0, [r3]
	ldr	r3, .L26+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r1, [fp, #12]
	lsl	r3, r0, #2
	add	r3, r1, r3
	str	r2, [r3, #4]
	.loc 2 48 0
	ldr	r3, [fp, #12]
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r2, [fp, #12]
	str	r1, [r2]
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2]
	ldr	r1, [fp, #12]
	add	r3, r3, #20
	lsl	r3, r3, #2
	add	r3, r1, r3
	str	r2, [r3, #4]
.L22:
	.loc 2 50 0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
.L18:
	.loc 2 38 0
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	bne	.L24
	b	.L13
.L25:
	.loc 2 29 0
	nop
.L13:
	.loc 2 52 0
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L27:
	.align	2
.L26:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+8)
	.word	track_nodes(GOT)
	.word	.LC0-(.LPIC2+8)
	.word	.LC1-(.LPIC3+8)
	.cfi_endproc
.LFE5:
	.size	compileRoute, .-compileRoute
	.align	2
	.global	findPath
	.syntax unified
	.arm
	.fpu softvfp
	.type	findPath, %function
findPath:
.LFB6:
	.loc 2 58 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 4736
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #4736
	sub	sp, sp, #20
	sub	ip, fp, #4096
	sub	ip, ip, #12
	str	r0, [ip, #-628]
	sub	r0, fp, #4096
	sub	r0, r0, #12
	str	r1, [r0, #-632]
	sub	r1, fp, #4096
	sub	r1, r1, #12
	str	r2, [r1, #-636]
	sub	r2, fp, #4096
	sub	r2, r2, #12
	str	r3, [r2, #-640]
	ldr	r4, .L41
.LPIC4:
	add	r4, pc, r4
	.loc 2 69 0
	sub	r3, fp, #4672
	sub	r3, r3, #12
	sub	r3, r3, #48
	mov	r0, r3
	bl	pqInit(PLT)
	.loc 2 71 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L29
.L30:
	.loc 2 72 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	mvn	r2, #-2147483648
	str	r2, [r3, #-588]
	.loc 2 73 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-1164]
	.loc 2 71 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L29:
	.loc 2 71 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #143
	ble	.L30
	.loc 2 76 0 is_stmt 1
	sub	r3, fp, #4096
	sub	r3, r3, #12
	ldr	r3, [r3, #-628]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-588]
	.loc 2 77 0
	sub	r3, fp, #4096
	sub	r3, r3, #12
	ldr	r3, [r3, #-628]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r2, fp, #4096
	sub	r2, r2, #12
	ldr	r2, [r2, #-628]
	str	r2, [r3, #-1740]
	.loc 2 79 0
	sub	r3, fp, #4096
	sub	r3, r3, #12
	mov	r2, r3
	sub	r3, fp, #4672
	sub	r3, r3, #12
	sub	r3, r3, #48
	ldr	r2, [r2, #-628]
	mov	r1, #0
	mov	r0, r3
	bl	pqInsert(PLT)
	.loc 2 81 0
	b	.L31
.L38:
.LBB2:
	.loc 2 82 0
	sub	r3, fp, #4672
	sub	r3, r3, #12
	sub	r3, r3, #48
	mov	r0, r3
	bl	pqGetMin(PLT)
	str	r0, [fp, #-20]
	.loc 2 83 0
	sub	r3, fp, #4672
	sub	r3, r3, #12
	sub	r3, r3, #48
	mov	r0, r3
	bl	pqGetMinPriority(PLT)
	str	r0, [fp, #-24]
	.loc 2 85 0
	sub	r3, fp, #4096
	sub	r3, r3, #12
	ldr	r2, [fp, #-20]
	ldr	r3, [r3, #-632]
	cmp	r2, r3
	bne	.L32
	.loc 2 86 0
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #-1164]
	.loc 2 87 0
	sub	r3, fp, #2304
	sub	r3, r3, #12
	sub	r3, r3, #12
	sub	r2, fp, #1728
	sub	r2, r2, #12
	sub	r2, r2, #12
	sub	r1, fp, #1152
	sub	r1, r1, #12
	sub	r1, r1, #12
	sub	ip, fp, #600
	sub	r0, fp, #4096
	sub	r0, r0, #12
	ldr	r0, [r0, #-640]
	str	r0, [sp, #12]
	sub	r0, fp, #4096
	sub	r0, r0, #12
	ldr	r0, [r0, #-636]
	str	r0, [sp, #8]
	sub	r0, fp, #4096
	sub	r0, r0, #12
	ldr	r0, [r0, #-632]
	str	r0, [sp, #4]
	sub	r0, fp, #4096
	sub	r0, r0, #12
	ldr	r0, [r0, #-628]
	str	r0, [sp]
	mov	r0, ip
	bl	compileRoute(PLT)
	.loc 2 89 0
	ldr	r3, [fp, #-24]
	b	.L39
.L32:
	.loc 2 92 0
	sub	r3, fp, #4672
	sub	r3, r3, #12
	sub	r3, r3, #48
	mov	r0, r3
	bl	pqPop(PLT)
	.loc 2 94 0
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-1164]
	cmp	r3, #0
	beq	.L34
	.loc 2 95 0
	b	.L31
.L34:
	.loc 2 97 0
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #-1164]
	.loc 2 99 0
	ldr	r3, .L41+4
	ldr	r1, [r4, r3]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L36
	cmp	r3, #3
	beq	.L37
	cmp	r3, #1
	bne	.L40
.L37:
	.loc 2 102 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r3, #16
	ldr	r2, .L41+4
	ldr	r2, [r4, r2]
	add	r0, r3, r2
	sub	r3, fp, #1728
	sub	r3, r3, #12
	sub	r3, r3, #12
	sub	ip, fp, #600
	sub	r1, fp, #4672
	sub	r1, r1, #12
	sub	r1, r1, #48
	ldr	r2, [fp, #-20]
	str	r2, [sp]
	mov	r2, ip
	bl	visit(PLT)
	.loc 2 103 0
	b	.L31
.L36:
	.loc 2 105 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r3, #16
	ldr	r2, .L41+4
	ldr	r2, [r4, r2]
	add	r0, r3, r2
	sub	r3, fp, #1728
	sub	r3, r3, #12
	sub	r3, r3, #12
	sub	ip, fp, #600
	sub	r1, fp, #4672
	sub	r1, r1, #12
	sub	r1, r1, #48
	ldr	r2, [fp, #-20]
	str	r2, [sp]
	mov	r2, ip
	bl	visit(PLT)
	.loc 2 106 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r3, #32
	ldr	r2, .L41+4
	ldr	r2, [r4, r2]
	add	r0, r3, r2
	sub	r3, fp, #1728
	sub	r3, r3, #12
	sub	r3, r3, #12
	sub	ip, fp, #600
	sub	r1, fp, #4672
	sub	r1, r1, #12
	sub	r1, r1, #48
	ldr	r2, [fp, #-20]
	str	r2, [sp]
	mov	r2, ip
	bl	visit(PLT)
	.loc 2 107 0
	b	.L31
.L40:
	.loc 2 109 0
	nop
.L31:
.LBE2:
	.loc 2 81 0
	sub	r3, fp, #4672
	sub	r3, r3, #12
	sub	r3, r3, #48
	mov	r0, r3
	bl	pqSize(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L38
	.loc 2 113 0
	mvn	r3, #0
.L39:
	.loc 2 114 0 discriminator 1
	mov	r0, r3
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L42:
	.align	2
.L41:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+8)
	.word	track_nodes(GOT)
	.cfi_endproc
.LFE6:
	.size	findPath, .-findPath
.Letext0:
	.file 3 "src/util/trains/track_data.h"
	.file 4 "src/util/trains/path_finder.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4de
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0xc
	.4byte	.LASF46
	.4byte	.LASF47
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.4byte	0x56
	.byte	0x3
	.byte	0x4
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x5
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x3
	.byte	0xb
	.4byte	0x25
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x3
	.byte	0x12
	.4byte	0x73
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x30
	.byte	0x3
	.byte	0x1b
	.4byte	0xbc
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x3
	.byte	0x1c
	.4byte	0x11c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x3
	.byte	0x1d
	.4byte	0x5d
	.byte	0x4
	.uleb128 0x8
	.ascii	"num\000"
	.byte	0x3
	.byte	0x1e
	.4byte	0x115
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x3
	.byte	0x1f
	.4byte	0x10f
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x3
	.byte	0x20
	.4byte	0x12e
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x3
	.byte	0x13
	.4byte	0xcc
	.uleb128 0x9
	.4byte	0xbc
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x10
	.byte	0x3
	.byte	0x15
	.4byte	0x109
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x3
	.byte	0x16
	.4byte	0x109
	.byte	0
	.uleb128 0x8
	.ascii	"src\000"
	.byte	0x3
	.byte	0x17
	.4byte	0x10f
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0x17
	.4byte	0x10f
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0x18
	.4byte	0x115
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xbc
	.uleb128 0xa
	.byte	0x4
	.4byte	0x68
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xa
	.byte	0x4
	.4byte	0x129
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0x9
	.4byte	0x122
	.uleb128 0xc
	.4byte	0xbc
	.4byte	0x13e
	.uleb128 0xd
	.4byte	0x13e
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0xc
	.4byte	0x68
	.4byte	0x155
	.uleb128 0xd
	.4byte	0x13e
	.byte	0x8f
	.byte	0
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x3
	.byte	0x29
	.4byte	0x145
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0xa4
	.byte	0x4
	.byte	0x8
	.4byte	0x191
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.byte	0x9
	.4byte	0x115
	.byte	0
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.byte	0xa
	.4byte	0x191
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.byte	0xb
	.4byte	0x191
	.byte	0x54
	.byte	0
	.uleb128 0xc
	.4byte	0x115
	.4byte	0x1a1
	.uleb128 0xd
	.4byte	0x13e
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0xa4
	.byte	0x4
	.byte	0xe
	.4byte	0x1d2
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.byte	0xf
	.4byte	0x115
	.byte	0
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.byte	0x10
	.4byte	0x191
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.byte	0x11
	.4byte	0x191
	.byte	0x54
	.byte	0
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	0x1f7
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x1
	.byte	0x9
	.4byte	0x115
	.byte	0
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x1
	.byte	0xa
	.4byte	0x115
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.4byte	.LASF27
	.2byte	0x964
	.byte	0x1
	.byte	0xd
	.4byte	0x21d
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x1
	.byte	0xe
	.4byte	0x115
	.byte	0
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x1
	.byte	0xf
	.4byte	0x21d
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	0x1d2
	.4byte	0x22e
	.uleb128 0x10
	.4byte	0x13e
	.2byte	0x12b
	.byte	0
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0x1
	.byte	0x10
	.4byte	0x1f7
	.uleb128 0x9
	.4byte	0x22e
	.uleb128 0x11
	.4byte	.LASF49
	.byte	0x2
	.byte	0x36
	.4byte	0x115
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30f
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x2
	.byte	0x36
	.4byte	0x115
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4740
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x2
	.byte	0x37
	.4byte	0x115
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4744
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x2
	.byte	0x38
	.4byte	0x30f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4748
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x2
	.byte	0x39
	.4byte	0x315
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4752
	.uleb128 0x13
	.ascii	"i\000"
	.byte	0x2
	.byte	0x3b
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x2
	.byte	0x3e
	.4byte	0x31b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -604
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x2
	.byte	0x3f
	.4byte	0x31b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1180
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x2
	.byte	0x40
	.4byte	0x31b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1756
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x2
	.byte	0x41
	.4byte	0x31b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2332
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x2
	.byte	0x42
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"q\000"
	.byte	0x2
	.byte	0x43
	.4byte	0x22e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4736
	.uleb128 0x15
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x14
	.4byte	.LASF14
	.byte	0x2
	.byte	0x53
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x160
	.uleb128 0xa
	.byte	0x4
	.4byte	0x1a1
	.uleb128 0xc
	.4byte	0x115
	.4byte	0x32b
	.uleb128 0xd
	.4byte	0x13e
	.byte	0x8f
	.byte	0
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x2
	.byte	0x13
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3bf
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x2
	.byte	0x13
	.4byte	0x3bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x2
	.byte	0x14
	.4byte	0x3bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x2
	.byte	0x15
	.4byte	0x3bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x2
	.byte	0x16
	.4byte	0x3bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x2
	.byte	0x17
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x2
	.byte	0x18
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x2
	.byte	0x19
	.4byte	0x30f
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x2
	.byte	0x1a
	.4byte	0x315
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x2
	.byte	0x1c
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x115
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x2
	.byte	0x8
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43b
	.uleb128 0x12
	.4byte	.LASF11
	.byte	0x2
	.byte	0x8
	.4byte	0x43b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"q\000"
	.byte	0x2
	.byte	0x8
	.4byte	0x441
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x2
	.byte	0x8
	.4byte	0x3bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x2
	.byte	0x8
	.4byte	0x3bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x2
	.byte	0x8
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x2
	.byte	0xa
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x2
	.byte	0xb
	.4byte	0x115
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xc7
	.uleb128 0xa
	.byte	0x4
	.4byte	0x22e
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x1
	.byte	0x37
	.4byte	0x115
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46e
	.uleb128 0x17
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x46e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x239
	.uleb128 0x18
	.4byte	.LASF43
	.byte	0x1
	.byte	0x2d
	.4byte	0x115
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x49b
	.uleb128 0x17
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x46e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF44
	.byte	0x1
	.byte	0x23
	.4byte	0x115
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c2
	.uleb128 0x17
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x46e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF50
	.byte	0x1
	.byte	0x18
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x441
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
	.uleb128 0x4
	.byte	0x1
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
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
.LASF20:
	.ascii	"stations\000"
.LASF50:
	.ascii	"pqInit\000"
.LASF43:
	.ascii	"pqGetMin\000"
.LASF12:
	.ascii	"track_edge\000"
.LASF4:
	.ascii	"NODE_ENTER\000"
.LASF34:
	.ascii	"visited\000"
.LASF45:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF24:
	.ascii	"PriorityQueueElement\000"
.LASF27:
	.ascii	"PriorityQueue\000"
.LASF7:
	.ascii	"track_node\000"
.LASF30:
	.ascii	"destination\000"
.LASF32:
	.ascii	"switches\000"
.LASF49:
	.ascii	"findPath\000"
.LASF33:
	.ascii	"distance\000"
.LASF48:
	.ascii	"track_nodes\000"
.LASF47:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF26:
	.ascii	"data\000"
.LASF13:
	.ascii	"dest\000"
.LASF35:
	.ascii	"previous\000"
.LASF15:
	.ascii	"unsigned char\000"
.LASF10:
	.ascii	"reverse\000"
.LASF3:
	.ascii	"NODE_MERGE\000"
.LASF18:
	.ascii	"TrackPath\000"
.LASF29:
	.ascii	"source\000"
.LASF5:
	.ascii	"NODE_EXIT\000"
.LASF23:
	.ascii	"positions\000"
.LASF2:
	.ascii	"NODE_BRANCH\000"
.LASF25:
	.ascii	"priority\000"
.LASF42:
	.ascii	"pqGetMinPriority\000"
.LASF44:
	.ascii	"pqSize\000"
.LASF36:
	.ascii	"successor\000"
.LASF39:
	.ascii	"visit\000"
.LASF16:
	.ascii	"char\000"
.LASF1:
	.ascii	"NODE_SENSOR\000"
.LASF41:
	.ascii	"new_dist\000"
.LASF14:
	.ascii	"dist\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF11:
	.ascii	"edge\000"
.LASF46:
	.ascii	"src/util/trains/path_finder.c\000"
.LASF6:
	.ascii	"node_type\000"
.LASF8:
	.ascii	"name\000"
.LASF0:
	.ascii	"NODE_NONE\000"
.LASF9:
	.ascii	"type\000"
.LASF38:
	.ascii	"compileRoute\000"
.LASF37:
	.ascii	"current\000"
.LASF31:
	.ascii	"path\000"
.LASF40:
	.ascii	"destination_id\000"
.LASF21:
	.ascii	"distances\000"
.LASF22:
	.ascii	"PathSwitchPositions\000"
.LASF28:
	.ascii	"size\000"
.LASF19:
	.ascii	"length\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
