---
title: Jak zbudować quadcopter? FPV250 + NAZE32 + DYS-BE1806
author: Przemek
type: post
date: 2014-09-01T05:40:29+00:00
url: /zbudowac-quadcopter-fpv250-naze32-dys-be1806/
featured_image: /wp-content/uploads/2014/08/IMG_20140827_200833_1.jpg
hits:
  - 6419
dsq_thread_id:
  - 2976972408
xyz_fbap:
  - 1
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - frsky
  - naze32
  - quadcopter
  - SimonK

---
Przy okazji budowy mojej nowej maszyny latającej zrobiłem małą fotorelację z budowy którą chciałbym się z wami podzielić. Tym razem buduję nowego quadcoptera z paru powodów. Po pierwsze jest tańszy niż poprzednie wersje (<a title="Mini H quadcopter" href="http://techfreak.pl/pierwszy-mini-h-quadcopter/" target="_blank" rel="noopener">pierwsza</a>, <a title="Hobby king fpv 250" href="http://techfreak.pl/miniquadcopter-hobbyking-fpv250/" target="_blank" rel="noopener">druga</a>, <a title="RCX 1804" href="http://techfreak.pl/nowe-silniki-rcx1804/" target="_blank" rel="noopener">trzecia</a>) i lepszy sprzętowo. W stosunku do poprzednich wersji w sumie zmieniło się prawie wszystko. Zaczynając od zmiany odbiornika <a title="D8R-II plus" href="http://www.frsky-rc.com/product/pro.php?pro_id=22" target="_blank" rel="noopener">D8R-II plus</a> na <a title="D4R II" href="http://www.frsky-rc.com/product/pro.php?pro_id=24" target="_blank" rel="noopener">D4R-II</a> który jest o wiele mniejszy a ma tą samą ilość kanałów ale tylko na jednym fizycznym kanale (PPM). Do zmiany poszły silniki <a title="RCX1804" href="http://www.myrcmart.com/zmr-1804-2400kv-micro-outrunner-brushless-motor-clockwise-p-6281.html" target="_blank" rel="noopener">RCX1804</a> na rzecz mocniejszych <a title="DYS1806" href="http://www.banggood.com/DYS-BE1806-2300KV-Brushless-Motor-2-3S-For-Mini-Multicopters-p-933192.html" target="_blank" rel="noopener">DYS-BE1806</a>. Kontroler lotu został zamieniony z <a title="KK 2.1" href="http://www.hobbyking.com/hobbyking/store/__54299__hobbyking_kk2_1_5_multi_rotor_lcd_flight_control_board_with_6050mpu_and_atmel_644pa.html" target="_blank" rel="noopener">KK 2.1</a> na <a title="MultiWii AIO" href="http://www.hobbyking.com/hobbyking/store/__31138__multiwii_and_megapirate_aio_flight_controller_w_ftdi_atmega_2560_v2_0.html" target="_blank" rel="noopener">MultiWii AIO</a> a na końcu został <a title="Naze32" href="http://www.hobbyking.com/hobbyking/store/__55819__AfroFlight_Naze32_Acro_AbuseMark_FunFly_Controller.html?strSearch=naze32" target="_blank" rel="noopener">NAZE32</a> który jest mniejszy i o wiele lepiej pasuje  do mini quadcopterów. Co do ramy, może jej nie zmieniłem ale zakupiłem trzecia wersję FPV250 która pozwala na różne ciekawe konfiguracje.

<!--more--><figure id="attachment_7584" aria-describedby="caption-attachment-7584" style="width: 1000px" class="wp-caption aligncenter">

