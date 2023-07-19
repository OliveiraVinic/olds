        program vinic08
        implicit none
        integer j
        real*8 flu1(50), flu2(50), flu3(50), err1(50), err2(50)
        real*8 err3(50),fator
        character*80  sai, arq1, arq2
        
C       In¡cio do programa

C       Inicializando as var¡ veis
        arq1='1d01flu'
        arq2='halfa_1d01flu'
        sai='teste5.tex'
        fator=1E-15

C       Lˆ o arquivo de entrada
        open(10,file=arq1,status='old')
        open(20,file=arq2,status='old')
        do j=1,50
          read(10,'(TR12,E10.4E2,TR4,E10.4E2)') flu1(j),err1(j)
          read(10,'(TR12,E10.4E2,TR4,E10.4E2)') flu2(j),err2(j)
          read(20,'(TR18,E10.4E2,TR4,E10.4E2)') flu3(j),err3(j)
        enddo
        close(10)
        close(20)

C       Oraganiza os dados para a sa¡da
        do j=1,50
          flu1(j)=flu1(j)/fator
          flu2(j)=flu2(j)/fator
          flu3(j)=flu3(j)/fator
          err1(j)=err1(j)/fator
          err2(j)=err2(j)/fator
          err3(j)=err3(j)/fator
        enddo
        
C       Grava o arquivo de sa¡da
        open(8,file=sai,status='new')
        do j=1,50
          write(8,'(/I2,'' & '',F7.4,'' & '',F6.4,$)') j,flu1(j),err1(j)
          write(8,'($'' & '',F7.4,'' & '',F6.4)') flu2(j),err2(j)
          write(8,'($'' & '',F7.2,'' & '',F6.3)') flu3(j),err3(j)
        enddo
        close(8)

C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof¡sica - UFSM
C     ------------------------------------------------------------------
        end
