---
title: Budujemy własny firmware OpenWRT
author: Przemek
type: post
date: 2011-01-14T06:13:58+00:00
url: /budujemy-wlasny-firmware-openwrt/
featured_image: /wp-content/uploads/2012/01/openwrt_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 315
dsq_thread_id:
  - 1024589646
categories:
  - Linux
  - Network
tags:
  - openwrt

---
Jak zbudować własny firmware dla OpenWRT ?

<!--more-->

Na początek ściągamy Image Buildera z openwrt.org. Gdy już mamy plik OpenWrt-ImageBuilder-brcm47xx-for-Linux-i686.tar.bz2, wypakowujemy go i wchodzimy do katalogu. Po wykonaniu polecenia &#8222;make info&#8221; dostaniemy listę: Current Target i Default Packages. Target w tym przypadku jest brcm47xx. A Default Packages to domyślnie instalowane pakiety. Oczywiście budując swój firmware odejmujemy lub dodajemy potrzebne paczki.  
Aby kompilować domyślny firmware wpisujemy:

<pre class="lang:default decode:true">make image</pre>

&nbsp;

Aby skompilować firmware z dodatkowymi paczkami:

<pre class="lang:default decode:true">make image PACKAGES="kmod-pcmcia-core kmod-pcmcia-yenta"</pre>

&nbsp;

Aby usunąć paczki z defaulta np: ppp ppp-mod-pppoe:

<pre class="lang:default decode:true">make image PACKAGES="-ppp -ppp-mod-pppoe"</pre>

&nbsp;

Aby dodać do swojego firmware pliki lub skrypty:

(Katalog files musimy stworzyć w katalogu po rozpakowaniu tara z openwrt.org)

<pre class="lang:default decode:true">make image FILES=files/</pre>

&nbsp;

Oczywiście wszystkie powyższe opcje można łączyć w jednej linii:

<pre class="lang:default decode:true">make image PACKAGES="kmod-pcmcia-core kmod-pcmcia-yenta -ppp -ppp-mod-pppoe" FILES=files/</pre>

&nbsp;