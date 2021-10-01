	.data
navios:				.asciz "3\n1 5 1 1\n0 5 2 2\n0 1 6 4"
msg_qtde_invalida: 		.asciz "Quantidade não pode ser 0 ou menor.\n"
msg_instrucao_invalida:		.asciz "ERRO: Instrução fora do formato esperado.\n"
msg_posicao_do_navio_invalida:	.asciz "ERRO: Sobreposição de embracações ou Tamanho da embarcação inválido para as coordenadas de inserção!\n"
char_vazio:			.asciz "*"
quebra_linha:			.asciz "\n"
msg_inicio:			.asciz "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠤⠴⠶⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠀⠂⠉⡇⠀⠀⠀⢰⣿⣿⣿⣿⣧⠀⠀⢀⣄⣀⠀⠀⠀⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⢠⣶⣶⣷⠀⠀⠀⠸⠟⠁⠀⡇⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠘⠟⢹⣋⣀⡀⢀⣤⣶⣿⣿⣿⣿⣿⡿⠛⣠⣼⣿⡟⠀⠀⠀⠀\n⠀⠀⠀⠀⠀⣴⣾⣿⣿⣿⣿⢁⣾⣿⣿⣿⣿⣿⣿⡿⢁⣾⣿⣿⣿⠁⠀⠀⠀⠀\n⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⠿⠇⠀⠀⠀⠀\n⠀⠀⠀⠳⣤⣙⠟⠛⢻⠿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣇⠘⠉⠀⢸⠀⢀⣠⠀⠀⠀\n⠀⠀⠀⠀⠈⠻⣷⣦⣼⠀⠀⠀⢻⣿⣿⠿⢿⡿⠿⣿⡄⠀⠀⣼⣷⣿⣿⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣶⣄⡈⠉⠀⠀⢸⡇⠀⠀⠉⠂⠀⣿⣿⣿⣧⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣷⣤⣀⣸⣧⣠⣤⣴⣶⣾⣿⣿⣿⡿⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠀\n⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n\n\n"
msg_titulo:			.asciz "######     #    #######    #    #       #     #    #       #     #    #    #     #    #    #       \n#     #   # #      #      # #   #       #     #   # #      ##    #   # #   #     #   # #   #       \n#     #  #   #     #     #   #  #       #     #  #   #     # #   #  #   #  #     #  #   #  #       \n######  #     #    #    #     # #       ####### #     #    #  #  # #     # #     # #     # #       \n#     # #######    #    ####### #       #     # #######    #   # # #######  #   #  ####### #       \n#     # #     #    #    #     # #       #     # #     #    #    ## #     #   # #   #     # #       \n######  #     #    #    #     # ####### #     # #     #    #     # #     #    #    #     # ####### \n\n"
matriz:				.word 100
matriz_player:			.word 100

	.text	
	la	t5, msg_inicio
	
	add 	a0, zero, t5
	li	a7, 4
	ecall
	
	la	t5, msg_titulo
	
	add 	a0, zero, t5
	li	a7, 4
	ecall

	jal	start
	
	j 	fim

start:
	add	s8, zero, ra				#grava o endereço para onde deve retornar
	la	a1, navios				#carrega em s1 a string navios
	la	a2, char_vazio
	la 	s0, matriz				#carrega em s0 a matriz do jogo
	la	s7, matriz_player
	
				#marca o ponteiro do retorno
	
	add	a4, zero, s0
	jal	inicializa_matriz
	
	add	s7, zero, t2
	add	a4, zero, s7
	jal	inicializa_matriz
	
	jal 	insere_embarcacoes			#chama a função para inserir as embarcaçoes
	
#	add	a4, zero, s0
#	jal	imprime_matriz
	
	add	a4, zero, s7
	jal	imprime_matriz
	add	ra, zero, s8				#retorna o endereço para onde a função deve retornar
	ret

insere_embarcacoes:
	add 	t0, zero, zero				#carrega em t0 o valor 0
	addi	t1, zero, 10				#carrega em t1 o valor 10
	addi	t2, zero, 48 				#carrega em t2 o valor 48
	j 	get_n_navios

get_n_navios:	
	lbu	t3, (a1)				#carrega em t3 o valor do endereço apontado por a1
	beq	t3, t1, loop_navio_especs		#valida se t3 for o valor ASCII da quebra de linha
	ble	t3, t2, qtde_invalida			#valida se t3 não é o valor ASCII de 0
	addi	t3, t3, -48				#transforma o valor ASCII do caractere em valor decimal
	addi	a3, zero, 32
	add	s1, zero, t3				#armazena em s1 o valor referente a quantidade de navios a inserir
	addi	a1, a1, 1				#passa para o próximo caractere da string
	j 	get_n_navios
	
loop_navio_especs:
	addi	a1, a1, 1				#passa para o próximo caractere da string
	lbu	s2, (a1)				#armazena em s2 o valor armazenado no endereço a1, que indica a posição do navio
	addi	s2, s2, -48				#transforma o valor ASCII do caractere em valor decimal
	addi	a1, a1, 1				#passa para o próximo caractere da string
	lbu	s6, (a1)
	bne	s6, a3, instrucao_invalida
	addi	a1, a1, 1
	lbu	s3, (a1)				#armazena em s3 o valor armazenado no endereço a1, que indica o comprimento do navio
	addi	s3, s3, -48				#transforma o valor ASCII do caractere em valor decimal
	addi	a1, a1, 1
	lbu	s6, (a1)
	bne	s6, a3, instrucao_invalida
	addi	a1, a1, 1				#passa para o próximo caractere da string
	lbu	s4, (a1)				#armazena em s4 o valor armazenado no endereço a1, que indica a linha inicial do navio
	addi	s4, s4, -48				#transforma o valor ASCII do caractere em valor decimal
	addi	a1, a1, 1
	lbu	s6, (a1)
	bne	s6, a3, instrucao_invalida
	addi	a1, a1, 1				#passa para o próximo caractere da string
	lbu	s5, (a1)				#armazena em s5 o valor armazenado no endereço a1, que indica a coluna inicial do navio
	addi	s5, s5, -48				#transforma o valor ASCII do caractere em valor decimal
	addi	a1, a1, 1				#passa para o próximo caractere da string
	lbu	t3,(a1)					#armazena em t3 o valor armazenado no endereço a1
	addi	t0, t0, 1				#incrementa em 1 o contador do loop
	j	insere_navio

