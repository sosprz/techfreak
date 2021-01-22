---
title: 'Liczarka elementów smd  w taśmach.'
author: Pawel R.
type: post
draft: true
date: 2018-12-16T12:37:56+00:00
url: /liczarka-elementow-smd-w-tasmach/
featured_image: /wp-content/uploads/2018/10/SMD_03_1.jpg
colormag_page_layout:
  - default_layout
onesignal_meta_box_present:
  - 1
categories:
  - Elektronika
tags:
  - liczarka
  - smd

---
[<img class="size-medium wp-image-15278 alignright" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_09_1-300x244.jpg" alt="" width="300" height="244" />][1]Z cyklu DIY – jeżeli mamy już jakieś projekty za sobą zostaje mi i zapewne pozostałym majsterkowiczom duża ilość elementów SMD z prostej przyczyny – nie da się zamówić np. mniej niż 100 elementów danego typu. Z biegiem lat elementy się gromadzą i wpadłem na pomysł że warto było by zweryfikować swój zasób. I tak powstał projekcik liczarki komponentów [SMD][2] zamkniętych w rolkach.

Dla czego pakuje się elementy w rolkach? Przy produkcji przemysłowej elementy są kładzione za pomocą maszyny Pick&Place która pobiera każdy elemencik z wyznaczonego podajnika (feedera) a tam jest on zapakowa[<img class="alignleft size-medium wp-image-15279" src="http://techfreak.pl/wp-content/uploads/2018/10/rolki_vishay-300x182.png" alt="" width="300" height="182" />][3]ny w taśmie. Dla innych komponentów są też inne opakowania ale moja maszynka ma za zadanie policzyć standardową taśmę o szerokości 8mm i grubości do 1,5mm. Do tego elementy zwykle nie są nawinięte na rolkach i ich liczba to max 2000 szt. Dla bardziej dociekliwych polecam zapoznać się z dowolną notą katalogową dla tego typu opakowań. Jest tam bardzo dużo parametrów … np. [taki][4].

&nbsp;

[<img class="size-medium wp-image-15277 alignright" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_08_1-300x147.jpg" alt="" width="300" height="147" />][5]W ramach przegryzania tematu postanowiłem zakupić tanie rozwiązanie z półki tj licznik zdarzeń ze sklepu AVT – kit [3188][6]. Posiada czytelny wyświetlacz „8” LED. Możliwość zliczania góra i dół. Do samego zliczania oczek w taśmie widocznej na zdjęciu użyłem sensora szczelinowego od Arduino. Po podłączeniu całości i pierwszej probie okazuje się że program zawarty w kicie wymaga odwrócenia logiki podawanego sygnału z sensora – tu sprawę załatwił tranzystor NPN **BC547**. Po dodaniu tego elementu licznik działa prawidłowa z uwagą że deklarowane 20Hz nie wydaje mi się realne do osiągnięcia (licznik gubi impulsy).

[<img class="size-medium wp-image-15274 alignright" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_05_1-300x246.jpg" alt="" width="300" height="246" />][7]Największym wyzwaniem był projekt mechaniczny odpowiedniej głowicy do zliczania i dobranie silnika. Rozwiązanie mechaniczne przeszło trzy iteracje, Z czego pierwsza nie doczekała się nawet napędu mechanicznego.Kolejna wersja zawierała już miniaturowy silnik z przekładnią metalową – niestety silnik okazał się za słaby oraz w projekcie wymagane było przyklejenie obudowy silnika. Co mimo mojego wysiłku włożonego w poszukiwanie kleju dającego dobre efekty w przypadku klejenia PLA spełzło na niczym. Wersja ta również wymagała lekkiego ręcznego poprawiania szczeliny na taśmę.

[<img class="alignleft size-medium wp-image-15275" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_06_1-300x251.jpg" alt="" width="300" height="251" />][8]Te przyczyny powodowały że powstała wersja trzecia urządzonka i ona spełnia pokładane założenia &#8211; zliczanie komponentów.  
W celu napędzania taśmy zaprojektowałem prosty wałek wykonany z TPU zakładany bezpośrednio na oś silnika. Jako że pierwszy raz używałem tego typu materiału w swojej drukarce 3D ( Anycubic ) spowodowało to problem – okazuje się że ta drukarka nie za dobrze radzi sobie bez odpowiednich modyfikacji z gumowymi filmanentami. To zdanie kosztowało mnie 3m filmanentu TPU. Kolejny problem to ilość materiału jaki musi zostać wypchnięty z dyszy. U mnie sprawdziło się 115%, prędkość 10mm/s oraz zwiększenie nakładania na siebie wewnętrznego wypełnienia. Ta opcja przydała by się też co do ścian zewnętrznych ale nie udało m się dotrzeć do tego parametru w programie CURA.[<img class="size-medium wp-image-15276 alignright" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_07_1-300x136.jpg" alt="" width="300" height="136" />][9]  
Z poprzedniej wersji nauczyłem się o odpowiednie zadbanie w wymiarach tak aby skurcz materiału po ostygnięciu działał na cześć optymalnie. Ztąd śruby M3 użyte w projekcie nie mają problemu z wkręcaniem się w materiał oraz mają odpowiednią wytrzymałość mechaniczną. Co do silnika napędowego użyłem przyzwoitego jak na swoją cenę silnika firmy ASLONG GY4632-370-37 przystosowanego do pracy na 24V.

Zasilanie układu – uniwersalny zasilacz do laptopa z marketu.

[<img class="alignleft size-medium wp-image-15272" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_03_1-300x216.jpg" alt="" width="300" height="216" />][10]

&nbsp;

Front panel – tu ciekawostka jako że jest to część wizualna została ona wycięta na laserze i od tyłu pokryta specyfikiem „MIRROR MNIST” jest to bardzo ciekawy spray który faktycznie tworzy powłokę lustrzaną. Tak więc stare pudełko od miernika tzw blister (przeźroczysta gruba folia) przerodziła się w przedni bezel do urządzenia. Tworzywo z którego jest wykonane daje ciekawe zjawisko – opcja grawerowania na laserze CO2 powoduje zmianę jego koloru na brązowy – może jest to jakiś antypalny dodatek do plastyku? Po pokryciu wyciętego detalu na laserze efektem lustrzanym dalej widać ledowe „8” spod spodu.

&nbsp;

<img class="size-medium wp-image-15270 alignleft" src="http://techfreak.pl/wp-content/uploads/2018/10/SMD_01_1-300x240.jpg" alt="" width="300" height="240" /> 

&nbsp;

Po około 30 testach udało mi się ustalić dokładność urządzenia na około +/- 2 komponenty. Błędy w zliczaniu biorą się na końcu taśmy – gdy taśmę trzeba ręcznie wysunąć z urządzenia tu bardzo często sensor nie zlicza komponentów (brak prawidłowego pozycjonowania lub za szybkie wyciągnięcie taśmy) . Finalnie urządzenie posiada na sobie dwa przełączniki, jeden do zerowania a drugi do załączania pracy silnika napędzającego taśmę.

 [1]: http://techfreak.pl/wp-content/uploads/2018/10/SMD_09_1.jpg
 [2]: https://en.wikipedia.org/wiki/Surface-mount_technology
 [3]: http://techfreak.pl/wp-content/uploads/2018/10/rolki_vishay.png
 [4]: https://www.vishay.com/docs/60034/tapereel.pdf
 [5]: http://techfreak.pl/wp-content/uploads/2018/10/SMD_08_1.jpg
 [6]: https://sklep.avt.pl/avt3188.html
 [7]: http://techfreak.pl/wp-content/uploads/2018/10/SMD_05_1.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2018/10/SMD_06_1.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2018/10/SMD_07_1.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2018/10/SMD_03_1.jpg