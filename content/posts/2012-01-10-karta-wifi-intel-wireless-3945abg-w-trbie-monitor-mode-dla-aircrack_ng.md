---
title: Karta wifi Intel wireless 3945ABG w trbie monitor mode dla aircrack_ng
author: Przemek
type: post
date: 2012-01-10T10:12:36+00:00
url: /karta-wifi-intel-wireless-3945abg-w-trbie-monitor-mode-dla-aircrack_ng/
bfa_virtual_template:
  - hierarchy
hits:
  - 292
dsq_thread_id:
  - 1025492181
categories:
  - Linux
tags:
  - wifi

---
## Jak uruchomić kartę wifi Intel wireless 3945ABG w trbie monitor mode?

<!--more-->

W całej akcji chodzi o to żeby ściągnąć najnowsze moduły kernela dla bez przewodowych urządzeń, nałożyć patche i zainstalować.

<pre class="lang:default decode:true">wget http://wireless.kernel.org/download/compat-wireless-2.6/compat-wireless-2011-05-24.tar.bz2
tar -jxf compat-wireless*
cd compat-wireless*
wget http://patches.aircrack-ng.org/mac80211.compat08082009.wl_frag+ack_v1.patch
patch -p1 &lt; mac80211.compat08082009.wl_frag+ack_v1.patch
wget http://patches.aircrack-ng.org/channel-negative-one-maxim.patch
patch ./net/wireless/chan.c channel-negative-one-maxim.patch
# Te dwa kroki można pominąć gdy sciągamy najnowszą wersje
# mcedit scripts/update-initramfs
# znajdz linie 13: KLIB=/lib/modules/2.6.31-wl/build
# zamień na: KLIB=/lib/modules/$(uname -r)/build
make
sudo make install
sudo make unload
sudo reboot</pre>

Następnie uruchamiamy kartę w tryb monitor mode:

<pre class="lang:default decode:true">airmon-ng start wlan0</pre>

Uruchamiamy airodump-ng aby zobaczyć jakie sieci mamy w zasięgu

<pre class="lang:default decode:true">airodump-ng mon0</pre>

Uruchamiamy airodump-ng na konkretnym kanale np: 11

<pre class="lang:default decode:true">airodump-ng -c 11,11 mon0</pre>

&nbsp;