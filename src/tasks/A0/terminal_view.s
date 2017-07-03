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
	.file	"terminal_view.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[%d;%dH\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	escape_jump, %function
escape_jump:
.LFB0:
	.file 1 "src/tasks/A0/terminal_view.c"
	.loc 1 7 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 1 9 0
	sub	r0, fp, #20
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r1, .L2
.LPIC0:
	add	r1, pc, r1
	bl	tfp_sprintf(PLT)
	.loc 1 10 0
	sub	r3, fp, #20
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 11 0
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
	.word	.LC0-(.LPIC0+8)
	.cfi_endproc
.LFE0:
	.size	escape_jump, .-escape_jump
	.align	2
	.global	prettybox
	.syntax unified
	.arm
	.fpu softvfp
	.type	prettybox, %function
prettybox:
.LFB1:
	.loc 1 13 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	.loc 1 15 0
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	escape_jump(PLT)
	.loc 1 16 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	.loc 1 17 0 discriminator 3
	mov	r0, #95
	bl	cputc(PLT)
	.loc 1 16 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	.loc 1 16 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	sub	r2, r3, #1
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L6
	.loc 1 19 0 is_stmt 1
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L7
.L8:
	.loc 1 20 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	escape_jump(PLT)
	.loc 1 21 0 discriminator 3
	mov	r0, #124
	bl	cputc(PLT)
	.loc 1 22 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	escape_jump(PLT)
	.loc 1 23 0 discriminator 3
	mov	r0, #124
	bl	cputc(PLT)
	.loc 1 19 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	.loc 1 19 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L8
	.loc 1 25 0 is_stmt 1
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	escape_jump(PLT)
	.loc 1 26 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L10:
	.loc 1 27 0 discriminator 3
	mov	r0, #95
	bl	cputc(PLT)
	.loc 1 26 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L9:
	.loc 1 26 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	sub	r2, r3, #1
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L10
	.loc 1 29 0 is_stmt 1
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
	.size	prettybox, .-prettybox
	.section	.rodata
	.align	2
.LC1:
	.ascii	"\033[2J\000"
	.align	2
.LC2:
	.ascii	"\033[?25l\000"
	.align	2
.LC3:
	.ascii	"\033[31m\000"
	.align	2
.LC4:
	.ascii	"Taggart Transcontinental Control Console\000"
	.align	2
.LC5:
	.ascii	"\033[37m\000"
	.align	2
.LC6:
	.ascii	">\000"
	.align	2
.LC7:
	.ascii	"_____v______v_______________________\000"
	.align	2
.LC8:
	.ascii	"    /      /                        \\\000"
	.align	2
.LC9:
	.ascii	"___<      >______v_________v______   \\\000"
	.align	2
.LC10:
	.ascii	"  /      /        \\       /       \\  |\000"
	.align	2
.LC11:
	.ascii	"_/      /          \\  |  /         \\ |\000"
	.align	2
.LC12:
	.ascii	"       /            \\ | /           \\|\000"
	.align	2
.LC13:
	.ascii	"      |               >              <\000"
	.align	2
.LC14:
	.ascii	"      |               |              |\000"
	.align	2
.LC15:
	.ascii	"      |               <              <\000"
	.align	2
.LC16:
	.ascii	"__     \\            / | \\           /|\000"
	.align	2
.LC17:
	.ascii	"  \\     \\          /  |  \\         / |\000"
	.align	2
.LC18:
	.ascii	"___<     >________^_______^_______/  |\000"
	.align	2
.LC19:
	.ascii	"    \\     \\                         /\000"
	.align	2
.LC20:
	.ascii	"_____<     \\___v_____________v_____/\000"
	.align	2
.LC21:
	.ascii	"      \\         \\           /\000"
	.align	2
.LC22:
	.ascii	"_______^_________^_________^________\000"
	.align	2
.LC23:
	.ascii	"Time:\000"
	.align	2
.LC24:
	.ascii	"Recent activations:\000"
	.text
	.align	2
	.global	setup_t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setup_t, %function
