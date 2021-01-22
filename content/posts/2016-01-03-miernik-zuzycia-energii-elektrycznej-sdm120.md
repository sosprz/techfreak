---
title: Miernik zużycia energii elektrycznej SDM120
author: Przemek
type: post
date: 2016-01-03T15:17:38+00:00
url: /miernik-zuzycia-energii-elektrycznej-sdm120/
featured_image: /wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-0-624x416.jpg
hits:
  - 785
dsq_thread_id:
  - 4457671886
categories:
  - Elektronika
tags:
  - Raspberry pi
  - recenzja
  - test

---
Dziś wpis dotyczący miernika energii elektrycznej SDM120 z pomocą którego można zobrazować zużycie prądu w domu.

<!--more-->

Ostatnio dużo dzieje się na forum nettemp gdzie razem z użytkownikami wprowadziłem takie funkcje jak pomiar zużycia energii elektrycznej, gazu i wody. Pomiary odbywają się przewodowo i bezprzewodowo. W pierwszej wersji wykorzystujemy GPIO w drugiej mini układ WiFi ESP8266. Doszła jeszcze jedna opcja pomiarów poprzez USB i protokół modbus z wykorzystaniem miernika SDM120.

Na użycie tego miernika wpadł jeden z użytkowników forum, który używa go dokładnie do pomiarów energii wytworzonej z solarów i energii zużytej przez grzałkę. Link do wątku na forum: <a href="http://techfreak.pl/forum/viewtopic.php?f=19&t=643" target="_blank">http://techfreak.pl/forum/viewtopic.php?f=19&t=643</a>

### SDM120

Ja też zakupiłem sobie jeden egzemplarz na testy i zamierzam go zamontować w skrzynce bezpieczników na stałe. <a href="http://www.aliexpress.com/item/SDM120-Modbus-1-phase-2-wire-0-25-5-45-A-230V-RS485-Modbus-kwh-kvarh/32515923674.html" target="_blank">Link do SDM120 na aliexpress</a>.

<a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-0/" rel="attachment wp-att-10970"><img class="aligncenter size-full wp-image-10970" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-0.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-0" width="1000" height="667" /></a>

### Podłączenie

Podłączenie jest całkiem proste.  Do wejścia nr 1 należy podłączyć fazę (L) a do wejścia nr 2 odbiorniki. Do wejścia nr 4 trzeba podłączyć linie neutralną (N) . Trzeba pamiętać o takim podłączeniu w innym przypadku SDM120 pokaże nieprawidłowe wartości. Miernik montowany jest na szynę <a href="https://pl.wikipedia.org/wiki/Szyna_DIN" target="_blank">DIN</a> i przy zakupie trzeba wiedzieć jaka szyna jest w skrzynce bezpieczników. U mnie jest to 35mm.

<a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/sdm120-connection/" rel="attachment wp-att-10971"><img class="aligncenter size-full wp-image-10971" src="http://techfreak.pl/wp-content/uploads/2016/01/SDM120-connection.jpg" alt="SDM120-connection" width="1000" height="666" /></a>

### Wyświetlacz

SDM120 został wyposażony w wyświetlacz i guzik. Domyślnie wyświetlacz pokazuje całkowite zużycie kWh, po kliknięciu na guziczek można przełączyć na inny widok np. Volt, Amper, Wat, Herc. Poniżej parę fotek.

<a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-0-2/" rel="attachment wp-att-10972"><img class="aligncenter size-full wp-image-10972" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-0-1.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-0" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-1/" rel="attachment wp-att-10973"><img class="aligncenter size-full wp-image-10973" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-1.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-1" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-2/" rel="attachment wp-att-10974"><img class="aligncenter size-full wp-image-10974" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-2.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-2" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-3/" rel="attachment wp-att-10975"><img class="aligncenter size-full wp-image-10975" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-3.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-3" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-4/" rel="attachment wp-att-10976"><img class="aligncenter size-full wp-image-10976" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-4.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-4" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-5/" rel="attachment wp-att-10977"><img class="aligncenter size-full wp-image-10977" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-5.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-5" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-6/" rel="attachment wp-att-10978"><img class="aligncenter size-full wp-image-10978" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-6.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-6" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-7/" rel="attachment wp-att-10979"><img class="aligncenter size-full wp-image-10979" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-7.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-7" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-8/" rel="attachment wp-att-10980"><img class="aligncenter size-full wp-image-10980" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-8.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-8" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-9/" rel="attachment wp-att-10981"><img class="aligncenter size-full wp-image-10981" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-9.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-9" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-10/" rel="attachment wp-att-10982"><img class="aligncenter size-full wp-image-10982" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-10.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-10" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-11/" rel="attachment wp-att-10983"><img class="aligncenter size-full wp-image-10983" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-11.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-11" width="1000" height="667" /></a>

### USB, Modbus, RS485

