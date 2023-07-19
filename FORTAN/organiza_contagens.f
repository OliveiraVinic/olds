       program vinic05
       implicit none
       real*8 comp1(11), comp2(11), flu1(11), flu2(11)
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
          read(10,'(F8.3,TR5,F8.3)') comp2(j), flu2(j)
         enddo
C      Calcula os calores intermidi rios
         i=1
         k=2
         do j=1,50
          linha1(j)=(comp1(i)+comp1(k))/2
          fluxo1(j)=(flu1(i)+flu1(k))/2
          linha2(j)=(comp2(i)+comp2(k))/2
          fluxo2(j)=(flu2(i)+flu2(k))/2
          if (mod(j,5).eq.0) then
           if (j.ne.50) then
            i=i+1
            k=k+1
           endif
          endif
         enddo
C      Grava no arquivo de sa¡da
       do j=1,50
         write(20,'(F8.3,TR5,F8.3)') linha1(j), fluxo1(j)
         write(20,'(F8.3,TR5,F8.3)') linha2(j), fluxo2(j)
       enddo

       close(10)
       close(20)
       end
      
      
