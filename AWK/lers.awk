#le os dados do splot e imprime comprimento de onda e fluxo para cada abertura (FEITO P/ MEDIR AS LINHAS DO Sii, DUPLAS OU NÂO)

{

a="Oct"
b="Feb"
c="Mar"
d="Sep"


if (($1 == a) || ($1 == b) || ($1 == c) || ($1 == d) ) { 
# achando a linha que contém o mes, imprime a abertura
#     printf ("%s \n",substr($5,23,2));
      cont=cont+1
      z=1
      x=cont
#      ab[cont]=substr($5,14,2)   (junta.fits)

#____ve se o que eu to pegando é número ou não (pra solucionar o problema das aberturas)  

if (substr($4,29,1)/2*2==substr($4,29,1)){

        ab[cont]=substr($4,29,1)
}

if (substr($4,29,2)/2*2==substr($4,29,2)){

        ab[cont]=substr($4,29,2)
}

if (substr($4,29,3)/2*2==substr($4,29,3)){

        ab[cont]=substr($4,29,3)
}
#____fim do problema das aberturas




#        ab[cont]=substr($5,33,2) (boa)
 }






if ((($1*2)/2==$1))
{
z=z+1

###############

lamb[z,cont]=$1
flux[z,cont]=$3

#######################
}
else
{
z=0
}







}
END{
for (i=1; i<(x+1); i++)
{
# imprime as duas linhas
#print ab[i],lamb1[i],flux1[i],lamb2[i],flux2[i]
#

####imprime tudo

print ab[i],lamb[1,i],flux[1,i],lamb[2,i],flux[2,i],lamb[3,i],flux[3,i],lamb[4,i],flux[4,i]

###fim do imprime tudo


}
}