Najlepszą opcją tego miernika jest to, że posiada możliwość pobierania wartości poprzez protokół <a href="https://pl.wikipedia.org/wiki/Modbus" target="_blank">modbus</a> i interfejs RS485. Aby podłączyć SDM120 do np. Raspberry Pi wystarczy zaopatrzyć się w konwerter RS485 -USB który można dostać za grosze na <a href="http://www.aliexpress.com/item/USB-to-RS485-485-Converter-Adapter-Support-Win7-XP-Vista-Linux-Mac-OS-WinCE5-0/1956981483.html" target="_blank">aliexpress</a>. Podłączenie ogranicza się do podłączenia  przewodów 9 (B), 10(A) do konwertera USB A i B. Niewątpliwą zaletą RS485 jest możliwość podłączenia 247 urządzeń na jednej linii do ok 1000 metrów.

<a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-12/" rel="attachment wp-att-10984"><img class="aligncenter size-full wp-image-10984" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-12.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-12" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-13/" rel="attachment wp-att-10985"><img class="aligncenter size-full wp-image-10985" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-13.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-13" width="1000" height="667" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-14/" rel="attachment wp-att-10986"><img class="aligncenter size-full wp-image-10986" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-14.jpg" alt="techfreak-energy-metter-raspberry-pi-sdm120-14" width="1000" height="667" /></a>

### Odczyty wartości, sterowniki

Bardzo fajną rzeczą jest to, że ktoś kiedyś napisał fajny program do odczytów wartości z SDM120 i jest on dostępny na githubie dla wszystkich.

<pre>sudo apt-get install libmodbus-dev
git clone https://github.com/gianfrdp/SDM120C
cd SDM120C
make clean && make install
</pre>

Po podłączeniu konwertera można wywołać polecenie jeśli twój SDM to /dev/ttyUSB0:

<pre>sdm120c /dev/ttyUSB0</pre>

Które powinno zwrócić coś w tym stylu:

<pre>Voltage: 236.20 V
Current: 0.13 A
Power: 29.50 W
Active Apparent Power: 31.53 VA
Reactive Apparent Power: -11.00 VAR
Power Factor: 0.94
Phase Angle: 0.00 Degree
Frequency: 49.95 Hz
Import Active Energy: 2428 Wh
Export Active Energy: 6947 Wh
Total Active Energy: 9375 Wh
Import Reactive Energy: 7007 VARh
Export Reactive Energy: 209 VARh
Total Reactive Energy: 7216 VARh
OK</pre>

Każdą z tych opcji można wywołać z osobna co ułatwia parsowanie.

<pre>sdm120c /dev/ttyUSB0 -p
Power: 29.30 W
OK</pre>

Wszystkie opcje można sprawdzić w helpie

<pre>sdm120c --help</pre>

### Nettemp

Oczywiście napisałem skrypty które pobierają wartości i zapisują je w bazach. Dzięki czemu nettemp rysuje wykresy i daje możliwość monitorowania zużycia. Poniżej na wykresach widać ile zużywa mój NAS Synology DSM212+ w czasie normalnej pracy i hibernacji.

<a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-0/" rel="attachment wp-att-10992"><img class="aligncenter size-full wp-image-10992" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-0.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-0" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-1/" rel="attachment wp-att-10993"><img class="aligncenter size-full wp-image-10993" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-1.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-1" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-2/" rel="attachment wp-att-10994"><img class="aligncenter size-full wp-image-10994" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-2.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-2" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-3/" rel="attachment wp-att-10995"><img class="aligncenter size-full wp-image-10995" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-3.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-3" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-4/" rel="attachment wp-att-10996"><img class="aligncenter size-full wp-image-10996" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-4.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-4" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-5/" rel="attachment wp-att-10997"><img class="aligncenter size-full wp-image-10997" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-5.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-5" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-6/" rel="attachment wp-att-10998"><img class="aligncenter size-full wp-image-10998" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-6.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-6" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-7/" rel="attachment wp-att-10999"><img class="aligncenter size-full wp-image-10999" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-7.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-7" width="1366" height="768" /></a> <a href="http://techfreak.pl/miernik-zuzycia-energii-elektrycznej-sdm120/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-8/" rel="attachment wp-att-11000"><img class="aligncenter size-full wp-image-11000" src="http://techfreak.pl/wp-content/uploads/2016/01/techfreak-energy-metter-raspberry-pi-sdm120-nettemp-8.png" alt="techfreak-energy-metter-raspberry-pi-sdm120-nettemp-8" width="1366" height="768" /></a>

### Podsumowanie

SDM120 montowany na szynę DIN jest idealnym rozwiązaniem aby monitorować zużycie prądu w mieszkaniu. Ten miernik jest jedno fazowy ale nie ma przeszkód aby podłączyć takie trzy lub kupić wersje trzy fazową. Jedynym minusem jest brak możliwość zresetowania takiego miernika. Wraz z połączeniem do nettemp dostajemy tanie urządzenia z możliwością logowania.