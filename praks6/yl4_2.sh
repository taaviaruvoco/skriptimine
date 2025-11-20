#!/bin/bash

#programm väljastab info esimese 20 numbri kohta, et kas need on aalgarvud või mitte

indeks1=1
for (( i=1; i<=20; i++ ))
  do
    if [ $indeks1 -eq 1 ] #arv on 1
    then
      echo "Arv 1 ei ole algarv"
      indeks1=$(( $indeks1 + 1 ))
      continue
    fi
    indeks2=1
    for (( j=1; j<=i; j++))
      do
        #echo "i on $i ja j on $j"
        if [ $indeks2 -eq 1 ] #kui  toimuks yhega jagamine
          then
            indeks2=$(( $indeks2 + 1 ))
            continue
        fi

        if [ $(( $indeks1 % $indeks2 )) -eq 0 ] && [ $(( $indeks1 / $indeks2 )) -ne 1 ] #arv ei ole algarv
          then
            echo “Arv $indeks1 ei ole algarv”
            break
        elif [ $(( $indeks1 % $indeks2 )) -eq 0 ] && [ $(( $indeks1 / $indeks2 )) -eq 1 ] # arv on algarv
          then
            echo “Arv $indeks1 on algarv”
            break
        fi
        indeks2=$(( $indeks2 + 1 ))
    done
    indeks1=$(( $indeks1 + 1 ))
  done
