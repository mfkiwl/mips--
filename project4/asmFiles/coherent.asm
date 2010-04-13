# vim: set noai ts=8 sw=8 softtabstop=8 noexpandtab:


####################################################
##################### CORE 0 #######################
####################################################

	org	0x0000
	ori	$sp, $0, 0x7000

	ori	$a0, $0, 0
	ori	$a1, $0, 0x00
	jal	fill

	halt



####################################################
##################### CORE 1 #######################
####################################################

	org	0x0200
	ori	$sp, $0, 0x8000

	ori	$a0, $0, 4
	ori	$a1, $0, 0x10
	jal	fill
	
	halt



####################################################
##################### COMMON #######################
####################################################

fill:
	ori	$t0, $0, buf
	ori	$t1, $0, 8
	ori	$t3, $0, 0
	or	$t4, $0, $a1

	addu	$t0, $t0, $a0

start_fill:
	# while t3 < t1
	beq	$t3, $t1, done_fill

	sw	$t4, 0($t0)

	addiu	$t0, $t0, 8
	addiu	$t4, $t4, 1
	addiu	$t3, $t3, 1

	j	start_fill

done_fill:
	jr	$ra


####################################################
###################### DATA ########################
####################################################

	org 0x1000
buf:
