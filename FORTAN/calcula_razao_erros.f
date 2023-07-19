C       O arquivo de entrada deve ser o mesmo da sa°da do programa
C       anterior.
C       O arquivo de sa°da estar† no formato espec°fico:
C          fluxo:
C                1¶ -> comprimento de onda
C                2¶ -> fluxo calibrado
C                3¶ -> erro na calibraá∆o do fluxo
C                     (usando a estimativa de erro de Poisson)
C             Obs.: cada duas linhas representam uma abertura
C          densidade:
C                1¶ -> n£mero da abertura
C                2¶ -> valor da raz∆o de linhas de [S II]
C                3¶ -> erro no c†lculo da raz∆o de linhas de [S II]
C                     (usando a propagaá∆o de erro em divis∆o)

        program vinic03
        implicit none
        integer j
        real*8 lin1(50), lin2(50), flu1(50), flu2(50), con1(50)
        real*8 con2(50), rms(50), sf1(50), sf2(50), sn(100), razao(50)
        character*80  saiflu, sairaz, ent

C	In°cio do programa
	write(*,*) 'Digite o nome do arquivo de entrada:'
	read(*,*) ent
        write(*,*) 'Digite o nome do arquivo de sa°da,'
        write(*,*) 'para os fluxos e erros de calibraá∆o:'
	read(*,*) saiflu
        write(*,*) 'para as raz‰es de linhas e seus erros:'
	read(*,*) sairaz

	open(10,file=ent,status='old')

C       Leitura do arquivo de entrada

        do j=1,50
	  read(10,'(F8.3,4x,E10.4e2,4x,F8.3,4x,E10.4e2)') lin1(j),
     1 flu1(j),con1(j), rms(j)
          read(10,'(F8.3,4x,E10.4e2,4x,F8.3,4x,E10.4e2)') lin2(j),
     2 flu2(j),con2(j)
        enddo
        close(10)

C       C†lculo do erro do fluxo calibrado
        do j=1,50
          sf1(j)=sqrt(rms(j)**2+(flu1(j)/con1(j))*flu1(j))
          sf2(j)=sqrt(rms(j)**2+(flu2(j)/con2(j))*flu2(j))
        enddo

C       C†lculo do erro da raz∆o das linhas de [S II]
        do j=1,50
          razao(j)=flu1(j)/flu2(j)
          sn(j)=razao(j)*sqrt((sf1(j)/flu1(j))**2+(sf2(j)/flu2(j))**2)
        enddo
        
C      Gravaá∆o do arquivo de sa°da com os fluxos e respectivos erros
       open(8,file=saiflu,status='new')
C        write(8,*) 'Linha       Fluxo         Erro fluxo'
 	do  j=1,50
         write(8,'(F8.3,4x,E10.4e2,4x,E10.4e2)') lin1(j),flu1(j),sf1(j)
         write(8,'(F8.3,4x,E10.4e2,4x,E10.4e2)') lin2(j),flu2(j),sf2(j)
        enddo
        close(8)

C      Gravaá∆o do arquivo de sa°da com as raz‰es de linhas e os erros
        open(9,file=sairaz,status='new')
C        write(9,*) 'Ab       Razao     Erro Densidade'
        do j=1,50
          write(9,'(I2,4x,F9.3,4x,F9.3)') j,razao(j),sn(j)
        enddo
        close(9)
C     ------------------------------------------------------------------
C      Desenvolvido por: Vinicius de Abreu Oliveira
C                         mestrando em Astrof°sica - UFSM
C     ------------------------------------------------------------------
        end