setup_t:
.LFB2:
	.loc 1 32 0
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
	.loc 1 33 0
	ldr	r3, .L12
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 34 0
	ldr	r3, .L12+4
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 35 0
	mov	r3, #46
	mov	r2, #26
	mov	r1, #3
	mov	r0, #3
	bl	prettybox(PLT)
	.loc 1 36 0
	mov	r3, #68
	mov	r2, #26
	mov	r1, #46
	mov	r0, #3
	bl	prettybox(PLT)
	.loc 1 37 0
	mov	r1, #18
	mov	r0, #2
	bl	escape_jump(PLT)
	.loc 1 38 0
	ldr	r3, .L12+8
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 39 0
	ldr	r3, .L12+12
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 40 0
	ldr	r3, .L12+16
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 41 0
	mov	r1, #5
	mov	r0, #23
	bl	escape_jump(PLT)
	.loc 1 42 0
	ldr	r3, .L12+20
.LPIC6:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 43 0
	mov	r1, #6
	mov	r0, #6
	bl	escape_jump(PLT)
	.loc 1 44 0
	ldr	r3, .L12+24
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 45 0
	mov	r1, #6
	mov	r0, #7
	bl	escape_jump(PLT)
	.loc 1 46 0
	ldr	r3, .L12+28
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 47 0
	mov	r1, #6
	mov	r0, #8
	bl	escape_jump(PLT)
	.loc 1 48 0
	ldr	r3, .L12+32
.LPIC9:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 49 0
	mov	r1, #6
	mov	r0, #9
	bl	escape_jump(PLT)
	.loc 1 50 0
	ldr	r3, .L12+36
.LPIC10:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 51 0
	mov	r1, #6
	mov	r0, #10
	bl	escape_jump(PLT)
	.loc 1 52 0
	ldr	r3, .L12+40
.LPIC11:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 53 0
	mov	r1, #6
	mov	r0, #11
	bl	escape_jump(PLT)
	.loc 1 54 0
	ldr	r3, .L12+44
.LPIC12:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 55 0
	mov	r1, #6
	mov	r0, #12
	bl	escape_jump(PLT)
	.loc 1 56 0
	ldr	r3, .L12+48
.LPIC13:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 57 0
	mov	r1, #6
	mov	r0, #13
	bl	escape_jump(PLT)
	.loc 1 58 0
	ldr	r3, .L12+52
.LPIC14:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 59 0
	mov	r1, #6
	mov	r0, #14
	bl	escape_jump(PLT)
	.loc 1 60 0
	ldr	r3, .L12+56
.LPIC15:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 61 0
	mov	r1, #6
	mov	r0, #15
	bl	escape_jump(PLT)
	.loc 1 62 0
	ldr	r3, .L12+60
.LPIC16:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 63 0
	mov	r1, #6
	mov	r0, #16
	bl	escape_jump(PLT)
	.loc 1 64 0
	ldr	r3, .L12+64
.LPIC17:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 65 0
	mov	r1, #6
	mov	r0, #17
	bl	escape_jump(PLT)
	.loc 1 66 0
	ldr	r3, .L12+68
.LPIC18:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 67 0
	mov	r1, #6
	mov	r0, #18
	bl	escape_jump(PLT)
	.loc 1 68 0
	ldr	r3, .L12+72
.LPIC19:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 69 0
	mov	r1, #6
	mov	r0, #19
	bl	escape_jump(PLT)
	.loc 1 70 0
	ldr	r3, .L12+76
.LPIC20:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 71 0
	mov	r1, #6
	mov	r0, #20
	bl	escape_jump(PLT)
	.loc 1 72 0
	ldr	r3, .L12+80
.LPIC21:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 73 0
	mov	r1, #6
	mov	r0, #21
	bl	escape_jump(PLT)
	.loc 1 74 0
	ldr	r3, .L12+84
.LPIC22:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 75 0
	mov	r1, #6
	mov	r0, #4
	bl	escape_jump(PLT)
	.loc 1 76 0
	ldr	r3, .L12+88
