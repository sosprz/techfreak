---
title: Allwinner A13 mini komputer z tabletu
author: Przemek
type: post
date: 2014-12-22T16:12:04+00:00
url: /allwinner-a13-mini-komputer-z-tabletu/
featured_image: /wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_1-624x468.jpg
hits:
  - 2304
dsq_thread_id:
  - 3349458670
categories:
  - Elektronika
tags:
  - Raspberry pi
  - tablet

---
Kiedyś robiłem recenzję tabletu Manta MID8S, taki tani tablet za 150 zł z hipermarketu. Szczerze to nadawał się tylko dla dzieciaków na bajki nawet proste gry zacinały. Ostatnio spadł mi z ok 2 metrów na ziemie i jak można się domyślać ekran pękł. Naprawa nawet nie przyszła mi do głowy z oczywistych względów. Natomiast szybko zadałem sobie pytanie &#8222;a może jakiegoś linucha tam wgram? może ma dostępne gpio, I2C? Po przeszukaniu całego internetu znalazłem nawet gotowe obrazy na kartę SD. Zabawa się zaczęła..

<!--more-->

Jak wyglądał tablet manta mid08s można sobie zobaczyć pod <a href="http://techfreak.pl/mini-test-tabletu-manta-mid08s/" target="_blank">tym</a> linkiem. A jak wygląda teraz poniżej :) Poniżej widać dostępne piny UART TX,TR, I2C SDA, SCL. I to już wystarcza aby zamienić te bebechy na ciekawy mini komputerek z przeróżnymi czujnikami, wbudowaną kartą wifi (Realtek RL8188) i podtrzymaniem bateryjnym. Ja ostatnio do łączenia poprzez UART posługuję się przejściówką FTDI232RL z przełącznikiem 5v &#8211; 3.3V i tym razem ustawiłem napięcie na 3.3V.

<a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_i2c_gpio_uart_1/" rel="attachment wp-att-8388"><img class="aligncenter size-full wp-image-8388" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_1.jpg" alt="techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_1" width="1000" height="500" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_i2c_gpio_uart_2/" rel="attachment wp-att-8387"><img class="aligncenter size-full wp-image-8387" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_2.jpg" alt="techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_2" width="1000" height="500" /></a><a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_i2c_gpio_uart_3/" rel="attachment wp-att-8386"><img class="aligncenter size-full wp-image-8386" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_3.jpg" alt="techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_3" width="1000" height="500" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_i2c_gpio_uart_4/" rel="attachment wp-att-8385"><img class="aligncenter size-full wp-image-8385" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_4.jpg" alt="techfreak_allwiner_A13_manta_mid08s_i2c_gpio_UART_4" width="1000" height="500" /></a>

### System

Płyta posiada slot na kartę SD i pamięć eMMC o pojemności 4G na system. Ja używam karty SD do odpalania obrazu ściągniętego ze strony projektu olinuxino który zajmuje się sprzętem na układach allwiner i udostępnia bootowale obrazy. <a href="https://www.olimex.com/wiki/A13-OLinuXino#Linux" target="_blank">TU</a> znajduje się Dokładny link do mojego A13. A <a href="https://drive.google.com/file/d/0B-bAEPML8fwldmpYSlRzR1B0VHM/edit?usp=sharing" target="_blank">TU</a> bezpośredni link do obrazu. Generalnie jeśli masz w pełni sprawny tablet to po wgraniu takiego obrazu na kartę SD uruchomisz normalnie system z obsługą ekranu. I nie trzeba go w cale rozbierać.

### Wgrywanie obrazu na SD

Obraz trzeba rozpakować i wgrać przy pomocy dd na kartę sd. U mnie karta zgłasza się jako mmcblk0.

<pre>7za e A13_debian_34_90_WIFI_RALINK_GCC_GPIO_X_I2C_100KHz_UVC_TS_FTDI_3G_video_accell_release_10.7z
dd if=A13_debian_34_90_WIFI_RALINK_GCC_GPIO_X_I2C_100KHz_UVC_TS_FTDI_3G_video_accell_release_10.img of=/dev/mmcblk0</pre>

### Uruchomienie, wifi



Po wgraniu obrazu łączę się po serialu aby zmienić ustawienia karty wlan aby automatycznie łączyła się do mojego access pointa. Wtedy mam możliwość łączenia się po SSH.

#### Konfiguracja wifi

<a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek__1/" rel="attachment wp-att-8405"><img class="aligncenter size-full wp-image-8405" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__1.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__1" width="772" height="393" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek__2/" rel="attachment wp-att-8404"><img class="aligncenter size-full wp-image-8404" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__2.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__2" width="1366" height="768" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek__3/" rel="attachment wp-att-8403"><img class="aligncenter size-full wp-image-8403" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__3.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__3" width="649" height="390" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek__4/" rel="attachment wp-att-8402"><img class="aligncenter size-full wp-image-8402" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__4.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__4" width="543" height="175" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek__5/" rel="attachment wp-att-8401"><img class="aligncenter size-full wp-image-8401" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__5.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek__5" width="822" height="408" /></a>

**ufup wlan12 &** wstaw koniecznie przed exit 0

### Czujniki

Znalezienie szyny I2C nie było trudne do tego punkty lutownicze są w miarę duże aby można było łatwo coś do nich przylutować. Ja na początek przykleiłem czujnik ciśnienia i temperatury BMP180. Na pokładzie A13 na pewno znajduje się jeszcze akcelerometr.

### Bateria

Ile trzyma bateria bez włączonego ekranu? ok 6 godzin z zainstalowanym nettempem i wyłączonym podświetleniem. Parametry baterii to 3.7V 2800mAh.

### Nettemp

A13 z debianem idealnie nadaje się na zainstalowanie <a href="http://techfreak.pl/nettemp" target="_blank">nettempa</a> parę screenów poniżej z działania.

<a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek_nettemp_1_1/" rel="attachment wp-att-8411"><img class="aligncenter size-full wp-image-8411" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek_nettemp_1_1.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek_nettemp_1_1" width="1366" height="717" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek_nettemp_2_1/" rel="attachment wp-att-8410"><img class="aligncenter size-full wp-image-8410" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek_nettemp_2_1.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek_nettemp_2_1" width="1366" height="681" /></a> <a href="http://techfreak.pl/allwinner-a13-mini-komputer-z-tabletu/techfreak_allwiner_a13_manta_mid08s_wifi_rl8188_realtek_nettemp_3_1/" rel="attachment wp-att-8409"><img class="aligncenter size-full wp-image-8409" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek_nettemp_3_1.jpg" alt="techfreak_allwiner_A13_manta_mid08s_wifi_rl8188_realtek_nettemp_3_1" width="1366" height="681" /></a>

### koniec

Płytka posiada szynę I2C która daje wiele możliwości podłączenia różnych czujników. Port USB daje jeszcze więcej możliwości. Bateria podtrzymanie na parę godzin. Do sprawdzenia zostały piny GPIO ale i tak jest dobrze. Oczywiście A13 to nie jedyny tablet którego można uruchomić z karty SD. Więcej informacji można znaleźć na <a href="https://www.olimex.com/wiki/Main_Page" target="_blank">https://www.olimex.com/wiki/Main_Pag</a>e i <a href="http://linux-sunxi.org/Main_Page" target="_blank">http://linux-sunxi.org/Main_Page</a>. Jak masz pytania czekam na info w komentarzach.