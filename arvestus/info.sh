#!/bin/bash

#Nimi: Taavi Aru
#Skripti nimi: Info
#Skripti kirjeldus: skript tervitab sisselogitud kasutajat
#ning väljastab info aja ning kuupäeva kohta

#kasutaja info printimine
kasutaja=$USER
echo "Tere, $kasutaja!"

#prindib kuupäeva info ja kellaaja
date +"Täna on %d.%m.%Y kell %H:%M"


