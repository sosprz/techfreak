---
title: Bezprzewodowe czujniki na ESP8266 + nettemp
author: Przemek
type: post
date: 2014-12-12T06:37:07+00:00
url: /bezprzewodowe-czujniki-na-esp8266-nettemp/
featured_image: /wp-content/uploads/2014/12/techfreak_nettemp_esp8266_ds18b20_4-624x468.jpg
hits:
  - 9245
dsq_thread_id:
  - 3315435921
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - ESP8266
  - nettemp
  - Raspberry pi

---
Po ostatnim <a href="http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/" target="_blank" rel="noopener">artykule</a> na temat bezprzewodowych czujników DS18b20 na układzie ESP8266 który był podłączony do bateryjki CR2032. Dziś chciałbym odpowiedzieć na parę pytań które urodziły się w tamtym czasie i pokazać wam jak działają bezprzewodowe czujniki z nettemp.

<!--more-->

### Bateria CR2032

Zapomnij o niej, układ w takim trybie jak prezentowałem zjadł ją w  godzinę.

### Jak podłączyć ESP8266 do układ USB-RS232<figure id="attachment_8340" aria-describedby="caption-attachment-8340" style="width: 934px" class="wp-caption aligncenter">

<a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/esp8266-reflash-firmware/" rel="attachment wp-att-8340"><img class="size-full wp-image-8340" src="http://techfreak.pl/wp-content/uploads/2014/12/esp8266-reflash-firmware.png" alt="Fotka z https://importhack.files.wordpress.com/2014/11/esp8266-reflash-firmware.png" width="934" height="384" /></a><figcaption id="caption-attachment-8340" class="wp-caption-text">Fotka z https://importhack.files.wordpress.com/2014/11/esp8266-reflash-firmware.png</figcaption></figure> 

&nbsp;

### Jaki układ do podłączenia?

Działać będzie każdy konwerter USB &#8211; RS232 czy na PL2303 czy na FTDI z tym że zasilanie musi działać na 3.3V.

### Inna bateria ?

Z ciekawości wykorzystałem baterię LIPO 600Mah 3,7V aby zobaczyć ile układ potrzyma. Bateria trzymała ok 24 godzin i tylko parę odczytów. W końcu zdalny czujnik podpiąłem pod Raspberry PI.

<a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/techfreak_nettemp_esp8266_ds18b20_1/" rel="attachment wp-att-8347"><img class="aligncenter size-full wp-image-8347" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_nettemp_esp8266_ds18b20_1.jpg" alt="techfreak_nettemp_esp8266_ds18b20_1" width="1000" height="500" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/techfreak_nettemp_esp8266_ds18b20_2/" rel="attachment wp-att-8346"><img class="aligncenter size-full wp-image-8346" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_nettemp_esp8266_ds18b20_2.jpg" alt="techfreak_nettemp_esp8266_ds18b20_2" width="1000" height="500" /></a>

&nbsp;

### ESP8266 + nettemp

I tym razem czujniki są wykrywane automatycznie pod warunkiem że są podłączone do tej samej sieci co nettemp. I muszą mieć wgrany program z poprzedniego wpisu <http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/>

<a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/nettemp_esp82663/" rel="attachment wp-att-8341"><img class="aligncenter size-full wp-image-8341" src="http://techfreak.pl/wp-content/uploads/2014/12/nettemp_esp82663.jpg" alt="nettemp_esp82663" width="1366" height="258" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/nettemp_esp82662/" rel="attachment wp-att-8342"><img class="aligncenter size-full wp-image-8342" src="http://techfreak.pl/wp-content/uploads/2014/12/nettemp_esp82662.jpg" alt="nettemp_esp82662" width="1366" height="681" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/nettemp_esp82661/" rel="attachment wp-att-8343"><img class="aligncenter size-full wp-image-8343" src="http://techfreak.pl/wp-content/uploads/2014/12/nettemp_esp82661.jpg" alt="nettemp_esp82661" width="1366" height="722" /></a>

### Mój ESP8266 + PL2303

Musiałem coś zrobić z tym że bateria na tą chwile to zła opcja. Potrzebowałem urządzenia które wszędzie mogę podłączyć i od razu wgrać nowy program. Moim zdaniem połączenie ESP8266 i USB Rs232 było by idealnym urządzeniem bo można podłączyć je do ładowarek do telefonów, każdy je ma, co za tym idzie mam rozwiązany problem zasilania.

Użyłem kabelka z banggooda za 7zł <a title="LINK" href="https://www.banggood.com/USB-to-RS232-or-TTL-Serial-FTDI-Chipset-FT232-Computer-Converter-Cable-p-80871.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling" target="_blank" rel="noopener">https://www.banggood.com/USB-to-RS232-or-TTL-Serial-FTDI-Chipset-FT232-Computer-Converter-Cable-p-80871.html</a>

<a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/techfreak_nettemp_esp8266_ds18b20_3/" rel="attachment wp-att-8345"><img class="aligncenter size-full wp-image-8345" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_nettemp_esp8266_ds18b20_3.jpg" alt="techfreak_nettemp_esp8266_ds18b20_3" width="1000" height="500" /></a> <a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/techfreak_nettemp_esp8266_ds18b20_4/" rel="attachment wp-att-8344"><img class="aligncenter size-full wp-image-8344" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_nettemp_esp8266_ds18b20_4.jpg" alt="techfreak_nettemp_esp8266_ds18b20_4" width="1000" height="500" /></a>

### KONIEC

To na pewno nie koniec zabawy z ESP8266 chociaż nettemp obsługuje te czujniki. Na pewnie jeszcze trochę czeka mnie grzebania w samym programie ESP8266.