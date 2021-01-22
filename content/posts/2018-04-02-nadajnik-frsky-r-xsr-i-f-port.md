---
title: Nadajnik FrSky R-XSR i F.PORT
author: Przemek
type: post
date: 2018-04-02T20:27:57+00:00
url: /nadajnik-frsky-r-xsr-i-f-port/
featured_image: /wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-105.jpg
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - betaflight
  - quadcopter
  - taranis

---
Zobacz jak zaktualizować odbiornik R-XSR i wgrać firmware z obsługa nowego protokołu F.Port.

<!--more-->

### Dlaczego używać F.Port?

F.Port to nowy protokół od FrSky, który został stworzony przy współpracy z developerami z Betaflight. Ma on na celu połączenie dwóch funkcjonalności SBUS (Serial Bus)(jednokierunkowa komunikacja do sterowania) i S.Port (dwukierunkowa komunikacja dla telemetrii, (zasięg, stan baterii, gps)). Oba protokoły wykorzystują transmisje szeregową (UART) i oba wykorzystują do tego jeden przewód sygnałowy. Czyli w przypadku chęci korzystania z dwóch protokołów trzeba użyć dwóch przewodów. F.Port łączy oba rozwiązania, wysyła i odbiera dane wykorzystując tylko jeden przewód. Dodatkowo transmisja posiada większą szybkość od S.Port &#8211; 115200baud . Plusem jest to, że oszczędzamy w kontrolerze lotu jeden UART . Cała instalacja jest prostsza i czystsza. Zyskujemy większą kompatybilność z procesorami F4, które posiadają UART noninverted.

### Aktualizacja odbiornika

Na początek trzeba pobrać z oficjalnej strony FrSky specjalny firmware aby obsługiwać protokół F.Port. Należy go rozpakować i wgrać na kartę SD do katalogu FIRMWARES. W zależności od wersji jaka się posiada, FCC lub LBT. Pisałem o tym pod tym linkiem <https://techfreak.pl/taranis-qx7-zmiana-firmware/>

