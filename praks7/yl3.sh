  GNU nano 7.2                                                    yl2.sh
#!/bin/bash

#väljastab kujundi milles on vastavalt sisestatud arvule ridu ja iga rida algab ja lopeb tarniga

echo "Sisesta ridade arv: "
read read
echo "Sisesta tarnide arv reas: "
read tarnid

for (( i=1; i<=$read; i++ )) #teeb ridade arvuga vordse arvu tsukleid labi
  do
    rida="$i. "
    for (( j=1; j<=$tarnid; j++ )) # teeb rea pikkusega vprdse arvu tsukleid labi
      do
        if [ $i -eq 1 ] || [ $i -eq $read ] || [ $j -eq 1 ] || [ $j -eq $tarnid ] #kui on esimene voi viimane rida voi kui on esimene voi viimane veerg reas
          then
            rida+="*"
          else
            rida+=" "
        fi
      done
    echo "$rida"
  done
