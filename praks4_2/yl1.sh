#!/bin/bash
#programm küsib kasutajalt arvu ning väljastab teatise
#et kas sisestatud arv on paaris või paaritu arv

#kasutajalt küsitakse arv
echo -n "Sisesta suvaline arv: "
read arv

if [ $(( $arv %2 )) = 0 ]; then #kui on paaris
	echo "Arv $arv on paaris"
else #kui arv on paaritu
	echo "Arv $arv on paaritu"
fi