insere_navio:
	mul	s6, s4, t1				#realiza a multiplicação da linha inicial pela quantidade de colunas
	add	s6, s6, s5				#realiza a adição da multiplicação anterior com a colunia inicial
	addi	t4, zero, 4				#carrega o valor 4 ao registrador t4
	mul	s6, s6, t4				#multiplica o valor obtido no cálculo anterior por 4 para obter o deslocamento
	add	t4, s0, s6				#armazena o valor do deslocamento em t4
	add	t5, zero, zero				#armazena em t5 o valor 0

	beq	s2, zero, insere_navio_horizontal	#valida se a posição do navio é horizontal
	j	insere_navio_vertical
			
insere_navio_horizontal:
	add	a5, s3, s5
	bgt	a5, t1, posicao_do_navio_invalida		#----------------------------------------------------------------------#
	lbu	s2, (t4)				#asjdpoajksdpokaspokdpaoskdsa
	addi	a6, zero, 42
	bne	s2, a6, posicao_do_navio_invalida
	addi	t6, t0, 64				#realiza a adição do navio atual para obter o valor ASCII do caractere referente
	sb	t6, (t4)				#armazena no valor endereço t4 o valor ASCII do caractere referente ao navio
	addi	t5, t5, 1				#acrescenta o contador t5 em 1
	beq	t5, s3, fim_insercao_navio		#verifica se o contador t5 é igual ao comprimento do navio
	addi	t4, t4, 4				#aponta o próximo endereço a ser inserido o caractere referente ao navio
	j	insere_navio_horizontal
	
insere_navio_vertical:
	add	a5, s3, s4
	bgt	a5, t1, posicao_do_navio_invalida		#----------------------------------------------------------------------#
	lbu	s2, (t4)				#asjdpoajksdpokaspokdpaoskdsa
	addi	a6, zero, 42
	bne	s2, a6, posicao_do_navio_invalida
	addi	t6, t0, 64				#realiza a adição do navio atual para obter o valor ASCII do caractere referente
	sb	t6, (t4)				#armazena no valor endereço t4 o valor ASCII do caractere referente ao navio
	addi	t5, t5, 1				#acrescenta o contador t5 em 1
	beq	t5, s3, fim_insercao_navio		#verifica se o contador t5 é igual ao comprimento do navio
	addi	t4, t4, 40				#aponta o próximo endereço a ser inserido o caractere referente ao navio
	j	insere_navio_vertical
	
fim_insercao_navio:
	beq	t0, s1, fim_instrucoes			#valida se existe mais um navio a ser inserido
	beq	t3, t1, loop_navio_especs		#valida se a instrução atual está encerrada por uma quebra de linha
	j 	instrucao_invalida
	
fim_instrucoes:
	ret
	
qtde_invalida:
	la 	a0, msg_qtde_invalida
	li	a7, 4
	ecall
	j 	fim
	
instrucao_invalida:
	la 	a0, msg_instrucao_invalida		#instrucao invalida
	li	a7, 4
	ecall
	j 	fim
	
posicao_do_navio_invalida:
	la 	a0, msg_posicao_do_navio_invalida		#instrucao invalida
	li	a7, 4
	ecall
	j 	fim

imprime_matriz:
	add 	t0, zero, zero				#carrega em t0 o valor 0
	addi	t1, zero, 100
	add	t2, zero, a4
	add	t3, zero, zero
	addi	t4, zero, 10
	la	t5, quebra_linha
	j	loop_imprime_matriz
	
loop_imprime_matriz:
	lbu 	a0, (t2)
	li	a7, 11
	ecall
	addi	a0, zero, 32
	li	a7, 11
	ecall
	addi	t0,t0, 1
	addi	t3,t3, 1
	addi	t2, t2, 4
	beq	t3, t4, quebra_linha_matriz
	beq	t0, t1, fim_impressao
	j	loop_imprime_matriz
	
fim_impressao:				
	lbu 	a0, (t5)				#fim impressão
	li	a7, 11
	ecall
	ret

inicializa_matriz:
	add 	t0, zero, zero				#carrega em t0 o valor 0
	addi	t1, zero, 100
	add	t2, zero, a4
	add	t3, zero, zero
	addi	t4, zero, 10
	la	t5, char_vazio
	j	loop_inicaliza_matriz
	
loop_inicaliza_matriz:
	lbu	t6, (t5)
	sb	t6, (t2)
	addi	t0,t0, 1
	addi	t2,t2, 4
	beq	t0, t1, fim_inicializa_matriz
	j	loop_inicaliza_matriz
	
fim_inicializa_matriz:
	ret
		
quebra_linha_matriz:
	addi	t3, zero, 0
	lbu 	a0, (t5)
	li	a7, 11
	ecall
	beq	t0, t1, fim_impressao
	j	loop_imprime_matriz
fim:
	nop
