.global main

main:
	mov r3, #5 @r3 guarda n
	mov r0, #0 @r0 guarda a soma
	mov r1, #1 @r1 é o contador (para no n)

loop:
	add r0, r0, r1 @adiciona o valor atual ao acumulador
	cmp r1, r3 @ve se chegou ao final
	beq end @se chegou termina
	add r1, r1, #1 @se nao chegou incrementa o contador
	b loop

end:
	bx lr
