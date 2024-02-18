---
title: Drukarka 3D dziennik budowy cz7
author: Przemek
type: post
date: 2013-11-20T06:37:38+00:00
url: /drukarka-3d-dziennik-budowy-cz7/
featured_image: /wp-content/uploads/2013/11/P1050473_1.jpg
hits:
  - 2439
dsq_thread_id:
  - 1981605898
categories:
  - Drukarki 3D
tags:
  - RepRap

---
Jeśli ktoś myślał że ostatnia cześć dziennika budowy drukarki 3D skończyła się na 6 odcinku to będzie zaskoczony. Trochę się wydarzyło i jest co opisywać. Jednym słowem. ONE MEN, ONE DESIRE, ONE WAZONIK!! DRUKARKA 3D. SUN!!

<!--more-->

No własnie, nie jest tak łatwo jak się podziewałem ogarnąć na wszystko co pozwoli drukować na początek. Trzeba się trochę namęczyć, potestować, nauczyć. W poprzedniej części pisałem że rurki PTFE kurczą mi się pod wpływem ciepła. Dokładnie nie wiedziałem dlaczego. Miła ekipa z <a title="G3D" href="http://www.gadgets3d.com/" target="_blank">Gadgets3D</a> wysłała mi nowe rurki ale niestety nie doczekały się instalacji bo mój PEEK czyli część HOTEND&#8217;u stopiła się. Fotki poniżej.

[<img class="aligncenter size-full wp-image-5252" alt="3431_1" src="http://techfreak.pl/wp-content/uploads/2013/11/3431_1.jpg" width="1000" height="650" />][1] [<img class="aligncenter size-full wp-image-5253" alt="3432_1" src="http://techfreak.pl/wp-content/uploads/2013/11/3432_1.jpg" width="1000" height="650" />][2] [<img class="aligncenter size-full wp-image-5254" alt="3433_1" src="http://techfreak.pl/wp-content/uploads/2013/11/3433_1.jpg" width="1000" height="650" />][3] [<img class="aligncenter size-full wp-image-5255" alt="3434_1" src="http://techfreak.pl/wp-content/uploads/2013/11/3434_1.jpg" width="1000" height="650" />][4] [<img class="aligncenter size-full wp-image-5256" alt="3435_1" src="http://techfreak.pl/wp-content/uploads/2013/11/3435_1.jpg" width="1000" height="650" />][5]

[<img class="aligncenter size-full wp-image-5345" alt="IMG_20131021_215657_1" src="http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131021_215657_1.jpg" width="1000" height="1333" />][6]

