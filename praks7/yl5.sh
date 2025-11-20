#!/bin/bash

#väljastab kujundi milles on vastavalt sisestatud arvule ridu ja iga reas sama arv tarne, ylejaanud sumbolid on 0id

echo "Sisesta ridade arv: "
read read

for (( i=1; i<=$read; i++ )) #teeb ridade arvuga vordse arvu tsukleid labi
  do
    rida="$i. "
    for (( j=1; j<=$read; j++ )) # teeb rea pikkusega vordse arvu tsukleid labi
      do
        if [ $(( $read - $i )) -lt $j ] #lisab vastavasse kohta tarni
          then
            rida+="*"
        else # lisab vastavasse kohta 'o' sumboli
          rida+="o"
        fi
      done
    echo "$rida"
  done
