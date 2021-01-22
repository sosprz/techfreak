---
title: Serwomechanizm TowerPro SG90 ciągły obrót
author: Przemek
type: post
date: 2018-07-28T18:53:09+00:00
url: /serwomechanizm-towerpro-sg90-ciagly-obrot/
featured_image: /wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-1.jpg
colormag_page_layout:
  - default_layout
categories:
  - Elektronika

---
Dziś mała modyfikacja Serwomechanizmu TowerPro SG90. Polega ona na takiej modyfikacji aby serwo obracało się o 360 stopni.

<!--more-->

Ktoś może się zapytać po co mi serwo jak mogę zakupić zwykły silniczek? Serwo obraca się tylko o 180 stopni, 90 w lewo i 90 w prawo. W serwie jest zwykły silniczek ale też i regulator obrotów. Blokada obrotu jest mechaniczna więc po jej usunięciu serwo może obracać się ciągle w jedną albo w drugą stronę. Serwo SG90 jest tanie i popularne, po szybkiej modyfikacji może posłużyć jako napęd do różnych pojazdów. Ja właśnie jestem w trakcie budowy takiego mini pojazdu ale w tym wpisie przedstawię tylko jak zmodyfikować serwo. Ogólnie nic się nie zmienia w ogólnym podłączeniu, takie serwo można podłączyć bezpośrednio pod odbiornik RC lub pod jakiś układ np. Arduino.

Modyfikacja polega na usunięciu dwóch blokad konstrukcyjnych w serwie, odłączenie regulatora obrotów (ESC) od potencjometru i zastąpieniu potencjometru **dwoma rezystorami 2.2k**. Poniżej przedstawię modyfikacje dwóch rodzajów serw SG90.

### Modyfikacja 1

[<img class="aligncenter size-full wp-image-14974" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-1.jpg" alt="" width="1000" height="500" />][1] [<img class="aligncenter size-full wp-image-14975" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-2.jpg" alt="" width="1000" height="500" />][2] [<img class="aligncenter size-full wp-image-14976" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-3.jpg" alt="" width="1000" height="500" />][3] [<img class="aligncenter size-full wp-image-14977" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-4.jpg" alt="" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-14978" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-5.jpg" alt="" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-14979" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-6.jpg" alt="" width="1000" height="500" />][6]

Serwo jest przylutowane do potencjometru trzeba je odlutować.

[<img class="aligncenter size-full wp-image-14980" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-7.jpg" alt="" width="1000" height="500" />][7] [<img class="aligncenter size-full wp-image-14981" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-8.jpg" alt="" width="1000" height="500" />][8] [<img class="aligncenter size-full wp-image-14982" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-9.jpg" alt="" width="1000" height="500" />][9] [<img class="aligncenter size-full wp-image-14983" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-10.jpg" alt="" width="1000" height="500" />][10]

Po zdjęciu górnej części zakrywającej zębatki trzeba je ściągnąć z pręta tak aby zapamiętać kolejność składnia.

[<img class="aligncenter size-full wp-image-14984" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-11.jpg" alt="" width="1000" height="500" />][11] [<img class="aligncenter size-full wp-image-14985" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-12.jpg" alt="" width="1000" height="500" />][12]

Następnie trzeba wyciągnąć potencjometr (zielony na fotkach), usunąć ze środka blaszki i trzy nóżki, które były przylutowane do regulatora. Chodzi o to żeby został tylko sam pręt na którym będą się obracać zębatki. Jak zobaczysz niebieska cześć została tak zbudowana, że sama sobą blokuje ruch obrotowy ja ją odciąłem.

