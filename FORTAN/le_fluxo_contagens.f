C       O arquivo de entrada deve estar no formato adequado:
C                 1¦ coluna -> comprimentos de onda
C                 2¦ coluna -> medida do fluxo ou das contagens
C            Obs.: uma terceira linha ‚ usada para o valor do rms
C       O arquivo de sa¡da ter  o formato:
C                 1¦ -> comprimentos de onda
C                 2¦ -> fluxo calibrado
C                 3¦ -> contagens
C                 4¦ -> quando aparecer ‚ o rms
C       Cada duas linhas consecutivas correspondem a uma abertura

        program vinic02
        implicit none
        integer j
        real*8 lin1(50), lin2(50), flu1(50), flu2(50), con1(50), l
        real*8 con2(50), rms(50)
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
	  read(10,'(F8.3,TR2,E10.4E2)') lin1(j),flu1(j)
	  read(10,'(F8.3,TR2,E10.4E2)') lin2(j),flu2(j)
	  read(10,'(E10.4E2)') rms(j)
	  read(20,'(F8.3,TR5,F8.3)') l,con1(j)
	  read(20,'(F8.3,TR5,F8.3)') l,con2(j)
        enddo
        close(20)
        close(10)

C      Grava‡Æo do arquivo de sa¡da
         open(8,file=sai,status='new')
         do  j=1,50
          write(8,'(F8.3,4x,E10.4e2,4x,F8.3,4x,E10.4e2)') lin1(j),
     1 flu1(j),con1(j), rms(j)
          write(8,'(F8.3,4x,E10.4e2,4x,F8.3,4x,E10.4e2)') lin2(j),
     2 flu2(j),con2(j)
         enddo
         close(8)
C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
