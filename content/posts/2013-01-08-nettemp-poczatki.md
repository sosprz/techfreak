---
title: Nettemp – poczatki
author: Przemek
type: post
date: 2013-01-08T09:19:26+00:00
url: /nettemp-poczatki/
featured_image: /wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0268_1.jpg
hits:
  - 2308
dsq_thread_id:
  - 3168308000
categories:
  - Elektronika
tags:
  - nettemp

---
### Pierwsza instalacja &#8211; pomiar temperatury

Moja pierwsza instalacja **nettemp’**a znajduje się u mnie w domu i składa się z siedmiu czujników temperatury DS18B20, przystawki 1 wire na USB która była początkowo podłączona do małego serwera na debianie, potem do ThinClient HP a skończyło się na **Raspberry Pi**. Na własne potrzeby stworzyłem skrypty i stronę www aby wygodnie obsługiwać czujniki a później powiadomienia mail i sms a na końcu sterowanie przekaźnikiem. Co nie oznacza że to koniec pomysłów ;)\

<!--more-->

#### Skład zestawu:

&#8211; **Rasbperry Pi** + przekażnik 5V &#8211; 240V  
&#8211; przewody  po ok od 20m do 40m (tak na 40 metrach to działa, kabel domofonowy 6 żył)  
&#8211; czujniki temperatury DS18B20  
&#8211; przystawka 1-wire USB od meraprojekt lub samodzielna przystawka **DS9097E** + USB-Serial lub czujniki podłączone bezpośrednio pod **GPIO.**

### Jak podłączyć czujniki pod **GPIO** w Raspberry PI ?

Bardzo prosto według poniższego schematu potrzeba tylko rezystora 4.7K. Wszystkie czujniki trzeba podłączyć równolegle i wystarczy jeden rezystor na wszystkie.

[<img class="aligncenter size-full wp-image-3219" src="http://techfreak.pl/wp-content/uploads/2013/01/sensor-connection.png" alt="sensor-connection" width="574" height="228" />][1]

&nbsp;

<a href="http://http://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/temperature/" target="_blank">źródło fotki</a>

Tak to wygląda u mnie na Raspberry pi. Pod GPIO podłączone tylko dwa czujniki a reszta DS18B20 jest podłączona poprzez USB.

