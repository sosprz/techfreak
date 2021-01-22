---
title: Update nexusa 5 do Androida 5 Loliipop
author: Przemek
type: post
date: 2014-11-14T19:04:27+00:00
url: /update-nexusa-5-androida-5-loliipop/
featured_image: /wp-content/uploads/2014/11/techfreak_nexus5_android5_lolypop_update_fastboot4-624x832.jpg
hits:
  - 243
dsq_thread_id:
  - 3225025594
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - Android
  - nexus
  - smartfon

---
Taki szybki wpis dla niecierpliwych którzy nie chcą czekać na OTA czyli, jak zrobić ręczny update nexusa 5 do Androida 5. Na stronie <a href="https://developers.google.com/android/nexus/images" target="_blank" rel="noopener">https://developers.google.com/android/nexus/images</a> pojawił się oficjalny image do pobrania więc do dzieła.

<!--more-->

Ściągamy plik hammerhead-lrx21o-factory-01315e08.tgz, rozpakowujemy i od razu odpalamy w edytorze plik flash-all aby zmienić linię

<pre>fastboot -w update image-hammerhead-lrx21o.zip</pre>

na

<pre>fastboot update image-hammerhead-lrx21o.zip</pre>

Po tej zmianie nie stracimy danych i aplikacji. Opcja -w w fastboot to &#8222;erase userdata and cache&#8221;. A całość ma wyglądać jak poniżej.

<a href="http://techfreak.pl/update-nexusa-5-androida-5-loliipop/techfreak_nexus5_android5_lolypop_update_fastboot2/" rel="attachment wp-att-8144"><img class="aligncenter size-full wp-image-8144" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nexus5_android5_lolypop_update_fastboot2.jpg" alt="techfreak_nexus5_android5_lolypop_update_fastboot2" width="810" height="460" /></a>

Podłączamy telefon do USB wchodziły w tryb fastboot (power on + VOL -) i odpalamy skrypt

<pre>flash-all.sh</pre>

I czekamy aż skończy się aktualizacja.

<a href="http://techfreak.pl/update-nexusa-5-androida-5-loliipop/techfreak_nexus5_android5_lolypop_update_fastboot4/" rel="attachment wp-att-8147"><img class="aligncenter wp-image-8147 size-large" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nexus5_android5_lolypop_update_fastboot4-768x1024.jpg" alt="techfreak_nexus5_android5_lolypop_update_fastboot4" width="640" height="853" /><img class="aligncenter size-full wp-image-8145" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nexus5_android5_lolypop_update_fastboot3.jpg" alt="techfreak_nexus5_android5_lolypop_update_fastboot3" width="494" height="687" /></a>

&nbsp;

Dokładny przebieg aktualizacji wygląda jak ponżej

<pre>./flash-all.sh 
sending 'bootloader' (2579 KB)...
OKAY [ 0.297s]
writing 'bootloader'...
OKAY [ 0.521s]
finished. total time: 0.818s
rebooting into bootloader...
OKAY [ 0.134s]
finished. total time: 0.134s
target reported max download size of 1073741824 bytes
sending 'radio' (45521 KB)...
OKAY [ 1.623s]
writing 'radio'...
OKAY [ 3.124s]
finished. total time: 4.748s
rebooting into bootloader...
OKAY [ 0.132s]
finished. total time: 0.132s
archive does not contain 'boot.sig'
archive does not contain 'recovery.sig'
archive does not contain 'system.sig'
--------------------------------------------
Bootloader Version...: HHZ12d
Baseband Version.....: M8974A-2.0.50.2.21
Serial Number........: 
--------------------------------------------
checking product...
OKAY [ 0.100s]
checking version-bootloader...
OKAY [ 0.100s]
checking version-baseband...
OKAY [ 0.100s]
sending 'boot' (8852 KB)...
OKAY [ 0.500s]
writing 'boot'...
OKAY [ 0.763s]
sending 'recovery' (9552 KB)...
OKAY [ 0.567s]
writing 'recovery'...
OKAY [ 0.795s]
erasing 'system'...
OKAY [ 1.046s]
sending 'system' (981596 KB)...
OKAY [ 31.505s]
writing 'system'...
OKAY [ 67.437s]
rebooting...</pre>

<pre>finished. total time: 103.448s</pre>

Jeśli nie masz fastboot musisz przeczytać <a href="http://techfreak.pl/nexus-4-update-android-4-4-kitkat/" target="_blank" rel="noopener">poprzedni wpis</a> w którym pisze co i jak.

Już po aktualizacji:

<a href="http://techfreak.pl/update-nexusa-5-androida-5-loliipop/techfreak_nexus5_android5_lolypop_update_fastboot6/" rel="attachment wp-att-8154"><img class="aligncenter wp-image-8154 size-large" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nexus5_android5_lolypop_update_fastboot6-576x1024.jpg" alt="techfreak_nexus5_android5_lolypop_update_fastboot6" width="576" height="1024" /></a>

&nbsp;

No to miłego odkrywania Androida 5 loliipop :)

&nbsp;