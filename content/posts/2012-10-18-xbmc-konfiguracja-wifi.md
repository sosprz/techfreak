---
title: xbmc konfiguracja wifi
author: Przemek
type: post
date: 2012-10-18T09:43:44+00:00
url: /xbmc-konfiguracja-wifi/
bfa_virtual_template:
  - hierarchy
hits:
  - 824
dsq_thread_id:
  - 1017044601
categories:
  - Linux
tags:
  - wifi
  - xbmc

---
Jak skonfigurować WiFi na XBMC ?

<!--more-->

Konfiguracja polega na edycji i konfiguracji interfejsu wlan0 i wpa_supplicant:

zmienne:  
moje-wifi = nazwa sieci wifi (SSID)  
tajne-hasło = hasło do sieci wifi

nano /etc/network/interfaces

<pre class="lang:default highlight:0 decode:true">auto lo
iface lo inet loopback
auto wlan0
iface wlan0 inet dhcp
wireless-essid moje-wifi
pre-up wpa_supplicant -B -iwlan0 -c/etc/wpa_supplicant.conf</pre>

nano /etc/wpa_supplicant.conf

<pre class="lang:default highlight:0 decode:true">ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=root
network={
ssid="moje-wifi"
key_mgmt=WPA-PSK
psk="tajne-hasło"
}</pre>

Przeładuj sieć:

<pre class="lang:default highlight:0 decode:true">/etc/init.d/networking restart</pre>

&nbsp;

&nbsp;