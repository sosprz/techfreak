---
title: Recenzja Tarot 130 FPV mini racer!
author: Przemek
type: post
date: 2016-06-10T14:37:21+00:00
url: /recenzja-tarot-130-fpv-mini-racer/
featured_image: /wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_25.jpg
dsq_thread_id:
  - 4899478450
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - blheli
  - fpv
  - frsky
  - hobbyking
  - recenzja
  - taranis
  - tarot
  - test

---
&nbsp;

Kto obserwuje moje wpisy wie, że czasem złożę jakiegoś mini drona. Zaczynałem od 250mm a teraz jestem na etapie >150mm. Ostatnio składałem [NOX3][1] którym naprawdę fajnie się lata. Dziś dzięki [gearbest.com][2] mam przyjemność polatać kolejnym mini o nazwie [TAROT 130][3].

<!--more-->

[Tarot 130][3] to mini multikopter ARF czyli Already Ready to Fly. Żeby się nim wzbić w powietrze trzeba samemu podłączyć odbiornik RC i baterię. Jego specyfikacja to silniki 1104 4000kv, regulatory napięcia HobbyKing 6A i zintegrowany kontroler lotu z płytą zasilania. To wszystko zostało zamontowane na karbonowej ramie z dystansem pomiędzy motorami 130mm. Nadajnik wideo posiada 32 kanały w paśmie 5.8Ghz o mocy 300mW. Mini kamerka FPV to CMOS 520 lini z kątem widzenia 170 stopni.

