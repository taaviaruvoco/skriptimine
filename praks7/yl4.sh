#!/bin/bash

#väljastab kujundi milles on vastavalt sisestatud arvule ridu ja iga reas sama arv tarne

echo "Sisesta ridade arv: "
read read

for (( i=1; i<=$read; i++ )) #teeb ridade arvuga vordse arvu tsukleid labi
  do
    rida="$i. "
    for (( j=1; j<=$i; j++ )) # teeb rea pikkusega vordse arvu tsukleid labi
      do
        rida+="*"
      done
    echo "$rida"
  done