[<img class="wp-image-7584 size-full" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_200833_1.jpg" alt="IMG_20140827_200833_1" width="1000" height="650" />][1]<figcaption id="caption-attachment-7584" class="wp-caption-text">FPV250 NAZE32 DYS1806 D4R-II</figcaption></figure> 

Po złożeniu całego potrzebnego sprzętu zabrałem się za budowę.

### RAMA FPV250

Rama w wersji FPV250v3 LH z HobbyKing

[<img class="aligncenter size-full wp-image-7587" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_215556_1.jpg" alt="IMG_20140818_215556_1" width="1000" height="650" />][2] [<img class="aligncenter size-full wp-image-7588" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_220352_1.jpg" alt="IMG_20140818_220352_1" width="1000" height="650" />][3] [<img class="aligncenter size-full wp-image-7589" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_220905_1.jpg" alt="IMG_20140818_220905_1" width="1000" height="650" />][4] [<img class="aligncenter size-full wp-image-7590" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_220856_1.jpg" alt="IMG_20140818_220856_1" width="1000" height="650" />][5] [<img class="aligncenter size-full wp-image-7591" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_222141_1.jpg" alt="IMG_20140818_222141_1" width="1000" height="650" />][6] [<img class="aligncenter size-full wp-image-7592" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_221458_1.jpg" alt="IMG_20140818_221458_1" width="1000" height="650" />][7] [<img class="aligncenter size-full wp-image-7593" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_222145_1.jpg" alt="IMG_20140818_222145_1" width="1000" height="650" />][8]

Ramę można różnie konfigurować, np. klatkę montując na dole można zastosować większe śmigła niż 5&#215;30.

### Silniki i ESC

Silniki DYS 1806 zamówione z banggood i kontrolery (ESC) RCX 10A G series z firmware SimonK. Silniki postanowiłem połączyć bezpośrednio z kontrolerami które musiały dostać nowe koszulki. Na ESC najlepsze są koszulki o średnicy 19.5mm. Przewody PWM skróciłem o połowę bo zawszę się walają. Poniżej specyfikacja do silników, na większych śmigłach mają większy udźwig. W wersji trzeciej ramy FPV250 z klatką na dole można właśnie takie zainstalować.

[<img class="aligncenter size-full wp-image-7611" src="http://techfreak.pl/wp-content/uploads/2014/08/SKU147223-10.jpg" alt="SKU147223-10" width="600" height="223" />][9]

[<img class="aligncenter size-full wp-image-7598" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_214520_1.jpg" alt="IMG_20140828_214520_1" width="1000" height="650" />][10] [<img class="aligncenter size-full wp-image-7596" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_213056_1.jpg" alt="IMG_20140828_213056_1" width="1000" height="650" />][11] [<img class="aligncenter size-full wp-image-7597" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_224351_1.jpg" alt="IMG_20140828_224351_1" width="1000" height="650" />][12] [<img class="aligncenter size-full wp-image-7599" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_224530_1.jpg" alt="IMG_20140828_224530_1" width="1000" height="650" />][13] [<img class="aligncenter size-full wp-image-7600" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_225208_1.jpg" alt="IMG_20140828_225208_1" width="1000" height="650" />][14] [<img class="aligncenter size-full wp-image-7602" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_230244_1.jpg" alt="IMG_20140828_230244_1" width="1000" height="650" />][15]

### Zasilanie i kontroler lotu

Kontroler lotu naze32 jest mały i posiada rozstaw na montaż śrubek 30.5mm. Płytkę zasilanie jaką akurat posiadałem miała rozstaw który pasował pod ramę  (45mm) ale nie można było do niej przymocować naze32. Trzeba było wiercić nowe otwory w płytce. Wszystko to po aby i kontroler lotu i płytka zasilania znalazły się pod kopułka zabezpieczającą od ramy. We wcześniejszych wersjach musiałem budować klatkę z ramy <a title="ZMR 250" href="http://techfreak.pl/fajna-mini-rama-do-quadcoptera/" target="_blank" rel="noopener">ZMR 250</a> która mi się nie podobała. Nylonowe dystanse wykorzystałem z ramy ZMR, tak samo nakrętki które zrobiłem z dystansów.

[<img class="aligncenter size-full wp-image-7605" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_211928_1.jpg" alt="IMG_20140827_211928_1" width="1000" height="650" />][16] [<img class="aligncenter size-full wp-image-7607" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_205145_1.jpg" alt="IMG_20140828_205145_1" width="1000" height="650" />][17] [<img class="aligncenter size-full wp-image-7606" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_205203_1.jpg" alt="IMG_20140828_205203_1" width="1000" height="650" />][18] [<img class="aligncenter size-full wp-image-7608" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_205900_1.jpg" alt="IMG_20140828_205900_1" width="1000" height="650" />][19]

### Odbiornik D4R-II konfiguracja PPM

Zamieniłem odbiornik D8R-II plus na D4R-II z powodu wymiarów i generalnie jest trochę tańszy. Dużym plusem jest konfiguracja ppm w której odbiornik połączony jest z kontrolerem tylko poprzez jeden potrójny kabelek. Zamiast minimum pięciu.

[<img class="aligncenter size-full wp-image-7614" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_213432_1.jpg" alt="IMG_20140827_213432_1" width="1000" height="650" />][20] [<img class="aligncenter size-full wp-image-7615" src="http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_213635_1.jpg" alt="IMG_20140827_213635_1" width="1000" height="650" />][21]

Jedyną rzeczą jaką trzeba zrobić aby w pełni działał ppm na ośmiu kanałach to wgrać nowy <a href="http://www.frsky-rc.com/download/view.php?sort=&down=4&file=Firmware-D4R-II_27mS" target="_blank" rel="noopener">firmware ze strony producenta</a>. Do tego trzeba mieć kabelek USB FrSky lub układ USB na UARS232 FT232RL.

### Flash D4R-II

[<img class="aligncenter size-full wp-image-7617" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash0.jpg" alt="D4R-II_firmware_flash0" width="3264" height="2448" />][22]

#### Poniżej instrukcja jak wgrać lepszy firmware do odbiornika D4R-II.

Zakupiłem układ na FT232RL w sumie fajny bo ma przełącznik z 3.3V na 5V co jest wygodne.

[<img class="aligncenter size-full wp-image-7619" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash2.jpg" alt="D4R-II_firmware_flash2" width="1000" height="650" />][23]

Ze strony producenta ściągnąłem program do wgrywania nowego firmware.

[<img class="aligncenter size-full wp-image-7621" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash1.jpg" alt="D4R-II_firmware_flash1" width="1022" height="521" />][24]

Dodatkowo trzeba pobrać program do ustawień FT232RL, FT_PROG i zaznaczyć tam INVERT TXD i INVERT RXD aby móc w ogóle połączyć się z odbiornikiem i wgrać jakikolwiek firmware.

[<img class="aligncenter size-full wp-image-7624" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash3-1.jpg" alt="D4R-II_firmware_flash3-1" width="628" height="669" />][25] [<img class="aligncenter size-full wp-image-7625" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash3-2.jpg" alt="D4R-II_firmware_flash3-2" width="626" height="661" />][26] [<img class="aligncenter size-full wp-image-7626" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash3-3.jpg" alt="D4R-II_firmware_flash3-3" width="629" height="666" />][27]

Po przygotowaniu przejściówki podłączyłem ją według instrukcji ze strony producenta do odbiornika. RX -TX, TX-RX, GND-GND.

[<img class="aligncenter size-full wp-image-7676" src="http://techfreak.pl/wp-content/uploads/2014/09/D4R-II_firmware_flash3_1.jpg" alt="D4R-II_firmware_flash3_1" width="1000" height="650" />][28]

&nbsp;

&nbsp;

Czas na odpalenie programu do zmiany firmwaru. Trzeba pamiętać aby odbiornik był w trybie boot zworka na 1-2 pinie sygnałowym w odbiorniku.

[<img class="aligncenter size-full wp-image-7627" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash4.jpg" alt="D4R-II_firmware_flash4" width="852" height="520" />][29] [<img class="aligncenter size-full wp-image-7628" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash5.jpg" alt="D4R-II_firmware_flash5" width="682" height="481" />][30] [<img class="aligncenter size-full wp-image-7629" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash6.jpg" alt="D4R-II_firmware_flash6" width="853" height="519" />][31] [<img class="aligncenter size-full wp-image-7630" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash7.jpg" alt="D4R-II_firmware_flash7" width="854" height="519" />][32] [<img class="aligncenter size-full wp-image-7631" src="http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash8.jpg" alt="D4R-II_firmware_flash8" width="854" height="526" />][33]

Po wgraniu firmwaru można wyciągnąć zworkę z 1-2 i przełożyć do 3-4 aby włączyć PPM.

### Naze32 i PPM

Aby w naze32 uruchomić tryb ppm trzeba wydać jedno polecenie z CLI, ppm enable. W ogóle do łączenia się z płytką używam po prostu przeglądarki chrome z odpaloną aplikacją <a href="https://chrome.google.com/webstore/detail/baseflight-configurator/mppkgnedeapfejgfimkdoninnofofigk" target="_blank" rel="noopener">baseflight</a>. Po wydaniu polecenia trzeba zrobić save konfiguracji poprzez wpisanie: save.

[<img class="aligncenter size-full wp-image-7633" src="http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm1.jpg" alt="naze32_ppm1" width="1360" height="681" />][34] [<img class="aligncenter size-full wp-image-7634" src="http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm2_cli.jpg" alt="naze32_ppm2_cli" width="1359" height="683" />][35] [<img class="aligncenter size-full wp-image-7635" src="http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm3_enable.jpg" alt="naze32_ppm3_enable" width="1358" height="686" />][36] [<img class="aligncenter size-full wp-image-7636" src="http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm4_enable_save.jpg" alt="naze32_ppm4_enable_save" width="1356" height="681" />][37] [<img class="aligncenter size-full wp-image-7637" src="http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm5_enabled.jpg" alt="naze32_ppm5_enabled" width="1357" height="701" />][38]

Po tych operacjach kończę konfigurowanie trybu PPM dla odbiornika i kontrolera. Przechodzę do próby flashowania samego naze32 tak z ciekawości.

### Naze32 firmware flash

Byłem ciekawy czy przez aplikacje baseflight da radę zaktualizować bez problemu naze32. I operacja przebiegła prawidłowo pod warunkiem że przejdzie się w tryb boot. Czyli trzeba zewrzeć dwa piny na płytce naze32 oznaczone boot, najlepiej płaskim śrubokrętem. Podłączyć zasilanie i po 2 sekundach odsunąć śrubokręt. W programie baseflight w prawym dolnym rogu jest przycisk Firmware Flasher. Dużym ułatwieniem jest też ściąganie firmwaru online: Load Firmware [online]. I flash on connect, kiedy po odsunięciu śrubokręta z padów boot program automatycznie zaczyna wgrywać nowy firmware.

[<img class="aligncenter size-full wp-image-7640" src="http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher1.jpg" alt="naze32_firmware_flasher1" width="1347" height="435" />][39]

[<img class="aligncenter size-full wp-image-7641" src="http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher2.jpg" alt="naze32_firmware_flasher2" width="1358" height="672" />][40] [<img class="aligncenter size-full wp-image-7642" src="http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher3_1.jpg" alt="naze32_firmware_flasher3_1" width="1000" height="650" />][41] [<img class="aligncenter size-full wp-image-7643" src="http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher4.jpg" alt="naze32_firmware_flasher4" width="1064" height="533" />][42]

### Składanie, budowanie

Dalej więcej fotek ze składania, generalnie mój cel został osiągnięty udało mi się ukryć wszystko pod małą kopułką ochronną. Chciałem mieć dwie opcje konfiguracji ze sprzętem fpv i bez. Na teraz jeszcze go nie mam więc będę latał bez klatki. A gdy tylko pojawi się, bez problemu nałożę klatkę i zamontuję dodatkowy sprzęt bez żadnych modyfikacji.

[<img class="aligncenter size-full wp-image-7646" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140828_234939_1.jpg" alt="IMG_20140828_234939_1" width="1000" height="650" />][43] [<img class="aligncenter size-full wp-image-7647" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140828_234934_1.jpg" alt="IMG_20140828_234934_1" width="1000" height="650" />][44] [<img class="aligncenter size-full wp-image-7648" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_101031_1.jpg" alt="IMG_20140830_101031_1" width="1000" height="650" />][45]

[<img class="aligncenter size-full wp-image-7650" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_101050_1.jpg" alt="IMG_20140830_101050_1" width="1000" height="650" />][46] [<img class="aligncenter size-full wp-image-7651" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_122543_1.jpg" alt="IMG_20140830_122543_1" width="1000" height="650" />][47] [<img class="aligncenter size-full wp-image-7652" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131601_1.jpg" alt="IMG_20140830_131601_1" width="1000" height="650" />][48] [<img class="aligncenter size-full wp-image-7653" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131557_1.jpg" alt="IMG_20140830_131557_1" width="1000" height="650" />][49] [<img class="aligncenter size-full wp-image-7654" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131605_1.jpg" alt="IMG_20140830_131605_1" width="1000" height="650" />][50] [<img class="aligncenter size-full wp-image-7655" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131618_1.jpg" alt="IMG_20140830_131618_1" width="1000" height="650" />][51] [<img class="aligncenter size-full wp-image-7656" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131612_1.jpg" alt="IMG_20140830_131612_1" width="1000" height="650" />][52] [<img class="aligncenter size-full wp-image-7657" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131653_1.jpg" alt="IMG_20140830_131653_1" width="1000" height="650" />][53] [<img class="aligncenter size-full wp-image-7658" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131635_1.jpg" alt="IMG_20140830_131635_1" width="1000" height="650" />][54] [<img class="aligncenter size-full wp-image-7659" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131656_1.jpg" alt="IMG_20140830_131656_1" width="1000" height="650" />][55] [<img class="aligncenter size-full wp-image-7660" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131703_1.jpg" alt="IMG_20140830_131703_1" width="1000" height="650" />][56] [<img class="aligncenter size-full wp-image-7661" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131711_1.jpg" alt="IMG_20140830_131711_1" width="1000" height="650" />][57] [<img class="aligncenter size-full wp-image-7662" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131808_1.jpg" alt="IMG_20140830_131808_1" width="1000" height="650" />][58] [<img class="aligncenter size-full wp-image-7663" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132237_1.jpg" alt="IMG_20140830_132237_1" width="1000" height="650" />][59] [<img class="aligncenter size-full wp-image-7664" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132324_1.jpg" alt="IMG_20140830_132324_1" width="1000" height="650" />][60] [<img class="aligncenter size-full wp-image-7665" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132242_1.jpg" alt="IMG_20140830_132242_1" width="1000" height="650" />][61] [<img class="aligncenter size-full wp-image-7666" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132331_1.jpg" alt="IMG_20140830_132331_1" width="1000" height="650" />][62]

Z dodatkowych rzeczy to obowiązkowo zainstalowałem <a title="FrSky" href="http://www.hobbyking.com/hobbyking/store/__16671__frsky_battery_voltage_sensor_frsky_telemetry_system_.html" target="_blank" rel="noopener">FrSky Battery Voltage Sensor </a>aby znać poziom rozładowania baterii. Oczywiście dostał też nową koszulkę.

[<img class="aligncenter size-full wp-image-7649" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_103543_1.jpg" alt="IMG_20140830_103543_1" width="1000" height="650" />][63]

&nbsp;

### Pierwszy lot

W naze32 nie trzeba było nic konfigurować oprócz PPM, i kalibracji żyroskopu. A no może jeszcze Minimum throttle na 1150. PID nie ruszałem w ogóle aby zobaczyć jak będzie. Czytałem że podobno nie trzeba wiele robić ale i tak byłem zaskoczony że jest tak dobrze.



### Bluetooth

Aby jednak na spokojnie podkonfigurować sobie PID np. YAW bo zawsze jest dla mnie za słaby. Podłączyłem pod TX i RX kontrolera <a title="bluetooth HC-06" href="http://techfreak.pl/skonfigurowac-modul-bluetooth-hc-06/" target="_blank" rel="noopener">bluetooth HC-06 o którym pisałem kiedyś</a>. Mam go ustawionego na 115200 i nie musiałem nić robić więcej aby połączyć się do naze32 i zacząć konfigurować. Program na androida jaki ściągnąłem to <a title="NAZE32" href="https://play.google.com/store/apps/details?id=com.naze32.configurator&hl=pl" target="_blank" rel="noopener">Naze32/Multiwii Configurator</a>.

[<img class="aligncenter size-full wp-image-7669" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_175015_1.jpg" alt="IMG_20140830_175015_1" width="1000" height="650" />][64] [<img class="aligncenter size-full wp-image-7670" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_175024_1.jpg" alt="IMG_20140830_175024_1" width="1000" height="650" />][65]

### Kiedy więcej latania?

Niestety nie polatałem długo, bo w weekend nie było dobrej pogody ale na razie jestem zadowolony z budowy i mam nadzieje że będzie to ostatni setup pod FPV. Bo ciągłe grzebanie w jednym modelu to zastój w treningach :) Postaram się dodać jakieś wyniki lotów na różnych bateriach i nowe filmiki.

### Lista części $$$

<a href="http://www.hobbyking.com/hobbyking/store/__16671__frsky_battery_voltage_sensor_frsky_telemetry_system_.html" target="_blank" rel="noopener">FrSky Battery Voltage Sensor</a> 2,55$

<a href="http://www.banggood.com/DYS-BE1806-2300KV-Brushless-Motor-2-3S-For-Mini-Multicopters-p-933192.html" target="_blank" rel="noopener">4 x DYS BE1806 2300KV Brushless Motor 2-3S</a> 39,16$

<a href="https://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=61388" target="_blank" rel="noopener">FPV250LH Low Hung Clean-and-Dirty (KIT)</a> 19,99$

<a href="https://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=55819" target="_blank" rel="noopener">AfroFlight Naze32 Acro</a> 25$

<a href="https://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=24788" target="_blank" rel="noopener">FrSky D4R-II 4ch 2.4Ghz</a> 20,09$

<a href="http://www.myrcmart.com/rcx-10a-esc-brushless-motor-speed-controller-series-programed-for-multicopter-simonk-firmware-p-6074.html" target="_blank" rel="noopener">RCX 10A ESC G series</a> 31,96

RAZEM: 138,75$

## EDIT:

Zapomniałem o wadze całości bez baterii.

[<img class="aligncenter size-full wp-image-7690" src="http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140908_163356_1.jpg" alt="IMG_20140908_163356_1" width="1000" height="650" />][66]

### Dodatkowa funkcja:  Lost Model Alarm



### Pierwsze flipy



### Kolejne flipy



### Nowa rama

<a href="http://techfreak.pl/diatone-37-nowa-rama-dla-quadcoptera/" target="_blank" rel="noopener">http://techfreak.pl/diatone-37-nowa-rama-dla-quadcoptera/</a>

&nbsp;

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_200833_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_215556_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_220352_1.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_220905_1.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_220856_1.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_222141_1.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_221458_1.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140818_222145_1.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2014/08/SKU147223-10.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_214520_1.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_213056_1.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_224351_1.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_224530_1.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_225208_1.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_230244_1.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_211928_1.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_205145_1.jpg
 [18]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_205203_1.jpg
 [19]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140828_205900_1.jpg
 [20]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_213432_1.jpg
 [21]: http://techfreak.pl/wp-content/uploads/2014/08/IMG_20140827_213635_1.jpg
 [22]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash0.jpg
 [23]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash2.jpg
 [24]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash1.jpg
 [25]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash3-1.jpg
 [26]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash3-2.jpg
 [27]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash3-3.jpg
 [28]: http://techfreak.pl/wp-content/uploads/2014/09/D4R-II_firmware_flash3_1.jpg
 [29]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash4.jpg
 [30]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash5.jpg
 [31]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash6.jpg
 [32]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash7.jpg
 [33]: http://techfreak.pl/wp-content/uploads/2014/08/D4R-II_firmware_flash8.jpg
 [34]: http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm1.jpg
 [35]: http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm2_cli.jpg
 [36]: http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm3_enable.jpg
 [37]: http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm4_enable_save.jpg
 [38]: http://techfreak.pl/wp-content/uploads/2014/08/naze32_ppm5_enabled.jpg
 [39]: http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher1.jpg
 [40]: http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher2.jpg
 [41]: http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher3_1.jpg
 [42]: http://techfreak.pl/wp-content/uploads/2014/09/naze32_firmware_flasher4.jpg
 [43]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140828_234939_1.jpg
 [44]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140828_234934_1.jpg
 [45]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_101031_1.jpg
 [46]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_101050_1.jpg
 [47]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_122543_1.jpg
 [48]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131601_1.jpg
 [49]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131557_1.jpg
 [50]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131605_1.jpg
 [51]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131618_1.jpg
 [52]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131612_1.jpg
 [53]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131653_1.jpg
 [54]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131635_1.jpg
 [55]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131656_1.jpg
 [56]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131703_1.jpg
 [57]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131711_1.jpg
 [58]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_131808_1.jpg
 [59]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132237_1.jpg
 [60]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132324_1.jpg
 [61]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132242_1.jpg
 [62]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_132331_1.jpg
 [63]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_103543_1.jpg
 [64]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_175015_1.jpg
 [65]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140830_175024_1.jpg
 [66]: http://techfreak.pl/wp-content/uploads/2014/09/IMG_20140908_163356_1.jpg