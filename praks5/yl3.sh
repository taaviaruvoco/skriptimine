#!/bin/bash

#programm tagastab vastavalt sisestatud kellaajale, mis päeva perioodiga tegemist

echo "Sisesta aja vaartus: "
read kell

if [ $kell -ge 6 ] && [ $kell -lt 12 ] #kui on hommikune periood
  then
    echo "Tere hommikust!"
elif [ $kell -ge 12 ] && [ $kell -lt 18 ] #kui on paevane periood
  then
    echo "Tere paevast!"
elif [ $kell -ge 18 ] && [ $kell -lt 22 ] #kui on ohtun periood
  then
    echo "Tere ohtust!"
elif [ $kell -ge 22 ] && [ $kell -lt 24 ] #kui on oine periood
  then
    echo "Head ood!"
else #sisestatud vaartus on vale
    echo "Sisestatud vaartus on vale"
fi

