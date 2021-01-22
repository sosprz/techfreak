---
title: Domowy alarm na Raspberry PI
author: Przemek
type: post
date: 2015-06-30T05:59:46+00:00
url: /domowy-alarm-na-raspberry-pi/
featured_image: /wp-content/uploads/2015/06/nettem_alarm_trigger-624x426.jpg
hits:
  - 2142
xyz_fbap:
  - 1
dsq_thread_id:
  - 3891272767
categories:
  - Elektronika
tags:
  - alarm
  - nettemp
  - Raspberry pi

---
Przy okazji grzebania w pudle z różnymi częściami elektronicznymi trafiłem na czujkę ruchu ([PIR][1]). Kiedyś napisałem na Arduino alarm domowy, który załączał alarm głosowy i powiadomienia SMS gdy został wykryty ruch w mieszkaniu. Uzbrajanie i rozbrajanie alarmu działało on kartę RFID. W sumie projekt fajny ale nigdy go nie wdrożyłem. Natomiast została mi czujka.

<!--more-->

W nettemp już była opcja alarmu o nazwie Trigger ale bardzo ograniczona. I wykorzystująca tylko jedno GPIO, bez możliwości akcji na innym. Ostatnio stwierdziłem, że fajną opcją będzie dodanie jednej czujki PIR w dużym pokoju, tak dla bezpieczeństwa. I pilnowała by wejścia od ogrodu. Główne wejście do mieszkania strzeże mi kamerka [trendnet][1] (już dwa lata). Dlatego właśnie postanowiłem rozszerzyć funkcje trigger o możliwość definiowania nie jednego wejścia GPIO które czeka na zmianę stanu a wielu. Tak aby można było podłączyć wiele czujek, kontaktronów i kontrolować je każde z osobna. Oprócz tego powiadomienie mailowe to za mało. Musiałem dodać funkcje triggerout która definiuje które GPIO maja zmienić swój stan gdy np. czujka załączy alarm. Przykładowo, po wykryciu ruchu przez czujkę nettemp włącza syrenę alarmową, zestaw świateł i wysyła powiadomienia. Poniżej przygotowałem filmik jak skonfigurować alarm w nettemp dla jednej czujki i prezentacje z działania.

<a href="http://techfreak.pl/domowy-alarm-na-raspberry-pi/techfreak_nettem_alarm_pir/" rel="attachment wp-att-9767"><img class="aligncenter size-full wp-image-9767" src="http://techfreak.pl/wp-content/uploads/2015/06/techfreak_nettem_alarm_PIR.jpg" alt="techfreak_nettem_alarm_PIR" width="1200" height="900" /></a>

### Konfiguracja alarmu

Konfiguruje funkcje ze smartofna, już na nowym interfejsie nettempa.



### Działanie

Czujka wykrywała minimalne poruszenie więc nie musiałem nawet machnąć ręką aby ją uruchomić. Po załączeniu alarmu w statusie zmienia się kolorek na czerwony GPIO o nazwie PIR.



Dla jednej czujki można skonfigurować wiele wyjść (triggerout). Bardzo przydatną rzeczą jest zmiana stanu na wejściu jak i na wyjściu poprzez klikanie opcji reverse HIGH/LOW. W przypadku kiedy czujka jest NO trzeba ustawić stan LOW, jeśli NC, HIGH. Tak samo w przypadku przekaźników. Aby wyłączyć alarm trzeba kliknąć włącznik w nowej zakładce controls która się pojawia w przypadku zdefiniowania funkcji trigger. Plusem jest to, że alarmem można zdalnie sterować po ustawieniu VPN. Jak to zrobić można zobaczyć w poniższym filmiku.



Akurat tą funkcje zrobiłem pod siebie ciekawe ale czy wy też z niej skorzystacie. Proszę, dawajcie znać jak system się sprawuje.

EDIT: Trochę zaktualizowałem kod i można podłączyć urządzenie włączające/wyłączające alarm albo po prostu przycisk.



&nbsp;

 [1]: https://pl.wikipedia.org/wiki/PIR_%28czujnik_ruchu%29