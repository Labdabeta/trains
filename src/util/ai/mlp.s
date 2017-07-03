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
	.file	"mlp.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	__aeabi_fmul
	.global	__aeabi_fdiv
	.global	__aeabi_fsub
	.global	__aeabi_fadd
	.align	2
	.global	approx_ln1
	.syntax unified
	.arm
	.fpu softvfp
	.type	approx_ln1, %function
approx_ln1:
.LFB0:
	.file 1 "src/util/ai/mlp.c"
	.loc 1 7 0
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
	str	r0, [fp, #-16]	@ float
	.loc 1 7 0
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul(PLT)
.LVL0:
	mov	r3, r0
	mov	r1, #1073741824
	mov	r0, r3
	bl	__aeabi_fdiv(PLT)
.LVL1:
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fsub(PLT)
.LVL2:
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul(PLT)
.LVL3:
	mov	r3, r0
	ldr	r1, [fp, #-16]	@ float
	mov	r0, r3
	bl	__aeabi_fmul(PLT)
.LVL4:
	mov	r3, r0
	ldr	r1, .L3
	mov	r0, r3
	bl	__aeabi_fdiv(PLT)
.LVL5:
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd(PLT)
.LVL6:
	mov	r3, r0
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
.L4:
	.align	2
.L3:
	.word	1077936128
	.cfi_endproc
.LFE0:
	.size	approx_ln1, .-approx_ln1
	.align	2
	.global	approx_exp
	.syntax unified
	.arm
	.fpu softvfp
	.type	approx_exp, %function
approx_exp:
.LFB1:
	.loc 1 8 0
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
	str	r0, [fp, #-16]	@ float
	.loc 1 8 0
	mov	r1, #1065353216
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fadd(PLT)
.LVL7:
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul(PLT)
.LVL8:
	mov	r3, r0
	mov	r1, #1073741824
	mov	r0, r3
	bl	__aeabi_fdiv(PLT)
.LVL9:
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd(PLT)
.LVL10:
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul(PLT)
.LVL11:
	mov	r3, r0
	ldr	r1, [fp, #-16]	@ float
	mov	r0, r3
	bl	__aeabi_fmul(PLT)
.LVL12:
	mov	r3, r0
	ldr	r1, .L7
	mov	r0, r3
	bl	__aeabi_fdiv(PLT)
.LVL13:
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd(PLT)
.LVL14:
	mov	r3, r0
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
.L8:
	.align	2
.L7:
	.word	1086324736
	.cfi_endproc
.LFE1:
	.size	approx_exp, .-approx_exp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	softplus, %function
softplus:
.LFB2:
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
	str	r0, [fp, #-8]	@ float
	.loc 1 10 0
	ldr	r0, [fp, #-8]	@ float
	bl	approx_exp(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	approx_ln1(PLT)
	mov	r3, r0
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
.LFE2:
	.size	softplus, .-softplus
	.global	__aeabi_f2d
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_d2f
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sigmoid, %function
sigmoid:
.LFB3:
	.loc 1 11 0
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
	str	r0, [fp, #-16]	@ float
	.loc 1 11 0
	ldr	r3, [fp, #-16]
	eor	r3, r3, #-2147483648
	mov	r0, r3
	bl	approx_exp(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d(PLT)
.LVL15:
	mov	r2, #0
	ldr	r3, .L13
	bl	__aeabi_dadd(PLT)
.LVL16:
	mov	r3, r0
	mov	r4, r1
	mov	r2, r3
	mov	r3, r4
	mov	r0, #0
	ldr	r1, .L13
	bl	__aeabi_ddiv(PLT)
.LVL17:
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f(PLT)
.LVL18:
	mov	r3, r0
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
.L14:
	.align	2
.L13:
	.word	1072693248
	.cfi_endproc
.LFE3:
	.size	sigmoid, .-sigmoid
	.global	__aeabi_dsub
	.global	__aeabi_dmul
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	dsigmoid, %function
dsigmoid:
.LFB4:
	.loc 1 12 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #12
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	str	r0, [fp, #-16]	@ float
	.loc 1 12 0
	ldr	r0, [fp, #-16]	@ float
	bl	sigmoid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d(PLT)
.LVL19:
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [fp, #-16]	@ float
	bl	sigmoid(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d(PLT)
.LVL20:
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L17
	bl	__aeabi_dsub(PLT)
.LVL21:
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul(PLT)
.LVL22:
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f(PLT)
.LVL23:
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	.cfi_def_cfa 13, 16
	@ sp needed
	pop	{r4, r5, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L18:
	.align	2
.L17:
	.word	1072693248
	.cfi_endproc
.LFE4:
	.size	dsigmoid, .-dsigmoid
	.global	__aeabi_fcmplt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	rectifier, %function
rectifier:
.LFB5:
	.loc 1 13 0
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
	str	r0, [fp, #-8]	@ float
	.loc 1 13 0
	mov	r1, #0
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fcmplt(PLT)
.LVL24:
	mov	r3, r0
	cmp	r3, #0
	beq	.L25
	.loc 1 13 0 is_stmt 0 discriminator 1
	mov	r3, #0
	b	.L23
.L25:
	.loc 1 13 0 discriminator 2
	ldr	r3, [fp, #-8]	@ float
.L23:
	.loc 1 13 0 discriminator 5
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
.LFE5:
	.size	rectifier, .-rectifier
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	step, %function
step:
.LFB6:
	.loc 1 14 0 is_stmt 1
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
	str	r0, [fp, #-8]	@ float
	.loc 1 14 0
	mov	r1, #0
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fcmplt(PLT)
.LVL25:
	mov	r3, r0
	cmp	r3, #0
	beq	.L32
	.loc 1 14 0 is_stmt 0 discriminator 1
	mov	r3, #0
	b	.L30
.L32:
	.loc 1 14 0 discriminator 2
	mov	r3, #1065353216
.L30:
	.loc 1 14 0 discriminator 5
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
.LFE6:
	.size	step, .-step
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	identity, %function
identity:
.LFB7:
	.loc 1 15 0 is_stmt 1
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
	str	r0, [fp, #-8]	@ float
	.loc 1 15 0
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE7:
	.size	identity, .-identity
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	unity, %function
unity:
.LFB8:
	.loc 1 16 0
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
	str	r0, [fp, #-8]	@ float
	.loc 1 16 0
	mov	r3, #1065353216
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE8:
	.size	unity, .-unity
	.align	2
	.global	mlpInit
	.syntax unified
	.arm
	.fpu softvfp
	.type	mlpInit, %function
mlpInit:
.LFB9:
	.loc 1 19 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 21 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #24]
	.loc 1 22 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #20]
	.loc 1 23 0
	ldr	r3, [fp, #-32]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #16]
	.loc 1 24 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #4]
	.loc 1 25 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #8]
	.loc 1 26 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #8]
	str	r2, [r3]
	.loc 1 27 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #4]
	str	r2, [r3, #12]
	.loc 1 29 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-12]
	.loc 1 31 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L38
.L42:
.LBB2:
	.loc 1 34 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	.loc 1 35 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L39
.L40:
	.loc 1 36 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	.loc 1 37 0 discriminator 3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 1 38 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 1 39 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	mov	r2, #0
	str	r2, [r3, #12]	@ float
	.loc 1 40 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	mov	r2, #0
	str	r2, [r3, #16]	@ float
	.loc 1 41 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	mov	r2, #0
	str	r2, [r3, #8]	@ float
	.loc 1 35 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L39:
	.loc 1 35 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L40
	.loc 1 44 0 is_stmt 1
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L41
	.loc 1 45 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #24]
.L41:
	.loc 1 47 0 discriminator 2
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-12]
.LBE2:
	.loc 1 31 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L38:
	.loc 1 31 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L42
	.loc 1 49 0 is_stmt 1
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE9:
	.size	mlpInit, .-mlpInit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	node_output, %function
node_output:
.LFB10:
	.loc 1 52 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
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
	mov	r3, r2
	strb	r3, [fp, #-29]
	.loc 1 55 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #12]	@ float
	.loc 1 56 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L44
.L45:
	.loc 1 57 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r4, [r3, #12]	@ float
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul(PLT)
.LVL26:
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd(PLT)
.LVL27:
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #12]	@ float
	.loc 1 56 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L44:
	.loc 1 56 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L45
	.loc 1 58 0 is_stmt 1
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]	@ float
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd(PLT)
.LVL28:
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #12]	@ float
	.loc 1 60 0
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L46
.L48:
	b	.L47
	b	.L49
	b	.L50
	b	.L51
	.p2align 1
.L47:
	.loc 1 62 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	step(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #16]	@ float
	.loc 1 63 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	rectifier(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #12]	@ float
	.loc 1 64 0
	b	.L46
.L49:
	.loc 1 66 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	sigmoid(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #16]	@ float
	.loc 1 67 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	softplus(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #12]	@ float
	.loc 1 68 0
	b	.L46
.L50:
	.loc 1 70 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	dsigmoid(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #16]	@ float
	.loc 1 71 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	sigmoid(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #12]	@ float
	.loc 1 72 0
	b	.L46
.L51:
	.loc 1 74 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	unity(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #16]	@ float
	.loc 1 75 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	mov	r0, r3
	bl	identity(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #12]	@ float
	.loc 1 76 0
	nop
.L46:
	.loc 1 78 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]	@ float
	.loc 1 79 0
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
	.cfi_endproc
.LFE10:
	.size	node_output, .-node_output
	.align	2
	.global	network_value
	.syntax unified
	.arm
	.fpu softvfp
	.type	network_value, %function
network_value:
.LFB11:
	.loc 1 82 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #32
	.cfi_def_cfa 11, 4
	sub	sp, sp, #60
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	str	r2, [fp, #-88]
	.loc 1 82 0
	mov	r2, sp
	str	r2, [fp, #-92]
	.loc 1 84 0
	ldr	r2, [fp, #-80]
	ldr	r0, [r2, #24]
	sub	r2, r0, #1
	str	r2, [fp, #-56]
	mov	r2, r0
	mov	r1, r2
	mov	r2, #0
	lsl	r10, r2, #5
	orr	r10, r10, r1, lsr #27
	lsl	r9, r1, #5
	mov	r2, r0
	mov	r1, r2
	mov	r2, #0
	lsl	r8, r2, #5
	orr	r8, r8, r1, lsr #27
	lsl	r7, r1, #5
	mov	r2, r0
	lsl	r2, r2, #2
	add	r2, r2, #3
	add	r2, r2, #7
	lsr	r2, r2, #3
	lsl	r2, r2, #3
	sub	sp, sp, r2
	mov	r2, sp
	add	r2, r2, #3
	lsr	r2, r2, #2
	lsl	r2, r2, #2
	str	r2, [fp, #-60]
	.loc 1 85 0
	ldr	r2, [fp, #-80]
	ldr	r0, [r2, #24]
	sub	r2, r0, #1
	str	r2, [fp, #-64]
	mov	r2, r0
	mov	r1, r2
	mov	r2, #0
	lsl	r6, r2, #5
	orr	r6, r6, r1, lsr #27
	lsl	r5, r1, #5
	mov	r2, r0
	mov	r1, r2
	mov	r2, #0
	lsl	r4, r2, #5
	orr	r4, r4, r1, lsr #27
	lsl	r3, r1, #5
	mov	r3, r0
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-68]
	.loc 1 88 0
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-44]
	.loc 1 89 0
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-48]
	.loc 1 92 0
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L54
.L55:
	.loc 1 93 0 discriminator 3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-84]
	add	r2, r1, r2
	ldr	r2, [r2]	@ float
	str	r2, [r3]	@ float
	.loc 1 92 0 discriminator 3
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L54:
	.loc 1 92 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-80]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L55
	.loc 1 95 0 is_stmt 1
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L56
.L59:
.LBB3:
	.loc 1 99 0
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L57
.L58:
	.loc 1 100 0 discriminator 3
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r4, r2, r3
	ldr	r3, [fp, #-80]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r0, r1, r3
	ldr	r3, [fp, #-80]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, [fp, #-44]
	bl	node_output(PLT)
	mov	r3, r0
	str	r3, [r4]	@ float
	.loc 1 99 0 discriminator 3
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
.L57:
	.loc 1 99 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-80]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bgt	.L58
	.loc 1 103 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-72]
	.loc 1 104 0 discriminator 2
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	.loc 1 105 0 discriminator 2
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-48]
.LBE3:
	.loc 1 95 0 discriminator 2
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L56:
	.loc 1 95 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-80]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L59
	.loc 1 108 0 is_stmt 1
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	beq	.L60
	.loc 1 109 0
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L61
.L62:
	.loc 1 110 0 discriminator 3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-44]
	add	r2, r1, r2
	ldr	r2, [r2]	@ float
	str	r2, [r3]	@ float
	.loc 1 109 0 discriminator 3
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L61:
	.loc 1 109 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-80]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L62
.L60:
	ldr	sp, [fp, #-92]
	.loc 1 112 0 is_stmt 1
	nop
	sub	sp, fp, #32
	.cfi_def_cfa 13, 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE11:
	.size	network_value, .-network_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	get_back_last_output, %function
get_back_last_output:
.LFB12:
	.loc 1 115 0
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
	str	r3, [fp, #-20]
	.loc 1 116 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	ble	.L64
	.loc 1 117 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L65
	.loc 1 117 0 is_stmt 0 discriminator 1
	mov	r3, #1065353216
	b	.L66
.L65:
	.loc 1 118 0 is_stmt 1
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #12]	@ float
	b	.L66
.L64:
	.loc 1 120 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L67
	.loc 1 120 0 is_stmt 0 discriminator 1
	mov	r3, #1065353216
	b	.L66
.L67:
	.loc 1 121 0 is_stmt 1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
.L66:
	.loc 1 123 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE12:
	.size	get_back_last_output, .-get_back_last_output
	.global	__aeabi_fcmpgt
	.align	2
	.global	network_train
	.syntax unified
	.arm
	.fpu softvfp
	.type	network_train, %function
network_train:
.LFB13:
	.loc 1 126 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #32
	.cfi_def_cfa 11, 4
	sub	sp, sp, #84
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	.loc 1 126 0
	mov	r3, sp
	str	r3, [fp, #-116]
	.loc 1 128 0
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #24]
	add	r0, r3, #1
	ldr	r3, [fp, #-96]
	ldr	ip, [r3, #4]
	sub	r3, r0, #1
	str	r3, [fp, #-60]
	mov	r3, r0
	mov	r4, #0
	lsl	r10, r4, #5
	orr	r10, r10, r3, lsr #27
	lsl	r9, r3, #5
	mov	r3, r0
	lsl	r3, r3, #2
	str	r3, [fp, #-112]
	sub	r3, ip, #1
	str	r3, [fp, #-64]
	mov	r3, r0
	mov	r9, r3
	mov	r10, #0
	mov	r3, ip
	mov	r1, r3
	mov	r2, #0
	mul	lr, r1, r10
	mul	r3, r9, r2
	add	lr, lr, r3
	umull	r3, r4, r9, r1
	add	r2, lr, r4
	mov	r4, r2
	lsl	r8, r4, #5
	orr	r8, r8, r3, lsr #27
	lsl	r7, r3, #5
	mov	r3, r0
	mov	r7, r3
	mov	r8, #0
	mov	r3, ip
	mov	r1, r3
	mov	r2, #0
	mul	lr, r1, r8
	mul	r3, r7, r2
	add	lr, lr, r3
	umull	r3, r4, r7, r1
	add	r2, lr, r4
	mov	r4, r2
	lsl	r6, r4, #5
	orr	r6, r6, r3, lsr #27
	lsl	r5, r3, #5
	mov	r3, r0
	mov	r2, ip
	mul	r3, r2, r3
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-68]
	.loc 1 131 0
	ldr	r2, [fp, #-104]
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-96]
	bl	network_value(PLT)
	.loc 1 134 0
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L69
.L72:
	.loc 1 135 0
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L70
.L71:
	.loc 1 136 0 discriminator 3
	ldr	r3, [fp, #-112]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-40]
	mul	r1, r2, r1
	ldr	r2, [fp, #-44]
	add	r2, r1, r2
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]	@ float
	.loc 1 135 0 discriminator 3
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L70:
	.loc 1 135 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bgt	.L71
	.loc 1 134 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L69:
	.loc 1 134 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L72
	.loc 1 140 0 is_stmt 1
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #4]
	sub	r3, r3, #1
	str	r3, [fp, #-40]
	.loc 1 141 0
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L73
.L74:
.LBB4:
	.loc 1 144 0 discriminator 3
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #12]	@ float
	str	r3, [fp, #-72]	@ float
	.loc 1 145 0 discriminator 3
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #16]	@ float
	str	r3, [fp, #-76]	@ float
	.loc 1 146 0 discriminator 3
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	str	r3, [fp, #-80]	@ float
	.loc 1 147 0 discriminator 3
	ldr	r3, [fp, #-112]
	lsr	r4, r3, #2
	ldr	r1, [fp, #-80]	@ float
	ldr	r0, [fp, #-72]	@ float
	bl	__aeabi_fsub(PLT)
.LVL29:
	mov	r3, r0
	ldr	r1, [fp, #-76]	@ float
	mov	r0, r3
	bl	__aeabi_fmul(PLT)
.LVL30:
	mov	r3, r0
	mov	r0, r3
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-40]
	mul	r1, r2, r4
	ldr	r2, [fp, #-44]
	add	r2, r1, r2
	str	r0, [r3, r2, lsl #2]	@ float
.LBE4:
	.loc 1 141 0 discriminator 3
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L73:
	.loc 1 141 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bgt	.L74
	.loc 1 151 0 is_stmt 1
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #4]
	sub	r3, r3, #2
	str	r3, [fp, #-40]
	b	.L75
.L80:
	.loc 1 152 0
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L76
.L79:
.LBB5:
	.loc 1 156 0
	mov	r3, #0
	str	r3, [fp, #-52]	@ float
	.loc 1 157 0
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L77
.L78:
	.loc 1 158 0 discriminator 3
	ldr	r3, [fp, #-112]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-40]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	mul	r1, r2, r1
	ldr	r2, [fp, #-48]
	add	r2, r1, r2
	ldr	r0, [r3, r2, lsl #2]	@ float
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-48]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul(PLT)
.LVL31:
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-52]	@ float
	bl	__aeabi_fadd(PLT)
.LVL32:
	mov	r3, r0
	str	r3, [fp, #-52]	@ float
	.loc 1 157 0 discriminator 3
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L77:
	.loc 1 157 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	bgt	.L78
	.loc 1 160 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-112]
	lsr	r4, r3, #2
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-48]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #16]	@ float
	ldr	r1, [fp, #-52]	@ float
	mov	r0, r3
	bl	__aeabi_fmul(PLT)
.LVL33:
	mov	r3, r0
	mov	r0, r3
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-40]
	mul	r1, r2, r4
	ldr	r2, [fp, #-44]
	add	r2, r1, r2
	str	r0, [r3, r2, lsl #2]	@ float
.LBE5:
	.loc 1 152 0 discriminator 2
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L76:
	.loc 1 152 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bgt	.L79
	.loc 1 151 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-40]
	sub	r3, r3, #1
	str	r3, [fp, #-40]
.L75:
	.loc 1 151 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bge	.L80
	.loc 1 165 0 is_stmt 1
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L81
.L94:
	.loc 1 166 0
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L82
.L93:
.LBB6:
	.loc 1 171 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3]
	str	r3, [fp, #-84]
	.loc 1 172 0
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L83
.L88:
.LBB7:
	.loc 1 173 0
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-40]
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-96]
	bl	get_back_last_output(PLT)
	str	r0, [fp, #-88]	@ float
	.loc 1 174 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #2
	add	r4, r2, r3
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r5, [r3]	@ float
	.loc 1 175 0
	ldr	r3, [fp, #4]
	eor	r0, r3, #-2147483648
	ldr	r3, [fp, #-112]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-40]
	mul	r1, r2, r1
	ldr	r2, [fp, #-44]
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]	@ float
	mov	r1, r3
	bl	__aeabi_fmul(PLT)
.LVL34:
	mov	r3, r0
	ldr	r1, [fp, #-88]	@ float
	mov	r0, r3
	bl	__aeabi_fmul(PLT)
.LVL35:
	mov	r3, r0
	.loc 1 174 0
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fadd(PLT)
.LVL36:
	mov	r3, r0
	str	r3, [r4]	@ float
	.loc 1 176 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	ldr	r1, .L99
	mov	r0, r3
	bl	__aeabi_fcmpgt(PLT)
.LVL37:
	mov	r3, r0
	cmp	r3, #0
	beq	.L84
	.loc 1 177 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, .L99
	str	r2, [r3]	@ float
.L84:
	.loc 1 178 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	ldr	r1, .L99+4
	mov	r0, r3
	bl	__aeabi_fcmplt(PLT)
.LVL38:
	mov	r3, r0
	cmp	r3, #0
	beq	.L86
	.loc 1 179 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, .L99+4
	str	r2, [r3]	@ float
.L86:
.LBE7:
	.loc 1 172 0 discriminator 2
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
.L83:
	.loc 1 172 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-84]
	sub	r2, r3, #1
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	bgt	.L88
	.loc 1 183 0 is_stmt 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r4, r1, r3
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r5, [r3, #8]	@ float
	ldr	r3, [fp, #4]
	eor	r0, r3, #-2147483648
	ldr	r3, [fp, #-112]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-68]
	ldr	r1, [fp, #-40]
	mul	r1, r2, r1
	ldr	r2, [fp, #-44]
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]	@ float
	mov	r1, r3
	bl	__aeabi_fmul(PLT)
.LVL39:
	mov	r3, r0
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fadd(PLT)
.LVL40:
	mov	r3, r0
	str	r3, [r4, #8]	@ float
	.loc 1 184 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	ldr	r1, .L99
	mov	r0, r3
	bl	__aeabi_fcmpgt(PLT)
.LVL41:
	mov	r3, r0
	cmp	r3, #0
	beq	.L89
	.loc 1 185 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, .L99
	str	r2, [r3, #8]	@ float
.L89:
	.loc 1 186 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #8]	@ float
	ldr	r1, .L99+4
	mov	r0, r3
	bl	__aeabi_fcmplt(PLT)
.LVL42:
	mov	r3, r0
	cmp	r3, #0
	beq	.L91
	.loc 1 187 0
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, .L99+4
	str	r2, [r3, #8]	@ float
.L91:
.LBE6:
	.loc 1 168 0
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L82:
	.loc 1 167 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	.loc 1 166 0 discriminator 1
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bgt	.L93
	.loc 1 165 0 discriminator 2
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L81:
	.loc 1 165 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L94
	ldr	sp, [fp, #-116]
	.loc 1 190 0 is_stmt 1
	nop
	sub	sp, fp, #32
	.cfi_def_cfa 13, 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L100:
	.align	2
.L99:
	.word	1092616192
	.word	-1054867456
	.cfi_endproc
.LFE13:
	.size	network_train, .-network_train
.Letext0:
	.file 2 "src/util/ai/mlp.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x617
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0xc
	.4byte	.LASF56
	.4byte	.LASF57
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x14
	.byte	0x2
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x5
	.4byte	0x6e
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x6
	.4byte	0x75
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x7
	.4byte	0x7b
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x8
	.4byte	0x7b
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.4byte	0x7b
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.4byte	0x7b
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF5
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x2
	.byte	0xa
	.4byte	0x8d
	.uleb128 0x5
	.byte	0x4
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF58
	.byte	0x1
	.4byte	0xbc
	.byte	0x2
	.byte	0xc
	.4byte	0xbc
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.4byte	0x124
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x14
	.4byte	0x124
	.byte	0
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x15
	.4byte	0x6e
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x16
	.4byte	0x12a
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.4byte	0x130
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0x18
	.4byte	0x6e
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x2
	.byte	0x19
	.4byte	0x6e
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x2
	.byte	0x1a
	.4byte	0x6e
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x82
	.uleb128 0x5
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x5
	.byte	0x4
	.4byte	0x93
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x2
	.byte	0x1b
	.4byte	0xc3
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x1
	.byte	0x7d
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26f
	.uleb128 0xb
	.ascii	"nn\000"
	.byte	0x1
	.byte	0x7d
	.4byte	0x26f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x7d
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x7d
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x1
	.byte	0x7d
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xb
	.ascii	"eta\000"
	.byte	0x1
	.byte	0x7d
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x1
	.byte	0x7f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x1
	.byte	0x7f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0x80
	.4byte	0x275
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0xe
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x206
	.uleb128 0xf
	.ascii	"val\000"
	.byte	0x1
	.byte	0x8e
	.4byte	0x7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x8e
	.4byte	0x7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x1
	.byte	0x8e
	.4byte	0x7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0xe
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x22e
	.uleb128 0xf
	.ascii	"w\000"
	.byte	0x1
	.byte	0x99
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x9a
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x10
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x1
	.byte	0xa9
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x1
	.byte	0xa9
	.4byte	0x6e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x10
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x1
	.byte	0xad
	.4byte	0x7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x136
	.uleb128 0x11
	.4byte	0x7b
	.4byte	0x292
	.uleb128 0x12
	.4byte	0x292
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.uleb128 0x12
	.4byte	0x292
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF32
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0x72
	.4byte	0x7b
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ea
	.uleb128 0xb
	.ascii	"nn\000"
	.byte	0x1
	.byte	0x72
	.4byte	0x26f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x72
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x1
	.byte	0x72
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x1
	.byte	0x72
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x1
	.byte	0x51
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x398
	.uleb128 0xb
	.ascii	"nn\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x26f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x51
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x51
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x1
	.byte	0x54
	.4byte	0x398
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x1
	.byte	0x55
	.4byte	0x3ab
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0xd
	.4byte	.LASF37
	.byte	0x1
	.byte	0x56
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x1
	.byte	0x57
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x10
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0xf
	.ascii	"x\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xf
	.ascii	"swp\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0x7b
	.4byte	0x3ab
	.uleb128 0x12
	.4byte	0x292
	.uleb128 0x3
	.byte	0x91
	.sleb128 -60
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.4byte	0x7b
	.4byte	0x3bf
	.uleb128 0x12
	.4byte	0x292
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.byte	0
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.byte	0x33
	.4byte	0x7b
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x40d
	.uleb128 0xb
	.ascii	"n\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x33
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x1
	.byte	0x33
	.4byte	0x93
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x35
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.byte	0x12
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c2
	.uleb128 0xb
	.ascii	"nn\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x26f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x1
	.byte	0x12
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x12
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.4byte	.LASF44
	.byte	0x1
	.byte	0x12
	.4byte	0x12a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x12
	.4byte	0x130
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x12
	.4byte	0x124
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF1
	.byte	0x1
	.byte	0x12
	.4byte	0x4c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x1
	.byte	0x14
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x1
	.byte	0x22
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x75
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.byte	0x10
	.4byte	0x7b
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4ee
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x1
	.byte	0xf
	.4byte	0x7b
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x514
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0xf
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0xe
	.4byte	0x7b
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x53a
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x1
	.byte	0xd
	.4byte	0x7b
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x560
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0xc
	.4byte	0x7b
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x586
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0xc
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x1
	.byte	0xb
	.4byte	0x7b
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ac
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0xa
	.4byte	0x7b
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d2
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0x1
	.byte	0x8
	.4byte	0x7b
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f8
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.4byte	.LASF54
	.byte	0x1
	.byte	0x7
	.4byte	0x7b
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0xc
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0x16
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
	.ascii	"MultilayerPerceptron\000"
.LASF33:
	.ascii	"network_train\000"
.LASF20:
	.ascii	"NNLayer\000"
.LASF55:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF42:
	.ascii	"mlpInit\000"
.LASF28:
	.ascii	"delta\000"
.LASF7:
	.ascii	"AF_SOFTPLUS\000"
.LASF29:
	.ascii	"weight\000"
.LASF44:
	.ascii	"layerSizes\000"
.LASF8:
	.ascii	"AF_SIGMOID\000"
.LASF47:
	.ascii	"unity\000"
.LASF1:
	.ascii	"weights\000"
.LASF3:
	.ascii	"last_output\000"
.LASF5:
	.ascii	"float\000"
.LASF43:
	.ascii	"numInputs\000"
.LASF11:
	.ascii	"PerceptronNode\000"
.LASF0:
	.ascii	"size\000"
.LASF14:
	.ascii	"numLayers\000"
.LASF21:
	.ascii	"NeuralNetwork\000"
.LASF30:
	.ascii	"num_weights\000"
.LASF25:
	.ascii	"deltas\000"
.LASF6:
	.ascii	"AF_RELU\000"
.LASF10:
	.ascii	"unsigned char\000"
.LASF48:
	.ascii	"identity\000"
.LASF22:
	.ascii	"real_outputs\000"
.LASF39:
	.ascii	"get_back_last_output\000"
.LASF56:
	.ascii	"src/util/ai/mlp.c\000"
.LASF46:
	.ascii	"lastWeight\000"
.LASF9:
	.ascii	"AF_LINEAR\000"
.LASF50:
	.ascii	"rectifier\000"
.LASF41:
	.ascii	"activator\000"
.LASF18:
	.ascii	"inputs\000"
.LASF27:
	.ascii	"target\000"
.LASF17:
	.ascii	"outputs\000"
.LASF26:
	.ascii	"dval\000"
.LASF52:
	.ascii	"sigmoid\000"
.LASF49:
	.ascii	"step\000"
.LASF4:
	.ascii	"last_doutput\000"
.LASF13:
	.ascii	"layers\000"
.LASF35:
	.ascii	"values_array\000"
.LASF19:
	.ascii	"maxLayer\000"
.LASF45:
	.ascii	"lastSize\000"
.LASF32:
	.ascii	"sizetype\000"
.LASF57:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF36:
	.ascii	"new_values_array\000"
.LASF2:
	.ascii	"bias\000"
.LASF37:
	.ascii	"values\000"
.LASF31:
	.ascii	"last_back_output\000"
.LASF40:
	.ascii	"node_output\000"
.LASF51:
	.ascii	"dsigmoid\000"
.LASF16:
	.ascii	"activators\000"
.LASF38:
	.ascii	"new_values\000"
.LASF24:
	.ascii	"node\000"
.LASF58:
	.ascii	"ActivationFunction\000"
.LASF15:
	.ascii	"numNodes\000"
.LASF23:
	.ascii	"layer\000"
.LASF34:
	.ascii	"network_value\000"
.LASF54:
	.ascii	"approx_ln1\000"
.LASF59:
	.ascii	"approx_exp\000"
.LASF53:
	.ascii	"softplus\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
