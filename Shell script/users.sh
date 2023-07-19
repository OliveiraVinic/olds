#!/bin/bash
# users.sh - Comp�e menus com os usu�rios do sistema
# Este script faz parte do http://aurelio.net/shell/dialog
#
# Exemplo de como construir menus din�micos, onde os itens
# s�o a sa�da de um comando. Nos exemplos, ser�o obtidos os
# dados do arquivo /etc/passwd, como login, UID e nome.
#
# S�o tr�s exemplos:
#
#   1) O mais simples. O comando retorna um login por linha.
#      Como cada entrada do menu precisa de dois campos, no
#      segundo campo foi colocado uma letra 'o', para ficar
#      esteticamente bonito. Poderia ser um ponto '.' ou
#      qualquer outro caractere ou texto. Outra alternativa
#      � repetir o login. Isso pode ser feito trocando o
#      comando sed para 's/.*/& &/'.
#
#   2) Aqui, o pr�prio comando j� retorna dois campos por
#      linha, no formato login:uid. Depois foi usado o tr
#      pra trocar os : por espa�os, separando os dados e
#      deixando pronto para usar no menu.
#
#   3) Similar ao segundo, s� que ao inv�s de pegar o 3o
#      campo do passwd (uid), foi pego o 5o, que � o nome
#      completo do usu�rio. O grande problema aqui � que
#      como o nome tem espa�os em branco, cada palavra �
#      encarada como um par�metro e bagun�a o menu. A
#      solu��o � colocar o nome entre \"aspas escapadas\"
#      e usar o 'eval' para executar o comando.
#
#      Para ficar bem claro o que est� acontecendo, troque
#      o 'eval' por um 'echo' para ver qual o comando final
#      que est� sendo executado. Aqui est� ele:
#
# dialog --menu "Dois campos por linha, 2o item com espa�os"
# 0 0 0 root "root" bin "bin" daemon "daemon" adm "adm"
# lp "lp" sync "sync" shutdown "shutdown" halt "halt"
# mail "mail" news "news" uucp "uucp" operator "operator"
# games "games" gopher "gopher" ftp "FTP User" ...
#
# 12 Agosto 2004 - Aur�lio Marinho Jargas

ARQUIVO=/etc/passwd

dialog --menu 'Lista normal de um campo por linha' \
	0 0 10 $(cat $ARQUIVO | cut -d: -f1 | sed 's/$/ o/')

dialog --menu 'Dois campos por linha, sem espa�os nos itens' \
	0 0 10 $(cat $ARQUIVO | cut -d: -f1,3 | tr : ' ')

eval \
dialog --menu \"Dois campos por linha, 2o item com espa�os\" \
	0 40 10 $(
		IFS=:
		while read login senha uid gid nome resto; do
			echo $login \"$nome\"
		done < $ARQUIVO
	)
