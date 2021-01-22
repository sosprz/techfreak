---
title: XMEGA EXPLOREGO czyli wypasiony moduł z MP3
author: Przemek
type: post
date: 2014-02-04T21:43:23+00:00
url: /xmega-explorego-czyli-wypasione-arduino/
featured_image: /wp-content/uploads/2014/02/Xmega-eXplore-opis.jpg
hits:
  - 627
dsq_thread_id:
  - 2221615055
categories:
  - Elektronika
tags:
  - arduino

---
Każdy kto choć ze dwa razy trzymał lutownicę w ręku zna platformę Arduino. Jest to świetna platforma programistyczna która pozwala szybko zapoznać się z językiem programowania i mikroprocesorami. A projekty które powstają na procesorach ATMEGA codziennie zalewają internety.  A tym razem chciałbym wam przybliżyć projekt **Xmega eXploreGO** od <a href="http://modulowo.pl/" target="_blank">modułowo.pl</a> który jest kompatybilny z nakładkami arduino.

<!--more-->

[<img class="aligncenter size-full wp-image-6148" alt="Xmega-eXplore-opis" src="http://techfreak.pl/wp-content/uploads/2014/02/Xmega-eXplore-opis.jpg" width="1296" height="769" />][1]

&nbsp;

Tak wygląda **Xmega eXploreGO. ** Co rzuca się w oczy to port LINE OUT, złącze bluetooth, i złącze modułu radiowego nRF24L01. Fajnie że nie trzeba dokupywać żadnej nakładki lub robić pająka aby dodać komunikacje bezprzewodową. Ale co z tym Line OUT? Będziemy sobie puszczać MP3? Dokładnie TAK! Na pokładzie został zainstalowany dekoder <del>telewizji trwam</del> MP3 VS1003B a na odwrocie płytki slot na kartę microSD. Od teraz możesz się pochwalić chłopakom w pracy że słuchasz muzy z Arduino. A tak na poważnie zastosowanie może być różne np. wyzwalanie nagrania &#8222;już dobrze kochanie, śpij, jestem tu&#8221; po wykryciu ruchu przez sensor PIR :)

Płytkę  programuje się przez złącze USB. Po naciśnięciu przycisku boot wprowadzamy procesor w tryb programowania i wgrywamy żądany program przez oprogramowanie FLIP. Niestety procesory ATXmega nie są kompatybilne z platformą ARDUINO. Co nie oznacza że dalej nie można pisać w niej programów. Jeszcze fotka od tylu:

[<img class="aligncenter size-full wp-image-6149" alt="Xmega-eXploreGO-bot" src="http://techfreak.pl/wp-content/uploads/2014/02/Xmega-eXploreGO-bot.jpg" width="1024" height="768" />][2]

Zapraszam do przeczytania pełnej specyfikacji na <a href="http://blog.modulowo.pl/xmega-explorego-nowy-modul-z-mikrokontrolerem-atxmega-i-mp3/" target="_blank">http://blog.modulowo.pl/xmega-explorego-nowy-modul-z-mikrokontrolerem-atxmega-i-mp3/</a>.  Koszt to około 110 zł.

&nbsp;

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/02/Xmega-eXplore-opis.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/02/Xmega-eXploreGO-bot.jpg