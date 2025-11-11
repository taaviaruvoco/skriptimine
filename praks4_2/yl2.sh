#!/bin/bash
#programm võtab sisendiks, mitu inimest on grupis ning mitu inimest mahub ühe bussi peale
#ning väljastab mitu bussi saab täielikult täidetud ja mitu inimest sellisel juhul maha jääb

#küsime reisijate arvu
echo "Sisesta reisijate arv: "
read reisijad

#küsime kui palju on istekohti ühes bussis
echo "Sisesta istekohtade arv bussis: "
read kohad

#arvutame mitu bussi on reisijatega täielikult täidetud
bussideArv=`expr $reisijad / $kohad`


if [ $(( $reisijad % $kohad )) == 0 ]; then #kui kõik bussid said täpselt täidetud
	echo "Kokku on vaja tellida $bussideArv bussi"
else #kui kõik bussid ei saanud täpselt täidetud
	echo "Kokku on vaja tellida $(($bussideArv + 1)) bussi"
fi
