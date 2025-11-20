#!/bin/bash

#väljastab kujundi milles on  viis rida ja igas reas in viis tärni

for (( i=1; i<=5; i++ ))
  do
    rida="$i. "
    for (( j=1; j<=5; j++ ))
      do
        rida+="*"
      done
    echo "$rida"
  done

