---
title: OpenWRT na Raspberry Pi
author: Przemek
type: post
date: 2013-06-22T21:10:32+00:00
url: /openwrt-na-raspberry-pi/
featured_image: /wp-content/uploads/2013/06/IMG_20130621_125802_1_642_362_force.jpg
hits:
  - 3727
dsq_thread_id:
  - 1423667774
categories:
  - Linux
  - Network
tags:
  - d-link
  - firewall
  - openwrt
  - Raspberry pi
  - router

---
Tyle ilu jest użytkowników Raspberry Pi tyle będzie pomysłów na zastosowanie tego maleństwa. Ja pomyślałem że muszę spróbować zainstalować OpenWRT na Raspberry Pi bo wraz ze stabilną wersją Attitude Adjustment, OpenWRT zaczęło je wspierać.

<!--more-->

Od razu wpadł mi do głowy pomysł Access Pointa, wygrzebałem wszystkie karty Wifi na USB ale niestety żadna nie jest wspierana przez OpenWRT. Ale przy poszukiwaniach znalazłem też kartę ethernet na USB, D-Link DUB-E100. Dwie karty ethernet w jednym urządzeniu to już co najmniej prosty router. I właśnie to będzie tematem poniższego opisu.

### Download and Install

Na początek ściągamy dedykowany pod Raspberry Pi obraz OpenWRT z oficjalnej strony <a href="http://downloads.openwrt.org/attitude_adjustment/12.09/brcm2708/generic/openwrt-brcm2708-sdcard-vfat-ext4_224.img" target="_blank">downloads.openwrt.org</a>. Gdy obraz już się ściągnie trzeba go nagrać na kartę SD ale wcześniej trzeba odmontować partycje które automatycznie zostały podmontowane.

<pre>root@sosprz:/home/sosprz/Pobrane#
umount /dev/mmcblkp1</pre>

<pre>root@sosprz:/home/sosprz/Pobrane# dd bs=4M if=/openwrt-brcm2708-sdcard-vfat-ext4_224.img of=/dev/mmcblk0
12+0 przeczytanych recordów
12+0 zapisanych recordów
skopiowane 50331648 bajtów (50 MB), 8,20802 s, 6,1 MB/s</pre>

### Uruchomienie OpenWRT na Rapsberry Pi

Tak wygląda system OpenWRT gdy uruchamia się na Rapsberry Pi. Generalnie szału nie ma :)

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/06/techfreak.pl_openwrt_raspberry_pi_1.jpg"><img class="aligncenter  wp-image-3766" title="Razpberry Pi z wgranym Openwrt" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak.pl_openwrt_raspberry_pi_1.jpg" alt="Raspberry Pi na OpenWRT" width="800" height="600" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/techfreak.pl_openwrt_raspberry_pi_1_1_1.jpg"><img class="aligncenter  wp-image-3767" title="OpenWRT na Raspberry Pi" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak.pl_openwrt_raspberry_pi_1_1_1.jpg" alt="OpenWRT na Raspberry Pi" width="800" height="600" /></a>
</p>

### Instalacja OpenWRT w mojej sieci

Dobra mamy OpenWRT na Raspberry Pi i teraz trzeba jakoś się dostać na stronę www lub ssh/telnet aby skonfigurować resztę. Aby to zrobić trzeba dostać się do domyślnego IP dla OpenWRT, 192.168.1.1. Ja zawsze robię jak poniżej, zatrzymuje network-managera i konfiguruje IP. Laptopa podłączam bezpośrednio pod Raspberry Pi, paczkordem.

Moim celem teraz jest podłączenie Raspbery Pi do mojego routera aby pozbyć się paczkorda z laptopa i przeprowadzić całą konfiguracje poprzez WiFi (mój router).

<pre>/etc/init.d/network-manager stop
<span style="line-height: 1.61538em;">ifconfig eth0 192.168.1.2 netmask 255.255.255.0
t</span>elnet 192.168.1.1</pre>

<pre>sosprz@sosprz:~$ sudo su -
 [sudo] password for sosprz:
 root@sosprz:~# /etc/init.d/network-manager stop
 Rather than invoking init scripts through /etc/init.d, use the service(8)
 utility, e.g. service network-manager stop
 Since the script you are attempting to invoke has been converted to an
 Upstart job, you may also use the stop(8) utility, e.g. stop network-manager
 network-manager stop/waiting
 root@sosprz:~# ifconfig eth0 192.168.1.2 netmask 255.255.255.0
 root@sosprz:~# telnet 192.168.1.1
 Trying 192.168.1.1...
 Connected to 192.168.1.1.
 Escape character is '^]'.
 === IMPORTANT ============================
 Use 'passwd' to set your login password
 this will disable telnet and enable SSH
 ------------------------------------------
 BusyBox v1.19.4 (2013-03-16 04:44:56 UTC) built-in shell (ash)
 Enter 'help' for a list of built-in commands.

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 ATTITUDE ADJUSTMENT (12.09, r36088)
 -----------------------------------------------------
 * 1/4 oz Vodka Pour all ingredients into mixing
 * 1/4 oz Gin tin with ice, strain into glass.
 * 1/4 oz Amaretto
 * 1/4 oz Triple sec
 * 1/4 oz Peach schnapps
 * 1/4 oz Sour mix
 * 1 splash Cranberry juice
 -----------------------------------------------------
 root@OpenWrt:/#</pre>

