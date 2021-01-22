---
title: Espurino Pico – mały ale mocny mikrokontroler
author: Przemek
type: post
date: 2014-11-02T19:59:26+00:00
url: /espurino-pico-maly-mocny-mikrokontroler/
featured_image: /wp-content/uploads/2014/11/Espurino_pico_large1-624x277.jpg
hits:
  - 468
dsq_thread_id:
  - 3184469524
categories:
  - Elektronika
tags:
  - mikrokontroler

---
Coraz więcej projektów pojawia się na małym ale 32 bitowym mikrokontrolerze STM32 z rodziny ARM Cortex-M3. Mi najbardziej znane realizacje na tym 32 bitowcu to kontroler lotu Naze32 który wykorzystałem w budowie <a href="http://techfreak.pl/zbudowac-quadcopter-fpv250-naze32-dys-be1806/" target="_blank">quadcoptera</a> i Radio odbiorniki FrSky których używam. Pojawił się ciekawy projekt Espurino Pico który ta jak Arduino ma na celu ułatwić zapoznanie i korzystanie właśnie z tej platformy.

<!--more-->

[<img class="aligncenter size-full wp-image-8004" src="http://techfreak.pl/wp-content/uploads/2014/11/Espurino_pico_large.jpg" alt="Espurino_pico_large" width="700" height="311" />][1]

Przede wszystkim Espurino Pico to małe wymiary i łatwo dostępne wejścia wyjścia. Bezpośredni port USB na styl mini pamięci przenośnych lub kluczy szyfrujących.

&nbsp;

### Specyfikacja

32mm x 15mm  
22 GPIO pins : 9 Analogowe wejscia, 21 PWM, 2 Serial, 3 SPI, 3 I2C  
Wszystkie GPIO pracują w zakresie max 5V  
2 rzędy po 8 pinów, plus 12 pinów  
Wejście USB Typ A  
STM32F401 CPU &#8211; ARM Cortex M4, 256kb flash, 64kb RAM  
3.3v 150mA regulator, tolerancja wejścia 3.5v to 20v  
Pobór prądu: <0.1mA &#8211; przez 2.5 roku na  2500mAh baterri

### Jak używać?

Dużą zaleta jest to że nie potrzebujesz dodatkowych sterowników i programów. Wszytko dzieje się w obrębie przeglądarki chrome w której trzeba tylko zainstalować Espurino WEB IDE.



### Co można stworzyć?

Parę przykładów niżej.



&nbsp;

### Source

Projekt jeszcze nie zakończył się na kickstarterze a zebrał już finansowanie. więcej można przeczytać na <a href="https://www.kickstarter.com/projects/gfw/espruino-pico-javascript-on-a-usb-stick" target="_blank"> https://www.kickstarter.com/projects/gfw/espruino-pico-javascript-on-a-usb-stick</a>

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/11/Espurino_pico_large.jpg