C       O arquivo de entrada deve estar no formato adequado:
C                 1¦ coluna -> n§ da abertura
C                 2¦ coluna -> comprimentos de onda
C                 3¦ coluna -> velocidade
C       O arquivo de sa¡da ter  o formato:
C                 coluna £nica com a velocidade m‚dia sobre a regiÆo
C                 HII conforme a sele‡Æo pelas linhas Halfa

        program velocidade_media
        implicit none
        integer j, ab(50), linf, lsup
        real*8 velo(50), soma, media, n
        character*80  sai, ent1

C	In¡cio do programa
	write(*,*) 'Digite o nome do arquivo de entrada'
	read(*,*) ent1
        write(*,*) 'Digite o nome do arquivo de sa¡da'
	read(*,*) sai
	open(10,file=ent1,status='old')

C       Leitura do arquivo de entrada
        do j=1,50
         read(10,'(I2,TR18,F8.3)') ab(j), velo(j)
	enddo
        close(10)

C      Calculando a velocidade m‚dia
        write(*,*) 'Qual o limite inferior?'
        read(*,*) linf
        write(*,*) 'Qual o limite superior?'
        read(*,*) lsup
        soma = 0
        do j=1,50
         if (j.ge.linf) then
          if (j.le.lsup) then
           soma = soma + velo(j)
          endif
         endif
        enddo
        n = (lsup - linf) + 1
        media = soma / n

C      Grava‡Æo do arquivo de sa¡da
         open(8,file=sai,status='new')
          write(8,'(F8.3)') media
         close(8)
         
C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
