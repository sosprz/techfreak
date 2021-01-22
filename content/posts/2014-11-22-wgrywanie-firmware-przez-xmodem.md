---
title: Wgrywanie firmware przez xmodem
author: Przemek
type: post
date: 2014-11-21T23:20:09+00:00
url: /wgrywanie-firmware-przez-xmodem/
featured_image: /wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_2.jpg
hits:
  - 189
dsq_thread_id:
  - 3250260394
categories:
  - Network
tags:
  - HP Procurve

---
Hej, tym razem trochę temat sieciowo linuxowy, bo dotyczący wgrywania firmwar&#8217;u do przełącznika HP Procurve poprzez kabel serial a w zasadzie do każdego urządzenia które wymaga zgrywania/wgrywania plików poprzez xmodem. Wiadomo że wygdoniej postawić serwer tftpd lub wgrać plik poprzez ssh (file transfer) ale czasem jest tak że z jakiegoś innego powodu lub przy całkowitym braku firmwar&#8217;u (primary, secondary) trzeba wgrać potrzebny plik.

<!--more-->

### Co będzie potrzebne?

Na pewno pakiet lrzsz, który korzysta z protokołów XMODEM, YMODEM, ZMODEM. W moim przypadku, firmware i przełącznik HP Procurve 3500 do którego muszę wgrać firmware i programik do obsługi konsoli GtkTerm.

<address>
  INFO: można było by użyć też pakietu cutecom który ma w sobie od razu opcje załadowania pliku poprzez XMODEM ale niestety u mnie nie działał.
</address>

<pre>aptitude install lrzsz gtkterm</pre>

Na początek zmieniam szybkość z 9600 na 155200

<pre>console baud-rate 115200
boot</pre>

<a href="http://techfreak.pl/wgrywanie-firmware-przez-xmodem/techfreakpl_hp_procurve_firmware_xmodem_1/" rel="attachment wp-att-8187"><img class="aligncenter size-full wp-image-8187" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_1.jpg" alt="techfreakpl_HP_procurve_firmware_xmodem_1" width="762" height="582" /></a>  
<a href="http://techfreak.pl/wgrywanie-firmware-przez-xmodem/techfreakpl_hp_procurve_firmware_xmodem_2/" rel="attachment wp-att-8188"><img class="aligncenter size-full wp-image-8188" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_2.jpg" alt="techfreakpl_HP_procurve_firmware_xmodem_2" width="939" height="591" /></a>

Wydaje polecenie które uruchomi start transferu poprzez XMODEM

<pre>copy flash xmodem</pre>

<a href="http://techfreak.pl/wgrywanie-firmware-przez-xmodem/techfreakpl_hp_procurve_firmware_xmodem_3/" rel="attachment wp-att-8189"><img class="aligncenter size-full wp-image-8189" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_3.jpg" alt="techfreakpl_HP_procurve_firmware_xmodem_3" width="761" height="587" /></a>

&nbsp;

I teraz ważne, ustawiam prędkość mojego seriala którym się łącze i nie zamykam GTKterma (nie nie krzyknie błędem że jest zajęty)

<pre>stty -F /dev/ttyUSB0 115200</pre>

odpalam sx gdzie K\_15\_16 to firmware

<pre>sx -vv K_15_16_0004.swi &lt; /dev/ttyUSB0 &gt; /dev/ttyUSB0</pre>

&nbsp;

<a href="http://techfreak.pl/wgrywanie-firmware-przez-xmodem/techfreakpl_hp_procurve_firmware_xmodem_4/" rel="attachment wp-att-8190"><img class="aligncenter size-full wp-image-8190" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_4.jpg" alt="techfreakpl_HP_procurve_firmware_xmodem_4" width="1131" height="666" /></a>

Po jakiś 30 minutach firmware się wgrywa kończąc linią: Transfer complete

<a href="http://techfreak.pl/wgrywanie-firmware-przez-xmodem/techfreakpl_hp_procurve_firmware_xmodem_5/" rel="attachment wp-att-8191"><img class="aligncenter size-full wp-image-8191" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_5.jpg" alt="techfreakpl_HP_procurve_firmware_xmodem_5" width="985" height="180" /></a>

Wgrany firmware

<pre>show flash</pre>

<a href="http://techfreak.pl/wgrywanie-firmware-przez-xmodem/techfreakpl_hp_procurve_firmware_xmodem_6/" rel="attachment wp-att-8192"><img class="aligncenter size-full wp-image-8192" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_HP_procurve_firmware_xmodem_6.jpg" alt="techfreakpl_HP_procurve_firmware_xmodem_6" width="757" height="581" /></a>

&nbsp;

Wgrywanie przez serial to głównie przygoda z utraconym lub skasowanym firmwar&#8217;em ale mam nadzieje że komuś się przyda. Sam znalazłem tą informację gdzieś kiedyś w necie i mi się przydaje ;)

&nbsp;