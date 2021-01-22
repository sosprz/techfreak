---
title: Raspberry PI Zero z WiFi na stałe!
author: Przemek
type: post
date: 2016-12-09T20:12:15+00:00
url: /raspberry-pi-zero-wifi-stale/
featured_image: /wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-55.jpg
dsq_thread_id:
  - 5368448750
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - debian
  - Raspberry pi
  - wifi

---
Czego brakuje w Raspberry Pi Zero do szczęścia? Wbudowanego modułu wifi!  
<!--more-->No może nie pokażę dziś jak wtopić w PCB Raspberry Pi Zero układ WiFi ale pokaże jak łatwo zainstalować go aby nie zajmował zbyt wiele miejsca. Jedyne co jest potrzebne do tego aby Raspberry miał WiFi to moduł WiFI!! Znaczy się taki jeden z najtańszych modułów jakie można kupić na alledrogo, dokładnie to ten ze znaczkiem 802.11n na czipsecie Ralink RT5370.

[<img class="aligncenter size-full wp-image-12466" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-50.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-50" width="1000" height="667" />][1] [<img class="aligncenter size-full wp-image-12467" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-51.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-51" width="1000" height="667" />][2]

Scena rozbierania modułu z obudowy USB została wycięta przez moderację! Była zbyt drastyczna.

[<img class="aligncenter size-full wp-image-12468" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-52.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-52" width="1000" height="667" />][3] [<img class="aligncenter size-full wp-image-12469" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-53.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-53" width="1000" height="667" />][4]

&nbsp;

Generalnie sprawa jest całkiem prosta trzeba się zapoznać z rozmieszczeniem padów na płytce raspberry Pi, z rozmieszczeniem wyjść USB i można lutować. Na zdjęciach poniżej schemat jest prosty, czerwony przewód to +5V, żółty +data, zielony -data, czarny GND. Cały pic polega na tym, że jak wkładam wtyczkę micro USB to zwierają się dwa pady w gnieździe na GND uruchamiając podłączony układ. Jeśli nic nie wkładam to nie ma co się zewrzeć i trzeba zrobić to samemu na PCB robiąc to jak ja czarnym przewodem.

[<img class="aligncenter size-full wp-image-12470" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-54.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-54" width="1000" height="667" />][5] [<img class="aligncenter size-full wp-image-12471" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-55.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-55" width="1000" height="667" />][6] [<img class="aligncenter size-full wp-image-12472" src="http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-56.jpg" alt="techfreakpl-raspberry-pi-zero-z-wifi-56" width="1000" height="667" />][7]

&nbsp;

Układ RT5370 nie wymaga instalowania żadnych sterowników na systemie a przedstawia się jak poniżej:

<pre>root@raspberrypi:/var/www/nettemp# lsusb
Bus 001 Device 002: ID 148f:5370 Ralink Technology, Corp. RT5370 Wireless Adapter
</pre>

I tak naprawdę tyle! Jak by ktoś nie pamiętał jak się konfiguruje WiFi edytując pliki na karcie SD to przypominam:

Plik /etc/wpa\_supplicant/wpa\_supplicant.conf musi wyglądać jak poniżej:

<pre>ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
ssid="your_ap"
psk="your_password"
}</pre>

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-50.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-51.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-52.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-53.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-54.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-55.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2016/12/techfreakpl-raspberry-pi-zero-z-wifi-56.jpg