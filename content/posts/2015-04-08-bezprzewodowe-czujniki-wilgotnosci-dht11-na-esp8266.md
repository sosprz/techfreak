---
title: Bezprzewodowe czujniki wilgotności DHT11 na ESP8266
author: Przemek
type: post
date: 2015-04-08T21:44:49+00:00
url: /bezprzewodowe-czujniki-wilgotnosci-dht11-na-esp8266/
featured_image: /wp-content/uploads/2015/04/ESP8266_DHT11_nettemppl_server_www-624x468.jpg
hits:
  - 3092
xyz_fbap:
  - 1
dsq_thread_id:
  - 3666088254
categories:
  - Elektronika
tags:
  - ESP8266
  - nettemp

---
Bardzo się cieszę, że mój poprzedni wpis o <a href="http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/" target="_blank">bezprzewodowych czujnikach temperatury DS18B20 na ESP8266</a> cieszył się tak dużym zainteresowaniem bo ok 8tyś wyświetleń. Wiem, że było trochę problemów z wgrywaniem programów na ESP ale mam nadzieję, że teraz pójdzie wszystkim lepiej. Tym razem chciałbym pokazać jak podłączyć pod ESP8266 czujnik wilgotności i temperatury DHT11.

<!--more-->

Od razu napisze dlaczego nie DHT22, bo nie mam teraz na stanie. Jak będzie to też coś napiszę/zrobię. Jak by się ktoś zastanawiał czy bezprzewodowe czujniki DHT11/22 będą obsługiwane w nettemp to zapewniam, że tak.

### Podłączenie

<span style="color: #ff0000;">UWAGA: ESP8266 pracuje z 3.3V, trzeba pamiętać aby ustawić odpowiednie napięcie na FTDI lub innej przejściówce.</span>

Trzeba się zaopatrzyć w ESP8266, FTDI FT232RL, DHT11 rezystor i 4,7k. Poniżej mały schemacik:

<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-dht11-na-esp8266/esp8266_dht11-22/" rel="attachment wp-att-9220"><img class="aligncenter size-full wp-image-9220" src="http://techfreak.pl/wp-content/uploads/2015/04/ESP8266_DHT11-22.jpg" alt="ESP8266_DHT11-22" width="867" height="567" /></a>

###  Nodemcu

Wersja nodemcu którą wgrałem na ESP8266 to 0.9.5 2015014. Wgrywam ją tak jak zawsze poprzez esptool.py z <a href="https://github.com/themadinventor/esptool" target="_blank">https://github.com/themadinventor/esptool</a>. GPIO0 musi być zwarte do GND aby wgrać sam firmware. Potem trzeba rozłączyć GPIO0 od GND.

<pre>./esptool.py --port /dev/ttyUSB0 write_flash 0x00000 nodemcu.bin</pre>

Aby połączyć się do ESP poprzez terminal polecam użyć Cutecom i prędkości 9600. Ale to nie wszystko czas na program. Poniżej screen z cutecom.

<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-dht11-na-esp8266/esp8266_dht11_nettemppl/" rel="attachment wp-att-9223"><img class="aligncenter size-full wp-image-9223" src="http://techfreak.pl/wp-content/uploads/2015/04/ESP8266_DHT11_nettemppl.jpg" alt="ESP8266_DHT11_nettemppl" width="1284" height="656" /></a>

### Program

Program pochodzi z <a href="http://scottsnowden.co.uk/?p=431" target="_blank">http://scottsnowden.co.uk/?p=431</a> a ja go zmieniłem na swoje potrzeby i dołożyłem serwer www. Generalanie jest to jedyna działająca wersja programu. Inne, nawet z nodemcu pokazywały głupoty. Oba pliki znajdują się już w repozytorium nettempa i trzeba je ściągnąć:

<a href="https://raw.githubusercontent.com/sosprz/nettemp/beta/modules/sensors/wireless/DHT11/dht.lua" target="_blank">https://raw.githubusercontent.com/sosprz/nettemp/beta/modules/sensors/wireless/DHT11/dht.lua</a>

<a href="https://raw.githubusercontent.com/sosprz/nettemp/beta/modules/sensors/wireless/DHT11/init.lua" target="_blank">https://raw.githubusercontent.com/sosprz/nettemp/beta/modules/sensors/wireless/DHT11/init.lua</a>

Trzeba pamiętać aby w init.lua dodać swój ssid i hasło do wifi.

Ja wgrywam programy za pomocą luatool z <a href="https://github.com/4refr0nt/luatool" target="_blank">https://github.com/4refr0nt/luatool</a>, można zrobić to przy pomocy specjalnej wersji Arduino <a href="https://github.com/esp8266/arduino" target="_blank">https://github.com/esp8266/arduino</a>.

<pre>./luatool.py -p /dev/ttyUSB0 -f init.lua -t init.lua
./luatool.py -p /dev/ttyUSB0 -f dht.lua -t dht.lua</pre>

Po wgraniu tych plików, po restarcie za pomocą komendy node.restart(); wydanej w cutecom albo wyłaczeniu zasilania i włączeniu. ESP8266 powinien połączyć się do twojej sieci WiFi. A po wpisaniu w przeglądarce adresu który uzyskał powinny pojawić się wartości czujnika wilgotności i temperatury. Aby dowiedzieć się jaki adres uzyskał układ z DHCP wydaj dwa polecenia w cutecom:

<pre>ip = wifi.sta.getip()
print(ip)</pre>

&nbsp;

<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-dht11-na-esp8266/esp8266_dht11_nettemppl_server_www/" rel="attachment wp-att-9228"><img class="aligncenter size-full wp-image-9228" src="http://techfreak.pl/wp-content/uploads/2015/04/ESP8266_DHT11_nettemppl_server_www.jpg" alt="ESP8266_DHT11_nettemppl_server_www" width="1000" height="650" /></a>

Teraz tylko zostało dorobienie obsługi w nettemp&#8230; Mam nadzieje, że wam wszystko działa. Nawet jak działa napiszcie w komentarzach. Dzięki.