---
title: ESP8266 – jak używać ESP12
author: Przemek
type: post
date: 2015-07-08T18:44:54+00:00
url: /esp8266-jak-uzywac-esp12/
featured_image: /wp-content/uploads/2015/07/1_techfreak_ESP12_boot_mode_normal_mode_-624x416.jpg
hits:
  - 1588
xyz_fbap:
  - 1
dsq_thread_id:
  - 3916371273
categories:
  - Elektronika
tags:
  - ESP8266
  - wifi

---
Ostatnio zakupiłem parę sztuk układu ESP8266 w wersji ESP12 w której jest dostępnych więcej GPIO. Wariant dwunasty jest w wersji SMD i nie ma wyprowadzonych pinów. Bez problemu można przylutować parę przewodów do takiej płytki ale większym problemem jest zaczęcie pracy z tym układem. Różni się on trochę od poprzednich i aby wgrać firmware lub wprowadzić układ w tryb normalnej pracy trzeba ustawić odpowiednie stany na odpowiednich GPIO.

<!--more-->

Poniżej przygotowałem mały obrazek który będzie pomocny przy wgrywaniu np. nodemcu i wprowadzaniu układu w normalny tryb.

<a href="http://techfreak.pl/esp8266-jak-uzywac-esp12/2_techfreak_esp12_boot_mode_normal_mode_/" rel="attachment wp-att-9811"><img class="aligncenter size-full wp-image-9811" src="http://techfreak.pl/wp-content/uploads/2015/07/2_techfreak_ESP12_boot_mode_normal_mode_.jpg" alt="2_techfreak_ESP12_boot_mode_normal_mode_" width="1000" height="630" /></a>

Wgrywanie samych programów nie zmienia się i można wgrywać je przez nettemp jak i standardowo przez ESPupload. Pisałem o tym jakiś czas temu <a href="http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/" target="_blank">techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/</a>. Ale najlepiej zaopatrzyć się w płytkę deweloperską <a href="http://techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/" target="_blank">techfreak.pl/bezprzewodowe-przekazniki-na-esp8266-esp-12e/</a>