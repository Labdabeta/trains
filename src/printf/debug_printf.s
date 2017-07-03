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
	.file	"debug_printf.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.bss
	.align	2
dstdout_putf:
	.space	4
	.size	dstdout_putf, 4
	.align	2
dstdout_putp:
	.space	4
	.size	dstdout_putp, 4
	.global	__aeabi_uldivmod
	.global	__aeabi_uidiv
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	uli2a, %function
uli2a:
.LFB0:
	.file 1 "src/printf/debug_printf.c"
	.loc 1 33 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #36
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	.loc 1 34 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 1 35 0
	mov	r3, #1
	str	r3, [fp, #-20]
	.loc 1 36 0
	b	.L2
.L3:
	.loc 1 37 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
.L2:
	.loc 1 36 0
	ldr	r3, [fp, #-20]
	mov	r4, #0
	mov	r2, r3
	mov	r3, r4
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_uldivmod(PLT)
.LVL0:
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mov	r4, #0
	cmp	r2, r4
	cmpeq	r1, r3
	bcs	.L3
	.loc 1 38 0
	b	.L4
.L10:
.LBB2:
	.loc 1 39 0
	ldr	r3, [fp, #-20]
	mov	r4, #0
	mov	r2, r3
	mov	r3, r4
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_uldivmod(PLT)
.LVL1:
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-24]
	.loc 1 40 0
	ldr	r3, [fp, #-20]
	mov	r4, #0
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_uldivmod(PLT)
.LVL2:
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	.loc 1 41 0
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-20]
	bl	__aeabi_uidiv(PLT)
.LVL3:
	mov	r3, r0
	str	r3, [fp, #-20]
	.loc 1 42 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L5
	.loc 1 42 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L5
	.loc 1 42 0 discriminator 2
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L4
.L5:
	.loc 1 43 0 is_stmt 1
	ldr	r2, [fp, #4]
	add	r3, r2, #1
	str	r3, [fp, #4]
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	ble	.L6
	.loc 1 43 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L7
	.loc 1 43 0 discriminator 3
	mov	r3, #55
	b	.L9
.L7:
	.loc 1 43 0 discriminator 4
	mov	r3, #87
	b	.L9
.L6:
	.loc 1 43 0 discriminator 2
	mov	r3, #48
.L9:
	.loc 1 43 0 discriminator 8
	ldr	r1, [fp, #-24]
	and	r1, r1, #255
	add	r3, r3, r1
	and	r3, r3, #255
	strb	r3, [r2]
	.loc 1 44 0 is_stmt 1 discriminator 8
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L4:
.LBE2:
	.loc 1 38 0
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L10
	.loc 1 47 0
	ldr	r3, [fp, #4]
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 48 0
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
	.cfi_endproc
.LFE0:
	.size	uli2a, .-uli2a
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	li2a, %function
li2a:
.LFB1:
	.loc 1 51 0
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
	str	r1, [fp, #-12]
	.loc 1 52 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L12
	.loc 1 53 0
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	str	r3, [fp, #-8]
	.loc 1 54 0
	ldr	r3, [fp, #-12]
	add	r2, r3, #1
	str	r2, [fp, #-12]
	mov	r2, #45
	strb	r2, [r3]
.L12:
	.loc 1 56 0
	ldr	r3, [fp, #-8]
	mov	r0, r3
	asr	r1, r0, #31
	ldr	r3, [fp, #-12]
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #10
	bl	uli2a(PLT)
	.loc 1 57 0
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
	.size	li2a, .-li2a
	.global	__aeabi_uidivmod
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ui2a, %function
ui2a:
.LFB2:
	.loc 1 62 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 63 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 64 0
	mov	r3, #1
	str	r3, [fp, #-12]
	.loc 1 65 0
	b	.L14
.L15:
	.loc 1 66 0
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	mul	r3, r2, r3
	str	r3, [fp, #-12]
.L14:
	.loc 1 65 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-24]
	bl	__aeabi_uidiv(PLT)
.LVL4:
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bcs	.L15
	.loc 1 67 0
	b	.L16
.L22:
.LBB3:
	.loc 1 68 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-24]
	bl	__aeabi_uidiv(PLT)
.LVL5:
	mov	r3, r0
	str	r3, [fp, #-16]
	.loc 1 69 0
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	__aeabi_uidivmod(PLT)
.LVL6:
	mov	r3, r1
	str	r3, [fp, #-24]
	.loc 1 70 0
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-12]
	bl	__aeabi_uidiv(PLT)
.LVL7:
	mov	r3, r0
	str	r3, [fp, #-12]
	.loc 1 71 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L17
	.loc 1 71 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L17
	.loc 1 71 0 discriminator 2
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L16
.L17:
	.loc 1 72 0 is_stmt 1
	ldr	r2, [fp, #-36]
	add	r3, r2, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L18
	.loc 1 72 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L19
	.loc 1 72 0 discriminator 3
	mov	r3, #55
	b	.L21
.L19:
	.loc 1 72 0 discriminator 4
	mov	r3, #87
	b	.L21
.L18:
	.loc 1 72 0 discriminator 2
	mov	r3, #48
.L21:
	.loc 1 72 0 discriminator 8
	ldr	r1, [fp, #-16]
	and	r1, r1, #255
	add	r3, r3, r1
	and	r3, r3, #255
	strb	r3, [r2]
	.loc 1 73 0 is_stmt 1 discriminator 8
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L16:
.LBE3:
	.loc 1 67 0
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L22
	.loc 1 76 0
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 77 0
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
.LFE2:
	.size	ui2a, .-ui2a
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	i2a, %function
i2a:
.LFB3:
	.loc 1 80 0
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
	.loc 1 81 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L24
	.loc 1 82 0
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	str	r3, [fp, #-8]
	.loc 1 83 0
	ldr	r3, [fp, #-12]
	add	r2, r3, #1
	str	r2, [fp, #-12]
	mov	r2, #45
	strb	r2, [r3]
.L24:
	.loc 1 85 0
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	mov	r1, #10
	bl	ui2a(PLT)
	.loc 1 86 0
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
	.size	i2a, .-i2a
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	a2d, %function
a2d:
.LFB4:
	.loc 1 89 0
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
	.loc 1 90 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L26
	.loc 1 90 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L26
	.loc 1 91 0 is_stmt 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #48
	b	.L27
.L26:
	.loc 1 92 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L28
	.loc 1 92 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L28
	.loc 1 93 0 is_stmt 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #87
	b	.L27
.L28:
	.loc 1 94 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L29
	.loc 1 94 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L29
	.loc 1 95 0 is_stmt 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #55
	b	.L27
.L29:
	.loc 1 96 0
	mvn	r3, #0
.L27:
	.loc 1 97 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE4:
	.size	a2d, .-a2d
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	a2i, %function
a2i:
.LFB5:
	.loc 1 100 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #32
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r3, r0
	strb	r3, [fp, #-21]
	.loc 1 101 0
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 1 102 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 1 104 0
	b	.L31
.L34:
	.loc 1 105 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bgt	.L36
	.loc 1 106 0
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	mul	r2, r3, r2
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 1 107 0
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	ldrb	r3, [r3]
	strb	r3, [fp, #-21]
.L31:
	.loc 1 104 0
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r0, r3
	bl	a2d(PLT)
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L34
	b	.L33
.L36:
	.loc 1 105 0
	nop
.L33:
	.loc 1 109 0
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	.loc 1 110 0
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 1 111 0
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	.loc 1 112 0
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
	.size	a2i, .-a2i
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	putchw, %function
putchw:
.LFB6:
	.loc 1 115 0
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
	strb	r3, [fp, #-25]
	.loc 1 116 0
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L38
	.loc 1 116 0 is_stmt 0 discriminator 1
	mov	r3, #48
	b	.L39
.L38:
	.loc 1 116 0 discriminator 2
	mov	r3, #32
.L39:
	.loc 1 116 0 discriminator 4
	strb	r3, [fp, #-9]
	.loc 1 118 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #4]
	str	r3, [fp, #-8]
	.loc 1 119 0 discriminator 4
	b	.L40
.L42:
	.loc 1 120 0
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L40:
	.loc 1 119 0
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L43
	.loc 1 119 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L42
	.loc 1 121 0 is_stmt 1
	b	.L43
.L44:
	.loc 1 122 0
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	mov	r1, r2
	ldr	r0, [fp, #-16]
	mov	lr, pc
	bx	r3
.LVL8:
.L43:
	.loc 1 121 0
	ldr	r3, [fp, #-24]
	sub	r2, r3, #1
	str	r2, [fp, #-24]
	cmp	r3, #0
	bgt	.L44
	.loc 1 123 0
	b	.L45
.L46:
	.loc 1 124 0
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	mov	r1, r2
	ldr	r0, [fp, #-16]
	mov	lr, pc
	bx	r3
.LVL9:
.L45:
	.loc 1 123 0
	ldr	r3, [fp, #4]
	add	r2, r3, #1
	str	r2, [fp, #4]
	ldrb	r3, [r3]
	strb	r3, [fp, #-10]
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L46
	.loc 1 125 0
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
.LFE6:
	.size	putchw, .-putchw
	.align	2
	.global	tfp_dformat
	.syntax unified
	.arm
	.fpu softvfp
	.type	tfp_dformat, %function
tfp_dformat:
.LFB7:
	.loc 1 128 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #52
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	.loc 1 134 0
	b	.L48
.L71:
	.loc 1 135 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L49
	.loc 1 136 0
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	ldr	r3, [fp, #-44]
	mov	r1, r2
	ldr	r0, [fp, #-40]
	mov	lr, pc
	bx	r3
.LVL10:
	b	.L48
.L49:
.LBB4:
	.loc 1 138 0
	mov	r3, #0
	strb	r3, [fp, #-14]
	.loc 1 140 0
	mov	r3, #0
	strb	r3, [fp, #-15]
	.loc 1 142 0
	mov	r3, #0
	str	r3, [fp, #-32]
	.loc 1 143 0
	ldr	r3, [fp, #-48]
	add	r2, r3, #1
	str	r2, [fp, #-48]
	ldrb	r3, [r3]
	strb	r3, [fp, #-13]
	.loc 1 144 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #48
	bne	.L50
	.loc 1 145 0
	ldr	r3, [fp, #-48]
	add	r2, r3, #1
	str	r2, [fp, #-48]
	ldrb	r3, [r3]
	strb	r3, [fp, #-13]
	.loc 1 146 0
	mov	r3, #1
	strb	r3, [fp, #-14]
.L50:
	.loc 1 148 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L51
	.loc 1 148 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L51
	.loc 1 149 0 is_stmt 1
	sub	r3, fp, #32
	sub	r1, fp, #48
	ldrb	r0, [fp, #-13]	@ zero_extendqisi2
	mov	r2, #10
	bl	a2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
.L51:
	.loc 1 152 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #108
	bne	.L52
	.loc 1 153 0
	ldr	r3, [fp, #-48]
	add	r2, r3, #1
	str	r2, [fp, #-48]
	ldrb	r3, [r3]
	strb	r3, [fp, #-13]
	.loc 1 154 0
	mov	r3, #1
	strb	r3, [fp, #-15]
.L52:
	.loc 1 157 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #99
	beq	.L54
	cmp	r3, #99
	bgt	.L55
	cmp	r3, #37
	beq	.L56
	cmp	r3, #88
	beq	.L57
	cmp	r3, #0
	beq	.L72
	.loc 1 198 0
	b	.L73
.L55:
	.loc 1 157 0
	cmp	r3, #115
	beq	.L59
	cmp	r3, #115
	bgt	.L60
	cmp	r3, #100
	beq	.L61
	.loc 1 198 0
	b	.L73
.L60:
	.loc 1 157 0
	cmp	r3, #117
	beq	.L62
	cmp	r3, #120
	beq	.L57
	.loc 1 198 0
	b	.L73
.L62:
	.loc 1 162 0
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L64
	.loc 1 163 0
	ldr	r3, [fp, #-52]
	add	r3, r3, #7
	bic	r3, r3, #7
	add	r2, r3, #8
	str	r2, [fp, #-52]
	ldmia	r3, {r0-r1}
	sub	r3, fp, #28
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #10
	bl	uli2a(PLT)
	b	.L65
.L64:
	.loc 1 166 0
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r0, [r3]
	sub	r3, fp, #28
	mov	r2, #0
	mov	r1, #10
	bl	ui2a(PLT)
.L65:
	.loc 1 167 0
	ldr	r2, [fp, #-32]
	ldrb	r1, [fp, #-14]	@ zero_extendqisi2
	sub	r3, fp, #28
	str	r3, [sp]
	mov	r3, r1
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-40]
	bl	putchw(PLT)
	.loc 1 168 0
	b	.L48
.L61:
	.loc 1 172 0
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L67
	.loc 1 173 0
	ldr	r3, [fp, #-52]
	add	r3, r3, #7
	bic	r3, r3, #7
	add	r2, r3, #8
	str	r2, [fp, #-52]
	ldmia	r3, {r3-r4}
	mov	r2, r3
	sub	r3, fp, #28
	mov	r1, r3
	mov	r0, r2
	bl	li2a(PLT)
	b	.L68
.L67:
	.loc 1 176 0
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r3, [r3]
	sub	r2, fp, #28
	mov	r1, r2
	mov	r0, r3
	bl	i2a(PLT)
.L68:
	.loc 1 177 0
	ldr	r2, [fp, #-32]
	ldrb	r1, [fp, #-14]	@ zero_extendqisi2
	sub	r3, fp, #28
	str	r3, [sp]
	mov	r3, r1
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-40]
	bl	putchw(PLT)
	.loc 1 178 0
	b	.L48
.L57:
	.loc 1 182 0
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L69
	.loc 1 183 0
	ldr	r3, [fp, #-52]
	add	r3, r3, #7
	bic	r3, r3, #7
	add	r2, r3, #8
	str	r2, [fp, #-52]
	ldmia	r3, {r0-r1}
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #88
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r2, r3
	sub	r3, fp, #28
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #16
	bl	uli2a(PLT)
	b	.L70
.L69:
	.loc 1 186 0
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r0, [r3]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #88
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r2, r3
	sub	r3, fp, #28
	mov	r1, #16
	bl	ui2a(PLT)
.L70:
	.loc 1 187 0
	ldr	r2, [fp, #-32]
	ldrb	r1, [fp, #-14]	@ zero_extendqisi2
	sub	r3, fp, #28
	str	r3, [sp]
	mov	r3, r1
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-40]
	bl	putchw(PLT)
	.loc 1 188 0
	b	.L48
.L54:
	.loc 1 190 0
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r3, [r3]
	and	r2, r3, #255
	ldr	r3, [fp, #-44]
	mov	r1, r2
	ldr	r0, [fp, #-40]
	mov	lr, pc
	bx	r3
.LVL11:
	.loc 1 191 0
	b	.L48
.L59:
	.loc 1 193 0
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r3, [r3]
	str	r3, [sp]
	mov	r3, #0
	mov	r2, r1
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-40]
	bl	putchw(PLT)
	.loc 1 194 0
	b	.L48
.L56:
	.loc 1 196 0
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	ldr	r3, [fp, #-44]
	mov	r1, r2
	ldr	r0, [fp, #-40]
	mov	lr, pc
	bx	r3
.LVL12:
.L73:
	.loc 1 198 0
	nop
.L48:
.LBE4:
	.loc 1 134 0
	ldr	r3, [fp, #-48]
	add	r2, r3, #1
	str	r2, [fp, #-48]
	ldrb	r3, [r3]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L71
	.loc 1 203 0
	b	.L63
.L72:
.LBB5:
	.loc 1 159 0
	nop
.L63:
.LBE5:
	.loc 1 203 0
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
	.cfi_endproc
.LFE7:
	.size	tfp_dformat, .-tfp_dformat
	.align	2
	.global	init_dprintf
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_dprintf, %function
init_dprintf:
.LFB8:
	.loc 1 207 0
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
	.loc 1 208 0
	ldr	r3, .L75
.LPIC0:
	add	r3, pc, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 1 209 0
	ldr	r3, .L75+4
.LPIC1:
	add	r3, pc, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	.loc 1 210 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L76:
	.align	2
.L75:
	.word	dstdout_putf-(.LPIC0+8)
	.word	dstdout_putp-(.LPIC1+8)
	.cfi_endproc
.LFE8:
	.size	init_dprintf, .-init_dprintf
	.align	2
	.global	tfp_dprintf
	.syntax unified
	.arm
	.fpu softvfp
	.type	tfp_dprintf, %function
tfp_dprintf:
.LFB9:
	.loc 1 213 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	.cfi_def_cfa_offset 16
	.cfi_offset 0, -16
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	push	{fp, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 11, -24
	.cfi_offset 14, -20
	add	fp, sp, #4
	.cfi_def_cfa 11, 20
	sub	sp, sp, #8
	.loc 1 215 0
	add	r3, fp, #8
	str	r3, [fp, #-8]
	.loc 1 216 0
	ldr	r3, .L78
.LPIC2:
	add	r3, pc, r3
	ldr	r0, [r3]
	ldr	r3, .L78+4
.LPIC3:
	add	r3, pc, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #4]
	bl	tfp_dformat(PLT)
	.loc 1 218 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 24
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 16
	add	sp, sp, #16
	.cfi_restore 3
	.cfi_restore 2
	.cfi_restore 1
	.cfi_restore 0
	.cfi_def_cfa_offset 0
	bx	lr
.L79:
	.align	2
.L78:
	.word	dstdout_putp-(.LPIC2+8)
	.word	dstdout_putf-(.LPIC3+8)
	.cfi_endproc
.LFE9:
	.size	tfp_dprintf, .-tfp_dprintf
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	putcp, %function
putcp:
.LFB10:
	.loc 1 221 0
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
	.loc 1 222 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-8]
	str	r1, [r2]
	ldrb	r2, [fp, #-9]
	strb	r2, [r3]
	.loc 1 223 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE10:
	.size	putcp, .-putcp
	.align	2
	.global	tfp_dsprintf
	.syntax unified
	.arm
	.fpu softvfp
	.type	tfp_dsprintf, %function
tfp_dsprintf:
.LFB11:
	.loc 1 228 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r1, r2, r3}
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	push	{fp, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 11, -20
	.cfi_offset 14, -16
	add	fp, sp, #4
	.cfi_def_cfa 11, 16
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	.loc 1 230 0
	add	r3, fp, #8
	str	r3, [fp, #-12]
	.loc 1 231 0
	sub	r0, fp, #20
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #4]
	ldr	r1, .L82
.LPIC4:
	add	r1, pc, r1
	bl	tfp_dformat(PLT)
	.loc 1 232 0
	sub	r3, fp, #20
	mov	r1, #0
	mov	r0, r3
	bl	putcp(PLT)
	.loc 1 234 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 20
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 12
	add	sp, sp, #12
	.cfi_restore 3
	.cfi_restore 2
	.cfi_restore 1
	.cfi_def_cfa_offset 0
	bx	lr
.L83:
	.align	2
.L82:
	.word	putcp-(.LPIC4+8)
	.cfi_endproc
.LFE11:
	.size	tfp_dsprintf, .-tfp_dsprintf
.Letext0:
	.file 2 "./res/6.3.1/include/stdarg.h"
	.file 3 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4c6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF25
	.4byte	.LASF26
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x28
	.4byte	0x30
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3
	.byte	0
	.4byte	0x47
	.uleb128 0x4
	.4byte	.LASF28
	.4byte	0x47
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x63
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x19
	.4byte	0x5f
	.uleb128 0x6
	.byte	0x4
	.4byte	0x65
	.uleb128 0x7
	.4byte	0x75
	.uleb128 0x8
	.4byte	0x47
	.uleb128 0x8
	.4byte	0x75
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0xa
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1a
	.4byte	0x54
	.uleb128 0x5
	.byte	0x3
	.4byte	dstdout_putf
	.uleb128 0xa
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1b
	.4byte	0x47
	.uleb128 0x5
	.byte	0x3
	.4byte	dstdout_putp
	.uleb128 0xb
	.4byte	.LASF5
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdc
	.uleb128 0xc
	.ascii	"s\000"
	.byte	0x1
	.byte	0xe3
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.ascii	"fmt\000"
	.byte	0x1
	.byte	0xe3
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.uleb128 0xe
	.ascii	"va\000"
	.byte	0x1
	.byte	0xe5
	.4byte	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x75
	.uleb128 0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0xdc
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x110
	.uleb128 0xc
	.ascii	"p\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"c\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0xd4
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x142
	.uleb128 0xc
	.ascii	"fmt\000"
	.byte	0x1
	.byte	0xd4
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xd
	.uleb128 0xe
	.ascii	"va\000"
	.byte	0x1
	.byte	0xd6
	.4byte	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.byte	0xce
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x174
	.uleb128 0x11
	.4byte	.LASF8
	.byte	0x1
	.byte	0xce
	.4byte	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF9
	.byte	0x1
	.byte	0xce
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x1
	.byte	0x7f
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x213
	.uleb128 0x11
	.4byte	.LASF8
	.byte	0x1
	.byte	0x7f
	.4byte	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.4byte	.LASF9
	.byte	0x1
	.byte	0x7f
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.ascii	"fmt\000"
	.byte	0x1
	.byte	0x7f
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xc
	.ascii	"va\000"
	.byte	0x1
	.byte	0x7f
	.4byte	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.ascii	"bf\000"
	.byte	0x1
	.byte	0x81
	.4byte	0x213
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xe
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x83
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x1
	.byte	0xca
	.4byte	.L63
	.uleb128 0x13
	.4byte	.Ldebug_ranges0+0
	.uleb128 0xe
	.ascii	"lz\000"
	.byte	0x1
	.byte	0x8a
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xe
	.ascii	"lng\000"
	.byte	0x1
	.byte	0x8c
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0xe
	.ascii	"w\000"
	.byte	0x1
	.byte	0x8e
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0x75
	.4byte	0x223
	.uleb128 0x15
	.4byte	0x223
	.byte	0xb
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x16
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.byte	0x72
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ae
	.uleb128 0x11
	.4byte	.LASF8
	.byte	0x1
	.byte	0x72
	.4byte	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF9
	.byte	0x1
	.byte	0x72
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"n\000"
	.byte	0x1
	.byte	0x72
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.ascii	"z\000"
	.byte	0x1
	.byte	0x72
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0xc
	.ascii	"bf\000"
	.byte	0x1
	.byte	0x72
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii	"fc\000"
	.byte	0x1
	.byte	0x74
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0xe
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x75
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0x76
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.ascii	"a2i\000"
	.byte	0x1
	.byte	0x63
	.4byte	0x75
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x327
	.uleb128 0xc
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x63
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0xc
	.ascii	"src\000"
	.byte	0x1
	.byte	0x63
	.4byte	0x327
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x63
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.4byte	.LASF16
	.byte	0x1
	.byte	0x63
	.4byte	0x32d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"num\000"
	.byte	0x1
	.byte	0x66
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x67
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xdc
	.uleb128 0x6
	.byte	0x4
	.4byte	0x22a
	.uleb128 0x19
	.ascii	"a2d\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x22a
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x35a
	.uleb128 0xc
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1a
	.ascii	"i2a\000"
	.byte	0x1
	.byte	0x4f
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38b
	.uleb128 0xc
	.ascii	"num\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"bf\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3d
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x407
	.uleb128 0xc
	.ascii	"num\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3d
	.4byte	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.ascii	"uc\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.ascii	"bf\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.ascii	"n\000"
	.byte	0x1
	.byte	0x3f
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"d\000"
	.byte	0x1
	.byte	0x40
	.4byte	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0xe
	.ascii	"dgt\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0x17
	.4byte	.LASF20
	.byte	0x1
	.byte	0x32
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43f
	.uleb128 0xc
	.ascii	"num\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x43f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"bf\000"
	.byte	0x1
	.byte	0x32
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.4byte	.LASF21
	.uleb128 0x17
	.4byte	.LASF22
	.byte	0x1
	.byte	0x20
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c2
	.uleb128 0xc
	.ascii	"num\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x4c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x20
	.4byte	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xc
	.ascii	"uc\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.ascii	"bf\000"
	.byte	0x1
	.byte	0x20
	.4byte	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii	"n\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"d\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x407
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xe
	.ascii	"dgt\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.byte	0x7
	.4byte	.LASF23
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xd
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF10:
	.ascii	"tfp_dformat\000"
.LASF24:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF21:
	.ascii	"long int\000"
.LASF5:
	.ascii	"tfp_dsprintf\000"
.LASF3:
	.ascii	"dstdout_putf\000"
.LASF0:
	.ascii	"__gnuc_va_list\000"
.LASF27:
	.ascii	"__va_list\000"
.LASF2:
	.ascii	"putcf\000"
.LASF4:
	.ascii	"dstdout_putp\000"
.LASF15:
	.ascii	"base\000"
.LASF13:
	.ascii	"putcp\000"
.LASF1:
	.ascii	"va_list\000"
.LASF19:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"tfp_dprintf\000"
.LASF17:
	.ascii	"digit\000"
.LASF11:
	.ascii	"char\000"
.LASF7:
	.ascii	"init_dprintf\000"
.LASF28:
	.ascii	"__ap\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF25:
	.ascii	"src/printf/debug_printf.c\000"
.LASF26:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF18:
	.ascii	"ui2a\000"
.LASF16:
	.ascii	"nump\000"
.LASF22:
	.ascii	"uli2a\000"
.LASF9:
	.ascii	"putf\000"
.LASF14:
	.ascii	"putchw\000"
.LASF8:
	.ascii	"putp\000"
.LASF29:
	.ascii	"abort\000"
.LASF20:
	.ascii	"li2a\000"
.LASF23:
	.ascii	"long long unsigned int\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