Ok połączyłem się i teraz muszę zmienić interfejs ze statycznego IP na DHCP. Zrobię to poprzez www będzie szybciej.

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133519.png"><img class="aligncenter  wp-image-3769" title="Logowanie do OpenWRT" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133519.png" alt="OpenWRT na Raspberry Pi" width="1360" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133540.png"><img class="aligncenter  wp-image-3770" title="Status OpenWRT" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133540.png" alt="OpenWRT na Raspberry Pi" width="1360" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133614.png"><img class="aligncenter  wp-image-3771" title="Interfaces OpenWRT" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133614.png" alt="OpenWRT na Raspberry Pi" width="1360" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133646.png"><img class="aligncenter  wp-image-3772" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133646.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:36:46" width="1360" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133653.png"><img class="aligncenter  wp-image-3773" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133653.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:36:53" width="1360" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133721.png"><img class="aligncenter  wp-image-3774" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-133721.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:37:21" width="1360" height="768" /></a>
</p>

Raspberry Pi zostało podłączone pod sieć domową i uzyskało adres IP. Jak można się powoli domyślać ten uzyskany adres IP z mojej sieci będzie adresem WAN.

### Instalacja D-Link DUB-E100

Podłączyłem DUB-E100 do Raspberry Pi. Mam dwa interfejsy sieciowe.

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/06/IMG_20130621_125703_1.jpg"><img class="aligncenter  wp-image-3788" title="D-link dub e100" src="http://techfreak.pl/wp-content/uploads/2013/06/IMG_20130621_125703_1.jpg" alt="OpenWRT na Raspberry Pi" width="800" height="600" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/IMG_20130621_125802_1.jpg"><img class="aligncenter  wp-image-3789" title="D-link dub e100" src="http://techfreak.pl/wp-content/uploads/2013/06/IMG_20130621_125802_1.jpg" alt="OpenWRT na Raspberry Pi" width="800" height="600" /></a>
</p>

Sprawdzamy w **status > kernel log** czy karta została wykryta

[<img class="aligncenter size-full wp-image-3790" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134435.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:44:35" width="1360" height="768" />][1]

<span style="line-height: 1.5em;">Karta jest ale to nie wszystko, trzeba zainstalować moduł </span><strong style="line-height: 1.5em;">kmod-usb-net-asix</strong> <span style="line-height: 1.5em;">aby uruchomić kartę w systemie.</span>

[<img class="aligncenter size-full wp-image-3791" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134458.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:44:58" width="1360" height="768" />][2] [<img class="aligncenter size-full wp-image-3792" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134559.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:45:59" width="1360" height="768" />][3] [<img class="aligncenter size-full wp-image-3793" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134653.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 13:46:53" width="1360" height="768" />][4]

Wszystko jest dobrze karta została wykryta i zarejestrowana w systemie pod** **interfejsem **eth1**

### Konfiguracja OpenWRT

W firewall settings przestawiamy interfejs (wbudowany Raspberry Pi) **LAN1** czyli **eth0** na **WAN. **

[<img class="aligncenter size-full wp-image-3797" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140546.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 14:05:46" width="1360" height="768" />][5]

Konfiguracja interfejsu **eth1** czyli USB D-link polega na ustawieniu adresacji dla sieci lokalnej np. 192.168.1.1/24 i ustawieniu w firewall settings na LAN.

[<img class="aligncenter size-full wp-image-3798" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140625.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 14:06:25" width="1360" height="768" />][6] [<img class="aligncenter size-full wp-image-3799" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140637.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 14:06:37" width="1360" height="768" />][7]

I to wszystko,  parę kliknięć zamienia Raspberry Pi w router. Podłączyłem lapka pod kartę D-link aby sprawdzić czy dostaje adres z DHCP i mam połączenie do internetu. Jak widać poniżej wszystko jest ok.<em id="__mceDel"> </em>

[<img class="aligncenter size-full wp-image-3800" src="http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140851.png" alt="Przechwycenie obrazu ekranu - 21.06.2013 - 14:08:51" width="1360" height="768" />][8]

### Podsumowanie

Szybko sprawnie i działa. Polecam przyjrzeć się bliżej wszystkim opcjom w OpenWRT, jest to naprawdę fajna alternatywa dla routerów w wielkimi możliwościami. Repozytorium jest naprawdę duże, można powiedzieć inspirujące. Parę lat temu na routerze z OpenWRT zaczynałem pomiary temperatur :)

Na koniec, mam nadzieje że wam też wszystko działa jeśli macie jakieś inne pomysły, czekam na komentarze.

 [1]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134435.png
 [2]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134458.png
 [3]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134559.png
 [4]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-134653.png
 [5]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140546.png
 [6]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140625.png
 [7]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140637.png
 [8]: http://techfreak.pl/wp-content/uploads/2013/06/Przechwycenie-obrazu-ekranu-21.06.2013-140851.png