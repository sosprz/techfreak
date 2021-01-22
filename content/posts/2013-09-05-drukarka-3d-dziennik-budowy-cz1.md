---
title: Drukarka 3D dziennik budowy cz1
author: Przemek
type: post
date: 2013-09-05T19:41:57+00:00
url: /drukarka-3d-dziennik-budowy-cz1/
featured_image: /wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax4_1.jpg
hits:
  - 9090
dsq_thread_id:
  - 1719150351
categories:
  - Drukarki 3D
  - Elektronika
tags:
  - drukarka 3d
  - pololu
  - Ramps 1.4
  - RepRap

---
Tym razem was zaskoczę! Nic nie testuję ani nie wrzucę jakiegoś fajnego newsa z technologii. Zaczynam budować drukarkę 3D model Mendelmax i podzielę się z wami moimi przygodami związanymi z tym tematem a na pewno się jakieś pojawią.

Ogólnie mam zawsze dużo pomysłów ale często jakoś kręcę się około tematu <a title="KMonitoring temperatury" href="http://techfreak.pl/nettemp/" target="_blank">nettempa</a> czyli mojego małego projektu pomiaru temperatury. Mam w głowie projekt płytki PCB do Raspbery Pi i często pojawia się też temat obudowy zamykającej projekt w jedną całość. I w pewnym sensie obudowa jest pretekstem do rozpoczęcia tematu drukowania przestrzennego. Pomijając to co chciałbym drukować to drukowanie elementów które można sobie samemu zaprojektować lub ściągnąć z [thingiverse.com][1] jest samo w sobie <del>zajebiste</del> fajne. Zastanawiałem się jak podejść do tematu budowy drukarki 3D i na początek robiłem ogólne wyliczenia co za ile, a że chciałem budować model <a title="MendelMax" href="http://reprap.org/wiki/MendelMax" target="_blank">MendelMax</a> 1.5 to te wyliczenia z grubsza wychodziły ok 2k. Niestety albo stety Mendelmax zbudowany jest z profili aluminiowych i budowa wychodzi drożej niż popularnej <a href="http://reprap.org/wiki/Prusa_Mendel/pl" target="_blank">Prusa Mendel</a>. Zacząłem szukać w necie kitów do samodzielnego złożenia aby zoptymalizować cały proces budowy i nie czekać na poszczególne części. Trafiłem na stronę [blomker.com][2] który oferuje kompletny KIT ale że miałem blokadę na PayPala i nawet dogadałem się na niższą cenę to ostatecznie wybór padł na KIT od <a href="http://gadgets3d.com/" target="_blank">gadgest3d.com</a> wychodziło sporo taniej. G3D to polska firma która zaprezentowała drukarkę Zortrax M200 na kickstarter i zdobyła z sukcesem ponad 178k $ od swoich zwolenników.

Części do drukarki przyszły po paru dniach i cały zestaw zrobił na mnie duże wrażenie. Wszystkie potrzebne części w jednym miejscu, to było jak wysypana kupa klocków LEGO na dywan z których można od razu budować. Poniżej parę fotek z paczki.

