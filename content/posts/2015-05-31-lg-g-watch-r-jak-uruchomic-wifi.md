---
title: Lg G watch R jak uruchomić WiFi
author: Przemek
type: post
date: 2015-05-31T19:43:23+00:00
url: /lg-g-watch-r-jak-uruchomic-wifi/
featured_image: /wp-content/uploads/2015/05/4_techfreak_lg_g_watch_r_wifi-624x416.jpg
hits:
  - 303
xyz_fbap:
  - 1
dsq_thread_id:
  - 3810023358
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - lg g watch r
  - smartwatch

---
Ostatni update do <a href="http://techfreak.pl/lg-g-watch-r-android-5-1-1-ota/" target="_blank" rel="noopener">Android Wear 5.1.1</a> nie przyniósł obsługi WiFi w LG g watch R. Jednak nie trzeba było długo czekać, aż XDA się weźmie za tą sprawę i uruchomi obsługę bezprzewodowych sieci na zegarku. Poniżej pokażę jak łatwo uruchomiłem WiFi na swoim GWR.

<!--more-->

Generalnie zachęcam do poczytania mojego ostatniego wpisu na <a href="http://techfreak.pl/lg-g-watch-r-hack-mods/" target="_blank" rel="noopener">temat LG G watch R</a> i wątków na XDA. Zaczynając od zmodyfikowanego <a href="http://forum.xda-developers.com/g-watch-r/orig-development/kernel-intersectravens-kernel-t2957728" target="_blank" rel="noopener">kernela</a> który zawiera wiele poprawek dotyczących zarządzaniem baterią. Zmodyfikowanego <a href="http://forum.xda-developers.com/g-watch-r/orig-development/recovery-twrp-2-8-4-0-touch-recovery-t3001890" target="_blank" rel="noopener">recovery</a> które ułatwia i posiada wiele przydatnych funkcji a kończąc na modyfikacji która włącza <a href="http://forum.xda-developers.com/g-watch-r/orig-development/mod-enable-wifi-ldz22d-t3122529" target="_blank" rel="noopener">WiFi</a> na zegarku.

####  boot, recovery, wifi

Na pewno już wiesz co to fastboot, adb i masz to na swoim komputerze. Do tej operacji jest potrzebny odblokowany bootloader. Pisałem o tym wyżej.

#### Recovery TWRP

Pobierz recovery <a href="https://dl.twrp.me/lenok/twrp-2.8.6.0-lenok.img fastboot flash recovery twrp.img" target="_blank" rel="noopener">TWRP</a> i wgraj je poprzez fastboot, aby wejsc do fastboot obejrzyj filmik a YT lub przy uruchamianiu przejedz palcem po tarczy.

<pre>fastboot flash recovery twrp.img</pre>

#### Boot

Pobierz i wgraj zmodyfikowany <a href="http://intersectraven.euroskank.com/kernels/G%20Watch%20R/3.10.0/20150531_18XX/" target="_blank" rel="noopener">kernel.</a>

<pre>fastboot flash boot single.boot.img</pre>

#### Wifi mod

Pobierz najnowsze adb w wersji 1.0.32 i <a href="http://forum.xda-developers.com/g-watch-r/orig-development/mod-enable-wifi-ldz22d-t3122529" target="_blank" rel="noopener">wifi-mod</a>. Wejdź do recovery i wgraj mod poprzez adb sideload.

<a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/1_techfreak_lg_g_watch_r_wifi/" rel="attachment wp-att-9629"><img class="aligncenter size-full wp-image-9629" src="http://techfreak.pl/wp-content/uploads/2015/05/1_techfreak_lg_g_watch_r_wifi.jpg" alt="1_techfreak_lg_g_watch_r_wifi" width="1000" height="667" /></a> <a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/2_techfreak_lg_g_watch_r_wifi/" rel="attachment wp-att-9630"><img class="aligncenter size-full wp-image-9630" src="http://techfreak.pl/wp-content/uploads/2015/05/2_techfreak_lg_g_watch_r_wifi.jpg" alt="2_techfreak_lg_g_watch_r_wifi" width="1000" height="667" /></a>

Kliknij sideload na segarku a na komputerze:

<pre>adb sideload lenok_wifi_zip-02.zip</pre>

#### <a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/3_techfreak_lg_g_watch_r_wifi/" rel="attachment wp-att-9631"><img class="aligncenter size-full wp-image-9631" src="http://techfreak.pl/wp-content/uploads/2015/05/3_techfreak_lg_g_watch_r_wifi.jpg" alt="3_techfreak_lg_g_watch_r_wifi" width="1000" height="667" /></a>  
Działa

<a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/4_techfreak_lg_g_watch_r_wifi/" rel="attachment wp-att-9632"><img class="aligncenter size-full wp-image-9632" src="http://techfreak.pl/wp-content/uploads/2015/05/4_techfreak_lg_g_watch_r_wifi.jpg" alt="4_techfreak_lg_g_watch_r_wifi" width="1000" height="667" /></a> <a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/5_techfreak_lg_g_watch_r_wifi/" rel="attachment wp-att-9633"><img class="aligncenter size-full wp-image-9633" src="http://techfreak.pl/wp-content/uploads/2015/05/5_techfreak_lg_g_watch_r_wifi.jpg" alt="5_techfreak_lg_g_watch_r_wifi" width="1000" height="667" /></a> <a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/6_techfreak_lg_g_watch_r_wifi/" rel="attachment wp-att-9634"><img class="aligncenter size-full wp-image-9634" src="http://techfreak.pl/wp-content/uploads/2015/05/6_techfreak_lg_g_watch_r_wifi.jpg" alt="6_techfreak_lg_g_watch_r_wifi" width="1000" height="667" /></a>

Wifi działa, jeśli chce połączyć się do jakiejś sieci na telefonie trzeba wpisać hasło.

<a href="http://techfreak.pl/lg-g-watch-r-jak-uruchomic-wifi/lg_g_wtach_r_wifi/" rel="attachment wp-att-9639"><img class="aligncenter wp-image-9639 size-medium" src="http://techfreak.pl/wp-content/uploads/2015/05/lg_g_wtach_r_wifi.jpg" alt="lg_g_wtach_r_wifi" width="169" height="300" /></a>Samo WiFi można też wyłączyć. Ciekawe jak to się przyda w praktyce i jakie będzie zużycie baterii.

&nbsp;
