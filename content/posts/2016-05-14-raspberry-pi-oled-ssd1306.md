---
title: Raspberry Pi + oled ssd1306
author: Przemek
type: post
date: 2016-05-14T20:13:25+00:00
url: /raspberry-pi-oled-ssd1306/
featured_image: /wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_6.jpg
dsq_thread_id:
  - 4827068041
categories:
  - Elektronika
tags:
  - nettemp
  - Raspberry pi

---
Dziś mały wstęp do pracy z Raspberry Pi i LCD OLED o rozdzielczości 128&#215;64 i przekątnej 0,96&#8243; na szynie I2C.

<!--more-->

Zakupiłem całkiem tani i całkiem mały [wyświetlacz OLED][1] który jest prosty w obsłudze i można na nim zrealizować wiele projektów. Działa on na szynie I2C i domyślnie zgłasza się na adresie 3c. Instalacja sprowadza się do podłączenia zasilania 3.3V, GND, SDA i SCL do Raspberry Pi. Jak widać poniżej piny są oznaczone więc nie ma problemu z podłączeniem. Oczywiście piny Raspberry Pi są do sprawdzenia np. [tu][2].

<a href="http://techfreak.pl/raspberry-pi-oled-ssd1306/techfreakpl_raspberrypi_oled_ssd1306_1/" rel="attachment wp-att-11559"><img class="aligncenter size-full wp-image-11559" src="http://techfreak.pl/wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_1.jpg" alt="techfreakpl_raspberrypi_oled_ssd1306_1" width="1000" height="667" /></a> <a href="http://techfreak.pl/raspberry-pi-oled-ssd1306/techfreakpl_raspberrypi_oled_ssd1306_2/" rel="attachment wp-att-11560"><img class="aligncenter size-full wp-image-11560" src="http://techfreak.pl/wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_2.jpg" alt="techfreakpl_raspberrypi_oled_ssd1306_2" width="1000" height="667" /></a>

Po wydaniu polecenia listującego urządzenia podłączone pod szynę I2C powinien pojawić się adres jak poniżej.

<pre>root@Zero1:~# i2cdetect -y 1
 0 1 2 3 4 5 6 7 8 9 a b c d e f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- 3c -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --
</pre>

### Sterowniki

Bez odpowiednich bibliotek nie ruszymy dalej! Ja znalazłem na tym [githubie][3] co trzeba zainstalować aby z powodzeniem używać OLED&#8217;a. W skrócie trzeba wykonać poniższe instalacje:

<pre>sudo apt-get install i2c-tools python-smbus python-pip libjpeg-dev
sudo pip install pillow
git clone https://github.com/rm-hull/ssd1306
cd ssd1306
sudo python setup.py install</pre>

Po poprawnej instalacji można odpalić przykłady

<pre>cd examples
python sys_info.py</pre>

<a href="http://techfreak.pl/raspberry-pi-oled-ssd1306/techfreakpl_raspberrypi_oled_ssd1306_3/" rel="attachment wp-att-11561"><img class="aligncenter size-full wp-image-11561" src="http://techfreak.pl/wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_3.jpg" alt="techfreakpl_raspberrypi_oled_ssd1306_3" width="1000" height="667" /></a>

### Dalej można już tylko się bawić!

<a href="http://techfreak.pl/raspberry-pi-oled-ssd1306/techfreakpl_raspberrypi_oled_ssd1306_4/" rel="attachment wp-att-11562"><img class="aligncenter size-full wp-image-11562" src="http://techfreak.pl/wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_4.jpg" alt="techfreakpl_raspberrypi_oled_ssd1306_4" width="1000" height="667" /></a> <a href="http://techfreak.pl/raspberry-pi-oled-ssd1306/techfreakpl_raspberrypi_oled_ssd1306_5/" rel="attachment wp-att-11563"><img class="aligncenter size-full wp-image-11563" src="http://techfreak.pl/wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_5.jpg" alt="techfreakpl_raspberrypi_oled_ssd1306_5" width="1000" height="667" /></a> <a href="http://techfreak.pl/raspberry-pi-oled-ssd1306/techfreakpl_raspberrypi_oled_ssd1306_6/" rel="attachment wp-att-11564"><img class="aligncenter size-full wp-image-11564" src="http://techfreak.pl/wp-content/uploads/2016/05/techfreakpl_raspberrypi_oled_ssd1306_6.jpg" alt="techfreakpl_raspberrypi_oled_ssd1306_6" width="1000" height="667" /></a>  
Przykładowy kod który wyświetla napis nettemp.pl, który został dopisany do kodu [sys_info.py][4] z przykładów:

<pre>font = ImageFont.load_default()
 font2 = ImageFont.truetype('../fonts/C&C Red Alert [INET].ttf', 30)
     with canvas(oled) as draw:
     draw.text((10, 15), 'nettemp.pl', font=font2, fill=255)</pre>

Rysowanie tekstu odbywa się przy pomocy ustawienia kursora w odpowiednim miejscu i narysowanie go odpowiednią czcionką i wielkością. Ja ustawiłem wielkość 30, i zmieniłem wartości draw.text((0, 0) na draw.text((10, 15).

Sam dopiero zaczynam z tym wyświetlaczem może coś jeszcze o nim napiszę :) Dawajcie znać jak wam idzie :)

 [1]: http://pl.aliexpress.com/item/Free-shipping-1Pcs-128X64-OLED-LCD-LED-Display-Module-For-Arduino-0-96-I2C-IIC-SPI/32224983358.html
 [2]: https://www.google.pl/search?q=raspberry+pi+gpio&source=lnms
 [3]: https://github.com/rm-hull/ssd1306
 [4]: https://github.com/rm-hull/ssd1306/blob/master/examples/sys_info.py#L67