[<img class="aligncenter size-full wp-image-4826" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax0_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax0_1.jpg" width="800" height="600" />][3] [<img class="aligncenter size-full wp-image-4825" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax1_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax1_1.jpg" width="800" height="600" />][4] [<img class="aligncenter size-full wp-image-4824" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax2_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax2_1.jpg" width="800" height="1067" />][5] [<img class="aligncenter size-full wp-image-4823" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax3_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax3_1.jpg" width="800" height="1067" />][6] [<img class="aligncenter size-full wp-image-4822" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax4_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax4_1.jpg" width="800" height="600" />][7] [<img class="aligncenter size-full wp-image-4821" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax6_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax6_1.jpg" width="800" height="600" />][8] [<img class="aligncenter size-full wp-image-4820" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax7_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax7_1.jpg" width="800" height="1067" />][9] [<img class="aligncenter size-full wp-image-4819" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax8_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax8_1.jpg" width="800" height="600" />][10] [<img class="aligncenter size-full wp-image-4818" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9_1.jpg" width="800" height="600" />][11] [<img class="aligncenter size-full wp-image-4817" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-2" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-2.jpg" width="2448" height="3264" />][12] [<img class="aligncenter size-full wp-image-4816" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-5" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-5.jpg" width="2448" height="3264" />][13] [<img class="aligncenter size-full wp-image-4815" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-9" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-9.jpg" width="2448" height="3264" />][14] [<img class="aligncenter size-full wp-image-4814" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax11_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax11_1.jpg" width="800" height="1067" />][15] [<img class="aligncenter size-full wp-image-4813" alt="techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax12_1" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax12_1.jpg" width="800" height="600" />][16]

W paczce przyszły wszystkie potrzebne części co do śrubki i podkładki,  jest wszystko, cały zestaw. Ale po chwili coś mi nie pasowało. Układałem już wszystkie części do budowy i zorientowałem się że w paczce nie ma plastików! Go szybko na stronkę, sprawdzam a tam &#8222;_*This set does not include plastic parts._&#8222;. Nie mam pojęcia jak udało mi się przegapić tą informację. Napisałem wiadomość do G3D z zapytaniem czy maja w ofercie plastiki lub czy wystawią swoją paczkę do pobrania. W między czasie zabrałem się za to za co chciałem na końcu czyli elektronikę. Układ sterujący jaki jest w zestawie to <a title="Ramps" href="http://reprap.org/wiki/RAMPS_1.4" target="_blank">Ramps 1.4</a>. Na całość składa się <a title="Arduino Mega 2650" href="http://arduino.cc/en/Main/arduinoBoardMega2560" target="_blank">Arduino Mega 2560</a> i nakładany Shield do którego podłącza się pięć sterowników <a title="Pololu " href="http://reprap.org/wiki/G3D_driver" target="_blank">pololu A4988</a> które sterują silnikami <a title="Silniki Nema 17" href="http://reprap.org/wiki/NEMA_17_Stepper_motor" target="_blank">Nema 17</a>. I w zasadzie do tej płytki podłącza się wszystko od zasilania, zasilania grzałki hotendu, termistorów, endstopów, hotbed i takich dodatków jak czytnik kart SD lub LCD.

#### Konfiguracja silników

Zabrałem się za lutowanie przewodów do silników. Wziąłem na początek jeden z silników osi Z i jeden z pozostałych do extrudera lub osi x,y. Podłączyłem do płytki tylko dwa drivery silników i wpiąłem wtyczki. Bez szczegółowego konfigurowania docelowego softu <a title="RepRap Marlin" href="https://github.com/ErikZalm/Marlin" target="_blank">marlin</a>, na początek wgrałem [testowy program][17] żeby zobaczyć czy coś w ogóle działa.  Filmik poniżej.



Wiedziałem że z silnikami będzie jeszcze trochę roboty bo trzeba skonfigurować ustawiania kroku i prąd wyjściowy z driverów. Przed tym złożyłem resztę silników i powpinałem wszystko w rampsa.



Okazało się ze silniki osi Z zamiast się kręcić drżą. Na szczęście kiedyś natrafiłem na filmik który pokazuje jak prawidłowo maja działać silniki.



Trzeba było to poprawić. Przeglądam forum [mojreprap.pl][18] i wiedziałem jak skonfigurować dokładnie silniki ale nie znałem ich modelu i nie wiedziałem ile amperów pobierają. Gdagets3d nie podają nigdzie modelu ale napisali mi że oni ustawiają około 0.8V do 1V na Vref. Co by wynikało ze wzoru z <a href="http://reprap.org/wiki/G3D_driver" target="_blank">wiki driverów</a> że silniki zjadają 1-1.2 Ampera. Ja na początek ustawiłem 0.9V na vref.

Następną sprawą jaką trzeba skonfigurować były mikro kroki. Z defaulta wszystkie zworki były ustawione na 1/16. G3D przy okazji pytania o model motorów napisali mi ze zalecają dla osi Z ustawić mikro kroki 1/8. Co uczyniłem.

Po tych konfiguracjach silniki przestały drżeć i nie zatrzymywały się gdy napotkały opór. Nadmiernego nagrzewania też nie zanotowałem ale może to jeszcze nie ten etap.

Po instalacji G3D Cooling Plate i G3D Fan Splitter jeden z wiatraczków zaczął śmierdzieć i okazało się ze działa ale nagrzewa się do 35 stopni i jest do wymiany. Gdzie dla porównania drugi sprawny nagrzewa się do 25 stopni. G3D oczywiście napisali mi że wymienią na nowy.

[<img class="aligncenter size-full wp-image-4843" alt="techfreak_gadgets_g3d_coolingplate" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_gadgets_g3d_coolingplate.jpg" width="800" height="600" />][19]

#### oś Z



<span style="line-height: 1.5em;">Jak można zauważyć na filmiku silniki osi Z maja zamiast metalowej gładkiej osi od razu gwintowany pręt. Przyjrzałem się trochę im i zauważyłem że jeden z nich nie trzyma się swojej osi. Trochę mnie to zaniepokoiło bo czytałem o problemach z falowaniem osi Z, która może powodować falowanie na wydrukach. Zakładając że gwintowany pręt tylko podnosi a cała platforma (extruder, silnik, hotend) przesuwa się na gładkim pręcie można założyć że nie będzie miało to znaczenia. Sam jeszcze tego nie wiem ale na pewnie wrócę do tego tematu. G3D odniosło się do mojego pytania i stwierdzili że nie powinno to mieć wpływu na wydruki ale jak będą problemy to oczywiście wymienią cały silnik.</span>

#### Marlin & Pronterface

Nadszedł czas aby choć trochę zaprogramować procka i zobaczyć jak wygląda sterowanie silnikami z programu pronterface. Instalacja jest prosta a instrukcja i pliki są na <a href="https://github.com/kliment/Printrun" target="_blank">githubie</a>. Otworzyłem w Arduino marlin.ino i przeszedłem do configuration.h gdzie ustawiłem:

Szybkość RX/TX (nie wiem dlaczego nie działa na 250000 ale jest to do sprawdzenia jeszcze).

<pre>#define BAUDRATE 115200</pre>

Definiuje rodzaj użytej elektroniki numer **33 = RAMPS 1.3 / 1.4 (Power outputs: Extruder, Fan, Bed)**

<pre>#define MOTHERBOARD 33</pre>

Jako że nie mam podłączonych czujników temperatury a nie chce żeby pronterface wywalał mi błędy, wyłączam ja wstawiając 0

<pre>#define TEMP_SENSOR_0 0
#define TEMP_SENSOR_1 0
#define TEMP_SENSOR_2 0
#define TEMP_SENSOR_BED 0</pre>

#### Printer is now online

Screen z pronterface po podłączeniu do elektroniki.

[<img class="aligncenter size-full wp-image-4865" alt="techfreak_pronterface" src="http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pronterface.jpg" width="1293" height="730" />][20]

#### C.D.N

Na tym etapie to tyle aby ruszyć dalej muszę zakupić plastiki &#8230;.

 [1]: http://www.thingiverse.com/
 [2]: http://blomker.com/
 [3]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax0_1.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax1_1.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax2_1.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax3_1.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax4_1.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax6_1.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax7_1.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax8_1.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9_1.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-2.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-5.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax9-9.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax11_1.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pl_drukarka3d_gadgets3d_unpack_MendelMax12_1.jpg
 [17]: http://reprap.org/wiki/RAMPS_1.4#Pre-Flight_Check
 [18]: http://www.mojreprap.pl/board/viewtopic.php?f=13&t=2282
 [19]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_gadgets_g3d_coolingplate.jpg
 [20]: http://techfreak.pl/wp-content/uploads/2013/09/techfreak_pronterface.jpg