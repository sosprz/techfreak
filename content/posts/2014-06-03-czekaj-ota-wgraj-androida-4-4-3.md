---
title: Nie czekaj na OTA wgraj Androida 4.4.3
author: Przemek
type: post
date: 2014-06-03T18:25:51+00:00
url: /czekaj-ota-wgraj-androida-4-4-3/
featured_image: /wp-content/uploads/2013/04/P1050353_642_362_force.jpg
hits:
  - 642
dsq_thread_id:
  - 2733643581
categories:
  - Elektronika
tags:
  - Android
  - nexus
  - smartfon

---
Jest już dostępna aktualizacja Androida do 4.4.3 którą można pobrać ze strony <a href="https://developers.google.com/android/nexus/images#hammerheadktu84m" target="_blank">developers.google.com</a>. I chciałbym Ci pokazać jak wgrać aktualizacje nie tracąc żadnych danych i ustawień. Nie wiadomo kiedy będzie dostępna aktualizacja OTA więc poradnik może się przydać dla użytkowników serii NEXUS.

<!--more-->

### Android 4.4.3

Ja posiadam nexus 5 więc pobrałem <a href="https://dl.google.com/dl/android/aosp/hammerhead-ktu84m-factory-53ff95bf.tgz" target="_blank">TEN</a> plik.

### Pobierz Android SDK

<a href="http://developer.android.com/sdk/index.html#download" target="_blank">http://developer.android.com/sdk/index.html#download</a>

Ja pobrałem: adt-bundle-linux-x86, w katalogu adt-bundle-linux-x86-*/sdk/platform-tools znajduje się plik fastboot. Dzięki niemu będziemy mogli odblokować bootloader lub wgrać custom recovery do telefonu. Na teraz posłuży on do wgrania obrazów takich jak radio, bootloader i system. Jak odblokować bootloader pisałem już wcześniej <a href="http://techfreak.pl/jak-uzyskac-uprawnienia-root-dla-lg-nexus-4/" target="_blank">http://techfreak.pl/jak-uzyskac-uprawnienia-root-dla-lg-nexus-4/</a>

### Fastboot

Po rozpakowaniu SDK w lokalizacji adt-bundle-linux-x86-*/sdk/platform-tools/ znajduje sie plik fastboot. Najlepiej przejść do tego katalogu.

### Tryb bootloader

[<img class="aligncenter size-full wp-image-2858" src="http://techfreak.pl/wp-content/uploads/2013/04/P1050353_642_362_force.jpg" alt="P1050353_642_362_force" width="642" height="362" />][1]

Wyłącz telefon i włącz przyciskając Volume up + Volume down + Power, dzięki czemu przejdziesz do bootloader mode. Podłącz telefon i wydaj polecenie fastboot devices. Powinien wyświetlić ciąg cyfr a na końcu napis fastboot.

<pre>root@komp:~# fastboot devices
05172cd0002d08ce fastboot</pre>

###  Instalacja/Aktualizacja

Rozpakuj ściągnięty plik w moim przypadku hammerhead-ktu84m-factory-53ff95bf.tgz.  Szukamy pliku flash-all.sh w którym będą wpisy:

<pre>fastboot flash bootloader bootloader-hammerhead-hhz11k.img
fastboot reboot-bootloader
sleep 5
fastboot flash radio radio-hammerhead-m8974a-2.0.50.1.13.img
fastboot reboot-bootloader
sleep 5
fastboot -w update image-hammerhead-ktu84m.zip</pre>

W ostatnim wpisie usuwam -w,  inaczej stracę swoje dane. Odpalam plik flash-all.sh i po restarcie cieszę się nowym systemem.

 [1]: http://techfreak.pl/wp-content/uploads/2013/04/P1050353_642_362_force.jpg