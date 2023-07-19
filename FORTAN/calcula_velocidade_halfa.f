C       O arquivo de entrada deve estar no formato adequado:
C                 1¦ coluna -> n§ da abertura
C                 2¦ coluna -> comprimentos de onda
C                 demais coluna -> nÆo importa
C       O arquivo de sa¡da ter  o formato:
C                 1¦ -> n§ da abertura
C                 2¦ -> comprimentos de onda
C                 3¦ -> velocidade

        program velocidade_das_linhas
        implicit none
        integer j, ab(50)
        real*8 lin(50), velo(50), soma, media
        character*80  sai, ent1

C	In¡cio do programa
	write(*,*) 'Digite o nome do arquivo de entrada'
	write(*,*) 'com os fluxos'
	read(*,*) ent1
        write(*,*) 'Digite o nome do arquivo de sa¡da'
	read(*,*) sai
	open(10,file=ent1,status='old')

C       Leitura do arquivo de entrada
        do j=1,50
         read(10,'(I2,TR4,F8.3)') ab(j), lin(j)
	enddo
        close(10)

C      Calculando a velocidade em cada ponto
        do j=1,50
         velo(j)=(lin(j)-6562.8)*45.6806
        enddo

C      Grava‡Æo do arquivo de sa¡da
         open(8,file=sai,status='new')
         do  j=1,50
          write(8,'(I2,4x,F8.3,4x,F8.3)') ab(j),lin(j),velo(j)
         enddo
         close(8)
         
C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
