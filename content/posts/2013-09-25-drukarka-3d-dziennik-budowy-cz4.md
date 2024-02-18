---
title: Drukarka 3D dziennik budowy cz4
author: Przemek
type: post
date: 2013-09-25T09:47:54+00:00
url: /drukarka-3d-dziennik-budowy-cz4/
featured_image: /wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_4.jpg
hits:
  - 3102
dsq_thread_id:
  - 1795195035
categories:
  - Drukarki 3D
  - Elektronika
tags:
  - drukarka 3d

---
Po ponad tygodniowej walce z konfiguracją są jakieś postępy, trochę się naczytałem, trochę eksperymentowałem ale wiem że jeszcze długa droga przede mną w temacie drukowania 3D. Były pierwsze wydruki więc jest motywacja. Po kolei postaram się przedstawić z jakimi problemami się spotkałem i co jeszcze mnie czeka.

<!--more-->

### endstop, home, pole robocze

Po złożeniu ramy i podłączeniu silników które już sprawdzałem w pierwszej części wszystko działało. W sensie mogłem z pronterface sterować silnikami. Sterowanie, sterowaniem ale dla wszystkich pozycji (X, Y, Z) trzeba określić punkt wyjściowy czyli HOME. Tą pozycje ustawia się endstop&#8217;ami czyli wyłącznikiem krańcowym. Po wybraniu przycisku HOME ALL wszystkie osie jadą tak długo w jedną stronę aż uderzą w endstopa. Co zdefiniuje własnie pozycję startową.