[<img class="aligncenter size-full wp-image-11611" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_17.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_17" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-11612" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_16.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_16" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-11613" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_19.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_19" width="1000" height="500" />][6] [<img class="aligncenter size-full wp-image-11614" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_18.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_18" width="1000" height="500" />][7] [<img class="aligncenter size-full wp-image-11615" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_21.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_21" width="1000" height="500" />][8] [<img class="aligncenter size-full wp-image-11616" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_20.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_20" width="1000" height="500" />][9] [<img class="aligncenter size-full wp-image-11617" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_23.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_23" width="1000" height="500" />][10]

&nbsp;

### Unpack



### Odbiornik wideo

Odbiornik wideo został zamontowany w aluminiowej obudowie i przymocowany do górnego podkładu tak aby dostęp do dip switchy którymi zmienia się częstotliwość  wideo był w miarę łatwy. Poniżej google Fatshark Dominator v2 które nie są w zestawie.



### Połączenie do Cleanflight

Aby podłączyć kabelek USB do kontrolera lotu trzeba wykręcić jeden słupek.



### Instalacja odbiornika RC

Konstruktorzy zadbali o różne sposoby podłączenia odbiornika RC. Można zrobić to za pomocą dwóch wejść, w trybie S.BUS lub PPM.

&nbsp;



&nbsp;

### Cleanflight/Betaflight

Do kontrolera FC, można wgrać dowolny flash pod Naze32 ponieważ na pokładzie znajduje się procesor STM32 F103. Jak widać poniżej ja zamieniłem flash cleanflight na betaflight.

[<img class="aligncenter size-full wp-image-11601" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_1.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_1" width="1000" height="255" />][11]

Konfiguracja hardwar&#8217;e została tak złożona, że przy konfiguracji od początku nie trzeba się martwić o odpowiednie ustawienie FC lub czy silniki kręcą się w prawo czy lewo. Wszystko zostawiam domyślnie. Jedyne co potrzeba ustawić to Recievier Mode i PID&#8217;y.

[<img class="aligncenter size-full wp-image-11600" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_2.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_2" width="1000" height="153" />][12] [<img class="aligncenter size-full wp-image-11599" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_3.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_3" width="1000" height="588" />][13] [<img class="aligncenter size-full wp-image-11598" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_4.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_4" width="1000" height="224" />][14]

### BLheli

Łącząc się przez interfejs USB do kontrolera (FC) można za pomocą BLheliSutie zaktualizować ustawienia lub firmware. Nie potrzeba do tego dodatkowych interfejsów ani lutowania.

[<img class="aligncenter size-full wp-image-11597" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_5.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_5" width="1000" height="806" />][15]

### Video z pierwszych lotów



### Wideo z wypadków



### Wideo z lotów przy opuszczonym domku



### Loty z bramką



### Kamerka

Jak widać powyżej wideo z kamerki nie jest super. Inna sprawa że nagrywarka DVR w Fatshark Dominator V2 nie ma dobrej jakości i służy tylko do przeglądania w przypadkach awaryjnych. Generalnie do lotów starcza i aż tak nie ma co narzekać. Natomiast montowanie tejże kamerki jest naprawdę fajne i pozwala na zmianę kąta widzenia. Widać je poniżej.

### Teardown

Jak ktoś jest ciekawy jak wygląda mini od środka, płytka zasilania i kontroler lotu jest zintegrowany. Kabelkologia dobrze wygląda :) Kontroler lotu generalnie jest przykręcony na nylonowe śrubki, później się okazało, że jest jeszcze przyklejony.

[<img class="aligncenter size-full wp-image-11609" src="//techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_25.jpg" alt="techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_25" width="1000" height="500" />][16]

### Bateria

Ja wybrałem w zasadzie jak większość [Lipo nano-tech 250mAh 65-130C][17], która pozwala na 2-3 minutowe loty.

[<img class="aligncenter wp-image-11608 size-full" src="//techfreak.pl/wp-content/uploads/2016/06/nano-tech_65C.jpg" alt="nano-tech_65C" width="565" height="414" />][18]

### Buzzer

Pod spodem widać całkiem duży buzzer, mógłby być mniejszy bo można takie kupić. Najważniejsze że jest. Jest całkiem dobrze słyszalny w wysokich trawach, więc jak by co znajdziesz swoją maszynę.

### Rzep

Rzep niby hudy mały ale przy dobrym naciągnięciu trzyma lipo. Niema co nażekać

### Podsumowanie

Bardzo fajny mini racer na początek ze względu na to, że omija Cię proces budowy i czas od wyciągnięcia z pudełka do lotów jest całkiem krótki. Jest to dobra podstawa np. do przebudowy na jeszcze szybszą opcję. Wystarczy zmienić regulatory i silniki na np. 1306 4000kv. Co na pewno Cię czeka to zabezpieczenie antenki wideo aby przypadkiem nie została ucięta podczas twardego lądowania. Jak to w kombosach jakiś element całości jest słaby. Dla mnie regulatory HobbyKing 6A są dosyć słabe w porównaniu np. z littlebee które posiadają np. [Damped Light][19]. Ja polecam dawajcie znać jak wasze wrażenia.

Zainteresowanych kupnem zapraszam na stronę [gearbest.com][3], dodatkowo zainteresowani mogą zobaczyć inne promocje pod tym [linkiem][2].

 [1]: //techfreak.pl/minifpv-rama-nox3-demonrc-budowa/
 [2]: http://www.gearbest.com/m-promotion-active-229.html
 [3]: http://goo.gl/Eqn6Bu
 [4]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_17.jpg
 [5]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_16.jpg
 [6]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_19.jpg
 [7]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_18.jpg
 [8]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_21.jpg
 [9]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_20.jpg
 [10]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_23.jpg
 [11]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_1.jpg
 [12]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_2.jpg
 [13]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_3.jpg
 [14]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_4.jpg
 [15]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_5.jpg
 [16]: //techfreak.pl/wp-content/uploads/2016/06/techfreakpl_tarot_130_FPV_mini_drone_racer_betaflight_cleanflight_fatshark_blheli_25.jpg
 [17]: http://www.hobbyking.com/hobbyking/store/__64210__Turnigy_nano_tech_450mAh_3S_65C_Lipo_E_flite_Compatible_Blade_180CFX_EFLB4503SJ30_.html
 [18]: //techfreak.pl/wp-content/uploads/2016/06/nano-tech_65C.jpg
 [19]: https://www.youtube.com/watch?v=QiAJkl_Opxk