C       O arquivo de entrada deve ser o mesmo da sa¡da do programa
C       anterior.
C       O arquivo de sa¡da estar  no formato espec¡fico:
C                1¦ -> comprimento de onda
C                2¦ -> fluxo calibrado
C                3¦ -> erro na calibra‡Æo do fluxo
C                     (usando a estimativa de erro de Poisson)

        program vinic08
        implicit none
        integer j
        real*8 lin(50), flu(50), con(50), rms(50), sf(50)
        character*80  sai, ent

C	In¡cio do programa
	write(*,*) 'Digite o nome do arquivo de entrada:'
	read(*,*) ent
        write(*,*) 'Digite o nome do arquivo de sa¡da,'
        write(*,*) 'para os fluxos e erros de calibra‡Æo:'
	read(*,*) sai

	open(10,file=ent,status='old')

C       Leitura do arquivo de entrada
        do j=1,50
	  read(10,'(F8.3,4x,E10.4e2,4x,F8.3,4x,E10.4e2)') lin(j),
     1 flu(j),con(j),rms(j)
        enddo
        close(10)

C       C lculo do erro do fluxo calibrado
        do j=1,50
          sf(j)=sqrt(rms(j)**2+(flu(j)/con(j))*flu(j))
        enddo

C      Grava‡Æo do arquivo de sa¡da com os fluxos e respectivos erros
       open(8,file=sai,status='new')
        write(8,*) 'Ab     Linha       Fluxo         Erro fluxo'
 	do  j=1,50
         write(8,'(I2,4x,F8.3,4x,E10.4e2,4x,E10.4e2)') j,lin(j),flu(j),
     2 sf(j)
        enddo
        close(8)

C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
