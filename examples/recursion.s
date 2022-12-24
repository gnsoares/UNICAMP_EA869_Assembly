@Somador de 0 até n-1 de forma recursiva
mov r0, #0x05 @Define-se n
cmp r0, #0x00
beq caso_base
bl somador @chama a subrotina
mov r5, r1 @r5 será a saída do programa
swi 0x11


somador: @subrotina de soma
mov r1, #0 @primeiro parâmetro de soma
cmp r0, #0x00 @caso base: n=0 -> r5 = ,
beq retorno @o codigo de retorno trabalha com a pilha
str r0, [sp] @guarda r0 na pilha
add sp, sp, #4 @avança uma linha na pilha
sub r0, r0, #1 @diminui r0
str lr, [sp] @guarda endereço de retorno
add sp, sp, #4 @avança uma linha na pilha
bl somador @chama a subrotina novamente
sub sp, sp, #4 @como sempre avançamos uma linha, para lermos os dados, retornamos uma também
ldr r0, [sp] @lê o valor de r0 na pilha
add r1, r1, r0 @soma a r1


retorno:
sub sp, sp, #4 @retorna uma linha na pilha
ldr lr, [sp] @carrega o endereço de retorno
bx lr @retorna da subrotina


caso_base:
mov r1, #0x00
mov r5, r1
swi 0x11