---
title: SONOFF gotowy układ do sterowania przekaźnikiem na ESP8266
author: Przemek
type: post
date: 2017-05-04T20:38:52+00:00
url: /sonoff-gotowy-uklad-sterowania-przekaznikiem-esp8266/
featured_image: /wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2252.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 5786731091
categories:
  - Elektronika
tags:
  - easyesp
  - ESP8266
  - nettemp
  - wifi

---
Dziś trochę na temat prostego i popularnego przekaźnika SONOFF z wbudowanym WiFi na układzie ESP8266.

<!--more-->

Pisałem jakiś czas temu o bezprzewodowych przekaźnikach na ESp8266 do których kod był pisany w LUA na platformie NodeMCU. Wtedy trzeba było zbudować swój przekaźnik z elementów elektronicznych i jeszcze napisać swój niewielki skrypt w LUA. Dziś jest łatwiej bo za takie same pieniądze mamy gotowy układ i soft EasyESP, który znacznie ułatwia sterowanie i zarządzanie zdalnym urządzeniem. EasyESP zawiera w sobie już szereg sterowników urządzeń, łatwość konfiguracji i graficzny interfejs. To wszystko sprawiło, że EasyESP jest bardzo popularny. Otwarty kod zdeterminował mnie aby zintegrować Easy tak aby bez problemu wysyłał dane do nettemp i aby z nettemp można było sterować przekaźnikiem.

### SONOFF

Ja swoje układy SONOFF zamówiłem w tym [sklepie][1], przyszły po koło 2 tygodniach. W pudełku znajduje się układ z osłonami na złącza przykręcane i śrubki do nich.

