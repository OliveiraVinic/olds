 
 
C........Programa que calcula a razao de dois numeros



        program media dos dados
        implicit none

        CHARACTER  NOME_ARQUIVO*30, NOME_ARQUIVO_saida*30
	integer i, k
	real*8 f1(10000), f2(10000) 
	real*8  erro1(1000), erro2(1000), b(10000)
	real*8   razao(10000),erro_r(10000),a(100000)
	
	
	WRITE(*,*)'Qual e o arquivo c/ os dados?'
        READ(*,*) nome_arquivo
	 
	WRITE(*,*)'Qual e o arquivo de saida?'
        READ(*,*) nome_arquivo_saida
	
	WRITE(*,*)'Quantos valores?'
        READ(*,*) k
	
	
	do i=1, k 
           OPEN(20, FILE=nome_arquivo, STATUS="old")
	   read(20,*) a(i),f1(i), f2(i)
        enddo 
	
	 
	
	
	
	do i=1, k
	   razao(i)= (f1(i)/f2(i))
	   OPEN(30, FILE=nome_arquivo_saida, STATUS="new")
	   write(*,*)  razao(i)
	   Write(30, '(f8.3,2x, f8.3)') a(i),  razao(i)
	    
	enddo
	
	close(20)
	close(30)
	
	
	
	end
	
	
	
	
	 
	 
