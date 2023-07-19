C.....PROGRAMA PARA LER O COMPRIMENTO DE ONDA E O 
C     FLUXO A PARTIR DE UMA TABELA GERADA PELO SPLOT - 10/07/2000
  
     
C     DETERMINACAO DAS VARIAVEIS

      CHARACTER LINHA*74, RMS*9, ABERTURA*74, NUM_ABERTURA*3
      CHARACTER SAIDA*30, ENTRADA*30 
      INTEGER I, PULO1, PULO2
      
C     LE O  O ARQUIVO DE ENTRADA, O ARQUIVO DE SAIDA, AS LINHAS QUE NAO
C     SERAO LIDAS, ABRE O  ARQUIVO COM OS DADOS E O 
C     ARQUIVO A SER CRIADO
     
      WRITE(*,*) 'ARQUIVO DE ENTRADA'
      READ(*,*) ENTRADA
      WRITE(*,*) 'ARQUIVO DE SAIDA'
      READ(*,*) SAIDA
      WRITE(*,*) 'PULO1'
      READ(*,*) PULO1
      WRITE(*,*) 'PULO2'
      READ(*,*) PULO2
      OPEN(10, FILE=ENTRADA, STATUS="OLD")
      OPEN(20, FILE=SAIDA, STATUS="NEW")
      
     
C     LE OS CAMPOS DESEJADOS

      DO WHILE(.TRUE.)
        READ(10,END=100,FMT=110) ABERTURA
        I = 1
        DO WHILE (ABERTURA(I:I).NE.",") 
           I = I + 1
        ENDDO
        I = I + 1
        J = I
        DO WHILE (ABERTURA(J:J).NE."]")
           J = J + 1
        ENDDO   
        NUM_ABERTURA = ABERTURA(I:J-1)        
        DO K=1, PULO1
          READ(10,END=100, FMT=110)
        ENDDO
        READ(10,END=100, FMT=110) LINHA
        DO K=1, PULO2
          READ(10,END=100, FMT=110)
        ENDDO        
        READ(LINHA, '(23X, A9)') RMS   
          WRITE(20,"(A3,1X,A9)") NUM_ABERTURA, RMS
      ENDDO
      
 100  CONTINUE
 
 110  FORMAT(A74)
        
      CLOSE(10)
      CLOSE(20)
      END
      
      
