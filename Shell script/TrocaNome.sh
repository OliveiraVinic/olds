#!/bin/bash

# Elaborado por Vinicius A Oliveira
# baseado em um script encontrado na Internet

# verifica se a chamada foi feita da maneira correta
if [ "$#" != 1 ] ; then
#   $\a
   echo ""
   echo "Use: $0 <dir> "
   echo ""
   exit
fi

# bloco que realiza a troca dos espaços vazios por '_'
DIR="$1"
echo ""
echo "-------------------------------------------------"
echo "Renomeando arquivos do diretório $DIR ..."
echo ""
ls $DIR/* | while read ARQ
do
        NOVO=$(echo $ARQ | tr ' ' '_')
        if [ "$NOVO" != "$ARQ" ]
        then
                echo "$ARQ -> $NOVO"
                mv "$ARQ" "$NOVO"
        fi
done

sleep 2
# espera 2 segundos para proseguir o script

clear
#apaga a tela

echo ""
echo " Trabalho feito! Todos os arquivos foram renomeados."
echo "----------------------------------------------------"
