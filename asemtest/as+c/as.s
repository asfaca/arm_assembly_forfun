@ Define my Raspberry Pi
	.cpu	cortex-a53
	.fpu	neon-fp-armv8
	.syntax unified

@Program code
	.text
	.align	2
	.global asf	
	.type	asf, %function
asf:
	str	fp, [sp, -4]!
	add	fp, sp, 0

	mov	r0, 1234 

	sub	sp, fp, 0
	ldr	fp, [sp], 4
	bx	lr
