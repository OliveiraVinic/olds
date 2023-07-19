#!/bin/sh

# Elaborado por Vinicius A Oliveira

clear

# abre o arquivo de leitura desejado
RESP=$(kdialog --title "By Vinicius" --getopenfilename "Qual arquivo texto vc deseja visualizar?")
kdialog --title "Vinicius o Foda!!!!" --textbox $RESP 500 500

