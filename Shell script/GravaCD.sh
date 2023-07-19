#!/bin/sh

gdialog --title "Grava CD" --infobox "Criando imagem... \n aguarde, isto pode levar alguns minutos" 8 50
mkisofs -v -joliet-long  -o imagem.iso /home/vinic/CD

gdialog --title "Grava CD" --yesno "O CD eh regravavel? (ESC para sair)" 15 50
resposta=$?
case $resposta in
0) gdialog --title "Grava CD" --infobox "Apagando o CD... \n aguarde" 8 50; cdrecord -v blank=fast dev=/dev/scd0; gdialog --title "Grava CD" --infobox "Gravando..." 8 50; cdrecord -v -eject speed=4 -dao dev=/dev/scd0 imagem.iso ;;
1) gdialog --title "Grava CD" --infobox "Gravando..." 8 50; cdrecord -v -eject speed=4 -dao dev=/dev/cdwriter imagem.iso ;;
esac

