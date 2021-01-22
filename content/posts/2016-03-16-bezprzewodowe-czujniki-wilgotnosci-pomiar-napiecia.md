---
title: Bezprzewodowe czujniki wilgotności + pomiar napięcia
author: Przemek
type: post
date: 2016-03-16T06:38:21+00:00
url: /bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/
featured_image: /wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-1.jpg
dsq_thread_id:
  - 4666701024
categories:
  - Elektronika
tags:
  - ESP8266
  - nettemp
  - pcb
  - Raspberry pi

---
W projekcie nettemp dużo się dzieje. Co chwilę wraz z społecznością na forum dokładamy nowe funkcjonalności albo poprawiamy stare elementy. Dziś chciałbym przestawić wam jeden ciekawy wątek na forum który cieszy się popularnością. Chodzi o temat <a href="http://nettemp.pl/forum/viewtopic.php?f=8&t=702" target="_blank">[DIY] Urządzenia WiFi dla NetTemp</a> w którym to użytkownicy zaprojektowali swoje płytki PCB oraz napisali oprogramowanie do układów ESP8266.

<!--more-->

W tym wątku można znaleźć wszystko co jest potrzebne do złożenia swojej bezprzewodowej płytki do nettemp. Zaczynając od samego PCB które można zamówić za ok 4 zł, po firmware do ściągnięcia oraz program napisany w lua. Zainteresowaniem cieszy się opcja z usypianiem układu ESP, który na bateriach 18650 może potrzymać nawet miesiąc.

Ja w końcu zabrałem się za lutowanie i złożyłem dwie płytki PCB z ESP8266 01 i EPS8266 12. Na razie na testy wrzuciłem pomiar napięcia z baterii i czujnik wilgotności DHT11.

<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-1/" rel="attachment wp-att-11383"><img class="aligncenter size-full wp-image-11383" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-1.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-1" width="1000" height="667" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-2/" rel="attachment wp-att-11384"><img class="aligncenter size-full wp-image-11384" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-2.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-2" width="1000" height="667" /></a>

Układu po wgraniu kodu lua zalogowały się do sieci WiFi i nettemp je wykrył. Kod dostępny jest w źródłach <a href="https://github.com/sosprz/nettemp" target="_blank">nettemp</a>.

<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-5/" rel="attachment wp-att-11388"><img class="aligncenter size-full wp-image-11388" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-5.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-5" width="1000" height="694" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-4/" rel="attachment wp-att-11389"><img class="aligncenter size-full wp-image-11389" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-4.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-4" width="1000" height="810" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-6/" rel="attachment wp-att-11387"><img class="aligncenter size-full wp-image-11387" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-6.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-6" width="1000" height="327" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-7/" rel="attachment wp-att-11386"><img class="aligncenter size-full wp-image-11386" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-7.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-7" width="1000" height="307" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-8/" rel="attachment wp-att-11385"><img class="aligncenter size-full wp-image-11385" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-8.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-8" width="1000" height="440" /></a>

Pomiar napięcia został dodany po to aby monitorować stan baterii. Do tego zadania został zastosowany dzielnik napięcia ponieważ układ ESP może czytać napięcie na pinie ADC do 1V. W projekcie zostały użyte rezystory 33k i 10k.

Jak by kto się zastanawiał jak wgrywam kody do ESP8166, to są dwie opcje. Pierwsza to każda płytka ma wyprowadzone trzy piny UART do których można podłączyć jakąś przejściówką na USB, lub można programować układ np. jak ja.  Przerabiając płytkę deweloperska WeMos. Do każdego ESP dodaje nóżki (gold piny) a do WeMos dodałem gniazda. Co pozwala mi na szybkie programowanie układów i ich wymianę.<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-aliexpress-1/" rel="attachment wp-att-11392"><img class="aligncenter size-full wp-image-11392" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-aliexpress-1.jpg" alt="techfreak-aliexpress-1" width="1000" height="839" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-aliexpress-2/" rel="attachment wp-att-11391"><img class="aligncenter size-full wp-image-11391" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-aliexpress-2.jpg" alt="techfreak-aliexpress-2" width="1000" height="904" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-aliexpress-3/" rel="attachment wp-att-11393"><img class="aligncenter size-full wp-image-11393" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-aliexpress-3.jpg" alt="techfreak-aliexpress-3" width="1000" height="894" /></a>

<a href="http://techfreak.pl/bezprzewodowe-czujniki-wilgotnosci-pomiar-napiecia/techfreak-dht11-esp8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-3/" rel="attachment wp-att-11390"><img class="aligncenter size-full wp-image-11390" src="http://techfreak.pl/wp-content/uploads/2016/03/techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-3.jpg" alt="techfreak-DHT11-ESP8266-voltage-humidity-bezprzewodowe-czujniki-wilgotnosci-3" width="1000" height="667" /></a>

Linki:

<a href="http://pl.aliexpress.com/item/hot-sale-10-pcs-1x40-Pin-2-0mm-Pitch-Single-Row-PCB-Pin-Headers/32414426067.html" target="_blank">http://pl.aliexpress.com/item/hot-sale-10-pcs-1&#215;40-Pin-2-0mm-Pitch-Single-Row-Female-Pin-Headers-Strip/32415019023.html</a>

<a href="http://pl.aliexpress.com/item/hot-sale-10-pcs-1x40-Pin-2-0mm-Pitch-Single-Row-PCB-Pin-Headers/32414426067.html" target="_blank">http://pl.aliexpress.com/item/hot-sale-10-pcs-1&#215;40-Pin-2-0mm-Pitch-Single-Row-PCB-Pin-Headers/32414426067.html</a>

<a href="http://pl.aliexpress.com/item/D1-mini-Mini-NodeMcu-4M-bytes-Lua-WIFI-Internet-of-Things-development-board-based-ESP8266/32529101036.html" target="_blank">http://pl.aliexpress.com/item/D1-mini-Mini-NodeMcu-4M-bytes-Lua-WIFI-Internet-of-Things-development-board-based-ESP8266/32529101036.html</a>

&nbsp;

Mam nadzieje w przyszłości jeszcze napisać o pomiarze odległości, licznikach gazu, prądu, wody itd &#8230;&#8230;.. bo to wszystko właśnie jest realizowane na forum :D

&nbsp;