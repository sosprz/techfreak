---
title: LG G watch R Android 5.1.1 OTA
author: Przemek
type: post
date: 2015-05-20T14:29:13+00:00
url: /lg-g-watch-r-android-5-1-1-ota/
featured_image: /wp-content/uploads/2015/05/lg_g_watch_r_GWAR_android_5-1-1-624x468.jpg
hits:
  - 206
xyz_fbap:
  - 1
dsq_thread_id:
  - 3779830005
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - Android
  - lg g watch r
  - wifi

---
Na pewno posiadacze Lg G watch R czekają na update (OTA) do Android 5.1.1 i są ciekawi czy zostanie włączona obsługa wifi. Spekulacji było dużo, okazało się że sam układ wifi jest zintegrowany w płycie głównej i antenę dzieli z modułem Bluetooth. Ale niestety update dla Androida 5.1.1 nie włącza tak upragnionej funkcji przez wielu użytkowników. Kto nie chce czekać na OTA już teraz może sobie wgrać najnowszy update do 5.1.1. Linki poniżej.

<!--more-->

&nbsp;

#### Unlock

Poniższe polecenie skasuje wszystkie dane z twojego zegarka. W sumie żądna strata, no chyba że coś tam jednak masz. Wszystkie programy i ustawienia i tak później zostaną ponownie zsynchronizowane.

<pre>fastboot oem unlock</pre>

aby ponownie zablokować bootloader wykonaj poniższe polecenie

<pre>fastboot oem lock</pre>

### Fastboot

W wątku na <a href="http://forum.xda-developers.com/g-watch-r/development/stock-boot-recovery-g-watch-r-t2956964" target="_blank" rel="noopener">XDA</a> można pobrać najnowsze obrazy które trzeba wgrać przez fastboot.

<pre>fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash system system.img</pre>

Poniżej filmik jak wejść w tryb fastboot



<a href="http://forum.xda-developers.com/showthread.php?t=2317790" target="_blank" rel="noopener">TU</a> można przeczytać jak zainstalować fastboot.

### Powodzenia ;P

Mam nadzieję że u was też poszło ok. Ja czekam na mod do wifi ;)

&nbsp;