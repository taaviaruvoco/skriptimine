#!/bin/bash

#väljastab kujundi milles on vastavalt sisestatud arvule ridu ja igas reas vastava arvu tarne

echo "Sisesta ridade arv: "
read read
echo "Sisesta tarnide arv reas: "
read tarnid

for (( i=1; i<=$read; i++ )) # teeb ridade arvuga vordse arvu tsukleid labi
  do
    rida="$i. "
    for (( j=1; j<=$tarnid; j++ )) #teeb tarnide arvuga vordse arvu tsukleid labi
      do
        rida+="*"
      done
    echo "$rida"
  done
