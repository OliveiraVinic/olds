#!/bin/sh
# lsj.sh -- o script do "ls joiado"
# Este script faz parte do http://aurelio.net/shell/dialog

# Zerando as op��es
cor= ; ocultos= ; subdir= ; detalhes=

# Obtendo as configura��es que o usu�rio deseja
dialog --yesno 'Usar cores?'               0 0 && cor='--color=yes'
dialog --yesno 'Mostrar arquivos ocultos?' 0 0 &&  ocultos='-a'
dialog --yesno 'Incluir sub-diret�rios?'   0 0 &&   subdir='-R'
dialog --yesno 'Mostrar vis�o detalhada?'  0 0 && detalhes='-l'

# Mostrando os arquivos
ls $cor $ocultos $subdir $detalhes
