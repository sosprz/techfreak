---
title: Nettemp Pi Hat nowy moduł dla Raspberry Pi
author: Przemek
type: post
date: 2016-02-15T16:28:43+00:00
url: /nettemp-pi-hat-nowy-modul-dla-raspberry-pi/
featured_image: /wp-content/uploads/2016/02/2techfreak-nettemp-modul-nettemp-pi-hat-raspberry-pi-nettemp-pi-hat-modul-nettemp-dla-komputera-raspberry-pi2-624x624.jpg
dsq_thread_id:
  - 4581623818
colormag_page_layout:
  - default_layout
onesignal_meta_box_present:
  - 1
categories:
  - Elektronika
tags:
  - 1wire
  - DIY
  - elektronika
  - i2c
  - kamami
  - nettemp
  - Raspberry pi

---
Miło mi poinformować że powstał nowy moduł dla Raspberry Pi, nettemp Pi Hat który który dedykowany jest pod mój projekt <a href="http://nettemp.pl" target="_blank" rel="noopener">nettemp</a>.

<span style="color: #ff0000;">Edit 2018.08.22: Moduł nie działa z Raspberry Pi 3+</span>

<!--more-->

Zawsze chciałem żeby moduł do nettempa wyglądał jak zwykły przełącznik sieciowy (switch) lub mały appliance. I dzięki [kamami.pl][1] moje oczekiwania zostały zrealizowane bo stworzyli oni nakładkę według mojego pomysłu. Działa ona ze wszystkimi mini komputerkami które posiadają złącze szpilkowe 40 pinów np. Raspberry Pi 2,B+. Cały pomysł opiera się takie ułożenie elementów aby tworzyły one jedną całość która może być zamknięta w obudowie. Całość wyglądem przypomina urządzenie a nie elektronikę DIY. Głównymi funkcjami Nettemp Pi Hat jest:

  * Sterowanie czterema przekaźnikami
  * Wyprowadzone złącza 1wire i i2c na RJ45
  * Ekspander umożliwiający zwiększenie odległości zasięgu układu i2c do 18 metrów
  * Zegar czasu z koszykiem na baterię
  * Konwerter UART-USB z wejściem micro USB
  * Wbudowany buzzer &#8211; sygnał dźwiękowy
  * Możliwość zamontowani wyświetlacza LCD

Powyższe funkcje zapewniają podstawę stworzenia systemu czujników z przewodami na wtyczkach RJ45. Wejście micro USB pozwala zalogować się do konsoli systemu co ułatwia pracę i rozwiązywanie problemów. Zegar czasu i jego podtrzymanie to jest to czego brakuje w Raspberry PI. Wyświetlacz LCD to dodatkowa opcja &#8211; nettemp obsługuje wyświetlanie na LCD temperatur w trybie tekstowym co jest przydatną funkcja w środowisku stałego monitoringu pomiarów.

<a href="http://techfreak.pl/nettemp-pi-hat-nowy-modul-dla-raspberry-pi/1techfreak-nettemp-modul-nettemp-pi-hat-raspberry-pi-nettemp-pi-hat-modul-nettemp-dla-komputera-raspberry-pi/" rel="attachment wp-att-11225"><img class="aligncenter size-full wp-image-11225" src="http://techfreak.pl/wp-content/uploads/2016/02/1techfreak-nettemp-modul-nettemp-pi-hat-raspberry-pi-nettemp-pi-hat-modul-nettemp-dla-komputera-raspberry-pi.jpg" alt="1techfreak-nettemp-modul-nettemp-pi-hat-raspberry-pi-nettemp-pi-hat-modul-nettemp-dla-komputera-raspberry-pi" width="800" height="800" /></a>

Trzeba wspomnieć, że Kamami przygotowało bardzo dobrą <a href="http://dl.btc.pl/kamami_wa/Nettemp%20Pi%20Hat.pdf" target="_blank" rel="noopener">dokumentację</a> do tego modułu w której użytkownik znajdzie wszystko do potrzeba aby podłączyć czujniki i szybko skorzystać z modułu.

Dla wszystkich czytelników mam kod zniżkowy **techfreak20**, który uprawnia do 20% rabatu na moduł: <a href="https://kamami.pl/kamod-kamami/559377-nettemp-pi-hat-modul-nettemp-dla-komputera-raspberry-pi.html" target="_blank" rel="noopener">kamami.pl</a>

Za jakiś czas pokaże moją domową instalację z wykorzystaniem powyższego modułu.

&nbsp;

 [1]: http://kamami.pl