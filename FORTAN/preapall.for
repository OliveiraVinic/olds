C     ------------------------------------------------------------------
C       Arquivo para multiplicar a quantidade de aberturas extraídas
C	pelo comando apall do IRAF

        program preapall
	implicit none
	real*8 lin,passo
        integer j,i,nabert
        character*80  sai,ent,linha(30)
	character*5 col

C	Inicio do programa
	open(11,file='ent.tmp',status='old')
	read(11,*) ent
	close(11)
	open(12,file='saida.tmp',status='old')
	read(12,*) sai
	close(12)
	open(13,file='nabert.tmp',status='old')
	read(13,*) nabert
	close(13)
	open(14,file='abert.tmp',status='old')
	read(14,'(a5,1x,f7.4)') col,lin
	close(14)
	open(15,file='passo.tmp',status='old')
	read(15,*) passo
	close(15)
C 	Leitura do arquivo texto de entrada
	open(10,file=ent,status='old')
	do i=1,30
	  read(10,'(a50)') linha(i)
	enddo
	close(10)
C	Ajuste e Gravacao do arquivo texto de saida
	open(8,file=sai,status='unknown')
	do j=1,nabert
C	Chama as varias subrotinas de ajuste
	  call linhadois(linha(2),lin,j,col)
	  call linhaquatro(linha(4),j)
	  call linhacinco(linha(5),j)
	  call linhaseis(linha(6),lin,col)
	  lin=lin+passo
	  do i=1,30
	    select case (i)
	     case (1)
	       write(8, '(a50)') linha(1)
	     case (2)
	       write(8,'(a46)') linha(2)
             case (3) 
	       write(8,'(a20)') linha(3)
             case (4) 
	       write(8,'(a12)') linha(4)
             case (5) 
	       write(8,'(a11)') linha(5)
             case (6) 
	       write(8,'(a24)') linha(6)
	     case (7:)
	       write(8,'(a50)') linha(i)
	    end select
	  enddo
	  write(8,*) ' '
	enddo
	close(8)
	end
C	Fim do programa principal

C	Subrotina para alterar o numero da abertura e o centro
C	na linha dois do arquivo
	subroutine linhadois(l,a,k,coluna)
	implicit none
	real*8 a
	integer k
	character*80 l,coluna
C	Ajusta a linha 2 conforme o valor da abertura e centro
	open(20,file='t.tmp',status='unknown')
	write(20,'(a29,i2,1x,a5,1x,f8.4)') l,k,coluna,a
	close(20)
C	Grava o resultado final da linha 2	
	open(7,file='t.tmp',status='old')
	read(7,'(a50)') l
	close(7)
	end
	
C	Subrotina para alterar o numero da abertura na linha 4
	subroutine linhaquatro(l,k)
	implicit none
	integer k
	character*80 l
C	Ajusta a linha 4 conforme o valor da abertura	
	open(20,file='t.tmp',status='unknown')
	write(20,'(a10,i2)') l,k
	close(20)
C	Grava o resultado final da linha 4	
	open(7,file='t.tmp',status='old')
	read(7,'(a50)') l
	close(7)
	end
	
C	Subrotina para alterar o numero da abertura na linha 5
	subroutine linhacinco(l,k)
	implicit none
	integer k
	character*80 l
C	Ajusta a linha 5 conforme o valor da abertura	
	open(20,file='t.tmp',status='unknown')
	write(20,'(a9,i2)') l,k
	close(20)
C	Grava o resultado final da linha 5
	open(7,file='t.tmp',status='old')
	read(7,'(a50)') l
	close(7)
	end
	
C	Subrotina para alterar o centro na linha 6
C	na linha dois do arquivo
	subroutine linhaseis(l,a,coluna)
	implicit none
	real*8 a
	character*80 l,coluna
C	Ajusta a linha 6 conforme o valor do centro	
	open(20,file='t.tmp',status='unknown')
	write(20,'(a9,1x,a5,1x,f8.4)') l,coluna,a
	close(20)
C	Grava o resultado final da linha 6
	open(7,file='t.tmp',status='old')
	read(7,'(a50)') l
	close(7)
	end
