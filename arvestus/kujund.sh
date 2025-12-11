#!/bin/bash

#Nimi: Taavi Aru
#Skripti ülesanne: väljastab kujundi milles on sisestatud arv ridu
#ning milles esimeses reas on sisestatud arv tärne ning igas järgnevas
#reas on üks tärn vähem

echo "Sisesta ridade arv: "
read read
lugeja=$read

for (( i=1; i<=$read; i++ )) #teeb ridade arvuga võrdse arvu tsükleid läbi
  do
    rida=""
    for (( j=$read; j>=$i; j-- )) # teeb rea pikkusega võrdse arvu tsükleid läbi
      do
        rida+="*"
      done
    echo "$rida" #prindib loodud tärnide rea
  done
