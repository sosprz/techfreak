---
title: Raspberry PI Zero konfiguracja WiFi
author: Przemek
type: post
date: 2016-03-04T20:14:15+00:00
url: /raspberry-pi-zero-konfiguracja-wifi/
featured_image: /wp-content/uploads/2016/03/techfreak-raspberry-pi-konfiguracja-wifi-2.jpg
dsq_thread_id:
  - 4634605507
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - Raspberry pi
  - wifi

---
Właśnie dziś dostałem Raspberry Pi Zero, najmniejszą dostępną wersje z mini komputerków z pod znaku malinki. Goła wersja przychodzi bez pinów, i bez kabelków. Jak więc skonfigurować malinkę aby po podłączeniu WiFi na USB automatycznie połączyła się ona do sieci?

<!--more-->

Już każdy wie że po w graniu obrazu na kartę SD trzeba rozszerzyć system plików na karcie co jest obowiązkowe. Jak by ktoś nie pamiętał to robi się to przez polecenie **raspi-conf** po zalogowaniu. Raspberry Pi Zero przechodzi także bez portu RJ45, więc nie ma jak go podłączyć do sieci LAN. Sprawa jest bardzo prosta ponieważ należy zaraz po wgraniu na kartę obrazu, zamontować ja na komputerze i edytować plik **etc/wpa\_supplicant/wpa\_supplicant.conf** który musi wyglądać jak poniżej.

<pre>nano /etc/wpa_supplicant/wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
ssid="your_ap"
psk="your_password"
}
</pre>

Po wpisaniu nazwy sieci (ssid) i hasła (psk) należy odmontować kartę i wsadzić do slotu Raspberry Pi Zero.

Aby zainstalować kartę WiFi użyłem przejściówki OTG za 5zł z [banggood][1].

<a href="//techfreak.pl/raspberry-pi-zero-konfiguracja-wifi/techfreak-raspberry-pi-konfiguracja-wifi-2/" rel="attachment wp-att-11352"><img class="aligncenter size-full wp-image-11352" src="//techfreak.pl/wp-content/uploads/2016/03/techfreak-raspberry-pi-konfiguracja-wifi-2.jpg" alt="techfreak-raspberry-pi-konfiguracja-wifi-2" width="1000" height="667" /></a>

<a href="//techfreak.pl/raspberry-pi-zero-konfiguracja-wifi/techfreak-raspberry-pi-konfiguracja-wifi-3/" rel="attachment wp-att-11353"><img class="aligncenter size-full wp-image-11353" src="//techfreak.pl/wp-content/uploads/2016/03/techfreak-raspberry-pi-konfiguracja-wifi-3.jpg" alt="techfreak-raspberry-pi-konfiguracja-wifi-3" width="1000" height="667" /></a>

 [1]: https://www.banggood.com/Original-JUWEI-Embedded-Micro-USB-V8-Male-to-USB-OTG-Adapter-Converter-p-1107547.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling