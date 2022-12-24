Terminal: .asciz "Botao direito pressionado!"
Segmento: .word 0x80|0x01|0x40|0x20|0x05|0x08

main: swi 0x202 @verificacao de botoes
      cmp r0, #0x02 @verifica botao direito
      beq rightb
      cmp r0, #0x01 @verifica botao esquerdo
      beq leftb
      b main @voltar para verificacao

rightb: swi 0x206 @limpa LCD
        mov r0, #1 @coluna
        mov r1, #2 @linha
        ldr r2, =Terminal @carrega string
        swi 0x204 @printa LCD
        b main @voltar para verificacao

leftb: ldr r1, =Segmento @carrega digito
       ldr r0, [r1]
       swi 0x200 @display digito
       bx lr @fim da execucao