[<img class="aligncenter size-full wp-image-3220" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_GPIO.jpg" alt="nettemp_GPIO" width="1000" height="650" />][2]

&nbsp;

### Schemat GPIO

[<img class="aligncenter size-full wp-image-3223" src="http://techfreak.pl/wp-content/uploads/2013/01/Diagram-includes-BCM-GPIO-references.png" alt="Diagram-includes-BCM-GPIO-references" width="1200" height="732" />][3]

<a href="http://www.adafruit.com/" target="_blank">źródło fotki</a>

### Jak samemu złożyć przystawkę ?

Prosta sprawa trzeba kupić części ze schematu poniżej i podłączyć pod przejściówkę RS-232 USB.

[<img class="aligncenter size-full wp-image-3144" src="http://techfreak.pl/wp-content/uploads/2013/01/Ds9097e.gif" alt="Ds9097e" width="474" height="292" />][4]

[<img class="aligncenter size-full wp-image-3145" src="http://techfreak.pl/wp-content/uploads/2013/01/usb-to-rs232.jpg" alt="usb to rs232" width="500" height="500" />][5]

### Zalety i wady przystawki DS9097E?

Zaletą przystawki jest to że czujnik DS18B20 podłączamy tylko pod dwa przewody a nie trzy jak w przypadku GPIO. Więc zaletą jest tylko dwu żyłowa instalacja lub wykorzystanie np. przewodów od alarmu lub innej podobnej instalacji.

Wadą jest minimalnie droższa instalacja. Trzeba dokupić parę elementów i przejściówkę USB-Serial.

### Moduł ze starego switcha?

Dla wygody i żeby jakoś to wyglądało postanowiłem ze starego switcha zrobić przystawkę/moduł do którego będę podłączał kable z czujnikami. Nie podobały mi się poskręcane kabelki a zarobione RJ45 super wyglądają. W środku jest moduł 1-wire na USB do którego połączone są czujniki. Sam moduł jest podłączony do Raspberry PI.

[<img src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przystawka_techfreak.jpg" alt="nettemp_przystawka_techfreak" width="1500" height="1125" />][6]

&nbsp;

### Sterowanie Przekaźnikiem:

[<img class="aligncenter size-full wp-image-3138" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0529_1.jpg" alt="nettemp_przekaznik_techfreakIMAG0529_1" width="1000" height="563" />][7] [<img class="aligncenter size-full wp-image-3139" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0530_1.jpg" alt="nettemp_przekaznik_techfreakIMAG0530_1" width="1000" height="563" />][8] [<img class="aligncenter size-full wp-image-3140" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0531_1.jpg" alt="nettemp_przekaznik_techfreakIMAG0531_1" width="1000" height="1778" />][9] [<img class="aligncenter size-full wp-image-3141" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0532_1.jpg" alt="nettemp_przekaznik_techfreakIMAG0532_1" width="1000" height="563" />][10]



### Jak zbudować sterowanie przekaźnikiem?

Potrzebne elementy:

  1. dioda D1 jakaś podobna do 1N4004
  2. rezystor R1 &#8211; 1K
  3. tranzystor Q1 &#8211; BC337
  4. Przekaźnik 240V sterowany 5V

<a href="http://techfreak.pl/nettemp/relay-sample/" rel="attachment wp-att-808"><img class="aligncenter size-full wp-image-808" src="http://techfreak.pl/wp-content/uploads/2013/01/Relay-Sample.jpg" alt="Relay-Sample" width="469" height="362" /></a>

&nbsp;

Schemat pod linkiem <a href="http://www.susa.net/wordpress/2012/06/raspberry-pi-relay-using-gpio/" target="_blank">susa.net</a>

### Druga instalacja &#8211; serwerownia

Aby sprawdzić czy wszystko działa poprawnie w innych warunkach niż domowe postanowiłem zainstalować wszystko w serwerowni w firmie w której pracuje. Testy które trwały ponad pół roku przebiegły zaskakująco dobrze. Ponieważ system linux na Thin Client był tworzony na podstawie TinyCore, a że nie znałem platformy IGEL miałem pewne obawy o stabilność. Okazało się że nie potrzebnie :)

#### Skład zestawu:

&#8211; przystawka na 8 czujników  
&#8211; Thin Client IGEL + software ( linux na karcie CF 128MB)  
&#8211; przewody 4x 5m i 4x 10m  
&#8211; czujniki temperatury DS18B20

&nbsp;

### [<img class="aligncenter size-full wp-image-3131" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0267_1.jpg" alt="nettemp_serwerownia_techfreakIMAG0267_1" width="1000" height="564" />][11] [<img class="aligncenter size-full wp-image-3132" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0268_1.jpg" alt="nettemp_serwerownia_techfreakIMAG0268_1" width="1000" height="564" />][12] [<img class="aligncenter size-full wp-image-3133" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0269_1.jpg" alt="nettemp_serwerownia_techfreakIMAG0269_1" width="1000" height="564" />][13] [<img class="aligncenter size-full wp-image-3134" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0271_1.jpg" alt="nettemp_serwerownia_techfreakIMAG0271_1" width="1000" height="564" />][14] [<img class="aligncenter size-full wp-image-3135" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0272_1.jpg" alt="nettemp_serwerownia_techfreakIMAG0272_1" width="1000" height="564" />][15]

### 

### Jak zainstalować nettemp na Raspberry Pi?

Stworzyłem automatyczny instalator dla Raspberry Pi który instaluje i konfiguruje wszystkie potrzebne paczki aby nettemp działał. Nie trzeba po instalacji robić nic aby program zaczął działać. Projekt jest dostępny na github <https://github.com/sosprz/nettemp>

#### <span style="line-height: 1.5em;">Instalacja</span>

Skrypt instaluje potrzebne paczki i konfiguruje serwer www. Umożliwia wybranie czy chcesz zainstalować wersję beta czy stabilną.

<pre>sudo su –
apt-get update
apt-get install ca-certificates
wget https://raw.github.com/sosprz/nettemp/master/nettemp_install_on_raspberry_pi.sh
chmod 755 nettemp_install_on_raspberry_pi.sh
./nettemp_install_on_raspberry_pi.sh</pre>

#### Wsparcie

Jeśli uważasz że projekt nettemp jest fajny wesprzyj go dobrowolną darowizną poprzez PayPal.

 [1]: http://techfreak.pl/wp-content/uploads/2013/01/sensor-connection.png
 [2]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_GPIO.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/01/Diagram-includes-BCM-GPIO-references.png
 [4]: http://techfreak.pl/wp-content/uploads/2013/01/Ds9097e.gif
 [5]: http://techfreak.pl/wp-content/uploads/2013/01/usb-to-rs232.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przystawka_techfreak.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0529_1.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0530_1.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0531_1.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_przekaznik_techfreakIMAG0532_1.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0267_1.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0268_1.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0269_1.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0271_1.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_serwerownia_techfreakIMAG0272_1.jpg