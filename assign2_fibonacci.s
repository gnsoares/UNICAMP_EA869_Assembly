.global main

main:
	mov r0, #1 ; inicio do contador
	mov r1, #9 ; valor de n (n > 0)
	mov r2, #1 ; valor inicial de Fi+1
	mov r3, #0 ; valor inicial de Fi
loop:	
	mov r4, r2 	   ; r4 serve de reg temporario
	add r2, r2, r3 ; soma dos valores anteriores
	mov r3, r4     ; r3 recupera o valor de Fi
	add r0, r0, #1 ; incremento do contador
	cmp r0, r1
	beq end        ; se o contador chegou no final -> terminar
	b loop         ; caso contrario, continuar

end:
	bx lr