Taki widok zastałem gdy przyszedłem do mojej jaskini techniki (jaskinia techniki &#8211; pomieszczenie w mieszkaniu 1,3^2 gdzie mam swoje graty). Jedyne co udało mi się ustalić to to że, stopił się PEEK bo temperatura była za duża, czyli powyżej 250 stopni. Ale dlaczego tak się stało? Czy mam szaloną grzałkę lub zepsuty czujnik temperatury? Temperatura drukowania to 235C a termistor działa poprawnie &#8211; co wykazały późniejsze testy.

Musiałem kupić nowy hotend. Zacząłem się zastanawiać nad głowicami full metal żeby nie mieć już nigdy problemu z PEEK&#8217;iem ani PTFE a nawet rozpocząłem wątek na <a href="http://www.mojreprap.pl/board/viewtopic.php?f=12&t=2678" target="_blank">forum mojreprap</a>. Znalazłem głowice <a href="http://e3d-online.com/index.php?route=product/product&path=20&product_id=53" target="_blank">E3D v5</a> ok 300zł, <a href="http://prusanozzle.org/" target="_blank">prusa nozzle</a> ok 400zł a nawet coś polskiego <a href="http://3dlabtek.weebly.com/3d-labtek-hot-end.html" target="_blank">3D Labtek</a> ok 200zł. Po informacjach w necie E3D i Prusa wysuwały się na prowadzenie aż w końcu zdecydowałem się kupić prusa nozzle ze sklepu <a href="http://reprapsource.com/" target="_blank">reprapsource.com</a>. Po paru dniach kurierem przyszła głowica. Fotki poniżej.

[<img class="aligncenter size-full wp-image-5260" alt="prusa1_1" src="http://techfreak.pl/wp-content/uploads/2013/11/prusa1_1.jpg" width="1000" height="650" />][7] [<img class="aligncenter size-full wp-image-5258" alt="DSC_1120_1" src="http://techfreak.pl/wp-content/uploads/2013/11/DSC_1120_1.jpg" width="1000" height="665" />][8] [<img class="aligncenter size-full wp-image-5259" alt="DSC_1121_1" src="http://techfreak.pl/wp-content/uploads/2013/11/DSC_1121_1.jpg" width="1000" height="665" />][9] [<img class="aligncenter size-full wp-image-5257" alt="DSC_1117_1" src="http://techfreak.pl/wp-content/uploads/2013/11/DSC_1117_1.jpg" width="1000" height="665" />][10]

Cenną dla mnie informacją była dla mnie notka na <http://prusanozzle.org/setup/> gdzie Prusa pisze aby zwiększyć kontrolę nad temperaturą zaleca się zmniejszenie PID_MAX na 50%. Co zrobiłem od razu. Po zainstalowaniu hotendu temperatura rzeczywiście trzymała się zadanej bez żadnych skoków. Nie wykonywałem też jeszcze autoregulacji **M303**. Tak wygląda zainstalowana głowica. Fotka poniżej.

[<img class="aligncenter size-full wp-image-5263" alt="prusa2_1" src="http://techfreak.pl/wp-content/uploads/2013/11/prusa2_1.jpg" width="1000" height="1333" />][11]

Instalacja z przejściówka jeszcze od starej głowicy i z wydrukowanym [groove mount plate for jhead][12]. Którego musiałem lekko zmodyfikować ale okazało się że ugina się przy wpychaniu filamentu. Na forum dałem ogłoszenie że kupię grove mounta z aluminium i szybko znalazłem sprzedającego. Po paru dniach za 21 zł mount leżał już u mnie.

[<img class="aligncenter size-full wp-image-5264" alt="IMG_20131106_110139_1" src="http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131106_110139_1.jpg" width="1000" height="650" />][13]

<span style="line-height: 1.5em;">Okazało się też że muszę chłodzić żeberka głowicy aby filament nie nagrzewał się zbyt wysoko bo się korkował i trzeba było rozbierać wszystko bo zastygał pomiędzy ekstruderem a hotendem. </span>

[<img class="aligncenter size-full wp-image-5265" alt="IMG_20131110_001515_1" src="http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131110_001515_1.jpg" width="1000" height="650" />][14]

Po złożeniu groove mounta i instalacji wiatraczka okazało się że wiatraczek 25mm powoduje duży spadek temperatury na głowicy z 195 dla PLA do 170 co powodowało by przerwanie wydruku. Zamontowałem specjalną blaszkę separującą blok grzejny od żeberek głowicy. Filmik poniżej.



Postanowiłem testować drukarkę na PLA ponieważ nagrzewanie stołu do 70 stopni to chwila a do 115 dla ABS to cała wieczność. Za dużo czasu traciłem na testy. A testowanie na PLA to dobra droga. Na początek spróbowałem wydrukować wazę <http://www.thingiverse.com/thing:137931> na kaptonie z podgrzanym stołem do 50C i bingo.Wazonik wydrukował się całkiem fajnie ale nie jest to najlepszy wybór bo na kaptonie wydruk nie trzyma się tak dobrze.

[<img class="aligncenter size-full wp-image-5304" alt="IMG_20131106_234338_1" src="http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131106_234338_1.jpg" width="1000" height="1333" />][15] [<img class="aligncenter size-full wp-image-5305" alt="IMG_20131107_005352_1" src="http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131107_005352_1.jpg" width="1000" height="1333" />][16]

Fajnie, ale chciałem spróbować drukować na samej szybie, w tym przypadku zalecana jest temperatura stołu 70C. Tym razem wydruk trzymał się bardzo dobrze ale inne figurki niż wazonik zaczęły wychodzić gorzej. Wtedy wpadłem na pomysł żeby zamontować w końcu jeden z wiatraczków których mi G3D napakowało do paczki. I kolejne bingo, ameryki nie odkryłem ale wydruki zaczęły wychodzić porządnie. Poniżej fotki figurki <http://www.thingiverse.com/thing:154019> ta gorsza wersja jest bez chłodzenia.

[<img class="aligncenter size-full wp-image-5335" alt="P1050473_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050473_1.jpg" width="1000" height="650" />][17]



Przy okazji wysłałem żonę do IKEA po lustra które świetnie nadają się do drukowania. <http://www.ikea.com/pl/pl/catalog/products/60074007/>.

Od czasu do czasu borykałem się też z problemem wyżłobionego rowka w filamencie. Dzieje się tak kiedy filament się zapcha z jakiegoś powodu a silnik dalej go pcha. Cały czas miałem wrażenie że przy retrakcji lub po, radełko robiło to wyżłobienie. Znajomy doradził mi zmianę śruby taką z rzadszymi / większymi ząbkami. Postanowiłem się posłuchać bo ciężko nie posłuchać kogoś kto ma naprawdę fajne wydruki. Wybór padł na <a href="http://www.pjd-automatyka.pl/" target="_blank">PJD Automatyka</a>, CNC shop na Allegro też oferuje śruby w tej samej cenie. Jak na razie nie zdarzyła mi się ta sytuacja ponownie. Poniżej porównanie.

[<img class="aligncenter size-full wp-image-5337" alt="IMG_20131108_130053_1" src="http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131108_130053_1.jpg" width="1000" height="650" />][18]

[<img class="aligncenter size-full wp-image-5339" alt="P1050475_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050475_1.jpg" width="1000" height="650" />][19]

Zacząłem drukować różne rzeczy. Poniżej linki i parę fotek jak to wszystko mi wychodzi.

<http://www.thingiverse.com/thing:154019>

<http://www.thingiverse.com/thing:137931>

<http://www.thingiverse.com/thing:50544>

<http://www.thingiverse.com/thing:879>

<http://www.thingiverse.com/thing:31639>

[<img class="aligncenter size-full wp-image-5319" alt="P1050451_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050451_1.jpg" width="1000" height="650" />][20] [<img class="aligncenter size-full wp-image-5320" alt="P1050452_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050452_1.jpg" width="1000" height="650" />][21] [<img class="aligncenter size-full wp-image-5321" alt="P1050453_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050453_1.jpg" width="1000" height="650" />][22] [<img class="aligncenter size-full wp-image-5322" alt="P1050454_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050454_1.jpg" width="1000" height="650" />][23] [<img class="aligncenter size-full wp-image-5323" alt="P1050455_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050455_1.jpg" width="1000" height="650" />][24] [<img class="aligncenter size-full wp-image-5324" alt="P1050456_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050456_1.jpg" width="1000" height="650" />][25] [<img class="aligncenter size-full wp-image-5325" alt="P1050457_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050457_1.jpg" width="1000" height="650" />][26] [<img class="aligncenter size-full wp-image-5326" alt="P1050458_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050458_1.jpg" width="1000" height="650" />][27] [<img class="aligncenter size-full wp-image-5327" alt="P1050459_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050459_1.jpg" width="1000" height="650" />][28] [<img class="aligncenter size-full wp-image-5328" alt="P1050460_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050460_1.jpg" width="1000" height="650" />][29] [<img class="aligncenter size-full wp-image-5329" alt="P1050461_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050461_1.jpg" width="1000" height="650" />][30] [<img class="aligncenter size-full wp-image-5330" alt="P1050462_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050462_1.jpg" width="1000" height="650" />][31] [<img class="aligncenter size-full wp-image-5331" alt="P1050463_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050463_1.jpg" width="1000" height="650" />][32] [<img class="aligncenter size-full wp-image-5332" alt="P1050464_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050464_1.jpg" width="1000" height="650" />][33] [<img class="aligncenter size-full wp-image-5333" alt="P1050465_1" src="http://techfreak.pl/wp-content/uploads/2013/11/P1050465_1.jpg" width="1000" height="650" />][34]

Podsumowując wydruki na PLA wychodzą poprawnie więc wracam do ABS. W międzyczasie kupiłem taśmy malarskie do drukowania z PLA. Niebieską zalecaną za 32zł i jakaś białą malarską za 20zł. Na niebieskiej wydruki rzeczywiści lepiej się trzymają ale na białej też da radę drukować.

[<img class="aligncenter size-full wp-image-5380" alt="DSC_1193_1" src="http://techfreak.pl/wp-content/uploads/2013/11/DSC_1193_1.jpg" width="1000" height="665" />][35]

 [1]: http://techfreak.pl/wp-content/uploads/2013/11/3431_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/11/3432_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/11/3433_1.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/11/3434_1.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2013/11/3435_1.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131021_215657_1.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/11/prusa1_1.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/11/DSC_1120_1.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/11/DSC_1121_1.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/11/DSC_1117_1.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/11/prusa2_1.jpg
 [12]: http://www.thingiverse.com/thing:74233
 [13]: http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131106_110139_1.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131110_001515_1.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131106_234338_1.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131107_005352_1.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2013/11/P1050473_1.jpg
 [18]: http://techfreak.pl/wp-content/uploads/2013/11/IMG_20131108_130053_1.jpg
 [19]: http://techfreak.pl/wp-content/uploads/2013/11/P1050475_1.jpg
 [20]: http://techfreak.pl/wp-content/uploads/2013/11/P1050451_1.jpg
 [21]: http://techfreak.pl/wp-content/uploads/2013/11/P1050452_1.jpg
 [22]: http://techfreak.pl/wp-content/uploads/2013/11/P1050453_1.jpg
 [23]: http://techfreak.pl/wp-content/uploads/2013/11/P1050454_1.jpg
 [24]: http://techfreak.pl/wp-content/uploads/2013/11/P1050455_1.jpg
 [25]: http://techfreak.pl/wp-content/uploads/2013/11/P1050456_1.jpg
 [26]: http://techfreak.pl/wp-content/uploads/2013/11/P1050457_1.jpg
 [27]: http://techfreak.pl/wp-content/uploads/2013/11/P1050458_1.jpg
 [28]: http://techfreak.pl/wp-content/uploads/2013/11/P1050459_1.jpg
 [29]: http://techfreak.pl/wp-content/uploads/2013/11/P1050460_1.jpg
 [30]: http://techfreak.pl/wp-content/uploads/2013/11/P1050461_1.jpg
 [31]: http://techfreak.pl/wp-content/uploads/2013/11/P1050462_1.jpg
 [32]: http://techfreak.pl/wp-content/uploads/2013/11/P1050463_1.jpg
 [33]: http://techfreak.pl/wp-content/uploads/2013/11/P1050464_1.jpg
 [34]: http://techfreak.pl/wp-content/uploads/2013/11/P1050465_1.jpg
 [35]: http://techfreak.pl/wp-content/uploads/2013/11/DSC_1193_1.jpg