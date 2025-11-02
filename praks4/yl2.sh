#!/bin/bash
#programm küsib sisendiks tordi suuruse (laius ja pikkus), tordi kihtide arvu,
#ühe küpsise suuruse (külje pikkus) ja mitu küpsist ühes pakis on
#ning arvutab selle põhjal mitu küpsise pakki kulub sellise tordi valmistamiseks

echo "Sisesta tordi külgede pikkused (cm) kujul 'pikkus laius': "
read pikkus laius
echo "Sisesta tordi kihtide arv: "
read kihid
echo "Sisesta ühe küpsise külje pikkus (cm): "
read kypsis
echo "Sisesta küpsiste arv, mis on ühes küpsise pakis: "
read pakk

yksKiht=`expr $pikkus \* $laius`
koguPind=`expr $kihid \* $yksKiht`

yksKypsis=`expr $kypsis \* $kypsis`
kypsisteArv=$(echo "scale=1; $koguPind / $yksKypsis" | bc)
pakkideArv=$(echo "scale=1; $kypsisteArv / $pakk" | bc)

#pakkideArv=`expr (expr (expr (expr $pikkus\*$laius)\*$kihid)/(expr $kypsis\*$kypsis))/$pakk`
echo "Sellise tordi valmistamiseks tuleb poest osta $pakkideArv küpsisepakki."
