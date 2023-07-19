#!/bin/bash

# Elaborado por Vinicius A Oliveira

# usa o kdialog para escolher a playlist a ser tocada
LISTA=$(kdialog --getopenfilename . "*.m3u | Playlist ")

# toca a playlist selecionada com o mplayer
mplayer -playlist $LISTA

