---
title: Czołg FPV z Drukarki 3D cześć druga
author: Przemek
type: post
date: 2018-12-19T13:18:15+00:00
url: /czolg-fpv-z-drukarki-3d-czesc-druga/
featured_image: /wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-28.jpg
colormag_page_layout:
  - default_layout
categories:
  - Drukarki 3D
tags:
  - devlidesign
  - fpv
  - frsky
  - rc
  - taranis

---
Zapraszam na kolejną cześć z dziennika budowy zdalnie sterowanego czołgu wydrukowanego w technologi 3D z podglądem FPV. Poprzednią można zobaczyć [tutaj][1].

<!--more-->

### Filament

Do zębatek wybrałem filament od [DevilDesing][2], biały PETG 1,75, który używałem z  ustawieniami stół 80C, hotend 220C, nadmuch 40%, Speed 50mm. Wybrałem go ze względu na to, że ten material jest twardszy i wytrzymalszy od PLA.

[<img class="aligncenter size-full wp-image-15297" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-1.jpg" alt="" width="1000" height="563" />][3] [<img class="aligncenter size-full wp-image-15298" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-2.jpg" alt="" width="1000" height="563" />][4]

### Silniki

Silniki na które czekałem to [SUNNYSKY S2212-13 980KV][5]. Po ich dostarczeniu mogłem budować dalej!

