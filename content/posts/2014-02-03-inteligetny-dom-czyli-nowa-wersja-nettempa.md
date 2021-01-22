---
title: Inteligetny dom czyli nowa wersja nettempa
author: Przemek
type: post
date: 2014-02-03T14:30:07+00:00
url: /inteligetny-dom-czyli-nowa-wersja-nettempa/
featured_image: /wp-content/uploads/2014/02/nettemp_748.jpg
hits:
  - 1547
dsq_thread_id:
  - 2214810336
categories:
  - Elektronika
tags:
  - nettemp
  - Raspberry pi

---
Cieszę się że tylu użytkowników zaczyna używać nettempa. Nettemp to już nie tylko pomiar temperatury ale pomiar wilgotności i sterowanie przekaźnikami na podstawie zmierzonych wartości. Wiem że jest to alternatywa dla wielu droższych urządzeń i cieszę się ze wam to działa. Forum też się rozrasta i powstają nowe dyskusje. Wszystkie tematy dotyczące nettemp&#8217;a zawsze można znaleźć pod tym linkiem <a href="http://techfreak.pl/tag/nettemp/" target="_blank">http://techfreak.pl/tag/nettemp/</a>

[<img class="aligncenter size-full wp-image-6130" alt="nettemp_748" src="http://techfreak.pl/wp-content/uploads/2014/02/nettemp_748.jpg" width="832" height="512" />][1]

Aktualna wersja to 7.4.8 a poniżej lista zmian.

Zmiany:

  * Dodana strefa do sterowania czasem. Można ustalić że pomiędzy 06:00 a 08:00 ma być 23 stopnie.
  * Dodany skrypt ustawiający hasło. Zalecane przy używaniu nettemp&#8217;a na zewnętrznym IP.
  * Zmiany w statusie zmiany położenia ikonek. Teraz to wygląda lepiej.
  * Poprawa odczytu temperatur z DHT11, DHT22.
  * Poprawiony błąd związany z ustawianiem opcji czujników DHT11, DHT22
  * Dodane statusy gpio.
  * Dodana zakładka settings. Gdzie można zdecydować jakich wykresów się używa.
  * Jakieś poprawki o których znowu nie pamiętam.
  * Wyłączony użytkownik temp.
  * Dodanie znaku specjalnego stopnia °C. Nie wiem czemu wcześniej tego nie zrobiłem ;)
  * Dodanie obsługi czujników DS18B20 prosto z portu RS232, ttyS0.

Plany:

  * Bezprzewodowy czujnik na 433Mhz z użyciem arduino pro mini i DS18b20.
  * Monitorowanie stanu GPIO, włączony/wyłączony i powiadomienia.
  * Dodanie obsługi inputów czyli np. fotorezystora.

 [1]: http://techfreak.pl/wp-content/uploads/2014/02/nettemp_748.jpg