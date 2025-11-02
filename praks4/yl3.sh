#!/bin/bash
#programm võtab sisendiks, mitu inimest on grupis ning mitu inimest mahub ühe bussi peale
#ning väljastab mitu bussi saab täielikult täidetud ja mitu inimest sellisel juhul maha jääb

echo "Sisesta reisijate arv: "
read reisijad
echo "Sisesta istekohtade arv bussis: "
read kohad

bussideArv=`expr $reisijad / $kohad`
kaasa=`expr $bussideArv \* $kohad`
maha=`expr $reisijad - $kaasa`

echo "Täielikult on täidetud $bussideArv ja maha jääb $maha reisijat."
