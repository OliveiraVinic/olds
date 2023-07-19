        PROGRAM READFLUX
C       SAMPLE PROGRAM READS THIS FILE ON UNIT 1
        implicit none
        integer i, j, m, n, q
        real*8 line(100), f_cont(100), f_ergs(100), rms(100)
	real*8 p, a(100), s(100), e_pois(100), af(100), f_rel(100)
	real*8 e_frel(100),uv(100),svv(100), suu(100), u(100), c_ext(100)
	real*8 f_lamb(100), cor_ext(100),e_ext(100),ecr_ext(100)
	real*8  cr1(100), cr2(100),f_rel1(100), suu1(100),svv1(100)
	real*8 e_frel1(100), gf(100) 		 
        CHARACTER*80  sai, entra, linha*80
	
	
	
c        #################################################################################################################
c	LEITURA DOS DADOS DE ENTRADA E SAÍDA.        
	
	write(*,*) 'Por favor insira o nome do arquivo de entrada'
	read(*,*) entra
        
	write(*,*) 'Por favor informe o número de linhas'
	read(*,*) m
	
	write(*,*) 'Por favor insira o nome do arquivo de saida'
        read(*,*)  sai
	
	 write(*,*) 'Informe o número da linha de H beta (4861)'
         read(*,*) j
        
	write(*,*) 'Informe o num da linha de H_alfa(6564) p/ extinção no vermelho e para o azul de H_gamma (4340)'
	read(*,*) n
	
	write(*,*) 'Informe a razão H_gamma/H_beta (0.468) ou a razão H_alfa/H_beta (2.86)'
	read(*,*) p


	open(10,file=entra,status='old') 
	
	 read(10, '(a80)') linha
c        #################################################################################################################
c           LEITURA DO ARQUIVO DE ENTRADA

c              Line é a linha em angstrons, f_cont é o fluxo em contagens, f_ergs é o fluxo em ergs, rms é o rms usado
c              para calcular o erro poisomico, f_lamb é a relação f_lambda - f_h_beta

        
	   do  i=1,m,1
	   read(10,*) line(i), f_cont(i),f_ergs(i), rms(i), f_lamb(i)
        



c        #################################################################################################################            
C          CÁLCULO DO ERRO POISSOMICO
 
C           Cálculo do erro poissomico onde: a=alfa, s=sigma medido com rms
c             quadrado, af= alfa vezes fluxo(ergs) e= erro poisomico	    
            
             a(i)=f_ergs(i)/f_cont(i)
              s(i)=rms(i)*rms(i)
	     af(i)=a(i)*f_ergs(i)
	     e_pois(i)=sqrt(s(i)+af(i))
          enddo
c        #################################################################################################################            

C	 FLUXO RELATIVO A H_beta NORMALIZADO A 100
   


           do i=1,m
           f_rel(i)=(f_ergs(i)/f_ergs(j))*100
	   

c        #################################################################################################################            	          
	    
C        PROPAGAÇÃO DO ERRO POSSOMICO PARA O FLUXO RELATIVO

C         Propagação do erro do fluxo relativo a H_beta onde: uv é o fluxo relativo a H_beta normalizado a 100
c         quadrado suu é sigma de i sobre fluxo de i ao quadrado e svv é sigma de H beta sobre fluxo de H beta ao quadrado.
           

	   suu(i)=(e_pois(i)/f_ergs(i))**2
	   svv(i)=(e_pois(j)/f_ergs(j))**2

         e_frel(i)=f_rel(i)*sqrt(suu(i) + Svv(i))
	 
c        #################################################################################################################            

C        CÁLCULO DO COEFICIENTE DE EXTINÇÃO

     
	 
c        Cálculo do coeficiente de extinção, utilizando a relação H_gamma/H_beta, para o Azul e H_alfa/H_beta para o Vermelho

c      Aqui u(i)= fluxo de h(gamma ou alfa) / H_beta
        
	
          u(i)=(f_ergs(n)/f_ergs(j))/p

         c_ext(i)= (log10 ((u(i))))/(-f_lamb(n))

   
	   
c        #################################################################################################################            
c       CORREÇÃO POR EXTINÇÃO

       cor_ext(i)=f_rel(i)*10**(c_ext(i)*f_lamb(i))

c        #################################################################################################################            
       
c       CÁLCULO DO ERRO DO COEFICIENTE DE EXTINCÇÃO C(H_beta)

c       Aqui eu calculei o erro relativo de h(n)( alfa ou gamma)  a H_beta, onde e_frel1 é o erro do fluxo relativo de H(n)/H_beta

           f_rel1(i)=(f_ergs(n)/f_ergs(j))*100  
           suu1(i)=(e_pois(n)/f_ergs(n))**2
	   svv1(i)=(e_pois(j)/f_ergs(j))**2


	   e_frel1(i)=f_rel1(i)*sqrt(suu1(i) + Svv1(i))
     

        e_ext(i)= (log10(2.718281828)*e_frel1(i))/(f_lamb(n)*f_rel1(i))
	
c        #################################################################################################################            

c         PROPAGAÇÃO DO ERRO PARA A CORREÇÃO POR EXTINÇÃO
        
	 cr1(i)=(10**(c_ext(i)*f_lamb(i))*(e_frel(i)))**2
	 
	 cr2(i)= ((10**(c_ext(i)*f_lamb(i)))*(f_lamb(i)*f_rel(i))*(2.3026)*(e_ext(i)))**2

         ecr_ext(i)= sqrt(cr1(i)+cr2(i))

c        #################################################################################################################            
C	IMPRESSÃO DOS ARQUIVOS DE SAÍDE REQUERIDOS NA TELA

	  
        print*, line(i),e_pois(i),f_rel(i),e_frel(i)

      enddo
        
        open(8,file=sai,status='new')
     
       

c        #################################################################################################################                       
C	  DADOS A SEREM GRAVADOS NO ARQUIVO DE SAÍDA

           Write(8,'(2x,A6,1x,A12,4xA4,1x,A16)') 'Lambda', 'F.Corrigido','erro', 'f_lamb-f_H_beta'

	   do  i=1,m,1   
	  
            Write(8,'(F8.2, 3x,F8.2,3x,F8.2,F8.2)') line(i), cor_ext(i), ecr_ext(i), f_lamb(i)
            if (i.eq.m) then
	    Write(8,'(2x,A40)')'----------------------------------------'
	    Write(8,'(2x,A23,3x,F8.2)') 'Coeficiente de Extinção', c_ext(i)
	    Write(8,'(2x,A23,3x,E9.2)') 'Fluxo observ. em H_beta', f_ergs(j)
	    endif
	  enddo

            Write(8,*) 
	   
          close(10)
          close(8)
         

             
           end
