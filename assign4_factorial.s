@fatorial de n >= 0 de forma recursiva
mov r0, #0x0d @Define-se n
cmp r0, #0x01
ble base
bl fat @chama a subrotina
mov r2, r1 @r2 será a saída do programa
swi 0x11


fat: mov r1, #1
     str lr, [sp], #4
     bl fataux @calcula fatorial de n-1
     ldr r0, [sp, #-4]!
     mov r3, r1
     mul r1, r3, r0 @ fat(n) = n * fat(n-1)
     bl retorno


fataux: cmp r0, #0x01 @caso base: n=1
        beq retorno @o codigo de retorno trabalha com a pilha
        str r0, [sp], #4 @guarda r0 na pilha
        sub r0, r0, #1 @diminui r0
        str lr, [sp], #4 @guarda endereço de retorno
        bl fataux @fat(i-1)
        ldr r0, [sp, #-4]! @lê o valor de r0 na pilha
        mov r3, r1 @move o valor atual para outro registrador
        mul r1, r3, r0 @fat(i) = i * fat(i-1)


retorno: ldr lr, [sp, #-4]! @carrega o endereço de retorno
         bx lr @retorna da subrotina


base: mov r1, #0x01
      mov r2, r1
      swi 0x11