C       O arquivo de entrada deve estar no formato adequado:
C                 1¦ coluna -> comprimentos de onda
C                 2¦ coluna -> medida do fluxo ou das contagens
C            Obs.: uma terceira linha ‚ usada para o valor do rms
C       O arquivo de sa¡da ter  o formato:
C                 1¦ -> comprimentos de onda
C                 2¦ -> fluxo calibrado
C                 3¦ -> contagens
C                 4¦ -> rms

        program vinic07
        implicit none
        integer j
        real*8 lin(50),flu(50), con(50), rms(50), l
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

C      Grava‡Æo do arquivo de sa¡da
         open(8,file=sai,status='new')
         do  j=1,50
          write(8,'(F8.3,4x,E10.4e2,4x,F9.3,4x,E10.4e2)') lin(j),flu(j),
     1 con(j),rms(j)
         enddo
         close(8)
C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
