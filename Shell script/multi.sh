#!/bin/sh
# multi.sh - o script que desenha v�rias janelas
# Este script faz parte do http://aurelio.net/shell/dialog
#
# Exemplo de como desenhar v�rias caixas numa mesma tela,
# usando a op��o --and-widget para juntar as caixas e o op��o
# --begin para pocisionar as janelas.
#
#
#    Brincando de Posicionar Caixas
#    ------------------------------
#
# Usando a op��o --begin, definimos o posicionamento da
# caixa. Usando a op��o --and-widget, colocamos mais de uma
# caixa na tela. Usando essas duas op��es juntas, podemos
# mostrar v�rias janelas inteiras na tela sem sobreposi��o!
#
# Por exemplo, que tal dividir a tela em 4 partes iguais e
# colocar uma janela em cada uma dessas partes? Isso pode ser
# �til para mostrar ao usu�rio o "hist�rico" das telas que
# ele j� passou.
#
# O c�lculo de posicionamento � simples. O tamanho padr�o de
# tela do console � 80 colunas por 25 linhas. Para facilitar,
# consideremos o tamanho da tela de 80x24, para usarmos
# n�meros pares somente. A �ltima linha da tela n�o ser�
# usada.
#
# Se queremos 4 caixas, basta dividir tanto as colunas quanto
# as linhas por 2 e teremos quatro "peda�os" iguais na tela:
#
#        80/2 = 40
#        25/2 = 12
# 
# Com isso, sabemos que todas as janelas ter�o 12 linhas e 40
# colunas. Esses n�meros tamb�m definem as coordenadas de
# posicionameto:
#
#                               0        40        80 colunas
#      Coordenadas:            0+---------+---------+
#        ( x, y )               | 0,0     | 0,40    |     
#          0, 0                 |       #1|       #2|
#          0,40               12+---------+---------+
#         12, 0                 | 12,0    | 12,40   |
#         12,40                 |       #3|       #4|
#                             24+---------+---------+
#                               linhas
#     
#
# Obs.: O --no-shadow � usado para que a caixa n�o tenha
#       sombra.
#

dialog --no-shadow \
       --begin   0  0 --msgbox 'Janela #1 -- (0,0)  ' 12 40 --and-widget \
       --begin   0 40 --msgbox 'Janela #2 -- (0,40) ' 12 40 --and-widget \
       --begin  12  0 --msgbox 'Janela #3 -- (12,0) ' 12 40 --and-widget \
       --begin  12 40 --msgbox 'Janela #4 -- (12,40)' 12 40


# Fracionando mais as coordenadas, d� pra fazer muitas firulas.
# 100% in�til, mas � legal de ver &:)
#
dialog --no-shadow \
       --begin  0  0 --infobox DIALOG 6 20 --and-widget \
       --begin  0 40 --infobox DIALOG 6 20 --and-widget \
       --begin  6 20 --infobox DIALOG 6 20 --and-widget \
       --begin  6 60 --infobox DIALOG 6 20 --and-widget \
       --begin 12  0 --infobox DIALOG 6 20 --and-widget \
       --begin 12 40 --infobox DIALOG 6 20 --and-widget \
       --begin 18 20 --infobox DIALOG 6 20 --and-widget \
       --sleep 6 --begin 18 60 --infobox DIALOG 6 20
