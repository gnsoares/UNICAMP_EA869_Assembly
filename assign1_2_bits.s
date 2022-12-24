.global main

main:
	mov r5, #62 @carregamento dos valores iniciais nos regs
	mov r6, #50 
	mov r7, #62
	mov r4, r5, LSR #3 @r4 recebe r5 shiftado: 3,4 -> 0,1
	bfi r1, r4, #0, #2 @r1 recebe os bits desejados
	mov r0, #0b11
	bfi r6, r0, #2, #2 @r6 tem os bits 2 e 3 setados
	bfc r7, #2, #1 @r7 tem o bit 2 limpado
	bfc r7, #6, #1 @r7 tem o bit 6 limpado

end:
	bx lr