.LPIC23:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 77 0
	mov	r1, #48
	mov	r0, #4
	bl	escape_jump(PLT)
	.loc 1 78 0
	ldr	r3, .L12+92
.LPIC24:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 80 0
	sub	r3, fp, #8
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 81 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 82 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC3+8)
	.word	.LC4-(.LPIC4+8)
	.word	.LC5-(.LPIC5+8)
	.word	.LC6-(.LPIC6+8)
	.word	.LC7-(.LPIC7+8)
	.word	.LC8-(.LPIC8+8)
	.word	.LC9-(.LPIC9+8)
	.word	.LC10-(.LPIC10+8)
	.word	.LC11-(.LPIC11+8)
	.word	.LC12-(.LPIC12+8)
	.word	.LC13-(.LPIC13+8)
	.word	.LC14-(.LPIC14+8)
	.word	.LC15-(.LPIC15+8)
	.word	.LC16-(.LPIC16+8)
	.word	.LC17-(.LPIC17+8)
	.word	.LC18-(.LPIC18+8)
	.word	.LC19-(.LPIC19+8)
	.word	.LC20-(.LPIC20+8)
	.word	.LC21-(.LPIC21+8)
	.word	.LC22-(.LPIC22+8)
	.word	.LC23-(.LPIC23+8)
	.word	.LC24-(.LPIC24+8)
	.cfi_endproc
.LFE2:
	.size	setup_t, .-setup_t
	.section	.rodata
	.align	2
.LC25:
	.ascii	"COUT\000"
	.align	2
.LC26:
	.ascii	"                                     \000"
	.text
	.align	2
	.global	echo_view_t
	.syntax unified
	.arm
	.fpu softvfp
	.type	echo_view_t, %function
echo_view_t:
.LFB3:
	.loc 1 84 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #56
	.loc 1 85 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 88 0
	ldr	r3, .L18
.LPIC25:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-12]
	.loc 1 89 0
	ldr	r3, .L18+4
.LPIC26:
	add	r3, pc, r3
	sub	ip, fp, #56
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	str	r0, [ip]
	add	ip, ip, #4
	strh	r1, [ip]	@ movhi
