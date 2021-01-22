---
title: nettemp nowe funkcje
author: Przemek
type: post
date: 2015-04-17T11:32:55+00:00
url: /nettemp-nowe-funkcje/
featured_image: /wp-content/uploads/2015/04/nettemp-nowe-funkcje1-624x351.jpg
hits:
  - 849
xyz_fbap:
  - 1
dsq_thread_id:
  - 3689226492
categories:
  - Linux
tags:
  - ESP8266
  - kamery
  - lcd
  - nettemp

---
Hej, dziś parę słów na temat projektu nettemp. Oczywiście nie rozwija się on tak szybko jak bym chciał ale zawszę trochę do przodu. Obecnie nettemp dzieli się na dwie wersje master i beta. Master jest w miarę stabilną wersją jeszcze ze starymi wykresami na RRD. Natomiast nowa wersja bety zawiera parę nowych funkcji o których werto wspomnieć.

<!--more-->

### LCD

Nawet nie pamiętam czy pisałem ale pojawiła się obsługa LCD, czyli można sobie wybrać jakie wartości czujników będą się wyświetlać na LCD.



Wiem że większość czeka na LCD x 4 ale muszę go w końcu zakupić :)

### Kamery

Następną całkiem fajną funkcją jest podgląd z kamer. Wystarczy wpisać tylko IP w sekcji settings i w statusie będzie pojawiał się obraz z kamer. Przewidziałem max 4 kamery ale nie jest problemem zwiększenie tego limitu.

<a href="http://techfreak.pl/nettemp-nowe-funkcje/nettemp_camera_status/" rel="attachment wp-att-9272"><img class="aligncenter size-full wp-image-9272" src="http://techfreak.pl/wp-content/uploads/2015/04/nettemp_camera_status.jpg" alt="nettemp_camera_status" width="753" height="270" /></a><a href="http://techfreak.pl/nettemp-nowe-funkcje/nettemp_camera__in_status/" rel="attachment wp-att-9273"><img class="aligncenter size-full wp-image-9273" src="http://techfreak.pl/wp-content/uploads/2015/04/nettemp_camera__in_status.jpg" alt="nettemp_camera__in_status" width="1357" height="483" /></a>

### ESPuploader

Ostatnio pisałem, że nettemp obsługuje nie tylko bezprzewodowe czujniki temperatury na DS18b20 ale też i bezprzewodowe czujniki wilgotności na DHT11. Można poczytać o tym <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-dht11-na-esp8266/" target="_blank">tu</a>. Wpadłem więc na pomysł aby zintegrować z nettemp&#8217;em wgrywanie programów do ESP8266. Sprawa prosta bo wystarczy podłączyć przejściówkę np. FT232RL do ESP8266 a kabelek USB do raspberry pi lub innego komputerka na którym jest nettemp. Wystarczy zaznaczyć program który ma być wgrany i urządzenie USB. Dodatkowym bonusem jest możliwość ustalenie sieci WiFi do której ma się łączyć ESP8266.

### <a href="http://techfreak.pl/nettemp-nowe-funkcje/nettemp_esp_uploade_luaupload/" rel="attachment wp-att-9276"><img class="aligncenter size-full wp-image-9276" src="http://techfreak.pl/wp-content/uploads/2015/04/nettemp_esp_uploade_luaupload.jpg" alt="nettemp_esp_uploade_luaupload" width="1358" height="540" /></a>Inne

W nettempie pojawia się dużo poprawek i rożnych życzeń zgłaszanych przez użytkowników. Ostatnio przeszliśmy na bazy sql dla czujników zamiast RRD co pozwala na większą elastyczność ale kosztem wydajności. Nowe wykresy higcharts zastąpiły całkowicie wykresy RRD. Projekt głownie się rozwija na forum, na którym też można zobaczyć instalacje użytkowników <a title="http://techfreak.pl/forum/viewtopic.php?f=8&t=272" href="http://techfreak.pl/forum/viewtopic.php?f=8&t=272" target="_blank">http://techfreak.pl/forum/viewtopic.php?f=8&t=272</a>