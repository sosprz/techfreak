---
title: Bezprzewodowe przekaźniki na ESP8266 ESP-12E
author: Przemek
type: post
date: 2015-06-26T18:45:29+00:00
url: /bezprzewodowe-przekazniki-na-esp8266-esp-12e/
featured_image: /wp-content/uploads/2015/06/3_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_-624x416.jpg
hits:
  - 1483
xyz_fbap:
  - 1
dsq_thread_id:
  - 3882280714
categories:
  - Elektronika

---
Popularność mini bezprzewodowego układu ESP8266 wciąż rośnie i pojawia się coraz więcej projektów bazujących na nim. Oczywiście i ja używam go w swoim projekcie nettemp. Używam go do pomiaru temperatury na czujniku DS18b20 i od niedawna do sterowania przekaźnikiem. Ostatnio pisałem o programie do projektowania PCB <a href="http://techfreak.pl/easyeda-program-do-projektowania-pcb/" target="_blank">easyEda</a> w którym zaprojektowałem mała płytkę, która umożliwiała mi szybkie programowanie układu ESP. Natomiast ekipa <a href="http://www.smartarduino.com/nodemcu-based-on-esp-12e-from-esp8266_p94571.html" target="_blank">smartduino.com</a> podesłała mi na testy swoją [płytkę developerską][1] z wbudowanym ESP8266 i układem CP210x UART do łatwego podłączenia na micro USB.

<!--more-->

<a href="http://techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/1_techfreak_esp8266_relays_bezprzewodowe_przekazniki_/" rel="attachment wp-att-9751"><img class="aligncenter size-full wp-image-9751" src="http://techfreak.pl/wp-content/uploads/2015/06/1_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_.jpg" alt="1_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_" width="1000" height="667" /></a> <a href="http://techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/2_techfreak_esp8266_relays_bezprzewodowe_przekazniki_/" rel="attachment wp-att-9752"><img class="aligncenter size-full wp-image-9752" src="http://techfreak.pl/wp-content/uploads/2015/06/2_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_.jpg" alt="2_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_" width="1000" height="667" /></a> <a href="http://techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/3_techfreak_esp8266_relays_bezprzewodowe_przekazniki_/" rel="attachment wp-att-9753"><img class="aligncenter size-full wp-image-9753" src="http://techfreak.pl/wp-content/uploads/2015/06/3_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_.jpg" alt="3_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_" width="1000" height="667" /></a> <a href="http://techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/4_techfreak_esp8266_relays_bezprzewodowe_przekazniki_/" rel="attachment wp-att-9754"><img class="aligncenter size-full wp-image-9754" src="http://techfreak.pl/wp-content/uploads/2015/06/4_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_.jpg" alt="4_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_" width="1000" height="667" /></a>

Za parę dolców można zakupić bardzo fajny zestaw który pozwala na szybkie zaprogramowanie i uruchomienie. Zapominamy o łączeniu jakiegoś UARTA z układem i po prostu działamy. Na pokładzie znalazł się przycisk boot przydatny do wgrywania wsadu np. nodemcu. I guzik reset. Przydatna też jest niebieska dioda podłączona do D6. Dzięki której można przetestować działania kodu jak np. w arduino (blink).

<a href="http://techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/5_techfreak_esp8266_relays_bezprzewodowe_przekazniki_/" rel="attachment wp-att-9755"><img class="aligncenter size-full wp-image-9755" src="http://techfreak.pl/wp-content/uploads/2015/06/5_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_.jpg" alt="5_techfreak_ESP8266_relays_bezprzewodowe_przekazniki_" width="1000" height="500" /></a>

Jeśli ktoś chce zobaczyć jak wgrywać programy do ESP to zapraszam do przeczytania mojego <a href="http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/" target="_blank">poprzedniego wpisu</a> lub można to zrobić z poziomu nettempa w zakładce tools ESPupload. Poniżej jeszcze filmik z działania ESP DEV board nettempa i przekaźników. Przy okazji porównuje mój dotychczasowy układ do wgrywania kodu z nowym od smartarduino.com.



&nbsp;

 [1]: http://www.smartarduino.com/nodemcu-based-on-esp-12e-from-esp8266_p94571.html