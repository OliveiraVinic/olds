# seleciona as linhas com a 1a linha para razao do [S II]
{if (($1 > 6700) && ($1 < 6725)) {
   flu[NR] = $2
   erro[NR] = $3
  } 
# seleciona as linhas com a 2a linha para a razao do [S II]
 else {
   flu[NR] = $2
   erro[NR] = $3
  }
}

# soh eh utilizado quando acabar todas as linhas do arquivo de entrada
END {
 i=1
 j=1
# seleciona o tamanho do array
 while (i <=14) {
     razao = flu[i]/flu[i+1]
     p1 = erro[i]/flu[i]
     p2 = erro[i+1]/flu[i+1]
     erroraz = razao*sqrt((p1)^2+(p2)^2)
     printf ("%d %4.3f %4.3f \n",j,razao,erroraz)
# incrementa os contadores
     i += 2
     j ++
  }
} 
