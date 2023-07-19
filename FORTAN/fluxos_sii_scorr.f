 
C......Programa que calcula a razão de fluxos - densidade   06/06/2003


       program  razao_densidade
       implicit none 
       
       character nome_arquivo_fluxos*30, nome_arquivo_saida*30
       integer*2 num_aberturas, i, abertura(150)
       real*8 f_1(150), rms_1(150), f_2(150), rms_2(150), ganho1(150), ganho2(150) 
       real*8  r_densidade(150), erro_densidade(150), largura, erro_2(150),erro_1(150) 
       
       
C######################################################################################
C     Lê os dados de entrada
C######################################################################################      
       
       WRITE(*,*) 'NOME DO ARQUIVO com os fluxos, com o rms e o ganho'
        READ(*,*) NOME_ARQUIVO_fluxos
	
       write(*,*) 'Quantas aberturas?'
        read(*,*) num_aberturas	
	
	 
       WRITE(*,*) 'NOME DO ARQUIVO de saida'
        READ(*,*) NOME_ARQUIVO_saida

       WRITE(*,*) 'Qual a largura das linhas de emissão'
        READ(*,*) largura
       	
C#########################################################################################      
C     Lê O ARQUIVO DE ENTRADA 
C#########################################################################################    	
      	
      	
       
       open(20, file=nome_arquivo_FLUXOS, status="old")
        write(*,*) 'passou'
	do i=1, num_aberturas 
	  read(20,*) abertura(i), f_ 1(i), rms_1(i),ganho1(i),  f_2(i), rms_2(i), ganho2(i)
	
	enddo
       close(20)
       
       
   	
C#########################################################################################      
C    Calcula a Razão [SII]
C#########################################################################################    	
      	    
       
       do i=1, num_aberturas 
          IF((f_1(i).GT.0.00).and.(f_2(i).GT.0.00)) THEN
           erro_1(i)= SQRT((largura*(rms_1(i)**2) + ganho1(i)*F_1(i)))
	   erro_2(i)= SQRT((largura*(rms_2(i)**2) + ganho2(i)*F_2(i)))
	   r_densidade(i)= (f_1(i))/ f_2(i)
	   erro_densidade(i)= r_densidade(i)*(sqrt((erro_1(i)/f_1(i))**2 + (erro_2(i)/f_2(i))**2) ) 
	  
	  ELSE
	    r_densidade(i)=0.0
	    erro_densidade(i)=0.0
	  endif     
       
       enddo
       
C#########################################################################################      
C     Escreve a razão [SII] no arquivo de saida
C#########################################################################################
      
      OPEN(40, FILE=nome_arquivo_saida, STATUS="new")  
       WRITE(40, '(A3, 2X, 2(A9,3X))') "#", "R[SII]", " erro"
       WRITE(40, '(A1)')  "#"
        DO i=1,NUM_ABERTURAS
          WRITE(40, '(I3,2X,3(f9.2,3x))') ABERTURA(i), r_densidade(i), erro_densidade(i)
        ENDDO
      CLOSE(40)     
      
      
       
       
       end
       
       
       
       
      		
	
