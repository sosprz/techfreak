---
title: 'Nettemp – czujniki wilgotności [edit: jest ok]'
author: Przemek
type: post
date: 2013-11-26T09:18:38+00:00
url: /nettemp-czujniki-wilgotnosci/
featured_image: /wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci2.jpg
hits:
  - 1982
dsq_thread_id:
  - 2000513828
categories:
  - Elektronika
tags:
  - nettemp

---
Po zakupieniu dwóch czujników wilgotności DHT11 które są też czujnikami temperatury. Koszty ok 15zł. W końcu znalazłem czas aby je podłączyć do Raspberry Pi i dopisać parę linii kodu aby można było zarządzać czujnikami z poziomu przeglądarki.

<!--more-->

Poniżej przedstawiam jak jest to wszystko u mnie podłączone. A dokładnie dwa czujniki **DS18B20** podłączone pod **GPIO 4** tylko na dwóch liniach. Za poprawne działanie tylko na dwóch przewodach odpowiada moduł** w1_gpio** z wpisem **pullup=1**. Całość wpisu w **/etc/modules** to **w1_gpio pullup=1**. Przekaźnik dwu kanałowy za kupiony na banggood podłączony do **GPIO 17**. Przekaźnik u mnie odpowiada za sterowanie ciepłem w kaloryferach. Następnie pod **GPIO 22** podłączyłem czujnik wilgotności i temperatury **DHT11**. Natomiast na USB mam podłączone pięć czujników **DS18B20** na przejściówce 1-wire DS9097U.

[<img class="aligncenter size-full wp-image-5393" alt="techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci2" src="http://techfreak.pl/wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci2.jpg" width="1000" height="650" />][1]  
[<img class="aligncenter size-full wp-image-5394" alt="techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci1" src="http://techfreak.pl/wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci1.jpg" width="1000" height="650" />][2] [<img class="aligncenter size-full wp-image-5395" alt="techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci0" src="http://techfreak.pl/wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci0.jpg" width="1000" height="650" />][3]

Poniżej filmik jak wygląda dodawanie takiego czujnika do systemu:



A poniżej wyniki już z danymi:

[<img class="aligncenter size-full wp-image-5396" alt="hour" src="http://techfreak.pl/wp-content/uploads/2013/11/hour.png" width="991" height="541" />][4]

#### Podsumowanie

Generalnie wiem że każdy sobie przetestuje u siebie jak działają czujniki wilgotności  DHT11. Ale u mnie odczyt jest raz na jakiś czas dobry. Może to być spowodowane zasilaniem lub nie poprawnie działającym programem od Adafruit z którego korzystam aby odczytywać dane z czujników. Więc tym razem wypuszczam tą wersję aby każdy mógł przetestować i sam ocenić jak to działa. Je ze swojej strony na pewno jeszcze zakupię czujniki **DHT22** i pomyślę nad dodatkowym zasilaniem. I pewnie nie tylko ja :) Zapraszam do testowania i dzielenia się uwagami na ten temat na <a href="http://techfreak.pl/forums/forum/nettemp-monitoring-temperatury/" target="_blank">forum</a>.

**EDIT**

W najnowszej wersji 7.3.1 jest poprawka która nie zapisuje błędnych odczytów co po prostu poprawia wygląd wykresów :)

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci2.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/11/techfreak_pl_nettemp_pomiar_temperatury_i_wilgotnosci0.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/11/hour.png