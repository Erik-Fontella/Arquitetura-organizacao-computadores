.data
prompt: .asciiz "Digite um valor em metros: "
result_cm: .asciiz "O valor em centímetros é: "
result_km: .asciiz "O valor em quilômetros é: "
result_mm: .asciiz "O valor em milímetros é: "
result_dm: .asciiz "O valor em decímetros é: "
menu: .asciiz "Escolha a unidade de conversão:\n1 - Centímetros\n2 - Quilômetros\n3 - Milímetros\n4 - Decímetros\n"
factor_cm: .float 100.0
factor_km: .float 0.001
factor_mm: .float 1000.0
factor_dm: .float 10.0
error_msg: .asciiz "Escolha inválida. Encerrando o programa.\n"


.text
.globl main

main:
    # Exibir prompt
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, prompt     # Carregar o endereço da string prompt
    syscall            # Chamar a syscall para imprimir a string

    # Ler entrada do usuário
    li $v0, 6          # Carregar o código da syscall para ler um número em ponto flutuante
    syscall            # Chamar a syscall para ler um número em ponto flutuante
    mov.s $f12, $f0    # Mover o valor de ponto flutuante para registrador de ponto flutuante

    # Exibir opções de conversão
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, menu       # Carregar o endereço da string menu
    syscall            # Chamar a syscall para imprimir a string

    # Ler a escolha do usuário
    li $v0, 5          # Carregar o código da syscall para ler um número inteiro
    syscall            # Chamar a syscall para ler um número inteiro
    move $t0, $v0      # Salvar a escolha em $t0

    # Converter metros para a unidade selecionada
    li $t1, 1          # Valor 1 para conversão para centímetros
    beq $t0, $t1, convert_to_cm  # Se a escolha for 1, converter para centímetros

    li $t1, 2          # Valor 2 para conversão para quilômetros
    beq $t0, $t1, convert_to_km  # Se a escolha for 2, converter para quilômetros

    li $t1, 3          # Valor 3 para conversão para milímetros
    beq $t0, $t1, convert_to_mm  # Se a escolha for 3, converter para milímetros

    li $t1, 4          # Valor 4 para conversão para decímetros
    beq $t0, $t1, convert_to_dm  # Se a escolha for 4, converter para decímetros

    # Se a escolha não for válida, exibir mensagem de erro
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, error_msg  # Carregar o endereço da string error_msg
    syscall            # Chamar a syscall para imprimir a string

    # Terminar o programa
    li $v0, 10         # Carregar o código da syscall para encerrar o programa
    syscall            # Chamar a syscall para encerrar o programa

convert_to_cm:
    # Converter metros para centímetros
    l.s $f1, factor_cm  # Carregar o fator de conversão (1 metro = 100 centímetros)
    mul.s $f0, $f12, $f1  # Multiplicar o valor em metros pelo fator de conversão

    # Exibir o resultado em centímetros
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, result_cm  # Carregar o endereço da string result_cm
    syscall            # Chamar a syscall para imprimir a string

    # Imprimir o valor convertido
    mov.s $f12, $f0    # Mover o valor para o registrador $f12 para impressão
    li $v0, 2          # Carregar o código da syscall para imprimir ponto flutuante
    syscall            # Chamar a syscall para imprimir o valor de ponto flutuante

    # Terminar o programa
    li $v0, 10         # Carregar o código da syscall para encerrar o programa
    syscall            # Chamar a syscall para encerrar o programa

convert_to_km:
    # Converter metros para quilômetros
    l.s $f1, factor_km  # Carregar o fator de conversão (1 metro = 0.001 quilômetros)
    mul.s $f0, $f12, $f1  # Multiplicar o valor em metros pelo fator de conversão

    # Exibir o resultado em quilômetros
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, result_km  # Carregar o endereço da string result_km
    syscall            # Chamar a syscall para imprimir a string

    # Imprimir o valor convertido
    mov.s $f12, $f0    # Mover o valor para o registrador $f12 para impressão
    li $v0, 2          # Carregar o código da syscall para imprimir ponto flutuante
    syscall            # Chamar a syscall para imprimir o valor de ponto flutuante

    # Terminar o programa
    li $v0, 10         # Carregar o código da syscall para encerrar o programa
    syscall            # Chamar a syscall para encerrar o programa

convert_to_dm:
    # Converter metros para decímetros
    l.s $f1, factor_dm    # Carregar o fator de conversão (1 metro = 10 decímetros)
    mul.s $f0, $f12, $f1  # Multiplicar o valor em metros pelo fator de conversão

    # Exibir o resultado em decímetros
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, result_dm  # Carregar o endereço da string result_dm
    syscall            # Chamar a syscall para imprimir a string

    # Imprimir o valor convertido
    mov.s $f12, $f0    # Mover o valor para o registrador $f12 para impressão
    li $v0, 2          # Carregar o código da syscall para imprimir ponto flutuante
    syscall            # Chamar a syscall para imprimir o valor de ponto flutuante

    # Terminar o programa
    li $v0, 10         # Carregar o código da syscall para encerrar o programa
    syscall            # Chamar a syscall para encerrar o programa


convert_to_mm:
    # Converter metros para milímetros
    l.s $f1, factor_mm  # Carregar o fator de conversão (1 metro = 1000 milímetros)
    mul.s $f0, $f12, $f1  # Multiplicar o valor em metros pelo fator de conversão

    # Exibir o resultado em milímetros
    li $v0, 4          # Carregar o código da syscall para imprimir string
    la $a0, result_mm  # Carregar o endereço da string result_mm
    syscall            # Chamar a syscall para imprimir a string

    # Imprimir o valor convertido
    mov.s $f12, $f0    # Mover o valor para o registrador $f12 para impressão
    li $v0, 2          # Carregar o código da syscall para imprimir ponto flutuante
    syscall            # Chamar a syscall para imprimir o valor de ponto flutuante

    # Terminar o programa
    li $v0, 10         # Carregar o código da syscall para encerrar