[<img class="aligncenter size-full wp-image-12903" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-50.jpg" alt="" width="1000" height="650" />][2] [<img class="aligncenter size-full wp-image-12902" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-51.jpg" alt="" width="1000" height="650" />][3] [<img class="aligncenter size-full wp-image-12901" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-52.jpg" alt="" width="1000" height="650" />][4] [<img class="aligncenter size-full wp-image-12900" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-53.jpg" alt="" width="1000" height="650" />][5] [<img class="aligncenter size-full wp-image-12899" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-54.jpg" alt="" width="1000" height="650" />][6]

&nbsp;

### Zasilanie

Układ SONOFF jest zasilany bezpośrednio z 230V

[<img class="aligncenter size-full wp-image-12898" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-55.jpg" alt="" width="1000" height="650" />][7]

[<img class="aligncenter size-full wp-image-12897" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-56.jpg" alt="" width="1000" height="650" />][8]

&nbsp;

### Co w środku

Układ składa się z zasilania, przekaźnika, guzika, diody informaującej o włączeniu przekaźnika oraz modułu WiFi ESP8266

[<img class="aligncenter size-full wp-image-12896" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-57.jpg" alt="" width="1000" height="650" />][9] [<img class="aligncenter size-full wp-image-12895" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-58.jpg" alt="" width="1000" height="650" />][10]

### Programowanie układu

Bardzo dobrym pomysłem projektantów było zostawienie pinów do programowania układu ESP8266 co bardzo mocno ułatwia zmianę oprogramowania. Do tego będzie potrzebny układ USB UART FTDI 232RL

[<img class="aligncenter size-full wp-image-12894" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-59.jpg" alt="" width="1000" height="650" />][11]

Do programowania można użyć gotowych paczek EASYESP pod Nettemp, lub samemu skompilować i wgrać je z arduino ale nie współpracują one z Nettemp.

Pliki Easyesp dla arduino: <https://github.com/letscontrolit/ESPEasy/tree/master>

Ustawienia dla easyesp w Arduino

[<img class="aligncenter size-full wp-image-12914" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-162.jpg.png" alt="" width="1920" height="1055" />][12]

Gotowe paczki dla nettemp i instrukcja znajduje się na stronie [wiki][13] prowadzonej przez użytkowników nettemp.

#### Dodatkowe GPIO<figure id="attachment_12911" aria-describedby="caption-attachment-12911" style="width: 800px" class="wp-caption aligncenter">

[<img class="wp-image-12911 size-full" src="//techfreak.pl/wp-content/uploads/2017/05/pinout_frontx-sonoff.jpg" alt="SONOFF GPIO PINOUT" width="800" height="456" />][14]<figcaption id="caption-attachment-12911" class="wp-caption-text">SONOFF schemat z forum nettemp.pl</figcaption></figure> 

Szkoda, że nie wszystkie wolne GPIO układu ESP zostały wyprowadzone na płytkę. Ja od początku miałem zamiar podłączyć wyświetlacz OLED ale niestety do tego brakuje GPIO. Jeśli chce zachować wszystkie dotychczasowe funkcjonalności tj. guzik i dioda muszę dorobić sobie samemu wyjścia pod GPIO5 (SCL) pin 24 i GPIO4 (SDA) pin 16. Czyli musiałem dolutować przewody do pierwszego pinu od góry na prawej ścianie układu, a dla GPIO4 do ostatniego pinu od lewej strony na dolnej ścianie. Bez cieniutkiego grotu się nie obejdzie ja zakupiłem na allegrosie u użytkownika hotair grot 0.2mm 900M T-I. Następnie te przewody wyprowadziłem na goldpiny przylutowane do wolnych nie używanych otworów. Takim sposobem mam wyprowadzoną szynę I2C. Jak ktoś się przyjrzał rozpisce wolnych GPIO to zauważy, że GPIO 14 jest wolne. Teraz mam możliwość podłączenia np. czujnika temperatury DS18b20 pod GPIO 14 lub podłączania innych czujników pod szynę I2C. Po prawidłowym przylutowaniu przewodów do procesora powinno pojawić się na nich 3.3V jeśli nie ma trzeba lutować dalej :) Po poprawnym połączeniu nowych przewodów lekko zalałem je klejem &#8222;kropelką&#8221; tak aby zaraz mi nie odpadły.

[<img class="aligncenter size-full wp-image-12893" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-60.jpg" alt="" width="1000" height="650" />][15] [<img class="aligncenter size-full wp-image-12892" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-61.jpg" alt="" width="1000" height="650" />][16] [<img class="aligncenter size-full wp-image-12891" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-62.jpg" alt="" width="1000" height="650" />][17]

### EasyESP

Poniżej screeny z konfiguracji EasyESP. Dodatkowa opcją jaka została włączona jest opcja RULES do której dopisałem kod, który odpowiada za zmianę stanu przekaźnika i diody po naciśnięciu przycisku. Poniżej widać na screenach, że po podłączeniu jakiegoś urządzenia na I2C można zeskanować szynę i sprawdzić czy wykrywane są jakieś adresy.

[<img class="aligncenter wp-image-12918 size-large" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-39-56_1-589x1024.jpg" alt="EasyESP" width="589" height="1024" />][18] [<img class="aligncenter wp-image-12919 size-large" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-40-37_1-492x1024.jpg" alt="EasyESP" width="492" height="1024" />][19] [<img class="aligncenter wp-image-12920 size-large" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-40-52_1-560x1024.jpg" alt="EasyESP" width="560" height="1024" />][20] [<img class="aligncenter wp-image-12921 size-full" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-41-09_1.jpg" alt="" width="1000" height="425" />][21] [<img class="aligncenter wp-image-12922 size-large" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-41-31_1-931x1024.jpg" alt="EasyESP" width="800" height="880" />][22] [<img class="aligncenter wp-image-12923 size-full" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-41-46_1.jpg" alt="" width="1000" height="809" />][23] [<img class="aligncenter wp-image-12924 size-large" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-02_1-892x1024.jpg" alt="" width="800" height="918" />][24] [<img class="aligncenter wp-image-12925 size-large" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-23_1-923x1024.jpg" alt="EasyESP" width="800" height="888" />][25] [<img class="aligncenter wp-image-12926 size-full" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-38_1.jpg" alt="" width="1000" height="678" />][26] [<img class="aligncenter size-full wp-image-12927" src="//techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-56_1.jpg" alt="" width="1000" height="490" />][27]

#### OLED

Wyświetlacz jaki podłączyłem do SONOFF to OLED SSD1306 na I2C. Wywierciłem i przeszlifowałem dodatkowo w obudowie otwory aby przeszły przewody pod wyświetlacz.

[<img class="aligncenter size-full wp-image-12934" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2250.jpg" alt="" width="1000" height="650" />][28] [<img class="aligncenter size-full wp-image-12935" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2251.jpg" alt="" width="1000" height="650" />][29] [<img class="aligncenter size-full wp-image-12936" src="//techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2252.jpg" alt="" width="1000" height="650" />][30]

### Filmik z działania



Na filmie widać, że cały czas aktualny stan przekaźnika jest aktualizowany w nettemp. I nettemp jest w stanie sterować przekaźnikiem.

Mam nadzieje, że wszystko jest w miarę jasne i że z powodzeniem zrealizujesz swój projekt. Jak by co proszę o komentarze.

&nbsp;

 [1]: http://www.gearbest.com/living-appliances/pp_425033.html?lkid=10694945
 [2]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-50.jpg
 [3]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-51.jpg
 [4]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-52.jpg
 [5]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-53.jpg
 [6]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-54.jpg
 [7]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-55.jpg
 [8]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-56.jpg
 [9]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-57.jpg
 [10]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-58.jpg
 [11]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-59.jpg
 [12]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-162.jpg.png
 [13]: http://wiki.abc-service.tk/doku.php?id=esp8266:programowanie_esp8266:easyesp
 [14]: //techfreak.pl/wp-content/uploads/2017/05/pinout_frontx-sonoff.jpg
 [15]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-60.jpg
 [16]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-61.jpg
 [17]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-62.jpg
 [18]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-39-56_1.jpg
 [19]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-40-37_1.jpg
 [20]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-40-52_1.jpg
 [21]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-41-09_1.jpg
 [22]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-41-31_1.jpg
 [23]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-41-46_1.jpg
 [24]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-02_1.jpg
 [25]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-23_1.jpg
 [26]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-38_1.jpg
 [27]: //techfreak.pl/wp-content/uploads/2017/05/Screenshot_2017-05-04_21-42-56_1.jpg
 [28]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2250.jpg
 [29]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2251.jpg
 [30]: //techfreak.pl/wp-content/uploads/2017/05/techfreak-sonoff-esp8266-arduino-nettemo-relay-sterowanie-przekaznikiem-2252.jpg