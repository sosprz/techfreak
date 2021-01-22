---
title: Moduł nettemp do Raspberry Pi
author: Przemek
type: post
date: 2014-10-21T18:47:41+00:00
url: /modul-nettemp-raspberry-pi/
featured_image: /wp-content/uploads/2014/10/2-624x527.jpg
hits:
  - 2533
dsq_thread_id:
  - 3141349995
categories:
  - Elektronika
tags:
  - czujniki
  - nettemp
  - Raspberry pi

---
Hej, czas na przedstawienie kolejnego etapu projektu nettemp. Nie są to nowe funkcje samego programu, chociaż ostatnio przybyło dużo nowych czujników, poprawek i opcji w a w szczególności system <a href="http://forum.techfreak.pl/viewtopic.php?f=5&t=175" target="_blank">Nettemp USB</a>. Tym razem jest to nakładka/shield na Raspberry Pi którą stworzyłem wraz z <a href="http://modulowo.com/pl/" target="_blank">modulowo.com</a>. Cel był prosty stworzyć prostą płytkę ułatwiającą użytkowanie systemu nettemp. Koniec z lutowaniem przekaźników na płytkach prototypowych i szukania GPIO ;).

<!--more-->

Na płytce przede wszystkim znajdują się dwa przekaźniki zakończone modułowymi złączami wraz z diodami sygnalizującymi włączenie. Wejście na dodatkowy zasilacz. Układ 1wire DS2482 na I2C wraz z wyprowadzeniami. Wyprowadzenia 1wire dla pinu GPIO4. Pięć wejść I2C z wyjściem 3.3V w tym dwa z 5V. Wejście UART (TX,RX,GND,VCC) do którego można podłączyć np. arduino lub konsolę. Jedno wejście dedykowane pod czujnik wilgotności DHT11/22 (sam czujnik bez rezystora lub płytki). Wejście na układ transmisji bezprzewodowej nRF24L01. I jedno wolne GPIO24 które można wykorzystać np. pod buzzer.

[<img class="aligncenter size-full wp-image-7847" src="http://techfreak.pl/wp-content/uploads/2014/10/3.jpg" alt="3" width="1024" height="943" />][1] [<img class="aligncenter size-full wp-image-7848" src="http://techfreak.pl/wp-content/uploads/2014/10/2.jpg" alt="2" width="1024" height="866" />][2] [<img class="aligncenter size-full wp-image-7849" src="http://techfreak.pl/wp-content/uploads/2014/10/1.jpg" alt="1" width="1024" height="1009" />][3]

&nbsp;

Zobaczcie jak wygląda moja płytka z czujnikami DHT11, DS18b20, BMP180, TSL2561, HTU21D, nRF24L01, LCD i buzzerem. Szczególe podziękowania dla użytkownika **ro-an** który dostarczył mi czujniki :)

[<img class="aligncenter size-full wp-image-7851" src="http://techfreak.pl/wp-content/uploads/2014/10/IMG_20141021_202941_1.jpg" alt="IMG_20141021_202941_1" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-7852" src="http://techfreak.pl/wp-content/uploads/2014/10/nettemp_shield.jpg" alt="nettemp_shield" width="729" height="580" />][5]

&nbsp;

Płytki już niedługo będą do kupienia na <a href="http://modulowo.com" target="_blank">modulowo.com</a>. Mogą wystąpić jeszcze drobne zmiany co do rodzaju wyjść. Mam nadzieje ze płytka zdobędzie sympatię użytkowników nettemp i nie tylko. Wierzę że przygoda z nettemp nie zakończy się tylko jednej wersji :)

 [1]: http://techfreak.pl/wp-content/uploads/2014/10/3.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/10/2.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/10/1.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/10/IMG_20141021_202941_1.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/10/nettemp_shield.jpg