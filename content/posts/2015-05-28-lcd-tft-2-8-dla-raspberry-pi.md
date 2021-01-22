---
title: LCD TFT 2.8 dla Raspberry Pi
author: Przemek
type: post
date: 2015-05-28T19:19:42+00:00
url: /lcd-tft-2-8-dla-raspberry-pi/
featured_image: /wp-content/uploads/2015/05/9_techfreak_raspberry_pi2_tft_2-8_lcd-624x416.jpg
hits:
  - 412
xyz_fbap:
  - 1
dsq_thread_id:
  - 3801913535
categories:
  - Elektronika
tags:
  - Raspberry pi

---
Wszelkie nakładki czy to Arduino czy Raspberry Pi to zawsze coś fajnego, coś co ułatwia budowę naprawdę fajnych projektów. W moje ręce wpadła bardzo fajna nakładka **<a href="https://kamami.pl/wyswietlacze-do-raspberry-pi/210936-pitft-mini-kit---320x240-28-tfttouchscreen-for-raspberry-pi.html" target="_blank">LCD TFT 2.8 320&#215;240 na Raspberry Pi</a>**. Sam lubię ułatwiać sobie życie, czy to gotowymi skryptami czy obrazami. I aby uruchomić ten wyświetlacz trzeba tylko wgrać odpowiedni image na kartę SD.

<!--more-->

#### LCD TFT 2,8 320&#215;240

Na początek parę fotek z Raspberry Pi2, oczywiście LCD jest kompatybilny ze wszystkimi wersjami RPI.

<a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/1_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9602"><img class="aligncenter size-full wp-image-9602" src="http://techfreak.pl/wp-content/uploads/2015/05/1_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="1_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/2_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9603"><img class="aligncenter size-full wp-image-9603" src="http://techfreak.pl/wp-content/uploads/2015/05/2_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="2_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/3_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9604"><img class="aligncenter size-full wp-image-9604" src="http://techfreak.pl/wp-content/uploads/2015/05/3_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="3_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/4_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9605"><img class="aligncenter size-full wp-image-9605" src="http://techfreak.pl/wp-content/uploads/2015/05/4_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="4_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/5_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9606"><img class="aligncenter size-full wp-image-9606" src="http://techfreak.pl/wp-content/uploads/2015/05/5_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="5_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/6_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9607"><img class="aligncenter size-full wp-image-9607" src="http://techfreak.pl/wp-content/uploads/2015/05/6_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="6_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/7_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9608"><img class="aligncenter size-full wp-image-9608" src="http://techfreak.pl/wp-content/uploads/2015/05/7_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="7_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/8_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9609"><img class="aligncenter size-full wp-image-9609" src="http://techfreak.pl/wp-content/uploads/2015/05/8_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="8_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/9_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9610"><img class="aligncenter size-full wp-image-9610" src="http://techfreak.pl/wp-content/uploads/2015/05/9_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="9_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a> <a href="http://techfreak.pl/lcd-tft-2-8-dla-raspberry-pi/10_techfreak_raspberry_pi2_tft_2-8_lcd/" rel="attachment wp-att-9611"><img class="aligncenter size-full wp-image-9611" src="http://techfreak.pl/wp-content/uploads/2015/05/10_techfreak_raspberry_pi2_tft_2-8_lcd.jpg" alt="10_techfreak_raspberry_pi2_tft_2-8_lcd" width="1000" height="667" /></a>

#### Instalacja obrazu

Aby działał LCD trzeba trochę naklikać w systemie aby dział w taki sposób aby wyświetlał terminal i desktop. Żeby użytkownik nie zagubił się w gąszczu komend Adafruit przygotowała gotowy obraz na kartę SD. W wyniku czego po wsadzeniu karty SD i zamontowaniu LCD na swoim miejscu od razu widzimy konsolę. Obraz do pobrania jest tu: <a href="https://learn.adafruit.com/adafruit-pitft-28-inch-resistive-touchscreen-display-raspberry-pi/easy-install" target="_blank">https://learn.adafruit.com/adafruit-pitft-28-inch-resistive-touchscreen-display-raspberry-pi/easy-install</a>

Aby poprawnie wgrać obraz na kartę w linuksie wydaj polecenie:

<pre>dd bs=4M if=2015-02-16-raspbian-wheezy-pitft28r.img of=/dev/sdd</pre>

Lub zobaczyć jak to się robi dla innych systemów wejdź na stronę: <a href="https://www.raspberrypi.org/documentation/installation/installing-images/README.md" target="_blank">https://www.raspberrypi.org/documentation/installation/installing-images/README.md</a>

Po uruchomieniu Raspberry Pi, pierwsze co wejdź do shella i rozszerz dysk z menu raspi-conf a następnie reboot. To uchroni Cię przed kłopotami w późniejszym czasie.

I tyle LCD działa. Mam parę pomysłów jak go wykorzystać będę jeszcze o nim pisać. Jak ktoś jest zainteresowany jest dostępny pod tym linkiem <a href="https://kamami.pl/wyswietlacze-do-raspberry-pi/210936-pitft-mini-kit---320x240-28-tfttouchscreen-for-raspberry-pi.html" target="_blank">https://kamami.pl/wyswietlacze-do-raspberry-pi/210936-pitft-mini-kit&#8212;320&#215;240-28-tfttouchscreen-for-raspberry-pi.html</a>