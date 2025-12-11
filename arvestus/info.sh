#!/bin/bash

#Nimi: Taavi Aru
#Skripti kirjeldus: skript tervitab sisselogitud kasutajat
#ning väljastab aja ning kuupäeva

#kasutaja info printimine
kasutaja=$USER
echo "Tere, $kasutaja!"

#prindib kuupäeva info ja kellaaja
date +"Täna on %d.%m.%Y kell %H:%M"


