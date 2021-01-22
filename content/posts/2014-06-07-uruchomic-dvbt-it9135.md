---
title: Jak uruchomić DVBT na it9135
author: Przemek
type: post
date: 2014-06-07T21:14:05+00:00
url: /uruchomic-dvbt-it9135/
featured_image: /wp-content/uploads/2014/06/me_tv_3.jpg
hits:
  - 1094
dsq_thread_id:
  - 2745385481
categories:
  - Elektronika
tags:
  - tv
  - ubuntu

---
Przy grzebaniu w moich kartonach znalazłem tuner DVB-T USB na układzie it9135 którego nigdy w zasadzie nie uruchomiłem i tak do końca nie używałem. Tym razem udało mi się uruchomić programy TV, więc pokaże Ci jak to zrobiłem.

<!--more-->

Po włożeniu tunera do USB dostałem takie komunikaty jak poniżej z których można wyczytać że nie mam  odpowiedniego firmwar&#8217;u do tego tunera.

<pre>[ 7647.180808] usb 2-1.2: new high-speed USB device number 4 using ehci-pci
 [ 7647.275262] usb 2-1.2: New USB device found, idVendor=048d, idProduct=9135
 [ 7647.275275] usb 2-1.2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
 [ 7647.414106] it913x: Chip Version=02 Chip Type=9135
 [ 7647.415229] it913x: Dual mode=0 Tuner Type=38it913x: Unknown tuner ID applying default 0x60
 [ 7647.416985] usb 2-1.2: dvb_usb_v2: found a 'ITE 9135 Generic' in cold state
 [ 7647.417648] usb 2-1.2: Direct firmware load failed with error -2
 [ 7647.417652] usb 2-1.2: Falling back to user helper
 [ 7647.418581] usb 2-1.2: dvb_usb_v2: Did not find the firmware file 'dvb-usb-it9135-02.fw'. Please see linux/Documentation/dvb/ for more details on firmware-problems. Status -2
 [ 7647.418592] dvb_usb_it913x: probe of 2-1.2:1.0 failed with error -2</pre>

Ściągnąłem program do ściągania firmwarów do DVB-T i ściągnąłem firmware :)

<pre>cd /lib/firmware
sudo wget https://raw.githubusercontent.com/torvalds/linux/master/Documentation/dvb/get_dvb_firmware
./get_dvb_firmware it9135</pre>

Wyciągnąłem i włożyłem ponownie tuner a z logów wyszło że jest ok:

<pre>[ 8169.551109] usb 2-1.2: dvb_usb_v2: found a 'ITE 9135 Generic' in cold state
[ 8169.551255] usb 2-1.2: dvb_usb_v2: downloading firmware from file 'dvb-usb-it9135-02.fw'
[ 8169.551668] it913x: FRM Starting Firmware Download
[ 8169.775976] it913x: FRM Firmware Download Completed - Resetting Deviceit913x: Chip Version=02 Chip Type=9135
[ 8169.810571] it913x: Firmware Version 52887808&lt;6&gt;[ 8169.881155] usb 2-1.2: dvb_usb_v2: found a 'ITE 9135 Generic' in warm state
[ 8169.881301] usb 2-1.2: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
[ 8169.881573] DVB: registering new adapter (ITE 9135 Generic)
[ 8169.906469] it913x-fe: ADF table value :00
[ 8169.910501] it913x-fe: Crystal Frequency :12000000 Adc Frequency :20250000 ADC X2: 01
[ 8169.946071] it913x-fe: Tuner LNA type :60
[ 8170.193266] usb 2-1.2: DVB: registering adapter 0 frontend 0 (ITE 9135 Generic_1)...
[ 8170.236841] Registered IR keymap rc-it913x-v1
[ 8170.237117] input: ITE 9135 Generic as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/rc/rc0/input17
[ 8170.237393] rc0: ITE 9135 Generic as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/rc/rc0
[ 8170.237413] usb 2-1.2: dvb_usb_v2: schedule remote query interval to 250 msecs
[ 8170.237425] usb 2-1.2: dvb_usb_v2: 'ITE 9135 Generic' successfully initialized and connected</pre>

Zainstalowałem ME TV

<pre> sudo aptitude install me-tv</pre>

Następnie wybrałem skanowanie z użyciem pliku startowego który jest już dostarczony z programem i mój tuner znalazł osiem stacji. Screeny poniżej.

&nbsp;

[<img class="aligncenter size-full wp-image-7182" src="http://techfreak.pl/wp-content/uploads/2014/06/me_tv_1.jpg" alt="me_tv_1" width="538" height="633" />][1]

[<img class="aligncenter size-full wp-image-7183" src="http://techfreak.pl/wp-content/uploads/2014/06/me_tv_2.jpg" alt="me_tv_2" width="571" height="618" />][2]

[<img class="aligncenter size-full wp-image-7184" src="http://techfreak.pl/wp-content/uploads/2014/06/me_tv_3.jpg" alt="me_tv_3" width="1164" height="725" />][3]

[<img class="aligncenter size-full wp-image-7185" src="http://techfreak.pl/wp-content/uploads/2014/06/me_tv_4.jpg" alt="me_tv_4" width="1080" height="726" />][4]

Jak widać poszło sprawnie i przyjemnie. Mogę oglądać teraz programy na lapku a TV wywalić na złom. W sumie ciekawe jak to uruchomić na XBMC&#8230;.

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/06/me_tv_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/06/me_tv_2.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/06/me_tv_3.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/06/me_tv_4.jpg