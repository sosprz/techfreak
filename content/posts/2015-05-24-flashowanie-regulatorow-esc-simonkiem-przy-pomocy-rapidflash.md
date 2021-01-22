---
title: Flashowanie regulatorów (ESC) SimonKiem przy pomocy rapidflash
author: Przemek
type: post
date: 2015-05-24T19:08:17+00:00
url: /flashowanie-regulatorow-esc-simonkiem-przy-pomocy-rapidflash/
featured_image: /wp-content/uploads/2015/05/simonk_flash_arduino_uno_rapidflash-624x468.jpg
hits:
  - 254
xyz_fbap:
  - 1
dsq_thread_id:
  - 3790398508
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - blheli
  - SimonK

---
Ostatnio pisałem o <a href="http://techfreak.pl/esc-dys-sn20a-blheli-arduino-uno-flash/" target="_blank" rel="noopener">flashowaniu regulatorów wsadem od BLheli przy pomocy BLheli Suite</a> a teraz napisze jak wgrywać bardzo znany &#8222;konkurencyjny&#8221; SimonK.

<!--more-->

Na pewno znasz oprogramowanie cleanflight, baseflight do kontrolerów lotu Naze32 lub flip32, które są wtyczkami do przeglądarki chrome i są naprawdę świetne. Obsługa i konfiguracja koptera przy pomocy tych programów jest na prawdę prosta i przyjemna. RapidFlash to kolejna wtyczka która ułatwi to co może sprawiać problem, czyli wgrywanie firmwaru do regulatorów. Jest ona dedykowana tylko dla oprogramowania SimonK.

<a href="http://techfreak.pl/flashowanie-regulatorow-esc-simonkiem-przy-pomocy-rapidflash/simonk_rapidflash_esc_flash/" rel="attachment wp-att-9563"><img class="aligncenter size-full wp-image-9563" src="http://techfreak.pl/wp-content/uploads/2015/05/simonk_rapidflash_esc_flash.jpg" alt="simonk_rapidflash_esc_flash" width="1363" height="738" /></a>

Większość regulatorów przychodzących z SimonK ma już wgrany bootloader który umożliwia wgrywanie firmwar&#8217;ów poprzez kabelek sygnałowy i gnd. Przez co nie jest potrzebny np. programator USBasp i rozrywanie koszulki. A potrzebujemy tylko interfejs Arduino USB linker czyli np. zwykłe arduino UNO. Wszytko co trzeba zrobić to wgrać przez Arduino program z githuba <a href="https://raw.githubusercontent.com/c---/ArduinoUSBLinker/master/ArduinoUSBLinker.ino" target="_blank" rel="noopener">https://raw.githubusercontent.com/c&#8212;/ArduinoUSBLinker/master/ArduinoUSBLinker.ino</a>

Kabelek sygnałowy podłącz pin 2, gnd &#8211; gnd.

<a href="http://techfreak.pl/flashowanie-regulatorow-esc-simonkiem-przy-pomocy-rapidflash/simonk_flash_arduino_uno_rapidflash/" rel="attachment wp-att-9565"><img class="aligncenter size-full wp-image-9565" src="http://techfreak.pl/wp-content/uploads/2015/05/simonk_flash_arduino_uno_rapidflash.jpg" alt="simonk_flash_arduino_uno_rapidflash" width="1000" height="500" /></a>

Jeśli chcesz przejść z BLheli na SimonK i nie masz bootloadera od Simonka to musisz go wgrać raz przez SPI USBasp a potem już nie będzie znaczenia czy poprzez kabelek data będziesz wgrywać SimonK czy BLheli. Wszystko się rozbija o bootloader od Simona który pozwala wgrywać też BLheli.