[<img class="aligncenter size-full wp-image-15299" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-3.jpg" alt="" width="1000" height="563" />][6] [<img class="aligncenter size-full wp-image-15301" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-5.jpg" alt="" width="1000" height="563" />][7] [<img class="aligncenter size-full wp-image-15300" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-4.jpg" alt="" width="1000" height="563" />][8]

### Budowa

[<img class="aligncenter size-full wp-image-15302" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-6.jpg" alt="" width="1000" height="563" />][9] [<img class="aligncenter size-full wp-image-15311" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-15.jpg" alt="" width="1000" height="563" />][10] [<img class="aligncenter size-full wp-image-15310" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-14.jpg" alt="" width="1000" height="563" />][11] [<img class="aligncenter size-full wp-image-15309" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-13.jpg" alt="" width="1000" height="563" />][12] [<img class="aligncenter size-full wp-image-15308" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-12.jpg" alt="" width="1000" height="563" />][13] [<img class="aligncenter size-full wp-image-15307" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-11.jpg" alt="" width="1000" height="563" />][14] [<img class="aligncenter size-full wp-image-15306" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-10.jpg" alt="" width="1000" height="563" />][15] [<img class="aligncenter size-full wp-image-15305" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-9.jpg" alt="" width="1000" height="563" />][16] [<img class="aligncenter size-full wp-image-15304" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-8.jpg" alt="" width="1000" height="563" />][17] [<img class="aligncenter size-full wp-image-15303" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-7.jpg" alt="" width="1000" height="563" />][18]

### Elektronika

Elektronika to dwa etapy zasilanie i fpv.

Na zasilanie składają się:

  * silniki SUNNYSKY X2212 980kv
  * regulatory silników (ESC) DYS XSD 20A
  * nadajnik RC FrSky X4R-II
  * odbiornik RC/Aparatura [FrSky X-Lite][19]
  * płyta zasilania (PDB) MatekPDB
  * złącze XT60
  * bateria LIPO użyłem starych NanoTech 3S 1300mAh 70C &#8211; w projekcie można użyć o wiele większych baterii co może pozwolić na ponad godzinną jazdę.

Na zestaw FPV składa się:

  * kamera [Foxeer][20]
  * nadajnik video AKK X2P
  * okulary/google/odbiornik wideo FPV Fatshark Dominator V2

### ESC

Generalnie nie mam w tym pojeździe jakiejś zaawansowanej elektroniki tzn. takiej którą trzeba ustawiać jakoś dodatkowo. Jedyne co trzeba zrobić to zaprogramować poprzez BlHeliSuite regulatory (ESC) tak aby mogły sterować silnikami w dwie strony czyli chodzi o ustawienie bidirectional. Screen poniżej.

### [<img class="aligncenter size-full wp-image-15334" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-blhelisuite-ESC-tank-3d-.png" alt="" width="835" height="544" />][21]

### Aparatura

Aparatura to zawsze indywidualna sprawa ale jakiego byś odbiornika i nadajnika nie kupił trzeba je ze sobą zbindować (BIND). Po tej akcji trzeba wybrać w aparaturze dwa kanały te, które sterują silnikami. Jednemu kanałowi/silnikowi dać wartość WEIGHT 10 na początek a drugiemu -10 z. Czyli jeden na plusie bo kreci się &#8222;do przodu&#8221; a drugi ustawiony na przeciwko aby kręcił się do przodu musi mieć wartość ujemną.

### FPV

Co do podglądu FPV to tak samo jak powyżej jedyną rzeczą, którą trzeba ustawić to ten sam kanał nadawania i odbierania. Niestety ale o FPV trzeba oddzielnie poczytać ale nie jest to skomplikowana sprawa w końcu to tylko przesyłanie obrazu.

### Dalej

[<img class="aligncenter size-full wp-image-15312" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-16.jpg" alt="" width="1000" height="563" />][22] [<img class="aligncenter size-full wp-image-15320" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-24.jpg" alt="" width="1000" height="563" />][23] [<img class="aligncenter size-full wp-image-15319" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-23.jpg" alt="" width="1000" height="563" />][24] [<img class="aligncenter size-full wp-image-15318" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-22.jpg" alt="" width="1000" height="563" />][25] [<img class="aligncenter size-full wp-image-15317" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-21.jpg" alt="" width="1000" height="563" />][26] [<img class="aligncenter size-full wp-image-15316" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-20.jpg" alt="" width="1000" height="563" />][27] [<img class="aligncenter size-full wp-image-15315" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-19.jpg" alt="" width="1000" height="563" />][28] [<img class="aligncenter size-full wp-image-15314" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-18.jpg" alt="" width="1000" height="563" />][29] [<img class="aligncenter size-full wp-image-15313" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-17.jpg" alt="" width="1000" height="563" />][30]

### Efekt końcowy

[<img class="aligncenter size-full wp-image-15321" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-25.jpg" alt="" width="1000" height="563" />][31] [<img class="aligncenter size-full wp-image-15326" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-30.jpg" alt="" width="1000" height="563" />][32] [<img class="aligncenter size-full wp-image-15325" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-29.jpg" alt="" width="1000" height="563" />][33] [<img class="aligncenter size-full wp-image-15324" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-28.jpg" alt="" width="1000" height="563" />][34] [<img class="aligncenter size-full wp-image-15323" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-27.jpg" alt="" width="1000" height="563" />][35] [<img class="aligncenter size-full wp-image-15322" src="http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-26.jpg" alt="" width="1000" height="563" />][36]

### Filmik z testu



### Filmik z wycieczki

Niestety czołg utknął na kamieniu pod domkiem. Taki minus niskiego podwozia :)



### Podsumowanie

Warto było poczytać wcześniej o projekcie ponieważ rzeczywiście elementy tworzone przez społeczność były lepiej dopasowane i spełniały swoje zadanie lepiej. Np. koło napędowe nie generuje już bardzo słyszalnych przeskoków gąsienicy. Szczerze to wolałbym ten projekt zrobić 50% mniejszy. Czołgi jest spory i ciężki. Do rekreacyjnego objazdu działki fajnie się nadaje, natomiast kamienny teren będzie dużą przeszkodą. Co do szybkości to naprawdę ma moc. Może nie jak wyścigówka ale daje trochę frajdy. Z minusów udało mi się pogubić śrubki, muszę je jakoś zabezpieczyć. Podsumowując projekt: nie był on skomplikowany ale czasochłonny z powodu wielu dużych drukowanych części i czasu oczekiwania na silniki. Na drugi raz na pewno mniejsza skala!

 [1]: https://techfreak.pl/czolg-fpv-z-drukarki-3d-czesc-pierwsza/
 [2]: https://devildesign.com/
 [3]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-1.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-2.jpg
 [5]: https://www.banggood.com/custlink/GvD3mTWlhQ
 [6]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-3.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-5.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-4.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-6.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-15.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-14.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-13.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-12.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-11.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-10.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-9.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-8.jpg
 [18]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-7.jpg
 [19]: https://www.banggood.com/custlink/vKDGvfpj5s
 [20]: https://techfreak.pl/kamera-fpv-foxeer-arrow-v3/
 [21]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-blhelisuite-ESC-tank-3d-.png
 [22]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-16.jpg
 [23]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-24.jpg
 [24]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-23.jpg
 [25]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-22.jpg
 [26]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-21.jpg
 [27]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-20.jpg
 [28]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-19.jpg
 [29]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-18.jpg
 [30]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-17.jpg
 [31]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-25.jpg
 [32]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-30.jpg
 [33]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-29.jpg
 [34]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-28.jpg
 [35]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-27.jpg
 [36]: http://techfreak.pl/wp-content/uploads/2018/12/techfreak-fpv-3d-printed-tank-part2-26.jpg