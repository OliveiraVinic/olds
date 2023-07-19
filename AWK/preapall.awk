# inicializa as variaveis universais, alterar conforme o caso
BEGIN {
# n eh o numero total de aberturas
 n = 60
# ab1 eh a posicao da 1a abertura
 ab1 = 19.3728
# p eh o passo entre as aberturas
 p = 9
 abn = ab1
 ab = 1
 }

# le todo o arquivo de entrada e armazena em um array
{ 
 for (i=1;i<=30;i++) {
  getline linha[i] < "apdems1030001ci"
 }
}

# apos a leitura do arquivo de entrada faz as alteracoes necessarias
# usei expressoes regulares pois o array nao mantem a separacao por colunas
END{ 
 j = 1
# final = j * n
 i = 1
 while (i<=n) {
     if (linha[j] ~ /begin/) {
 	 printf ("begin   aperture dems1030001ci %d 1023. %3.4f\n",ab,abn);
     } else if (linha[j] ~ /aperture/) {
 	    printf ("	aperture	%d\n",ab);
     } else if (linha[j] ~ /beam/) {
 	    printf ("	beam    %d\n",ab)
 	    ab++;
     } else if (linha[j] ~ /center/) {
 	    printf ("	center  1023. %3.4f\n",abn)
 	    abn += p;
     } else {
 	    print linha[j]
 	}
     if (j == 30) {
         i++
	 j = 1
     } else {
   j++
   }
}
}

# nao esquecer de alterar o nome do arquivo no getline

# tem que trocar o 1o printf com as novas expecificacoes, tipo nome do arquivo
# e centro da abertura no eixo x