[<img class="aligncenter size-full wp-image-14512" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-fport-frsky-201.png" alt="" width="1312" height="663" />][1]

[<img class="aligncenter size-full wp-image-14513" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-fport-frsky-202.png" alt="" width="222" height="140" />][2]

[<img class="aligncenter size-full wp-image-14514" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-fport-frsky-203.png" alt="" width="1232" height="304" />][3]

[<img class="aligncenter size-full wp-image-14503" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-101.jpg" alt="" width="1000" height="500" />][4]

W zestawie z odbiornikiem R-XSR zostały dołączone dwa przewody jeden służy do aktualizacji oprogramowania przez aparaturę a drugi już do docelowego podłączenia odbiornika do kontrolera lotu.

[  
<img class="aligncenter size-full wp-image-14504" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-102.jpg" alt="" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-14505" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-103.jpg" alt="" width="1000" height="500" />][6] [<img class="aligncenter size-full wp-image-14506" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-104.jpg" alt="" width="1000" height="500" />][7] [<img class="aligncenter size-full wp-image-14507" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-105.jpg" alt="" width="1000" height="500" />][8]

Po podłączeniu należy wybrać plik z karty SD i wskazać do jakiego urządzenia na zostać wgrany, menu wyboru nie widać na zdjęciu ale trzeba zaznaczyć plik naciskając enter.

[<img class="aligncenter size-full wp-image-14508" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-106.jpg" alt="" width="1000" height="500" />][9] [<img class="aligncenter size-full wp-image-14509" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-107.jpg" alt="" width="1000" height="500" />][10] [<img class="aligncenter size-full wp-image-14511" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-109.jpg" alt="" width="1000" height="500" />][11]

### Podłączenie

Testy wykonywałem na kontrolerze lotu HGLRC XJB F413 Omnibus F4.V2, który mam w [HGLRC Hornet120][12]. Standardowo Odbiornik RC podłączony jest pod port TX3 oznaczony jako SBUS. Jest to port inverted który nie obsługuje dwukierunkowej komunikacji. F.Port zadziała ale tylko w jedną stronę &#8211; mogę sterować quadem. Natomiast nie wyślę on żadnych danych do aparatury. Musiałem skorzystać z pinu TX6, który jest uninverted.

W odbiorniku R-XSR trzeba podłączyć się do pinu P, który jest uninverted. Niestety pin jest całkiem mały i trzeba uważać aby go później nie zerwać.

[<img class="aligncenter size-full wp-image-14522" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-wiring-40.jpg" alt="" width="1000" height="500" />][13]

### Betaflight 3.3.0

F.Port jest obsługiwany przez najnowszą wersje betaflight 3.3.0 aby włączyć tą opcje należy wskazać port UART, Recievier mode i Serial Recievier Provider w takiej kolejności poniżej.

[<img class="aligncenter size-full wp-image-14517" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-301.png" alt="" width="1809" height="489" />][14]

[<img class="aligncenter size-full wp-image-14518" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-302.png" alt="" width="688" height="282" />][15]

Diff z CLI betaflight. Tak aby porównać co się zmieniło.

[<img class="aligncenter size-full wp-image-14519" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-303.png" alt="" width="634" height="510" />][16]

&nbsp;

I tu myślałem, że nie trzeba będzie nic więcej robić aby F.Port działał poprawnie. Niestety myliłem się, trzeba dodać wpis **set serialrx_halfduplex = ON.** Wszystskie wpisy potrzebne do uruchomienia poniżej.

<pre>serial 5 64 115200 57600 0 115200
set serialrx_provider = FPORT
set serialrx_halfduplex = ON</pre>

### Wynik

Na poniższym wideo pokazuje, że działa sterowanie czyli odbieranie wysyłanie danych z aparatury. Jednym słowem działa sterowanie RC i konfiguracja opcjami kontrolera lotu.

<blockquote class="instagram-media" data-instgrm-permalink="https://www.instagram.com/p/BhEyz11AIFA/" data-instgrm-version="8" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:658px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);">
  <div style="padding:8px;">
    <div style=" background:#F8F8F8; line-height:0; margin-top:40px; padding:50.0% 0; text-align:center; width:100%;">
      <div style=" background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAMUExURczMzPf399fX1+bm5mzY9AMAAADiSURBVDjLvZXbEsMgCES5/P8/t9FuRVCRmU73JWlzosgSIIZURCjo/ad+EQJJB4Hv8BFt+IDpQoCx1wjOSBFhh2XssxEIYn3ulI/6MNReE07UIWJEv8UEOWDS88LY97kqyTliJKKtuYBbruAyVh5wOHiXmpi5we58Ek028czwyuQdLKPG1Bkb4NnM+VeAnfHqn1k4+GPT6uGQcvu2h2OVuIf/gWUFyy8OWEpdyZSa3aVCqpVoVvzZZ2VTnn2wU8qzVjDDetO90GSy9mVLqtgYSy231MxrY6I2gGqjrTY0L8fxCxfCBbhWrsYYAAAAAElFTkSuQmCC); display:block; height:44px; margin:0 auto -44px; position:relative; top:-22px; width:44px;">
      </div>
    </div>
    
    <p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;">
      <a href="https://www.instagram.com/p/BhEyz11AIFA/" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;" target="_blank">A post shared by techfreak (@techfreak_fpv)</a> on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2018-04-02T16:38:25+00:00">Apr 2, 2018 at 9:38am PDT</time>
    </p>
  </div>
</blockquote>



### Linkownia:

<li style="list-style-type: none;">
  <ul>
    <li>
      <a href="https://github.com/betaflight/betaflight/wiki/The-FrSky-FPort-Protocol">https://github.com/betaflight/betaflight/wiki/The-FrSky-FPort-Protocol</a>
    </li>
    <li>
      <a href="https://www.frsky-rc.com/r-xsr/">https://www.frsky-rc.com/r-xsr/</a>
    </li>
    <li>
      <a href="https://www.frsky-rc.com/frsky-betaflight-introduction-of-f-port-protocol/">https://www.frsky-rc.com/frsky-betaflight-introduction-of-f-port-protocol/</a>
    </li>
    <li>
      <a href="https://github.com/betaflight/betaflight/files/1491056/F.Port.protocol.betaFlight.V2.1.2017.11.21.pdf">https://github.com/betaflight/betaflight/files/1491056/F.Port.protocol.betaFlight.V2.1.2017.11.21.pdf</a>
    </li>
  </ul>
</li>

 [1]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-fport-frsky-201.png
 [2]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-fport-frsky-202.png
 [3]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-fport-frsky-203.png
 [4]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-101.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-102.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-103.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-104.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-105.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-106.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-107.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-xsr-fport-109.jpg
 [12]: https://www.banggood.com/HGLRC-HORNET-120mm-FPV-Racing-Drone-PNP-Omnibus-F4-OSD-13A-Blheli_S-ESC-5_8G-25100200350mW-VTX-p-1254621.html?cur_warehouse=CN&p=9H0114137951201303E0
 [13]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-wiring-40.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-301.png
 [15]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-302.png
 [16]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-frsky-fport-303.png