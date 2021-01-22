---
title: Regulator temperatury – na szybko.
author: Pawel R.
type: post
draft: true
date: 2019-03-17T11:06:19+00:00
url: /regulator-temperatury-na-szybko/
featured_image: /wp-content/uploads/2019/01/IMG_4445_1.jpg
colormag_page_layout:
  - default_layout
categories:
  - Bez kategorii
  - Elektronika
tags:
  - 1wire
  - arduino
  - laser

---
<span style="color: #333333"><span style="font-family: Georgia, quot">Projekt zrealizowany  z powodu pojawienia się nagłej potrzeby rozwiązania problemu &#8211; 2 pomieszczenia i jeden system grzania  (brak elektrozaworów &#8211; jeden pion grzewczy). Tak więc to co pod ręką można było odnaleźć tj.: arduino i jakiś shield z wyświetlaczem LCD. Założenie co do projektu &#8211; wybranie średniej z dwóch sensorów i wysterowanie pieca gazowego. W przypadku uszkodzenia sensora &#8211; informacja dla użytkownika na LCD. Histereza stała tj +/-1&#8217;c  od nastawy.<a href="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4457_1.jpg"><img class="alignleft size-medium wp-image-15412" src="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4457_1-300x200.jpg" alt="" width="300" height="200" /></a></span></span>

<span style="color: #333333"><span style="font-family: Georgia, quot">Samo programowanie nie było wielkim wyzwaniem, jednak pojawiło się zagadnienie regulacji wartości zmiennej dla klawiatury pod LCD który to miał działać od ręki. Zakupiony schield który nigdy do tej pory nie był używany teoretycznie powinien od startu zadziałać z dedykowaną biblioteką. Biblioteka poza obsługą wyświetlacza odczytuje z wejścia arduino A0 zmienną z klawiatury. Klawiatura to prosta drabinka rezystancyjna tak więc odczyt przycisku to wartość z przedziału 0 do 1023. Chyba mój chiński producent zamontował to co miał pod ręką i nijak odczyty miały się do tego co </span></span>

<img class="size-medium wp-image-15406 alignright" src="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4442_1-300x200.jpg" alt="" width="300" height="200" /> 

<span style="color: #333333"><span style="font-family: Georgia, quot">oczekiwała biblioteka.</span></span>

<span style="color: #333333"><span style="font-family: Georgia, quot">Odczyt temperatury na układach komunikujących się po magistrali 1W tj.: DS18B20. Komunikacja z sensorami odbywa się korzystając z zasilania przewodowego ( długość przewodu to około 100m ale nie jest to skrętka przy pierwszym uruchomieniu i testach na zasilaniu pasożytniczym układ nie reagował poprawnie).  Nastawione wartości są zapisywane w nieulotnej pamięci eeprom.</span></span>

<span style="color: #333333"><span style="font-family: Georgia, quot">Programowo nie jest tu nic ciekawego – układ korzysta ze środowiska Arduino i tak .:</span></span>

<span style="color: #333333"><span style="font-family: Georgia, quot"><strong>OnWire.h ; DallasTemperature.h</strong> – obsługa sensorów dallasa</span></span>

<span style="color: #333333"><span style="font-family: Georgia, quot"><strong>LiquidCrystal.h ; DFR_LCD_Keypad.h</strong> – obsługa LCD i klawiatury </span></span>

<span style="color: #333333"><span style="font-family: Georgia, quot"><strong>EEPROM.h</strong> – obsługa wewnętrznej pamięci </span></span>

&nbsp;

<img class="alignleft size-medium wp-image-15409" src="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4445_1-300x200.jpg" alt="" width="300" height="200" /> 

<span style="color: #333333"><span style="font-family: Georgia, quot">Innym &#8222;wyzwaniem&#8221;  o którym warto wspomnieć było zrozumienie jak i poco regulator kontrastu (potencjometr) jest ustawiony od strony wyświetlacza LCD tak że wystaje poza jego obrys  &#8211; tu za jasną cholerę nie rozumem wyboru elementu &#8211; ostatecznie został on odlutowany i zamontowany od strony dolnej. Gdyby pozostawić jego pozycję jak do tej porty nie było by możliwości wykonania obudowy &#8211; przyciski TACT są niskie &#8211; wystający potencjometr wymuszał by odsunięcie wyświetlacza LCD i przycisków bardzo głęboko w urządzenie. Tak więc jak każdy dałem się załapać w pułapkę ładnie wyglądającego zdjęcia na aukcji natomiast przy instalacji klocka który miał pasować od ręki okazuje się że nie ma to sensu&#8230;.. Na jednym z poprzednich zdjęć widać też wymaganą izolację od  złącza USB na Arduino. Wyświetlacz LCD po zamontowaniu go w sposób odpowiedni na płycie bazowej powodował zwarcie. <a href="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4443_1.jpg"><img class="size-medium wp-image-15407 alignright" src="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4443_1-300x200.jpg" alt="" width="300" height="200" /></a></span></span>

