C       O arquivo de entrada deve estar no formato adequado:
C                 1¦ coluna -> comprimentos de onda
C                 2¦ coluna -> medida das contagens
C       Como s¢ foram feitas medidas a cada 5 abertura este programa
C       faz a m‚dia entre elas para ter os 50 valores esperados
C       O arquivo de sa¡da ter  o mesmo formato, com 50 linhas
C       representando cada abertura

       program vinic06
       implicit none
       real*8 comp1(11), flu1(11)
       real*8 linha1(50), linha2(50), fluxo1(50), fluxo2(50)
       character  saida*30, ent*30
       integer i, j, k
      
C      In¡cio do programa
       write(*,*) 'Digite o nome do arquivo de entrada'
       read(*,*) ent
       write(*,*) 'Digite o nome do arquivo de sa¡da'
       read(*,*) saida
       open(10, file=ent, status="old")
       open(20, file=saida, status="new")
       
C      Leitura dos arquivos de entrada e grava‡Æo do aqruivo de sa¡da
C      Lˆ o arquivo com as contagens
         do j=1,11
          read(10,'(F8.3,TR5,F8.3)') comp1(j), flu1(j)
         enddo
C      Calcula os calores intermidi rios
         i=1
         k=2
         do j=1,50
          linha1(j)=(comp1(i)+comp1(k))/2
          fluxo1(j)=(flu1(i)+flu1(k))/2
          if (mod(j,5).eq.0) then
           if (j.ne.50) then
            i=i+1
            k=k+1
           endif
          endif
         enddo
C      Grava no arquivo de sa¡da
       do j=1,50
         write(20,'(F8.3,TR5,F9.3)') linha1(j), fluxo1(j)
       enddo

       close(10)
       close(20)
C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
       end
      
      
