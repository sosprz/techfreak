---
title: BME280 czujnik wilgotności, temperatury, ciśnienia
author: Przemek
type: post
date: 2016-08-01T17:13:31+00:00
url: /bme280-czujnik-wilgotnosci-temperatury-cisnienia/
featured_image: /wp-content/uploads/2016/08/techfreakpl_BMP280_5023.jpg
dsq_thread_id:
  - 5031747356
categories:
  - Elektronika
tags:
  - nettemp
  - Raspberry pi

---
Dziś parę słów na temat taniego czujnika temperatury, wilgotności i ciśnienia BME280.

<!--more-->

Jakiś czas temu, a w zasadzie bardzo dawno temu! zakupiłem czujnik all in one czyli BME280, który na jednej płytce posiada wszystkie trzy czujniki, temperatury, ciśnienia i wilgotności. Zakupiłem go na aliexpress za ok 20 zł. Jak widać poniżej jedynym minusem jest długie oczekiwania na przesyłkę.

[<img class="aligncenter size-full wp-image-11852" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3.png" alt="techfreakpl_BMP280_3" width="903" height="178" />][1]

&nbsp;

[<img class="aligncenter size-full wp-image-11867" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5020.jpg" alt="techfreakpl_BMP280_5020" width="1000" height="500" />][2] [<img class="aligncenter size-full wp-image-11868" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5021.jpg" alt="techfreakpl_BMP280_5021" width="1000" height="1333" />][3] [<img class="aligncenter size-full wp-image-11871" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5022.jpg" alt="techfreakpl_BMP280_5022" width="1000" height="500" />][4]

BME280 został zaprojektowany przez firmę BOSCH. Jest to czujnik działający na szynie I2C z adresem 76. Zasilany jest napięciem od 1.71 V do 3.6 V. Natomiast jego parametry wyglądają jak poniżej:

### Wilgotność

W temperaturze od 0 do 60 stopni działa on w zakresie od 0 do 100% wilgotności

[<img class="aligncenter size-full wp-image-11853" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_4.png" alt="techfreakpl_BMP280_4" width="658" height="309" />][5] [<img class="aligncenter size-full wp-image-11854" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5.png" alt="techfreakpl_BMP280_5" width="468" height="385" />][6]

### Ciśnienie

Pomiar ciśnienia od 300 do 1100 hPa

[<img class="aligncenter size-full wp-image-11855" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_2.png" alt="techfreakpl_BMP280_2" width="663" height="189" />][7]

### Temperatura

Pomiar temperatury od -40 do 85 stopni

[<img class="aligncenter size-full wp-image-11856" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_1.png" alt="techfreakpl_BMP280_1" width="688" height="163" />][8]

&nbsp;

Więcej informacji może znaleźć w [pdf][9] od BOSCH

### nettemp + raspberry pi

[<img class="aligncenter size-full wp-image-11870" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5023.jpg" alt="techfreakpl_BMP280_5023" width="1000" height="500" />][10] [<img class="aligncenter size-full wp-image-11869" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5024.jpg" alt="techfreakpl_BMP280_5024" width="1000" height="500" />][11]

Od ostatniej wersji beta czujnik jest wykrywany automatycznie po podłączeniu do szyny I2C

[<img class="aligncenter size-full wp-image-11860" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_11.png" alt="techfreakpl_BMP280_11" width="520" height="293" />][12]

### Wykresy

[<img class="aligncenter size-full wp-image-11863" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3020.jpg" alt="techfreakpl_BMP280_3020" width="1000" height="563" />][13] [<img class="aligncenter size-full wp-image-11864" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3022.jpg" alt="techfreakpl_BMP280_3022" width="1000" height="563" />][14] [<img class="aligncenter size-full wp-image-11865" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3021.jpg" alt="techfreakpl_BMP280_3021" width="1000" height="563" />][15]

### Adafruit

Gdyby nie Adafruit nie było by tak łatwo, to [adafruit][16] napisała bibliotekę do której można się odwołać aby odczytać aktualne parametry z czujników.

[<img class="aligncenter size-full wp-image-11862" src="http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_22.png" alt="techfreakpl_BMP280_22" width="579" height="363" />][17]

&nbsp;

Dawajcie znać jak tam wasze czujniki!

&nbsp;

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3.png
 [2]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5020.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5021.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5022.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_4.png
 [6]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5.png
 [7]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_2.png
 [8]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_1.png
 [9]: https://cdn-shop.adafruit.com/product-files/2652/2652.pdf
 [10]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5023.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_5024.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_11.png
 [13]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3020.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3022.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_3021.jpg
 [16]: https://learn.adafruit.com/adafruit-bme280-humidity-barometric-pressure-temperature-sensor-breakout/overview
 [17]: http://techfreak.pl/wp-content/uploads/2016/08/techfreakpl_BMP280_22.png