.L17:
	.loc 1 92 0
	sub	r1, fp, #17
	sub	r3, fp, #16
	mov	r2, #1
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 93 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 94 0
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L15
	.loc 1 95 0
	mov	r1, #7
	mov	r0, #23
	bl	escape_jump(PLT)
	.loc 1 96 0
	sub	r3, fp, #56
	mov	r2, r3
	mov	r1, #2
	ldr	r0, [fp, #-12]
	bl	Putstr(PLT)
	.loc 1 97 0
	mov	r1, #5
	mov	r0, #25
	bl	escape_jump(PLT)
	.loc 1 98 0
	sub	r3, fp, #56
	mov	r2, r3
	mov	r1, #2
	ldr	r0, [fp, #-12]
	bl	Putstr(PLT)
	.loc 1 99 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L17
.L15:
	.loc 1 101 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #7
	mov	r1, r3
	mov	r0, #23
	bl	escape_jump(PLT)
	.loc 1 102 0
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #2
	ldr	r0, [fp, #-12]
	bl	Putc(PLT)
	.loc 1 103 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	.loc 1 92 0
	b	.L17
.L19:
	.align	2
.L18:
	.word	.LC25-(.LPIC25+8)
	.word	.LC26-(.LPIC26+8)
	.cfi_endproc
.LFE3:
	.size	echo_view_t, .-echo_view_t
	.section	.rodata
	.align	2
.LC27:
	.ascii	" <<^<^vv<<vvvv>>^^^\000"
	.align	2
.LC28:
	.ascii	" ^^<v>><v^<<<>^v><<\000"
	.text
	.align	2
	.global	flip_view_t
	.syntax unified
	.arm
	.fpu softvfp
	.type	flip_view_t, %function
flip_view_t:
.LFB4:
	.loc 1 108 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #256
	.loc 1 109 0
	ldr	r3, .L37
.LPIC27:
	add	r3, pc, r3
	sub	ip, fp, #36
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	str	r3, [ip]
	.loc 1 110 0
	ldr	r3, .L37+4
.LPIC28:
	add	r3, pc, r3
	sub	ip, fp, #56
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	str	r3, [ip]
	.loc 1 113 0
	mov	r3, #12
	str	r3, [fp, #-136]
	mov	r3, #14
	str	r3, [fp, #-132]
	mov	r3, #16
	str	r3, [fp, #-128]
	mov	r3, #3
	str	r3, [fp, #-124]
	mov	r3, #16
	str	r3, [fp, #-120]
	mov	r3, #14
	str	r3, [fp, #-116]
	mov	r3, #14
	str	r3, [fp, #-112]
	.loc 1 114 0
	mov	r3, #9
	str	r3, [fp, #-108]
	mov	r3, #7
	str	r3, [fp, #-104]
	mov	r3, #3
	str	r3, [fp, #-100]
	mov	r3, #1
	str	r3, [fp, #-96]
	mov	r3, #1
	str	r3, [fp, #-92]
	mov	r3, #3
	str	r3, [fp, #-88]
	mov	r3, #3
	str	r3, [fp, #-84]
	.loc 1 115 0
	mov	r3, #12
	str	r3, [fp, #-80]
	mov	r3, #12
	str	r3, [fp, #-76]
	mov	r3, #12
	str	r3, [fp, #-72]
	mov	r3, #16
	str	r3, [fp, #-68]
	mov	r3, #9
	str	r3, [fp, #-64]
	mov	r3, #7
	str	r3, [fp, #-60]
	.loc 1 118 0
	mov	r3, #4
	str	r3, [fp, #-220]
	mov	r3, #6
	str	r3, [fp, #-216]
	mov	r3, #8
	str	r3, [fp, #-212]
	mov	r3, #4
	str	r3, [fp, #-208]
	mov	r3, #28
	str	r3, [fp, #-204]
	mov	r3, #16
	str	r3, [fp, #-200]
	mov	r3, #30
	str	r3, [fp, #-196]
	.loc 1 119 0
	mov	r3, #38
	str	r3, [fp, #-192]
	mov	r3, #38
	str	r3, [fp, #-188]
	mov	r3, #28
	str	r3, [fp, #-184]
	mov	r3, #13
	str	r3, [fp, #-180]
	mov	r3, #6
	str	r3, [fp, #-176]
	mov	r3, #18
	str	r3, [fp, #-172]
	mov	r3, #11
	str	r3, [fp, #-168]
	.loc 1 120 0
	mov	r3, #10
	str	r3, [fp, #-164]
	mov	r3, #19
	str	r3, [fp, #-160]
	mov	r3, #27
	str	r3, [fp, #-156]
	mov	r3, #18
	str	r3, [fp, #-152]
	mov	r3, #23
	str	r3, [fp, #-148]
	mov	r3, #23
	str	r3, [fp, #-144]
.LBB2:
	.loc 1 123 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L22:
	.loc 1 124 0 discriminator 3
	sub	r2, fp, #248
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, #63
	strb	r2, [r3]
	.loc 1 123 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L21:
	.loc 1 123 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #22
	ble	.L22
.LBE2:
	.loc 1 129 0 is_stmt 1
	ldr	r3, .L37+8
.LPIC29:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-16]
.L36:
	.loc 1 132 0
	sub	r1, fp, #256
	sub	r3, fp, #252
	mov	r2, #2
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 133 0
	ldr	r3, [fp, #-252]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 135 0
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	cmp	r3, #18
	bhi	.L23
	.loc 1 136 0
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-136]
	add	r2, r3, #5
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-220]
	add	r3, r3, #5
	mov	r1, r3
	mov	r0, r2
	bl	escape_jump(PLT)
	.loc 1 137 0
	ldrb	r3, [fp, #-255]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L24
	.loc 1 137 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r3, [r3, #-52]	@ zero_extendqisi2
	b	.L25
.L24:
	.loc 1 137 0 discriminator 2
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r3, [r3, #-32]	@ zero_extendqisi2
.L25:
	.loc 1 137 0 discriminator 4
	strb	r3, [fp, #-255]
	b	.L26
.L23:
	.loc 1 139 0 is_stmt 1
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	cmp	r3, #19
	beq	.L27
	.loc 1 139 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-256]	@ zero_extendqisi2
	cmp	r3, #22
	bne	.L28
.L27:
	.loc 1 140 0 is_stmt 1
	ldrb	r3, [fp, #-229]
	strb	r3, [fp, #-9]
	.loc 1 141 0
	ldrb	r3, [fp, #-226]
	strb	r3, [fp, #-10]
	.loc 1 142 0
	ldr	r3, [fp, #-64]
	add	r2, r3, #5
	ldr	r3, [fp, #-148]
	add	r3, r3, #5
	mov	r1, r3
	mov	r0, r2
	bl	escape_jump(PLT)
	b	.L29
.L28:
	.loc 1 144 0
	ldrb	r3, [fp, #-227]
	strb	r3, [fp, #-9]
	.loc 1 145 0
	ldrb	r3, [fp, #-228]
	strb	r3, [fp, #-10]
	.loc 1 146 0
	ldr	r3, [fp, #-60]
	add	r2, r3, #5
	ldr	r3, [fp, #-144]
	add	r3, r3, #5
	mov	r1, r3
	mov	r0, r2
	bl	escape_jump(PLT)
.L29:
	.loc 1 149 0
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	cmp	r3, #63
	beq	.L30
	.loc 1 149 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	cmp	r3, #63
	bne	.L31
.L30:
	.loc 1 150 0 is_stmt 1
	mov	r3, #63
	strb	r3, [fp, #-255]
	b	.L26
.L31:
	.loc 1 151 0
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L32
	.loc 1 152 0
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L33
	.loc 1 153 0
	mov	r3, #124
	strb	r3, [fp, #-255]
	b	.L26
.L33:
	.loc 1 155 0
	mov	r3, #62
	strb	r3, [fp, #-255]
	b	.L26
.L32:
	.loc 1 158 0
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L35
	.loc 1 159 0
	mov	r3, #60
	strb	r3, [fp, #-255]
	b	.L26
.L35:
	.loc 1 161 0
	mov	r3, #63
	strb	r3, [fp, #-255]
.L26:
	.loc 1 165 0
	ldrb	r3, [fp, #-255]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #2
	ldr	r0, [fp, #-16]
	bl	Putc(PLT)
	.loc 1 132 0
	b	.L36
.L38:
	.align	2
.L37:
	.word	.LC27-(.LPIC27+8)
	.word	.LC28-(.LPIC28+8)
	.word	.LC25-(.LPIC29+8)
	.cfi_endproc
.LFE4:
	.size	flip_view_t, .-flip_view_t
	.section	.rodata
	.align	2
.LC29:
	.ascii	"\033[%d;48H%c%d    \033[%d;48H------\000"
	.text
	.align	2
	.global	sensor_view_t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sensor_view_t, %function
sensor_view_t:
.LFB5:
	.loc 1 169 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #68
	.loc 1 170 0
	mov	r3, #0
	str	r3, [fp, #-16]
.L43:
	.loc 1 174 0
	sub	r1, fp, #28
	sub	r3, fp, #24
	mov	r2, #2
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 175 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
.LBB3:
	.loc 1 176 0
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L40
.L42:
	.loc 1 177 0
	ldrb	r3, [fp, #-27]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #7
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L41
.LBB4:
	.loc 1 179 0
	ldr	r3, [fp, #-16]
	add	lr, r3, #6
	.loc 1 180 0
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	.loc 1 179 0
	add	r4, r3, #65
	.loc 1 180 0
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	and	r3, r3, #1
	lsl	r3, r3, #3
	.loc 1 179 0
	add	r0, r2, r3
	.loc 1 181 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	ldr	r3, .L44
	smull	r2, r3, r1, r3
	asr	r2, r3, #3
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, r1, r3
	.loc 1 179 0
	add	r3, r2, #6
	sub	ip, fp, #68
	str	r3, [sp, #4]
	str	r0, [sp]
	mov	r3, r4
	mov	r2, lr
	ldr	r1, .L44+4
.LPIC30:
	add	r1, pc, r1
	mov	r0, ip
	bl	tfp_sprintf(PLT)
	.loc 1 182 0
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, .L44
	smull	r1, r3, r2, r3
	asr	r1, r3, #3
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 183 0
	sub	r3, fp, #68
	mov	r0, r3
	bl	cputstr(PLT)
.L41:
.LBE4:
	.loc 1 176 0 discriminator 2
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L40:
	.loc 1 176 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	cmp	r3, #7
	ble	.L42
.LBE3:
	.loc 1 174 0 is_stmt 1
	b	.L43
.L45:
	.align	2
.L44:
	.word	1717986919
	.word	.LC29-(.LPIC30+8)
	.cfi_endproc
.LFE5:
	.size	sensor_view_t, .-sensor_view_t
	.section	.rodata
	.align	2
.LC30:
	.ascii	"CLOCK\000"
	.align	2
.LC31:
	.ascii	"\033[4;13H%04d:%02d:%02d:%02d\000"
	.text
	.align	2
	.global	time_view_t
	.syntax unified
	.arm
	.fpu softvfp
	.type	time_view_t, %function
time_view_t:
.LFB6:
	.loc 1 189 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #56
	.loc 1 193 0
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	.loc 1 194 0
	ldr	r3, .L48
.LPIC31:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-24]
.L47:
	.loc 1 196 0 discriminator 1
	mov	r1, #1
	ldr	r0, [fp, #-24]
	bl	Delay(PLT)
	.loc 1 197 0 discriminator 1
	ldr	r0, [fp, #-24]
	bl	Time(PLT)
	str	r0, [fp, #-28]
	.loc 1 198 0 discriminator 1
	ldr	r2, [fp, #-28]
	ldr	r3, .L48+4
	smull	r1, r3, r2, r3
	asr	r1, r3, #5
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r1, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	.loc 1 199 0 discriminator 1
	ldr	r3, [fp, #-28]
	ldr	r2, .L48+4
	smull	r1, r2, r3, r2
	asr	r2, r2, #5
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	.loc 1 200 0 discriminator 1
	ldr	r2, [fp, #-28]
	ldr	r3, .L48+8
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	asr	r1, r3, #5
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #4
	sub	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 1 201 0 discriminator 1
	ldr	r3, [fp, #-28]
	ldr	r2, .L48+8
	smull	r1, r2, r3, r2
	add	r2, r2, r3
	asr	r2, r2, #5
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	.loc 1 202 0 discriminator 1
	ldr	r2, [fp, #-28]
	ldr	r3, .L48+8
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	asr	r1, r3, #5
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #4
	sub	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 203 0 discriminator 1
	ldr	r3, [fp, #-28]
	ldr	r2, .L48+8
	smull	r1, r2, r3, r2
	add	r2, r2, r3
	asr	r2, r2, #5
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 1 204 0 discriminator 1
	sub	r0, fp, #52
	ldr	r3, [fp, #-8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-12]
	str	r3, [sp]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r1, .L48+12
.LPIC32:
	add	r1, pc, r1
	bl	tfp_sprintf(PLT)
	.loc 1 205 0 discriminator 1
	sub	r3, fp, #52
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 196 0 discriminator 1
	b	.L47
.L49:
	.align	2
.L48:
	.word	.LC30-(.LPIC31+8)
	.word	1374389535
	.word	-2004318071
	.word	.LC31-(.LPIC32+8)
	.cfi_endproc
.LFE6:
	.size	time_view_t, .-time_view_t
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x374
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0xc
	.4byte	.LASF27
	.4byte	.LASF28
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.byte	0xbd
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbf
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0xbe
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.ascii	"hr\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x6
	.ascii	"min\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.ascii	"sec\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0xbf
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x6
	.ascii	"str\000"
	.byte	0x1
	.byte	0xc0
	.4byte	0xbf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0xc2
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.4byte	0xcf
	.uleb128 0x8
	.4byte	0x41
	.byte	0x17
	.byte	0
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.byte	0xa9
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13e
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0xaa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0xab
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x6
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xac
	.4byte	0x13e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x6
	.ascii	"i\000"
	.byte	0x1
	.byte	0xb0
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x6
	.ascii	"buf\000"
	.byte	0x1
	.byte	0xb2
	.4byte	0x14e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.4byte	0x14e
	.uleb128 0x8
	.4byte	0x41
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.4byte	0x15e
	.uleb128 0x8
	.4byte	0x41
	.byte	0x27
	.byte	0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21b
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x1
	.byte	0x6d
	.4byte	0x21b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x1
	.byte	0x6e
	.4byte	0x21b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x1
	.byte	0x70
	.4byte	0x22b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x1
	.byte	0x75
	.4byte	0x22b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x1
	.byte	0x7a
	.4byte	0x23b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0x7e
	.4byte	0x2c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x1
	.byte	0x7f
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.byte	0x7f
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x6
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x80
	.4byte	0x13e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x1
	.byte	0x81
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x6
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.4byte	0x22b
	.uleb128 0x8
	.4byte	0x41
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.4byte	0x2c
	.4byte	0x23b
	.uleb128 0x8
	.4byte	0x41
	.byte	0x14
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.4byte	0x24b
	.uleb128 0x8
	.4byte	0x41
	.byte	0x16
	.byte	0
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.byte	0x54
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a5
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x1
	.byte	0x55
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0x56
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.ascii	"c\000"
	.byte	0x1
	.byte	0x57
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x1
	.byte	0x58
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x1
	.byte	0x59
	.4byte	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.4byte	0x2b5
	.uleb128 0x8
	.4byte	0x41
	.byte	0x25
	.byte	0
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.byte	0x20
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d9
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0x4f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x1
	.byte	0xd
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x32f
	.uleb128 0xa
	.ascii	"x1\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.ascii	"y1\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.ascii	"x2\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.ascii	"y2\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.ascii	"i\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x1
	.byte	0x7
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36b
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.ascii	"y\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x1
	.byte	0x8
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.4byte	0x3a
	.uleb128 0x8
	.4byte	0x41
	.byte	0xc
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
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
.LASF16:
	.ascii	"switchstates\000"
.LASF10:
	.ascii	"caller\000"
.LASF24:
	.ascii	"prettybox\000"
.LASF3:
	.ascii	"sizetype\000"
.LASF12:
	.ascii	"curvedchars\000"
.LASF25:
	.ascii	"movcode\000"
.LASF11:
	.ascii	"flip_view_t\000"
.LASF19:
	.ascii	"out_tid\000"
.LASF4:
	.ascii	"curtime\000"
.LASF20:
	.ascii	"echo_view_t\000"
.LASF14:
	.ascii	"xpos\000"
.LASF22:
	.ascii	"clear\000"
.LASF6:
	.ascii	"clock_tid\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF7:
	.ascii	"time_view_t\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF21:
	.ascii	"userlen\000"
.LASF28:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF2:
	.ascii	"char\000"
.LASF15:
	.ascii	"ypos\000"
.LASF8:
	.ascii	"sensor_view_t\000"
.LASF29:
	.ascii	"escape_jump\000"
.LASF13:
	.ascii	"straightchars\000"
.LASF27:
	.ascii	"src/tasks/A0/terminal_view.c\000"
.LASF26:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF23:
	.ascii	"setup_t\000"
.LASF5:
	.ascii	"msec\000"
.LASF18:
	.ascii	"second\000"
.LASF9:
	.ascii	"userheight\000"
.LASF17:
	.ascii	"first\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
