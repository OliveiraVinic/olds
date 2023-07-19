#!/bin/sh

teste=$(dialog --title "Escolha de video" --stdout --fselect /home/vinic/videos/ 0 0 )

mplayer $teste

