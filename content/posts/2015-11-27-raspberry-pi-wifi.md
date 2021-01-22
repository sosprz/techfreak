---
title: Raspberry Pi + WiFi
author: Przemek
type: post
date: 2015-11-27T18:49:54+00:00
url: /raspberry-pi-wifi/
featured_image: /wp-content/uploads/2015/11/techfreak-raspberry-konfiguracja-wifi-624x468.jpg
hits:
  - 399
dsq_thread_id:
  - 4356023715
categories:
  - Linux
tags:
  - debian
  - nettemp
  - Raspberry pi
  - wifi

---
Pisałem już parę razy jak skonfigurować kartę WiFi na USB pod Raspberry PI i tym razem napisze jak to się robi na Raspbianie. Na najnowszych obrazach jest to całkiem proste i robi się to w jednym pliku.

<!--more-->

Wszystko co trzeba zrobić po zainstalowaniu obrazu Raspbian na karcie SD to edytować jeden plik, ale od początku.

### Instalacja na karcie SD

Aby pobrać obraz przejdź na stronę  <a href="https://www.raspberrypi.org/downloads/raspbian/" target="_blank">raspberry</a>.

<pre>dd bs=4M if=2015-11-21-raspbian-jessie-lite.img of=/dev/mmcblk</pre>

### Pierwsze uruchomienie systemu

Po zalogowaniu się do systemy po SSH jeszcz przez sieć LAN. Trzeba uruchomić polecenie raspi-conf w celu rozszerzenia partycji na karcie SD. Jest to obowiązkowy krok po instalacji obrazu. W menu raspi-conf trzeba wybrac pierwsza opcję **1. Expand Filesystem** kliknąć **OK, Finish** i zgodzić się na restart systemu. Po restarcie i podłączeniu karty WiFi na USB pojawi się taki interfejs jak wlan0. Można to siprawdzic poleceniem **ifconfig**.

### Podłączenie do sieci WiFi

Aby podłączyć się do sieci bezprzewodowej należy edytować plik /etc/wpa\_supplicant/wpa\_supplicant.conf

<pre>nano /etc/wpa_supplicant/wpa_supplicant.conf</pre>

W którym to zastaniemy dwie linie

<pre>ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1</pre>

Należy dopisać poniżej cztery poniższe:

<pre>network={
ssid="your_ap"
psk="your_password"
}</pre>

Tak aby plik wyglądał jak niżej:

<pre>ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
ssid="your_ap"
psk="your_password"
}</pre>

Po restarcie, poleceniem **reboot** Raspberry Pi powinno połączyć się z twoją siecią bezprzewodową. Sprawdź na routerze w zakładce DHCP Clients jaki IP dostało tworze urządzenie. Nazwa jeśli nie została zmieniona to raspberrypi.