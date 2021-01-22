---
title: Jak zrobić flash ESC Multistar 10A do SimonK?
author: Przemek
type: post
date: 2014-08-12T05:11:30+00:00
url: /zrobic-flash-esc-multistar-10a-simonk/
featured_image: /wp-content/uploads/2014/08/IMG_20140611_001812_1.jpg
hits:
  - 660
dsq_thread_id:
  - 2919932026
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - multistar
  - SimonK

---
Kiedyś pisałem o tym że składam <a title="minicopter" href="http://techfreak.pl/pierwszy-mini-h-quadcopter/" target="_blank" rel="noopener">mini H quadcopter</a>, a dziś chciałbym pokazać jak zmienić firmware w regulatorach silników (ESC) na SimonK. Dlaczego SimonK? Ponieważ ten firmware pozwala na szybszą reakcje na zmianę PWM z kontrolera lotu. Co przekłada się na płynniejsze działanie silników. Ja będę wgrywać nowy firmware do <a title="ESC multistar 10A" href="http://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=25362" target="_blank" rel="noopener">Turnigy Multistar 10 Amp</a>. To są właśnie te z powyższego opisu mini H. W zasadzie po co o tym pisze? Bo mikroprocesor regulatora to Atmel Mega 8A MU o wymiarach 4,6mm x 4,6mm i nie ma wyprowadzonych pinów pod programator. Co powoduje że wgranie innego firmwaru jest dosyć trudne. Ale jak zawsze dla chcącego nic trudnego. Potrzeba trochę cierpliwości i precyzji :)

<!--more-->

O to pacjent w oryginalnej zielonej termokurczce, Multistar 10A.

<img class="alignnone" src="http://techfreak.pl/wp-content/uploads/2014/03/DSC_1794_1.jpg" alt="" width="1000" height="665" /> 

Tutaj już bez, zbliżenie pod lupą z lidla :

[  
][1] [<img class="aligncenter size-full wp-image-7475" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140811_204142_1.jpg" alt="IMG_20140811_204142_1" width="1000" height="1333" />][2]

Ok ale co będzie potrzebne do flashowania? Przede wszystkim programator. Najlepiej najpopularniejszy USBASP 2.0 + cienkie miedziane druciki z np. przewodu audio.

[<img class="aligncenter size-full wp-image-7474" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140811_202148_1.jpg" alt="IMG_20140811_202148_1" width="1000" height="500" />][1]

Na początek te cienkie druciki trzeba ocynować a nadmiar cyny usunąć. Trzeba znać jeszcze wyprowadzenia Atmega8A pod programator. Z pomocą przychodzi google grafika.

[<img class="aligncenter size-full wp-image-7481" src="http://techfreak.pl/wp-content/uploads/2014/08/atmega8_pinout.png" alt="atmega8_pinout" width="758" height="639" />][3]

&nbsp;

Do podłączenia programatora potrzebne są MOSI, MISO, CSK, RST, VCC, GND. Na rysunku są wyraźnie widoczne. A więc podłączam&#8230;

[<img class="aligncenter size-full wp-image-7472" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140611_001753_1.jpg" alt="IMG_20140611_001753_1" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-7473" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140611_001812_1.jpg" alt="IMG_20140611_001812_1" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-7470" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140610_234839_1.jpg" alt="IMG_20140610_234839_1" width="1000" height="500" />][6]

VCC czyli 5V i GND podłączyłem wtyczkę zasilania i PWM, RESET pod rezystor, żółty przewód. Czyli pestka. Zostały MISO, MOSI i CLK. Te przewody trzeba podłączyć drucikami. Za pierwszym razem szło całkiem sprawnie bo wystarczyło trochę wyżej nagrzać drucik i kleił się on do nóżki procesora. Trzeba uważać żeby nie oderwać drucika bo później lutowanie jest znacznie utrudnione.

Jest podłączony programator ale co z softem? Do wgrywania używam <a title="kkmultiflash tool" href="http://lazyzero.de/en/modellbau/kkmulticopterflashtool" target="_blank" rel="noopener">kkmulticopterflashtool_0.77beta8</a>. W sofcie trzeba wybrać:

  * programator &#8211; USBasp
  * controller &#8211; atmega 8-based brushless ESC + bootloader (8kB flash)
  * repository &#8211; Keda (kda)

[<img class="aligncenter size-full wp-image-7489" src="http://techfreak.pl/wp-content/uploads/2014/08/KKmulticopter_flash_multistar_10A.jpg" alt="KKmulticopter_flash_multistar_10A" width="825" height="619" />][7]

Wszystko jest ok więc można wgrywać!

[<img class="aligncenter size-full wp-image-7471" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140611_001643_1.jpg" alt="IMG_20140611_001643_1" width="1000" height="500" />][8]

Jak zobaczysz: avrdude done. Thank You. Oznacza to że wszystko poprawnie się wgrało i możesz cieszyć się nowym firmwarem.

Jeśli chcesz flashować inne kontrolery silników możesz znaleźć je na liście <a href="https://github.com/sim-/tgy" target="_blank" rel="noopener">https://github.com/sim-</a>. Trzeba wybrać odpowiedni typ. W przypadku wgrania nie poprawnego firmwaru prawdopodobnie spalisz i kontroler i silnik.

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140811_202148_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140811_204142_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/08/atmega8_pinout.png
 [4]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140611_001753_1.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140611_001812_1.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140610_234839_1.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2014/08/KKmulticopter_flash_multistar_10A.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140611_001643_1.jpg