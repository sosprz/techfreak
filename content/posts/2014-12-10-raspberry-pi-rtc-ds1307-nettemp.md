---
title: Raspberry Pi RTC DS1307 + nettemp
author: Przemek
type: post
date: 2014-12-10T15:30:04+00:00
url: /raspberry-pi-rtc-ds1307-nettemp/
featured_image: /wp-content/uploads/2014/12/techfreak_raspberry_pi_rtc_ds1307_3_1-624x468.jpg
hits:
  - 1240
dsq_thread_id:
  - 3309840265
categories:
  - Linux
tags:
  - nettemp
  - Raspberry pi

---
Podobno tej jednej funkcji brakuje w Raspberry Pi najbardziej, podtrzymania czasu rzeczywistego za pomocą bateryjki. Razpberry Pi nie zostało wyposażone w RTC pewnie z tego powodu że istnieje alternatywa w postacji NTP. Jednak czasem z różnych powodów RTC jest potrzebne i poniżej pokażę jak podłączyć i zainstalować taki moduł w Raspberry Pi.

<!--more-->

### Sprzęt

Na początek trzeba zakupić moduł RTC, ja zakupiłem go na banggood.com

<a href="http://techfreak.pl/raspberry-pi-rtc-ds1307-nettemp/techfreak_raspberry_pi_rtc_ds1307_2_1/" rel="attachment wp-att-8324"><img class="aligncenter size-full wp-image-8324" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_raspberry_pi_rtc_ds1307_2_1.jpg" alt="techfreak_raspberry_pi_rtc_ds1307_2_1" width="1000" height="650" /></a> <a href="http://techfreak.pl/raspberry-pi-rtc-ds1307-nettemp/techfreak_raspberry_pi_rtc_ds1307_1_1/" rel="attachment wp-att-8325"><img class="aligncenter size-full wp-image-8325" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_raspberry_pi_rtc_ds1307_1_1.jpg" alt="techfreak_raspberry_pi_rtc_ds1307_1_1" width="1000" height="650" /></a>

### Połączenie

Połączenie jest bardzo proste bo łączę moduł do szyny i2c na Raspberry Pi. VCC do 5V, GND &#8211; GND, SDA &#8211; SDA, SDC &#8211; SDC.

<a href="http://techfreak.pl/raspberry-pi-rtc-ds1307-nettemp/techfreak_raspberry_pi_rtc_ds1307_3_1/" rel="attachment wp-att-8323"><img class="aligncenter size-full wp-image-8323" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_raspberry_pi_rtc_ds1307_3_1.jpg" alt="techfreak_raspberry_pi_rtc_ds1307_3_1" width="1000" height="650" /></a>

### Uruchomienie

Na pewno trzeba mieć załadowane moduły I2C. I2C w Raspberry Pi można uruchomić w programie **raspi-config** wchodząc do **Advanced Options** a następnie do **I2C**. Po tych czynnościach można wykonać restart i sprawdzić i2cdetect -y 0 lub i2cdetect -y 1 czy moduł RTC został poprawnie wykryty. Jeśli nie masz i2cdetect zainstaluj i2c-tools. W zależności jaką wersję Raspberry Pi posiadasz taki masz numer szyny i2c-1, i2c-0

<pre>sudo apt-get install i2c-tools</pre>

Przechodząc dalej, trzeba uruchomić moduł odpowiedzialny za pracę z RTC i wskazać na jakim adresie jest dostępny

<pre>modprobe rtc-ds1307
echo ds1307 0x68 &gt; /sys/class/i2c-adapter/i2c-1/new_device
echo ds1307 0x68 &gt; /sys/class/i2c-adapter/i2c-0/new_device</pre>

Dodaj do autostartu

<pre>sudo echo "rtc-ds1307" &gt;&gt; /etc/modules
sudo sed -i '/exit 0/i echo ds1307 0x68 &gt; \/sys\/class\/i2c-adapter\/'$(ls /dev/i2c-* |awk -F/ '{print $3}')'\/new_device && hwclock -s' /etc/rc.local</pre>

Po wydaniu polecenia hwclock powinien pokazać datę z 2000 roku, to oznacza że działa.

<a href="http://techfreak.pl/raspberry-pi-rtc-ds1307-nettemp/2-6/" rel="attachment wp-att-8333"><img class="aligncenter size-full wp-image-8333" src="http://techfreak.pl/wp-content/uploads/2014/12/2.jpg" alt="2" width="580" height="391" /></a>

Aby zsynchronizować czas systemowy z RTC trzeba wydać polecenie hwclock -w ale jeśli nie jest poprawny to trzeba wydać polecenie ntp -qg aby synchronizować czas systemowy z jakimś serwerem czasu a dopiero wtedy zapisać go w pamięci DS1307. Jesli nie masz ntp w systemie trzeba go zainstalować.

<pre>sudo apt-get install ntp
sudo service ntp restart
ntpd -qg
hwclock -w</pre>

Po takiej operacji zapisał się poprawny czas w module i podtrzymywany jest bateryjką 3.6V. Aby sprawdzić czy na pewno wydaj polecenie hwclock.

<a href="http://techfreak.pl/raspberry-pi-rtc-ds1307-nettemp/4-3/" rel="attachment wp-att-8335"><img class="aligncenter size-full wp-image-8335" src="http://techfreak.pl/wp-content/uploads/2014/12/4.jpg" alt="4" width="581" height="388" /></a>

Teraz w systemie działa Ci NTP i RTC. Jeśli nie będzie połączenia do internetu po restarcie Raspberry Pi weźmie czas z modułu który podłączyłeś.

### Nettemp

Jeśli masz zainstalowanego nettempa na Raspberry Pi wystarczy przejść do Settings > Time gdzie przygotowałem menu w którym można powyższe czynności wyklikać i nie trzeba martwić się o moduły czy wpisywanie czegoś do plików.

<a href="http://techfreak.pl/raspberry-pi-rtc-ds1307-nettemp/attachment/10/" rel="attachment wp-att-8330"><img class="aligncenter size-full wp-image-8330" src="http://techfreak.pl/wp-content/uploads/2014/12/10.jpg" alt="10" width="1028" height="606" /></a>

### Koniec

Dajcie znać czy wam wszystko działa i jest ok w komentarzach.