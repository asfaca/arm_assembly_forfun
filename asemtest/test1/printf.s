	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"t2.c"
	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	5
	.section	.rodata
	.align	2
.LC0:
	.ascii	"hello %d world!\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L3
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L3+4
	bl	printf
	mov	r3, #0
	mov	r0, r3
	pop	{fp, pc}
.L4:
	.align	2
.L3:
	.word	a
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
