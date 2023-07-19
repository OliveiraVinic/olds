#!/bin/sh
# duas.sh - o script que pede confirma��o
# Este script faz parte do http://aurelio.net/shell/dialog
#
# Exemplo de como fazer caixas sobrepostas, onde a nova caixa
# aparece sobre a primeira, t�pico de avisos como:
#
#    "Voc� tem certeza?"
#
# O fonte do pr�prio script � usado como a "licen�a", mas na
# vida real, basta trocar o $0 por um arquivo como o COPYING
#

dialog --title 'LICEN�A do Software' --textbox $0 16 65 \
       --and-widget \
       --yesno '\nVoc� aceita os Termos da Licen�a?' 8 30 
