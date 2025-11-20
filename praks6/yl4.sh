#!/bin/bash

#programm mis kontrollib kas kasutaja sisestatud number on algarv voi mitte

echo “Sisesta suvaline arv: “
read arv

if [ $arv -lt 0 ] # sisestatud arv on negatiivne
  then
    echo "Sisestatud arv on negatiivne, negatiivne arv ei ole algarv"

elif [ $arv -eq 0 ]
 then
    echo "Sisestasite arvu 0, mis ei ole algarv" #sisestati 0

elif [ $arv -eq 1 ] # sisestati 1
  then
    echo "Sisestasite arvu 1, mis ei ole algarv"

else
  for (( i=2; i<=$arv; i++ ))
   do
      #If () #kui jääk on 0 ja täisosa on 1 siis on algarv
      if [ $(( $arv % $i )) -eq 0 ] && [ $(( $arv / $i )) -ne 1 ] #kui jääk on 0 ja täisosa ei ole üks siis ei ole algarv
        then
          echo "Sisestatud arv ei ole algarv"
          break
      elif [ $arv -eq $i ] #sisestatud arv on algarv
        then
          echo "Sisestatud arv on algarv"
          break
      fi
    done
fi

