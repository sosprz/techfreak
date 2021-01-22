---
title: Bezprzewodowy czujnik SHT30 Wemos z ESP8266 – nettemp i EasyESP Mega
author: Przemek
type: post
date: 2018-02-18T17:19:10+00:00
url: /bezprzewodowy-czujnik-sht30-wemos-esp8266-nettemp-easyesp-mega/
featured_image: /wp-content/uploads/2018/02/techfreak-wemos-D1-SHT30.jpg
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - czujniki
  - easyesp
  - nettemp
  - wemos

---
Układy Wemos to tanie i łatwe u użyciu bezprzewodowe rozwiązanie do podłączania wielu czujników. Wraz z oprogramowaniem ESPEasy daje bardzo duże możliwości.

<!--more-->

Lubię układy Wemos bo są proste w użyciu i zaprogramowaniu. Na pokładzie posiadają bezprzewodowy bardzo popularny układ ESP8266. Dziś chciałbym pokazać jak wgrać do takiego układu wsad ESPEasy podłączyć czujnik SHT30 i dane posyłać do serwera [nettemp][1]. Dlaczego shield SHT30? Ponieważ można go bardzo łatwo podłączyć do Wemosa.

### Instalacja ESPEasy na Wemos

Od jakiegoś czasu na github jest wydawana wersja ESPEasy w wersji binary i nie trzeba używać do wgrania programu arduino. Trzeba pobrać ostatnie wydanie z [oficjalnego githuba][2].

&nbsp;

[<img class="aligncenter size-full wp-image-14451" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1.png" alt="" width="1271" height="666" />][3]

Następnie trzeba rozpakować archiwum w którym znajdują się wersje dev, normal i test. Aby działał czujnik SHT30 trzeba zainstalować wersję test, na razie tylko w tej są dodane sterowniki.

&nbsp;

[<img class="aligncenter size-full wp-image-14452" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-2.png" alt="" width="1440" height="786" />][4]

Jeśli jesteś użytkownikiem Windows w archiwum masz już esptool.exe do wgrania wsadu. Jeśli używasz linux to trzeba pobrać esptool z github. Na początek przechodzę do katalogu z ESPEasy i tam klonuję repozytorium. Wybieram odpowiednie USB zazwyczaj **/dev/ttyUSB0** i wgrywam wsad **ESP\_Easy\_v2.0-20180218\_test\_ESP8266_4096.bin**

<pre>cd Downloads/ESPEasy_v2.0-20180218
git clone https://github.com/espressif/esptool
esptool/esptool.py --port /dev/ttyUSB0 write_flash --flash_mode dio --flash_size 4MB 0x0 ESP_Easy_v2.0-20180218_test_ESP8266_4096.bin
</pre>

[<img class="aligncenter size-full wp-image-14454" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-7.png" alt="" width="1743" height="278" />][5]

Jeśli wyskoczy problem z import serial trzeba doinstalować bibliotekę do pythona.

<pre>sudo apt install python-serial</pre>

### Konfiguracja ESPEasy

Po wgraniu powyższego wsadu i restarcie Wemos, pojawi się otwarta sieć ESPEasy_0. Do której trzeba się dołączyć i wejść na adres IP http://192.168.4.1. Poniżej dodaje SHT30 na adresie I2C 0x45. Zaznaczam wysyłanie do kontrolera i zmieniam values na temp i humid. Chcę pomiary wysyłać do nettemp więc ustawiam w Controllers kontroler Generic HTTP Advanced. Wpisuje admin i hasło z nettemp. Następnie wklejam link w którym też znajduje się hasło NodeServer z nettemp, poniżej przykładowo: **tajnehaslo**.

<pre>/receiver.php?device=ip&name=%tskname%&ip=%ip%&key=<strong>tajnehaslo</strong>&type=%vname1%;%vname2%;%vname3%&value=%val1%;%val2%;%val3%</pre>

[<img class="aligncenter size-full wp-image-14457" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-8.png" alt="" width="834" height="341" />][6]

[<img class="aligncenter size-full wp-image-14463" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-1.png" alt="" width="664" height="695" />][7] [<img class="aligncenter size-full wp-image-14462" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-2.png" alt="" width="953" height="336" />][8]

[<img class="aligncenter size-full wp-image-14460" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-4.png" alt="" width="785" height="798" />][9] [<img class="aligncenter size-full wp-image-14461" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-3.png" alt="" width="677" height="271" />][10]

&nbsp;

### Nettemp

Po prawidłowej konfiguracji w nettemp pojawiły się czujniki.

[<img class="aligncenter size-full wp-image-14469" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-1.png" alt="" width="1908" height="183" />][11]

[<img class="aligncenter size-full wp-image-14468" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-2.png" alt="" width="1069" height="307" />][12]

[<img class="aligncenter size-full wp-image-14467" src="http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-3.png" alt="" width="1904" height="842" />][13]

&nbsp;

Niestety wykresy znacznie się różnią od tych, które przeprowadziłem na BME280. Pewnie jest to spowodowane nagrzewaniem się całej kanapki. Dlatego jednak lepiej wyciągać czujniki na kilku centymetrowym przewodzie. Co ciekawe pojawiła nowe wersja płytki Wemos shield SHT30 ze specjalnymi nacięciami.

[<img class="aligncenter size-full wp-image-14472" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-wemos-shield-SHT30.png" alt="" width="426" height="454" />][14]

&nbsp;

&nbsp;

&nbsp;

 [1]: https://techfreak.pl/nettemp/
 [2]: https://github.com/letscontrolit/ESPEasy/releases
 [3]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1.png
 [4]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-2.png
 [5]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-7.png
 [6]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-8.png
 [7]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-1.png
 [8]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-2.png
 [9]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-4.png
 [10]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-sht30-1-3.png
 [11]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-1.png
 [12]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-2.png
 [13]: http://techfreak.pl/wp-content/uploads/2018/02/techfrak-nettemp-espeasy-wemos-3.png
 [14]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-wemos-shield-SHT30.png