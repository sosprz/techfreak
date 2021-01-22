---
title: Raspberry pi, raspbmc konfiguracja WiFi
author: Przemek
type: post
date: 2012-10-01T13:02:11+00:00
url: /raspberry-pi-raspbmc-konfiguracja-wifi/
featured_image: /wp-content/uploads/2012/10/Raspberry-Pi.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 4137
dsq_thread_id:
  - 1015601334
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - Raspberry pi
  - ubuntu
  - wifi
  - xbmc

---
Raspberry Pi to fajny i tani mini komputerek który w połączeniu z projektem <a title="raspbmc" href="http://www.raspbmc.com/" target="_blank" rel="noopener">raspbmc</a> tworzy niezłe centrum multimedialne.

<!--more-->

Aby skonfigurować kartę WiFi na USB trzeba edytować pliki w których podajemy parametry takie jak:

Nazwa access pointa: ssid

Klucz prywatny: psk

Nazwa interfejsu: wlan0

**Konfiguracja wpa_summplicant:**

nano /etc/wpa\_supplicant/wpa\_supplicant.conf:

<pre class="lang:default highlight:0 decode:true">ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=0
update_config=1

network={
ssid="your_ap"
psk="your_password"
key_mgmt=WPA-PSK
}</pre>

**Konfiguracja interfejsu :**

nano /etc/network/interfaces

<pre class="lang:default highlight:0 decode:true">auto wlan0
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf</pre>

**Manualne uruchomienie:**

<pre class="lang:default highlight:0 decode:true">mkdir -p /var/run/network
ifup wlan0</pre>

lub

<pre class="lang:default highlight:0 decode:true">/etc/init.d/networking restart</pre>

**Automatyczne uruchomienie:**

nano /etc/init.d/wifi.sh

<pre class="lang:default highlight:0 decode:true">#!/bin/bash
mkdir /var/network
sudo ifdown wlan0
sudo ifup wlan0</pre>

**Dodanie do autostartu:**

<pre class="lang:default highlight:0 decode:true">chmod +x /etc/init.d/wifi.sh
update-rc.d wifi.sh defaults 100</pre>

&nbsp;

&nbsp;

&nbsp;