# verifica se a 1a coluna tem a data se tiver pega o valor da abertura
{if ($1 == "Jul") { 
     printf ("%s \n",substr($4,16,2));
# seleciona as linhas com os valores medidos     
  } else {if (($1 != "avg:") && ($1 != "center")) { 
     printf ($1" "$3" \n");
  } 
}
}

