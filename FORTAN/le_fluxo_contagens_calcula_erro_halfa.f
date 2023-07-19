C       O arquivo de entrada deve estar no formato adequado:
C                 1¦ coluna -> comprimentos de onda
C                 2¦ coluna -> medida do fluxo ou das contagens
C                 3¦ coluna -> valor do rms
C       O arquivo de sa¡da ter  o formato:
C                 1¦ -> comprimentos de onda
C                 2¦ -> fluxo calibrado
C                 3¦ -> erro na calibra‡Æo do fluxo
C                     (usando a estimativa de erro de Poisson)

        program vinic07
        implicit none
        integer j
        real*8 lin(50),flu(50), con(50), rms(50), l, sf(50)
        character*80  sai, ent1, ent2

C	In¡cio do programa
	write(*,*) 'Digite o nome do arquivo de entrada'
	write(*,*) 'com os fluxos'
	read(*,*) ent1
	write(*,*) 'com as contagens'
	read(*,*) ent2
	write(*,*) 'Digite o nome do arquivo de sa¡da'
	read(*,*) sai

	open(10,file=ent1,status='old')
	open(20,file=ent2,status='old')

C       Leitura do arquivo de entrada
        do j=1,50
         read(10,'(F8.3,TR2,E9.4E2,TR2,E9.3E2)') lin(j),flu(j),rms(j)
	 read(20,'(F8.3,TR5,F9.3)') l,con(j)
	enddo
        close(20)
        close(10)

C       C lculo do erro do fluxo calibrado
        do j=1,50
          sf(j)=sqrt(rms(j)**2+(flu(j)/con(j))*flu(j))
        enddo

C      Grava‡Æo do arquivo de sa¡da com os fluxos e respectivos erros
       open(9,file=sai,status='new')
        write(9,*) 'Ab     Linha       Fluxo         Erro fluxo'
 	do  j=1,50
         write(9,'(I2,4x,F8.3,4x,E10.4e2,4x,E10.4e2)') j,lin(j),flu(j),
     2 sf(j)
        enddo
        close(9)

C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
