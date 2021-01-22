---
title: Nexus 4 update do Android 4.4 KitKat
author: Przemek
type: post
date: 2013-11-21T17:56:13+00:00
url: /nexus-4-update-android-4-4-kitkat/
featured_image: /wp-content/uploads/2013/11/android_4.4_kitkat_update.jpg
hits:
  - 358
dsq_thread_id:
  - 1986453295
categories:
  - Elektronika
tags:
  - Android
  - nexus
  - smartfon

---
Jeśli ktoś chciałby zaktualizaować swojego nexusa 4 do Androida 4.4 KitKat. A nie chce czekać na OTA tak jak ja, to zapraszam do przeczytania poniższego tekstu. <span style="color: #ff0000;"><strong>TA PROCEDURA ZRESETUJE TWOJE USTAWIENIA APALIKACJI</strong></span>

<!--more-->

#### Pobierz Android SDK

<http://developer.android.com/sdk/index.html#download>

Ja pobrałem: <a href="http://dl.google.com/android/adt/adt-bundle-linux-x86-20131030.zip" target="_blank">adt-bundle-linux-x86</a>, w katalogu adt-bundle-linux-x86-*/sdk/platform-tools znajduje się plik fastboot. Dzięki niemu będziemy mogli odblokować bootloader lub wgrać custom recovery do telefonu. Na teraz posłuż on do wgrania obrazów takich jak radio, bootloader i system.

#### Pobierz KitKat&#8217;a

Pobierz obraz z oficjalnej strony <a href="https://developers.google.com/android/nexus/images#occamkrt16s" target="_blank">https://developers.google.com/android/nexus/images#occamkrt16s</a>. Rozpakuj plik. W katalogu **occam-krt16s** zobaczysz takie katalogi i pliki:

[<img class="aligncenter size-full wp-image-5373" alt="android_4.4_kitkat_update" src="http://techfreak.pl/wp-content/uploads/2013/11/android_4.4_kitkat_update.jpg" width="445" height="207" />][1]

#### Tryb fastboot mode

Uruchamiamy telefon włączając tryb fastboot mode przyciskami „vol -” i „Power”.

[<img class="aligncenter size-full wp-image-2858" alt="P1050353_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/04/P1050353_642_362_force.jpg" width="642" height="362" />][2]

#### Podłącz telefon pod USB

Wejdz do katalogu i odpal **./flash-all.sh** lub **flash-all.bat**

<pre>root@sosprz:/home/sosprz/Pobrane/occam-krt16s# ./flash-all.sh 
sending 'bootloader' (2203 KB)...
OKAY [ 0.073s]
writing 'bootloader'...
OKAY [ 0.339s]
finished. total time: 0.412s
rebooting into bootloader...
OKAY [ 0.001s]
finished. total time: 0.001s
sending 'radio' (45537 KB)...
OKAY [ 1.446s]
writing 'radio'...
OKAY [ 2.610s]
finished. total time: 4.056s
rebooting into bootloader...
OKAY [ 0.001s]
finished. total time: 0.001s
archive does not contain 'boot.sig'
archive does not contain 'recovery.sig'
archive does not contain 'system.sig'
--------------------------------------------
Bootloader Version...: MAKOZ30d
Baseband Version.....: M9615A-CEFWMAZM-2.0.1700.97
Serial Number........: xxxxx
--------------------------------------------
checking product...
OKAY [ 0.002s]
checking version-bootloader...
OKAY [ 0.002s]
checking version-baseband...
OKAY [ 0.002s]
sending 'boot' (6360 KB)...
OKAY [ 0.206s]
writing 'boot'...
OKAY [ 0.369s]
sending 'recovery' (6908 KB)...
OKAY [ 0.237s]
writing 'recovery'...
OKAY [ 0.418s]
erasing 'system'...
OKAY [ 0.912s]
sending 'system' (700496 KB)...
OKAY [ 22.180s]
writing 'system'...
^_^_OKAY [ 42.839s]
erasing 'userdata'...
OKAY [ 10.597s]
formatting 'userdata' partition...
Creating filesystem with parameters:
 Size: 14129561600
 Block size: 4096
 Blocks per group: 32768
 Inodes per group: 8144
 Inode size: 256
 Journal blocks: 32768
 Label: 
 Blocks: 3449600
 Block groups: 106
 Reserved block group size: 847
Created filesystem with 11/863264 inodes and 95427/3449600 blocks
sending 'userdata' (137438 KB)...
writing 'userdata'...
OKAY [ 12.925s]
erasing 'cache'...
OKAY [ 0.078s]
formatting 'cache' partition...
Creating filesystem with parameters:
 Size: 587202560
 Block size: 4096
 Blocks per group: 32768
 Inodes per group: 7168
 Inode size: 256
 Journal blocks: 2240
 Label: 
 Blocks: 143360
 Block groups: 5
 Reserved block group size: 39
Created filesystem with 11/35840 inodes and 4616/143360 blocks
sending 'cache' (10984 KB)...
writing 'cache'...
OKAY [ 1.044s]
rebooting...</pre>

I tak oto cieszymy się nowym systemem KitKat 4.4. Oczywiście jak ktoś nie chce tracić danych może czekać na OTA. Aplikacje i tak same się dociągną a ustawień nie mam zbyt dużo do wklepywania :)

 [1]: http://techfreak.pl/wp-content/uploads/2013/11/android_4.4_kitkat_update.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/04/P1050353_642_362_force.jpg