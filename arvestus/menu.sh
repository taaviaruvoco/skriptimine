#!/bin/bash

#Nimi: Taavi Aru
#Skripti kirjeldus: Väljastab kasutajale menüü. Kasutaja valib menüüst endale toidu,
#mille peale tagastatakse talle kommentaar selle toidu kohta

#prinditakse menüü valik
echo "1) liha ja kartulid"
echo "2) kala ja krõpsud"
echo "3) supp ja salat"

#küsitakse kasutajalt tema valik mis salvestatakse muutujasse
echo ""
echo "Tee oma valik (1 või 2 või 3): "
read tulemus #kasutaja poolt sisestatud valik

#võrreldakse kasutaja poolt sisestatud arvu ning väljastatakse sellele
#vastav tekst ning kui arv on vale siis sellest teavitatakse
if [ $tulemus -eq 1 ]; then #valik 1
  echo "Väga maitsev, aga jälgi oma tervist!"
  echo "Head isu!"
elif [ $tulemus -eq 2 ]; then #valik 2
  echo "Brititoit on maitsev!"
  echo "Head isu!"
elif [ $tulemus -eq 3 ]; then #valik 3
  echo "Nii tervislik ja igav..."
  echo "Head isu!"
else #kui sisestati vale arv
  echo "Antud valikut ei ole menüüs."
fi
