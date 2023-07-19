# verifica se a 1a coluna tem a data se tiver pega o valor da abertura
{if ($1 == "Apr") { 
     printf ("%s \n",substr($4,18,2));
# seleciona as linhas com os valores medidos     
  } else {if (($1 != "avg:") && ($1 != "center")) { 
     print $1" "$3
  } 
# seleciona as linhas com o valor do RMS
  {if ($1 == "avg:") {
     print $4
  }
}
}
}

