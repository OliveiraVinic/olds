#!/bin/bash

# Elaborado por Vinicius A Oliveira
# serve para copiar os arquivos recebidos dos alunos para os respectivos diretórios
# formato: ano.mes.dia-disciplina-nome.pdf

# define os diretorios
curso1=/home/profvinic/Dropbox/Aulas/2017-1/exercicios.semanais/FIII-extra
curso2=/home/profvinic/Dropbox/Aulas/2017-1/exercicios.semanais/FIII-geof

# bloco principal
echo ""
echo "Copiando os arquivos:"
echo ""
ls ./* | while read arquivo
do
	case $arquivo in
		*geol*|*Geol*|*GEOL*|*extra*|*EXTRA*|*Extra*)
			mv "$arquivo" "$curso1"
			echo -ne "-" 
			sleep 1;;
		*geof*|*Geof*|*GEOF*)
			mv "$arquivo" "$curso2"
			echo -ne "-" 
			sleep 1;;
	esac
done

echo ""
echo " Todos os arquivos foram copiados."
echo ""
