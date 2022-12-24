@@ PROGRAMA PRINCIPAL 
mov r1, #15  @determina quantos loops serao feitos
main_s:bl rot1 @entra na primeira subrotina
sub r1, r1, #1 @diminui r1 para nao haver loop infinito
cmp r1, #0 @caso r1 seja igual a 0 acaba o programa
bne main_s
swi 0x11 @acaba o programa

@@ PRIMEIRA SUBROTINA 
rot1:
mov r4, #15 @quantas vezes a segunda subrotina será feita
str lr, [sp, #4] @guarda o endereço de retorno
str r3, [sp] @guarda o atual stack pointer
rot1_s: bl rot2 @chama a segunda subrotina
sub r4, r4, #1 @diminui r4 para nao haver loop infinito
cmp r4, #0 @quando r4 for igual a 0, retorna para o programa principal
bne rot1_s 
ldr lr, [sp, #4] @carrega em LR o endereço de retorno
bx lr @desvia para o endereço apontado por LR


@@ SEGUNDA SUBROTINA 
rot2: @essa subrotina nao tem nenhum objetivo especifico
mov r6, #2
sub r6, r6, #1
sub r6, r6, #1
bx lr