[<img class="aligncenter size-full wp-image-4958" alt="techfreak_pl_drukarka3d_endstop_MendelMax_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_1.jpg" width="3264" height="2448" />][1] [<img class="aligncenter size-full wp-image-4959" alt="techfreak_pl_drukarka3d_endstop_MendelMax_2" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_2.jpg" width="3264" height="2448" />][2] [<img class="aligncenter size-full wp-image-4960" alt="techfreak_pl_drukarka3d_endstop_MendelMax_3" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_3.jpg" width="2448" height="3264" />][3] [<img class="aligncenter size-full wp-image-4961" alt="techfreak_pl_drukarka3d_endstop_MendelMax_4" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_4.jpg" width="3264" height="2448" />][4] [<img class="aligncenter size-full wp-image-4962" alt="techfreak_pl_drukarka3d_endstop_MendelMax_5" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_5.jpg" width="2448" height="3264" />][5] [<img class="aligncenter size-full wp-image-4963" alt="techfreak_pl_drukarka3d_endstop_MendelMax_6" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_6.jpg" width="2448" height="3264" />][6]

&nbsp;

Wszystkie endstopy zamontowane trzeba pogrzebać w firmware aby teraz to wszystko razem działało. Jak widać powyżej ja użyłem krańcówek w trybie **NC** (Normal Closed). Co oznacza że jeśli osie nie są w pozycji **HOME** to maja stan** open** a jeśli są mają stan **triggered**. W pronterface aktualny stan endstopów można sprawdzić poprzez wydanie komendy **M119**. Co pomaga w zrozumieniu jaki mam teraz stan i jak go skonfigurować poprawnie. Ja użyłem sterowania masą w RAMPS 1.4 pin **S** i (minus). Czyli jak zero pojawi się na pinie S to mam stan **triggered.** Ok ale co w firmware? Tak naprawdę nie trzeba dużo zmieniać aby poprawnie ustalać pozycje home i maksymalną. Spróbuje omówić po kolei.

Pierwsza linią jaką można zobaczyć w sekcji ENDSTOPS jest:

<pre> #define ENDSTOPPULLUPS</pre>

W procesorach Atmega jest coś takiego jak <a href="http://arduino.cc/en/Tutorial/DigitalPins" target="_blank">rezystory podciągające</a> aby gdy pojawi się zero na pinie było ono utrzymane w tym stanie cały czas. Ja steruje zerem więc zostawiam tą opcje w spokoju. Można sterować też plusem za co odpowiada poniższy wpis i trzeba zmienić false na true:

<pre>const bool X_MIN_ENDSTOP_INVERTING = false</pre>

Pozycje maksymalną może wyliczać program lub możemy użyć do tego krańcówek. Ja wole aby pozycja maksymalna była wyliczana więc muszę wyłączyć endstopy. Domyślnie wpis jest wyłączony znakami **// **

<pre dir="ltr">#define DISABLE_MAX_ENDSTOPS</pre>

Ja ustawiłem dla osi X endstop po lewej stronie więc muszę też ustawić kierunek jazdy i czy po lewej mam home czy po prawej stronie. Kierunki ustawia się definiując **INVERT\_X\_DIR** a pozycje HOME** X\_HOME\_DIR. **

<pre>#define INVERT_X_DIR false // for Mendel set to false, for Orca set to true
#define INVERT_Y_DIR true // for Mendel set to true, for Orca set to false
#define INVERT_Z_DIR false // for Mendel set to false, for Orca set to true
#define INVERT_E0_DIR false // for direct drive extruder v9 set to true, for geared extruder set to false
#define INVERT_E1_DIR false // for direct drive extruder v9 set to true, for geared extruder set to false
#define INVERT_E2_DIR false // for direct drive extruder v9 set to true, for geared extruder set to false

// ENDSTOP SETTINGS:
// Sets direction of endstops when homing; 1=MAX, -1=MIN
#define X_HOME_DIR -1
#define Y_HOME_DIR -1
#define Z_HOME_DIR -1</pre>

Po takiej konfiguracji po naciśnięciu HOME ALL wszystkie osie powinny podjechać do krańcówek. Wypadało by tez ustawić pole robocze bo wcześniej ustawiłem że nie ma krańcówek dla maksymalnej pozycji więc skądś program musi wiedzieć gdzie jest koniec pola roboczego. Ja ustawiłem na początek pole po 200mm. I pewnie tu się nic nie zmieni bo ogranicza mnie konstrukcja.

<pre>// Travel limits after homing
#define X_MAX_POS 200
#define X_MIN_POS 0
#define Y_MAX_POS 200
#define Y_MIN_POS 0
#define Z_MAX_POS 200
#define Z_MIN_POS 0</pre>

Tak skonfigurowane krańcówki, pozycja home i pole robocze pozwala iść dalej&#8230;.

### Filament

Niby wsadzenie filamentu to taka prosta sprawa a na początku są problemy. Na początku kiedy wkładałem kawałek drutu do extrudera wszystko działało. Kiedy obracałem kołem drut był wciągany. Problem pojawił się gdy już był hotend a drut się kończył. Okazało się że pierwszym problemem jest docisk który za lekko przykręcałem i radełko kręciło mi się na drucie robiąc wyżłobienie i nie wciągało go. Druga sprawa to po obcięciu drutu ostrymi końcami zahaczał o ścianki i nie chciał wchodzić do środka. Trzeba po prostu go przeszlifować przed włożeniem. Poniżej fotki jak czyściłem radełko i jak to wygląda z góry.

[<img class="aligncenter size-full wp-image-4974" alt="techfreak_pl_drukarka3d_radelko_MendelMax_0" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_radelko_MendelMax_0.jpg" width="1000" height="650" />][7] [<img class="aligncenter size-full wp-image-4975" alt="techfreak_pl_drukarka3d_radelko_MendelMax_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_radelko_MendelMax_1.jpg" width="1000" height="1333" />][8]

&nbsp;

### Kroki dla OSI X Y Z

Chyba najważniejszą sprawą jest wyliczenie poprawnych kroków dla silników. Ja zastosowałem się do instrukcji ze strony <a href="http://www.reprap.org/wiki/Triffid_Hunter%27s_Calibration_Guide" target="_blank">reprap.org</a>. Dane jakie są potrzebne do wyliczeń to:

  * kroki silników = 200
  * mikro krok = 16 dla Y X, dla Z = 8
  * zęby dużej zębatki ekstrudera = 43
  * zęby małej zębatki ekstrudera = 10
  * radełko w najmniejszym punkcie styku = 6,58mm
  * szerokość pomiędzy zębami na pasku X Y E = 2mm
  * ilość zębów na rolce X Y E = 20

**Ekstruder**

Wzór z powyższej stronki:

<pre> e_steps_per_mm = (motor_steps_per_rev * driver_microstep) * (big_gear_teeth / small_gear_teeth) / (hob_effective_diameter * pi)</pre>

Moje wyliczenie:

<pre>(200*16)*(43/10) / (3.14159*6,58) = 665,64</pre>

**oś Y X **

Wzór:

<pre>steps_per_mm = (motor_steps_per_rev * driver_microstep) / (belt_pitch * pulley_number_of_teeth)</pre>

Moje wyliczenie:

<pre>(200*16)/(2*20) = 80</pre>

**oś Z**

<pre>steps_per_mm = (motor_steps_per_rev * driver_microstep) / thread_pitch</pre>

Moje wyliczenie:

<pre>(200*8)/1,25 = 1280</pre>

Powyższe wyliczenia trzeba umieścić we wpisie:

<pre>#define DEFAULT_AXIS_STEPS_PER_UNIT   {80, 80, 1280, 665,64}</pre>

<span style="line-height: 1.5em;"> W pierwszych wydrukach można zobaczyć że z osią Z jest coś nie tak więc pewnie trzeba w tych danych będzie coś poprawić.</span>

### Pierwsze wydruki

No to jest postęp, są jakieś wydruki. Jest jakiś kształt ale jak na razie wydruki przypominają makaron do zupki chińskiej. Wychodzi na to że mam jakieś problemy z kalibracją osi Z. Gdy drukarka zaczyna hotend ustawia się ok 3mm nad stołem i wydruki lecą w powietrzu. Przy okazji pisania tego wpisu okazało się że źle wyliczyłem kroki dla extrudera zamiast swojej wartości dałem inna co zmieniło dosyć mocno wynik końcowy.

[<img class="aligncenter size-full wp-image-4968" alt="techfreak_pl_drukarka3d_MendelMax_pierwsze_wydruki" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_MendelMax_pierwsze_wydruki.jpg" width="1000" height="650" />][9]





### MendelMax

Tak wygląda złożona drukarka ale w stanie jeszcze roboczym. Jak już zacznie drukować mam plan wydrukować mocowanie elektroniki na przód i zrobić porządki z przewodami.

[<img class="aligncenter size-full wp-image-4980" alt="techfreak_pl_drukarka3d_wersja_robocza_MendelMax_0" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_0.jpg" width="1000" height="1333" />][10] [<img class="aligncenter size-full wp-image-4981" alt="techfreak_pl_drukarka3d_wersja_robocza_MendelMax_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_1.jpg" width="1000" height="650" />][11] [<img class="aligncenter size-full wp-image-4982" alt="techfreak_pl_drukarka3d_wersja_robocza_MendelMax_2" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_2.jpg" width="1000" height="650" />][12] [<img class="aligncenter size-full wp-image-4983" alt="techfreak_pl_drukarka3d_wersja_robocza_MendelMax_3" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_3.jpg" width="1000" height="1333" />][13] [<img class="aligncenter size-full wp-image-4984" alt="techfreak_pl_drukarka3d_wersja_robocza_MendelMax_4" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_4.jpg" width="1000" height="1333" />][14]

### Co dalej&#8230;

Ciąg dalszy jak tylko uporam się z osią Z. Napisałem na forum <a href="http://www.mojreprap.pl/board/viewtopic.php?f=50&t=2532&p=24377" target="_blank">mojreprap</a> może coś ktoś mi podpowie.

 [1]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_2.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_3.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_4.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_5.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_endstop_MendelMax_6.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_radelko_MendelMax_0.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_radelko_MendelMax_1.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_MendelMax_pierwsze_wydruki.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_0.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_1.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_2.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_3.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_wersja_robocza_MendelMax_4.jpg