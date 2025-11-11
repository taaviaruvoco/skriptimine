#!/bin/bash
# programm võtab programmi käivitamisega kaas antud parameetri (arvu)
#ning kontrollib kas see on paaris või paaritu

if [ $2 ]; then #kui sisestati rohkem kui üks parameeter
	echo "Sisestada tuli ainult uks parameeter. Proovige palun uuesti"
elif [ $# == 0 ]; then #kui ei sisestatud ühtki parameetrit
	echo "Sisestage programmiga koos kaasa ka parameeter (arv)"
else
	if [ $(($1 % 2)) == 0 ]; then #tegemist on paaris arvuga
		echo "Sisestatud arv $1 on paaris"
	else # kui arv on paaritu
		echo "Sisestatud arv $1 on paaritu"
	fi
fi
