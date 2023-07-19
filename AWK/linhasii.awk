# seleciona apenas as linhas do [S II] para estimar a densidade
{if (($1> 6700) && ($1< 6800)) {
   print $1" "$2" "$3
 }
}
      
