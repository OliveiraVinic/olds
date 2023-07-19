#!/bin/bash
# script para chamar o executavel em fortran dados_exe
# este executavel serve para multiplicar as aberturas da rotina apall do IRAF

# funcao para remover os arquivos temporarios utilizados
apaga() {
 [ -e t.tmp ] && rm -r t.tmp
 [ -e ent.tmp ] && rm -r ent.tmp
 [ -e saida.tmp ] && rm -r saida.tmp
 [ -e nabert.tmp ] && rm -r nabert.tmp
 [ -e abert.tmp ] && rm -r abert.tmp
 [ -e passo.tmp ] && rm -r passo.tmp
 exit
}

# pede o nome do arquivo de entrada
# o loop impede um nome em branco
while [ -z $ent ]; do
 gdialog --title "Pre-extrair" --inputbox "Qual o nome do arquivo de entrada?" 40 50 2>ent.tmp
 para=$?
 ent=$(cat ent.tmp)
 if [ $para = '1' -o $para = '255' ]; then 
   apaga 
 fi
done 

# visualiza o arquivo de entrada sem travar o script, serve como base para proseguir
gdialog --title "Visualizando o arquivo de entrada: $ent" --textbox $ent 90 50 &

# pede o nome do arquivo de saida
# o loop impede um nome em branco
while [ -z $saida ]; do
 gdialog --title "Pre-extrair" --inputbox "Qual o nome do arquivo de saida?" 40 50 2>saida.tmp
 para=$?
 if [ $para = '1' -o $para = '255' ]; then 
   apaga 
 fi
 saida=$(cat saida.tmp)
done 

# pede a quantidade de aberturas
# o loop impede um nome em branco
while [ -z $nabert ]; do
 gdialog --title "Pre-extrair" --inputbox "Quantas aberturas?" 40 50 2>nabert.tmp
 para=$?
 if [ $para = '1' -o $para = '255' ]; then 
   apaga 
 fi
 nabert=$(cat nabert.tmp)
done 

# pede o valor da abertura, primeiro a coluna (que e fixa) e depois a linha (que o programa vai alterar)
# o loop impede um nome em branco
while [ -z $abert ]; do
 gdialog --title "Pre-extrair" --inputbox "Qual o valor da primeira abertura? (coluna espaco linha)" 40 50 2>abert.tmp
 para=$?
 if [ $para = '1' -o $para = '255' ]; then 
   apaga 
 fi
 abert=$(cat abert.tmp)
done 

# pede o tamanho do incremento dado em cada abertura
# o loop impede um nome em branco
while [ -z $passo ]; do
 gdialog --title "Pre-extrair" --inputbox "Qual o valor do passo?" 40 50 2>passo.tmp
 para=$?
 if [ $para = '1' -o $para = '255' ]; then 
   apaga 
 fi
 passo=$(cat passo.tmp)
done 

# roda o programa fortran de multiplicar as aberturas
./dados_exe

# visualizacao do arquivo de saida 
gdialog --title "Visualizando o arquivo de saida: $saida" --textbox $saida 90 50

# roda a funcao de apagar
apaga

