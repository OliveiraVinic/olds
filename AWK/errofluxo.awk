# seleciona a 1a coluna com o numero da abertura
{if (($1 > 0) && ($1 <61)) {
    print $1
# seleciona as linhas para estimar o erro da calibracao em fluxo
  } else {if ($1> 6000) {
           printf ($1" "$2" %.3e \n",sqrt($3^2+($2)^2/$4));
          }
	}
}      
