---
title: Jak zainstalować LogMeIn Hamachi na Ubuntu z GUI Haguichi i zagrać w Quake 2?
author: Przemek
type: post
date: 2013-02-19T14:15:24+00:00
url: /jak-zainstalowac-logmein-hamachi-na-ubuntu-z-gui-haguichi/
featured_image: /wp-content/uploads/2013/02/quake2_orgi_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 2162
dsq_thread_id:
  - 1092507283
categories:
  - Linux
  - Network
tags:
  - ubuntu
  - vpn

---
#### <span style="font-size: 1em; line-height: 19px;">Instalacja LogMeIn hamachi</span>

Hamachi nie jest już w pełni darmowe ale można pobrać wersje BETA które działają pod linuksem. Trzeba przenieść się na stronę <https://secure.logmein.com/US/labs/> przejść do **LogMeIn Hamachi for Linux (Beta) command line version** i kliknąć **learn more.** Do pobrania będą trzy wersje 32bity, 64bity, ARM.

<!--more-->

[<img class="aligncenter size-full wp-image-2014" src="http://techfreak.pl/wp-content/uploads/2013/02/logmein_hamachi_download_642_362_force.jpg" alt="logmein_hamachi_download_642_362_force" width="642" height="362" />][1]

<em id="__mceDel"> </em>

#### Graficzna nakładka na Hamachi?

Jest GUI dla hamachi nazywa się haguichu i wygląda jak poniżej, na pewno ułatwia korzystanie.

[<img class="aligncenter size-full wp-image-2107" src="http://techfreak.pl/wp-content/uploads/2013/02/haguichi.jpg" alt="haguichi" width="336" height="362" />][2]

#### 

#### Jak zainstalować graficzną nakładkę haguichi ?

Bardzo prosta sprawa na Ubuntu należy dodać repozytorium która zawiera **haguichi**

<pre class="lang:default decode:true">sudo add-apt-repository ppa:webupd8team/haguichi
sudo apt-get update
sudo apt-get install haguichi</pre>

#### 

#### QUAKE II

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/02/quake2_orgi_642_362_force.jpg"><img class="aligncenter  wp-image-2113" src="http://techfreak.pl/wp-content/uploads/2013/02/quake2_orgi_642_362_force.jpg" alt="quake2_orgi_642_362_force" width="385" height="217" /></a>
</p>

Już dawno nie grałem w Q2 ale ostatnio po rozmowie z kumplem pomyśleliśmy że mógłby być nie zły fan ponownie zagrać w grę z przed lat. Nawet znalazłem oryginalną płytę Quake 2 z CD-Action. Dobra ale na linuchu nie będę grał na Wine czy innych emulatorach. Google podpowiedział mi że istnieje poprawiona wersja quake&#8217;a w której nie tylko poprawiono bugi a działa ona na linuxie, windowsie i mac. Dodatkowo wspiera 64bity. Mowa o <a href="http://www.yamagi.org/quake2/" target="_blank">Yamagi Quake 2</a>.

Instalacja bardzo prosta po zapięciu tunelu hamachi stworzyłem serwer a kolega dołączył się po uprzednim wpisaniu mojego ip które przydzielił mi hamachi do listy serwerów.

NO i graliśmy&#8230;

&nbsp;

[<img class="aligncenter size-full wp-image-2110" src="http://techfreak.pl/wp-content/uploads/2013/02/quake2.jpg" alt="quake2" width="642" height="340" />][3]

&nbsp;

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2013/02/logmein_hamachi_download_642_362_force.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/02/haguichi.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/02/quake2.jpg