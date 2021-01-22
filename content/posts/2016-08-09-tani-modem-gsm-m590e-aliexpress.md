---
title: Tani modem GSM M590E z aliexpress
author: Przemek
type: post
date: 2016-08-09T20:26:16+00:00
url: /tani-modem-gsm-m590e-aliexpress/
featured_image: /wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_21.jpg
dsq_thread_id:
  - 5053245906
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - aliexpress
  - arduino
  - modem
  - Raspberry pi

---
Zapraszam na krótką ale zakończoną sukcesem historię taniego modemu GSM M590E z aliexpress.

<!--more-->

[<img class="aligncenter size-full wp-image-11919" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-24.png" alt="techfreakpl_modem_aliexpress_m590e_10-24" width="931" height="181" />][1]

Przy okazji testów modemów na forum nettemp nawiązała się dyskusja o kompatybilnych modemach z Raspberry Pi. Okazało się, że do kupienia jest całkiem tani modem GSM M590E. Tani bo za 1,3$ i w dodatku do samodzielnego złożenia. Kupiłem poczekałem trochę czasu i przyszedł!

[<img class="aligncenter size-full wp-image-11921" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_20.jpg" alt="techfreakpl_modem_aliexpress_m590e_20" width="1000" height="667" />][2][<img class="aligncenter size-full wp-image-11920" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_21.jpg" alt="techfreakpl_modem_aliexpress_m590e_21" width="1000" height="667" />][3] [<img class="aligncenter size-full wp-image-11922" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_23.jpg" alt="techfreakpl_modem_aliexpress_m590e_23" width="1000" height="667" />][4] [<img class="aligncenter size-full wp-image-11923" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_22.jpg" alt="techfreakpl_modem_aliexpress_m590e_22" width="1000" height="667" />][5]

Jak widać powyżej modem jest lekko pordzewiały! Na pewno nie jest nowy i na pewno jest z demontażu na co wskazuje pozostawiona cyna na pinach :) (dlatego tak tanio ;p). Reszta części jest nowa.

W opakowaniu nie ma instrukcji jak i gdzie wsadzić części. To jest DIY, czyli zrób sobie sam. Generalnie łatwo można dopasować elementy jeśli się posiada jakieś podstawy elektroniki.

  * kreseczka na kondensatorze to plus, plus znajdź miernikiem
  * kreseczka na diodzie to kierunek przewodzenia
  * kreseczka na LED to plus, plus znajdź miernikiem

[<img class="aligncenter size-full wp-image-11926" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_27.jpg" alt="techfreakpl_modem_aliexpress_m590e_27" width="1000" height="667" />][6] [<img class="aligncenter size-full wp-image-11925" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_24.jpg" alt="techfreakpl_modem_aliexpress_m590e_24" width="1000" height="667" />][7] [<img class="aligncenter size-full wp-image-11927" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_26.jpg" alt="techfreakpl_modem_aliexpress_m590e_26" width="1000" height="667" />][8] [<img class="aligncenter size-full wp-image-11928" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_29.jpg" alt="techfreakpl_modem_aliexpress_m590e_29" width="1000" height="667" />][9] [<img class="aligncenter size-full wp-image-11929" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_28.jpg" alt="techfreakpl_modem_aliexpress_m590e_28" width="1000" height="667" />][10] [<img class="aligncenter size-full wp-image-11930" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_31.jpg" alt="techfreakpl_modem_aliexpress_m590e_31" width="1000" height="667" />][11] [<img class="aligncenter size-full wp-image-11931" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_30.jpg" alt="techfreakpl_modem_aliexpress_m590e_30" width="1000" height="667" />][12] [<img class="aligncenter size-full wp-image-11933" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_32.jpg" alt="techfreakpl_modem_aliexpress_m590e_32" width="1000" height="667" />][13] [<img class="aligncenter size-full wp-image-11932" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_33.jpg" alt="techfreakpl_modem_aliexpress_m590e_33" width="1000" height="667" />][14]

Poszło całkiem łatwo, nie było zbyt wielu elementów! Czas na podłączenie. Ja użyłem FTDI 232RL do podłączenia tego modemu do komputera. Tu też nie ma filozofi:

  * RX-TX
  * TX-RX
  * GND-GND
  * 5V-5V

[<img class="aligncenter size-full wp-image-11934" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_35.jpg" alt="techfreakpl_modem_aliexpress_m590e_35" width="1000" height="667" />][15] [<img class="aligncenter size-full wp-image-11936" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_36.jpg" alt="techfreakpl_modem_aliexpress_m590e_36" width="1000" height="667" />][16]

Przyszedł czas na prace z terminalem. Ja używam GTK-term pod ubuntu i teraz też go użyłem. Ustawiłem prędkość 38400, wydałem komendę AT i modem odpowiedział OK!

[<img class="aligncenter size-full wp-image-11943" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-20.png" alt="techfreakpl_modem_aliexpress_m590e_10-20" width="584" height="246" />][17] [<img class="aligncenter size-full wp-image-11944" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-21.png" alt="techfreakpl_modem_aliexpress_m590e_10-21" width="752" height="575" />][18]

Radość była wielka aż do momentu kiedy zauważyłem, że modem się resetuje!

[<img class="aligncenter size-full wp-image-11945" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-22.png" alt="techfreakpl_modem_aliexpress_m590e_10-22" width="752" height="575" />][19] [<img class="aligncenter size-full wp-image-11946" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-23.png" alt="techfreakpl_modem_aliexpress_m590e_10-23" width="752" height="575" />][20]

Po wydaniu komendy AT+CREG? która sprawdza czy modem się zarejestrował, dostałem OK ale dalej się resetował. Gdzieś na jakimś forum wyczytałem, że resetuje się z braku zasilania i że ktoś wstawił kondensator elektrolityczny 470uF i pomogło. Przy okazji znalazłem [wpis][21] o tym aby zamienić rezystor 4,7k przy slocie na sim na 10k aby karta poprawnie działała. Nie zastanawiając się wstawiłem kondensator 470uF 35V (35 bo akurat taki miałem) i wymieniłem 4,7 na 10k. Jak by co dioda miga cały czas i nic chyba innego nie robi.

[<img class="aligncenter size-full wp-image-11939" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_40.jpg" alt="techfreakpl_modem_aliexpress_m590e_40" width="1000" height="667" />][22] [<img class="aligncenter size-full wp-image-11940" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_39.jpg" alt="techfreakpl_modem_aliexpress_m590e_39" width="1000" height="667" />][23]

Od tego momentu modem działa prawidłowo a nawet wysyła SMS-ski z nettemp :)

Mam nadzieje, że spokojnie z fotek wyczytaliście wszystko co było  potrzebne aby złożyć modem i go zmodyfikować aby działał. Jak by co dawajcie znać w komentarzach!

 [1]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-24.png
 [2]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_20.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_21.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_23.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_22.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_27.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_24.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_26.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_29.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_28.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_31.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_30.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_32.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_33.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_35.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_36.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-20.png
 [18]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-21.png
 [19]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-22.png
 [20]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_10-23.png
 [21]: http://www.sunduino.pl/wordpress/gsm-m590e-tanio-i-prosto/
 [22]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_40.jpg
 [23]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_modem_aliexpress_m590e_39.jpg