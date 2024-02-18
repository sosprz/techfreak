---
title: Jak skonfigurować moduł bluetooth HC-06
author: Przemek
type: post
date: 2014-06-22T18:48:49+00:00
url: /skonfigurowac-modul-bluetooth-hc-06/
featured_image: /wp-content/uploads/2014/06/techfreak_bluetooht_HC06_3.jpg
hits:
  - 3533
dsq_thread_id:
  - 2786832833
categories:
  - Elektronika
tags:
  - bluetooth
  - usb

---
Kiedyś zakupiłem tani i popularny moduł bluetooth HC-06 i do dziś używam go w swoich projektach. Dziś chciałbym Ci pokazać jak go skonfigurować. Czyli jak ustawić prędkość, zmienić PIN lub nazwę.

<!--more-->

Poniżej omawiany moduł bluetooth HC-06

[<img class="aligncenter size-full wp-image-7244" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_0.jpg" alt="techfreak_bluetooht_HC06_0" width="1000" height="650" />][1] [<img class="aligncenter size-full wp-image-7245" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_1.jpg" alt="techfreak_bluetooht_HC06_1" width="1000" height="650" />][2]

Moduł ma wyprowadzone cztery piny, VCC, GND, TX, RX. Na odwrocie jest wszystko opisane więc podłączenie nie będzie problemem, tym bardziej że pokazany został też zakres napięć do zasilania (3,6-6V).

### Podłączenie

Aby podłączyć moduł potrzebny jest konwerter USB-RS232. Ja zakupiłem <a href="http://www.banggood.com/USB-To-RS232-Or-TTL-Serial-FTDI-Chipset-FT232-Computer-Converter-Cable-p-80871.html" target="_blank">USB To RS232</a> na banggod za 9zł.

[<img class="aligncenter size-full wp-image-7246" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_2.jpg" alt="techfreak_bluetooht_HC06_2" width="1000" height="650" />][3] [<img class="aligncenter size-full wp-image-7247" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_3.jpg" alt="techfreak_bluetooht_HC06_3" width="1000" height="650" />][4]

Powyżej jest pokazane prawidłowe podłączenie. Zielony przewód do RX, biały do TX, czerwony zasilanie i czarny masa.

### Komunikacja

Po podłączeniu konwerter został wykryty jako ttyUSB0

<pre>[59590.857184] usb 2-1.2: Product: USB-Serial Controller
[59590.857190] usb 2-1.2: Manufacturezur: Prolific Technology Inc.
[59590.857862] pl2303 2-1.2:1.0: pl2303 converter detected
[59590.859906] usb 2-1.2: pl2303 converter now attached to ttyUSB0</pre>

Aby skomunikować się z modułem odpalam program GTKterm. Równie dobrze można odpalić np. putty lub zupełnie coś innego. Ustawiłem prędkość 115200 i wybrałem /dev/ttyUSB0. Aby sprawdzić czy jest komunikacja z HC-06 wydałem polecenie AT a moduł odpowiedział mi OK. Jak zakupisz nowy moduł może mieć on ustawioną zupełnie inną prędkość np. 9600.

### [<img class="aligncenter size-full wp-image-7253" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem0.jpg" alt="techfreak_bluetooht_HC06_gtktem0" width="753" height="581" />][5]  
Baudrate

Poniżej pokażę jak przestawić szybkość transmisji. Do wyboru mamy takie jak poniżej. Z tym że najpopularniejsze to 9600 i 115200.

  1. 1200
  2. 2400
  3. 4800
  4. 9600
  5. 19200
  6. 38400
  7. 57600
  8. 115200

Każda z powyższych ma przypisany swój numerek np. 115200 to numer 8. Aby zmienić szybkość transmisji trzeba wkleić do terminalu

<pre>AT+BAUD8</pre>

[<img class="aligncenter size-full wp-image-7254" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem1.jpg" alt="techfreak_bluetooht_HC06_gtktem1" width="751" height="575" />][6]

Terminal zwrócił 115200 co oznacza ze moduł ustawił taką prędkość.

### Zmiana nazwy

Domyślą nazwą wykrywaną przez inne urządzenia jest HC-06:

[<img class="aligncenter wp-image-7268 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_0-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_0" width="168" height="300" />][7]

Nazwę zmieniamy komendą AT+NAMEname czyli:

<pre>AT+NAMEtechfreak.pl</pre>

[<img class="aligncenter size-full wp-image-7255" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem2.jpg" alt="techfreak_bluetooht_HC06_gtktem2" width="750" height="576" />][8]

Terminal zwrócił setname, czyli zmienił nazwę na żądaną.

[<img class="aligncenter wp-image-7269 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_1-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_1" width="168" height="300" />][9]

### Zmiana PIN

Nie pamiętam domyślnego PINU ale albo 1234 albo 6789. PIN zmieniam komendą, AT+PINxxxx

<pre>AT+PIN6789</pre>

[<img class="aligncenter size-full wp-image-7256" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem3.jpg" alt="techfreak_bluetooht_HC06_gtktem3" width="753" height="578" />][10]

Dostałem potwierdzenie setPIN czyli jest ok. I sprawdzam łącząc się do modułu.

[<img class="aligncenter wp-image-7269 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_1-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_1" width="168" height="300" />][9] [<img class="aligncenter wp-image-7270 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_2-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_2" width="168" height="300" />][11] [<img class="aligncenter wp-image-7271 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_3-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_3" width="168" height="300" />][12]

&nbsp;

### Version

Aby sprawdzić jaką wersje firmware posiadamy w HC-06 wklejamy komendę:

<pre>AT+VERSION

</pre>

[<img class="aligncenter size-full wp-image-7257" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem4.jpg" alt="techfreak_bluetooht_HC06_gtktem4" width="753" height="575" />][13]

Moja wersja to linvorV1.8

### Bluetooth i Android

Jak mam już sparowany telefon i moduł, a moduł wciąż jest podłączony do komputera to sprawdzę czy jest komunikacja pomiędzy komputerem a telefonem z Androidem. Zainstalowałem darmowy program <a href="https://play.google.com/store/apps/details?id=com.asaxen.e.bluedatatooth" target="_blank">BlueArduino</a>, połączyłem się a w terminalu na komputerze wpisałem &#8222;test z kompa&#8221; który pojawił się od razu na telefonie.

&nbsp;

[<img class="aligncenter wp-image-7272 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_4-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_4" width="168" height="300" />][14] [<img class="aligncenter wp-image-7273 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_5-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_5" width="168" height="300" />][15] [<img class="aligncenter wp-image-7274 size-medium" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_6-168x300.png" alt="techfreak_bluetooht_HC06_android_4.4.4_6" width="168" height="300" />][16]

### Podsumowanie

Trochę tych opisów wszyło ale są to podstawy które mogą się przydać przy użytkowaniu modułu HC-06. Mam nadzieje że tobie wszystko poprawie działa jak mi :) Mi ten moduł się przydał między innymi do testu robota [AAR-04][17].

 [1]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_0.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_2.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_3.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem0.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem1.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_0.png
 [8]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem2.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_1.png
 [10]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem3.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_2.png
 [12]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_3.png
 [13]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_gtktem4.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_4.png
 [15]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_5.png
 [16]: http://techfreak.pl/wp-content/uploads/2014/06/techfreak_bluetooht_HC06_android_4.4.4_6.png
 [17]: http://techfreak.pl/test-arexx-arduino-robot-aar-04/