---
title: 'LG G watch R hack & mods'
author: Przemek
type: post
date: 2015-01-31T21:06:02+00:00
url: /lg-g-watch-r-hack-mods/
featured_image: /wp-content/uploads/2015/01/LG_G_watch_R_kernel_mod_2-624x416.jpg
hits:
  - 679
xyz_fbap:
  - 1
dsq_thread_id:
  - 3473529418
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - lg g watch r
  - smartwatch

---
No to długo nie wytrzymałem i zmieniłem kernel w moim LG G watch R. Minęło zaledwie 20 dni od <a href="http://techfreak.pl/lg-g-watch-r-recenzja/" target="_blank" rel="noopener">mojej recenzji smart watcha</a> a ja już wgrywam zmodyfikowane jądra. A to wszystko dlatego aby dłużej trzymał na baterii.

<!--more-->

### Ile trzymał na baterii?

W teście pisałem że zegarek trzyma 24 godziny w trybie cały czas włączonym, i ok. 38 godzin w trybie w którym, włączam tarczę dotykiem. Ja na tą chwilę korzystam z trybu zawsze włączonego, ale czarno białego (Ambient Mode) i codziennie zegarek wrzucam na noc do ładowania. Poniżej można zobaczyć <a href="https://play.google.com/store/apps/details?id=net.ddroid.aw.watchface.ra45" target="_blank" rel="noopener">tarczę A45</a> która jak na razie najbardziej mi się spodobała.

<a href="http://techfreak.pl/lg-g-watch-r-hack-mods/lg_g_watch_r_kernel_mod_2/" rel="attachment wp-att-8798"><img class="aligncenter size-full wp-image-8798" src="http://techfreak.pl/wp-content/uploads/2015/01/LG_G_watch_R_kernel_mod_2.jpg" alt="LG_G_watch_R_kernel_mod_2" width="1000" height="667" /></a> <a href="http://techfreak.pl/lg-g-watch-r-hack-mods/lg_g_watch_r_kernel_mod_1/" rel="attachment wp-att-8799"><img class="aligncenter size-full wp-image-8799" src="http://techfreak.pl/wp-content/uploads/2015/01/LG_G_watch_R_kernel_mod_1.jpg" alt="LG_G_watch_R_kernel_mod_1" width="1000" height="667" /></a>

### Ile trzyma na baterii?

Od jakiegoś czasu obserwuje wątek na <a href="http://forum.xda-developers.com/g-watch-r/orig-development/kernel-intersectravens-kernel-t2957728" target="_blank" rel="noopener">XDA</a> w którym użytkownik intersectRaven wrzuca zmodyfikowane jądra dla LG G watch R. Są one modyfikowane po to aby wydłużyć pracę zegarka na baterii. Sam postanowiłem sprawdzić czy jego obrazy są warte uwagi. I okazało się, że rzeczywiście praca wydłużyła się do 39 godzin w trybie Ambient Mode i zostało jeszcze 17% (8h). Co jest dużo lepszym wynikiem niż z oryginalnym jądrem. Nie ma co się dziwić nie pierwszy raz społeczność XDA ulepsza androida. Główną zmianą jest używanie np. jednego cora (cpu) zamiast dwóch. Pełna lista zmian jest dostępna <a href="http://forum.xda-developers.com/g-watch-r/orig-development/kernel-intersectravens-kernel-t2957728" target="_blank" rel="noopener">pod tym linkiem</a>.

&nbsp;

<a href="http://techfreak.pl/lg-g-watch-r-hack-mods/screenshot_2015-01-31-20-46-30/" rel="attachment wp-att-8802"><img class="aligncenter wp-image-8802 size-large" src="http://techfreak.pl/wp-content/uploads/2015/01/Screenshot_2015-01-31-20-46-30-576x1024.png" alt="Screenshot_2015-01-31-20-46-30" width="576" height="1024" /></a>

### Ja też chcę!

Jak też chcesz wgrać zmodyfikowany kernel, to na początek trzeba odblokować bootloader. W zasadzie robi się to tak samo jak na smartfonach. I traci się gwarancję, ale w przypadku LG G watch R można przywrócić stan unlocked do stanu locked. Jeśli nie chcesz w jakiś sposób uszkodzić zegarka lub stracić gwarancji, po prostu nie rób tego.

#### 1. Wejście w tryb fastboot



#### 2. Podłączenie zegarka do komputera

Musisz podłączyć ładowarkę do zegarka a kabel USB podłączyć do komputera.

#### 3. Tryb fastboot

Jak już się decydujesz użyć fastboot to pewnie masz już ten program na komputerze. Wydaj polecenie fastboot devices aby sprawdzić czy widzi on twoje urządzenie.

#### 4. Unlock

Poniższe polecenie skasuje wszystkie dane z twojego zegarka. W sumie żądna strata, no chyba że coś tam jednak masz. Wszystkie programy i ustawienia i tak później zostaną ponownie zsynchronizowane.

<pre>fastboot oem unlock</pre>

aby ponownie zablokować bootloader wykonaj poniższe polecenie

<pre>fastboot oem lock</pre>

#### 5. boot.img

Teraz należy ściągnąć plik boot.img z <a href="http://intersectraven.euroskank.com/kernels/G%20Watch%20R/3.10.0/" target="_blank" rel="noopener">http://intersectraven.euroskank.com/kernels/G%20Watch%20R/3.10.0/</a> do wybory będzie single\* lub dual\* ja wgrałem single.

#### 6. Wgrywam lub testuje

Teraz masz dwie opcje możesz przetestować nowy kernel lub wgrać od razu go na stałe.

Wgrywanie na stałe:

<pre>fastboot flash boot single.boot.img</pre>

Testowanie, czyli tymczasowe uruchamianie, do restartu.

<pre>fastboot boot single.boot.img</pre>

### Koniec

Teraz zegarek powinien uruchomić się normalnie i po ponownym sparowaniu z telefonem zaciągnie sobie aplikacje i dane. Jak już ktoś się zdecydował przejść tą niezbyt skomplikowaną procedurę, niech da znać w komentarzach ile czasu teraz zegarek trzyma na baterii.