Ostatnim klockiem jest płytka zawierająca dwa przekaźniki, z których tylko jeden jest wykorzystywany do sterowania piecem. Obsługa pieca polega na zwieraniu dwóch przewodów co uruchamia proces grzewczy ( tak jak wykonują to zwykłe bimetaliczne regulatory naścienne).

<span style="color: #333333"><span style="font-family: Georgia, quot">Obudowa &#8211; cięcie na laserze K40 &#8211; tak w końcu na coś się przydała zabawka! Tu wspomnę może o sposobie pracy z tym urządzeniem. Do lasera jest dostarczona płyta z dedykowanym programem do rysowania opracowanym przez kogoś z Chin jak i bardzo podejrzana wersja Corela 12. Choć z tego co udało mi się wygooglać istnieje już alternatywa/sterownik pod system linux co zapewne w niedalekiej przyszłości sprawdzę.</span></span>

<img class="size-medium wp-image-15410 alignleft" src="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4448_1-300x200.jpg" alt="" width="300" height="200" /> 

<span style="color: #333333"><span style="font-family: Georgia, quot">Urządzenie </span></span><span style="color: #333333"><span style="font-family: Georgia, quot">jako takie ma tylko jeden punkt pozycjonowania tj krańcówki HOME i nie bardzo przejmuje się ograniczeniami w osiach X/Y (czysto teoretycznie rozwiązując problemy mechaniczne ten ploter ma możliwość pracy w polu 100x100cm !). Dlatego w celu wykonania powtarzalnych cięć na tym samym materiale trzeba zapewnić sobie jakaś fixturę. Ja rozwiązuje ten problem w przypadku gdy wymagane jest przejście w kilku etapach za pomocą znacznika bazowego który laser stara się wyciąć a jednocześnie jest on poza obszarem materiału obrabianego. Znacznik bazowy w moim przypadku to prostokąt 1x1mm.<a href="http://techfreak.pl/wp-content/uploads/2019/03/screen_l.jpg"><img class="size-medium wp-image-15415 alignright" src="http://techfreak.pl/wp-content/uploads/2019/03/screen_l-300x160.jpg" alt="" width="300" height="160" /></a> Laser nie ma regulowanego stołu i często mimo swojej dużej mocy nie jest wstanie przeciąć za jednym przejazdem cienkiego tworzywa 3-4mm. Inna ekstremalna sprawa to metoda nastawy mocy lasera – potencjometr :) do regulacji prądu tuby lasera. Jak układ sprawia wrażenie że nie podejmuje się ucięcia / wypalenia to pach wystarczy dodać odrobinę mocy. </span></span><span style="color: #333333"><span style="font-family: Georgia, quot">Tuba chłodzona wodą (producent daje pompkę akwariową) o deklarowanej mocy 40W daje sobie radę z materiałami sztucznymi do około 8mm. Jako opcja tunningu – dodałem asystę powietrzną tak <a href="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4449_1.jpg"><img class="size-medium wp-image-15411 alignleft" src="http://techfreak.pl/wp-content/uploads/2019/01/IMG_4449_1-300x200.jpg" alt="" width="300" height="200" /></a>aby ew. opary z ciętych materiałów nie leciały bezpośrednio na lustro. Na ostatnim zdjęciu widać kawałek wytoczonego tworzywa POM z doprowadzoną rurką powietrza które jest wytwarzane przez kompresor membranowy. Na sam koniec dodaje listing programu &#8211; układ działa nieprzerwanie od 4mc więc pierwsze testy przebiegły pozytywnie. <a href="http://techfreak.pl/wp-content/uploads/2019/03/sterownik_temp2sensory_OK.7z">sterownik_temp2sensory_OK</a></span></span>