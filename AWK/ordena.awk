 BEGIN {
     print "# Este programa ordena um arquivo cujas linhas sao numeradas!\n"
}
# Comandos que serao executados depois de varrer o arquivo
END {
     print "# Arquivo Ordenado: \n"
     for (i=1; i<=max; i++)
	  if (i in vetor) # para evitar linhas em branco
	      print vetor[i]
}
# Comandos que serao executados enquanto varre o arquivo
{
     if ($1 > max)
	  max = $1
     vetor[$1] = $0
}

