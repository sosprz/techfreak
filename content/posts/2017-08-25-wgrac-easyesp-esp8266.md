---
title: Jak wgrać EasyESP do ESP8266
author: Przemek
type: post
date: 2017-08-25T07:02:41+00:00
url: /wgrac-easyesp-esp8266/
featured_image: /wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-0.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6094470734
categories:
  - Elektronika
tags:
  - easyesp
  - ESP8266
  - wemos

---
Jak wgrać firmware EasyESP Mega do ESP8266?

<!--more-->

Ja korzystam z płytek deweloperskich [WEMOS D1][1], które maja na pokładzie nie tylko ESP8266 ale też złącze micro USB, które bardzo ułatwia całą zabawę z tymi układami.

Na stronie projektu [EasyESP][2] można znaleźć starą wersję EasyESP i nowszą EasyESP mega, w sekcji releases można pobrać paczkę ZIP w której znajdują się potrzebne pliki, na tą chwilę to jest [aktualna paczka][3]. Po rozpakowaniu struktura katalogów będzie wyglądała jak poniżej.

[<img class="aligncenter size-full wp-image-13102" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-1.jpg" alt="" width="1000" height="188" />][4]

Widać że w paczce znajdują się narzędzia do wgrywania plików bin ale są to programy tylko na platformę Windows. Aby wgrać bin do ESP8266 na linuksie trzeba pobrać Esptool z github.

Ja robię to poprzez gita i robie to już w katalogu z wcześniej ściągniętymi binarkami:

<pre>git clone https://github.com/espressif/esptool</pre>

Następnie wgrywam plik ESPEasy\_v2.0.0-dev11\_normal_4096.bin do mojego urządzenia WEMOS D1, które zgłosiło się w systemie pod urządzeniem /dev/ttyUSB0.

<pre>esptool/esptool.py --port /dev/ttyUSB0 write_flash 0x00000 ESPEasy_v2.0.0-dev11_normal_4096.bin</pre>

<pre>tf@E74:~/hdd/app/EASY ESP MEGA$ esptool/esptool.py --port /dev/ttyUSB0 write_flash 0x00000 ESPEasy_v2.0.0-dev11_normal_4096.bin 
esptool.py v2.1
Connecting....
Detecting chip type... ESP8266
Chip is ESP8266
Uploading stub...
Running stub...
Stub running...
Configuring flash size...
Auto-detected Flash size: 4MB
Compressed 558896 bytes to 368940...
Wrote 558896 bytes (368940 compressed) at 0x00000000 in 32.4 seconds (effective 137.8 kbit/s)...
Hash of data verified.

Leaving...
Hard resetting...</pre>

&nbsp;

Po wgraniu pliku z firmware, układ zacznie rozgłaszać sieć o nazwie ESP_0. Sieć jet zabezpieczona hasłem **configesp**. Po zalogowaniu się do sieci w przeglądarce trzeba wejść na adres IP 192.168.4.1. Poniżej zrzuty z programu.

[<img class="aligncenter size-full wp-image-13103" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-2.jpg" alt="" width="1000" height="434" />][5] [<img class="aligncenter size-full wp-image-13104" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-3.jpg" alt="" width="1000" height="1247" />][6] [<img class="aligncenter size-full wp-image-13105" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-4.jpg" alt="" width="1000" height="436" />][7] [<img class="aligncenter size-full wp-image-13106" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-5.jpg" alt="" width="1000" height="1198" />][8]

&nbsp;

EasyESP ma wiele możliwości takich jak podłączenie wielu różnych urządzeń pomiarowych lub kontrolowania stanu GPIO. Co za tym idzie daje możliwość np. sterowania ciepłem w domu. Polecam przeczytać mój [wpis][9] na temat urządzenia SONOFF który działa z EasyESP.

&nbsp;

 [1]: https://www.banggood.com/WeMos-D1-Mini-V2-NodeMcu-4M-Bytes-Lua-WIFI-Internet-Of-Things-Development-Board-Based-ESP8266-p-1115398.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling
 [2]: https://github.com/letscontrolit/ESPEasy
 [3]: https://github.com/letscontrolit/ESPEasy/releases/download/v2.0.0-dev9/ESPEasy_v2.0.0-dev9.zip
 [4]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-1.jpg
 [5]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-2.jpg
 [6]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-3.jpg
 [7]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-4.jpg
 [8]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-easyesp-mega-ubuntu-5.jpg
 [9]: //techfreak.pl/sonoff-gotowy-uklad-sterowania-przekaznikiem-esp8266/