[<img class="aligncenter size-full wp-image-14986" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-13.jpg" alt="" width="1000" height="500" />][13] [<img class="aligncenter size-full wp-image-14987" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-14.jpg" alt="" width="1000" height="500" />][14] [<img class="aligncenter size-full wp-image-14988" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-15.jpg" alt="" width="1000" height="500" />][15] [<img class="aligncenter size-full wp-image-14989" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-16.jpg" alt="" width="1000" height="500" />][16] [<img class="aligncenter size-full wp-image-14990" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-17.jpg" alt="" width="1000" height="500" />][17] [<img class="aligncenter size-full wp-image-14991" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-18.jpg" alt="" width="1000" height="500" />][18] [<img class="aligncenter size-full wp-image-14992" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-19.jpg" alt="" width="1000" height="500" />][19]

Kolejną blokadą jest jedna zębatka z której trzeba usunąć wystający kawałek płaskimi obcinaczkami.

[<img class="aligncenter size-full wp-image-14993" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-20.jpg" alt="" width="1000" height="500" />][20] [<img class="aligncenter size-full wp-image-14994" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-21.jpg" alt="" width="1000" height="500" />][21] [<img class="aligncenter size-full wp-image-14995" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-22.jpg" alt="" width="1000" height="500" />][22]

Po złożeniu zębatek trzeba przylutować dwa rezystory w miejsce wcześniej wylutowanego potencjometru. Schemat jest prosty bo do środkowego otworu wchodzą nóżki dwóch rezystorów a ich końce wchodzą do kolejnych otworów po obu stronach. Najlepiej zakupić do tego rezystory SMD.

[<img class="aligncenter size-full wp-image-14996" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-23.jpg" alt="" width="1000" height="500" />][23] [<img class="aligncenter size-full wp-image-14997" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-24.jpg" alt="" width="1000" height="500" />][24]

Po złożeniu trzeba sprawdzić czy wszystko działa ja mam do tego ten [Serwo tester][25].

[<img class="aligncenter size-full wp-image-14998" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-25.jpg" alt="" width="1000" height="500" />][26]

**Modyfikacja 2**

Ogólny schemat jest podobny do tego powyżej, różnice to inne podłączenie potencjometru do regulatora czyli przewodami. I inna budowa samego potencjometru, posiada metalową blokadę. Połączenie rezystorów i blokada na białej zębatce jest taka sama jak powyżej.

[<img class="aligncenter size-full wp-image-15000" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-1_1.jpg" alt="" width="1000" height="500" />][27] [<img class="aligncenter size-full wp-image-15001" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-2_1.jpg" alt="" width="1000" height="500" />][28] [<img class="aligncenter size-full wp-image-15002" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-3_1.jpg" alt="" width="1000" height="500" />][29] [<img class="aligncenter size-full wp-image-15003" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-4_1.jpg" alt="" width="1000" height="500" />][30] [<img class="aligncenter size-full wp-image-15004" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-5_1.jpg" alt="" width="1000" height="500" />][31] [<img class="aligncenter size-full wp-image-15005" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-6_1.jpg" alt="" width="1000" height="500" />][32] [<img class="aligncenter size-full wp-image-15006" src="http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-7_1.jpg" alt="" width="1000" height="500" />][33]

Wpis pisałem na podstawie informacji z tej strony: [todbot.com][34]

 [1]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-2.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-3.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-4.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-5.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-6.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-7.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-8.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-9.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-10.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-11.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-12.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-13.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-14.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-15.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-16.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-17.jpg
 [18]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-18.jpg
 [19]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-19.jpg
 [20]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-20.jpg
 [21]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-21.jpg
 [22]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-22.jpg
 [23]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-23.jpg
 [24]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-24.jpg
 [25]: https://www.banggood.com/Wholesale-EK2-0907-Updated-Version-Servo-Tester-Server-Electronic-Speed-Controller-p-66240.html?p=9H0114137951201303E0
 [26]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwomechanizm-TowerPro-SG90-25.jpg
 [27]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-1_1.jpg
 [28]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-2_1.jpg
 [29]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-3_1.jpg
 [30]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-4_1.jpg
 [31]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-5_1.jpg
 [32]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-6_1.jpg
 [33]: http://techfreak.pl/wp-content/uploads/2018/07/techfreak-serwo-sg90-7_1.jpg
 [34]: https://todbot.com/blog/2009/04/11/tiny-servos-as-continuous-rotation-gearmotors/