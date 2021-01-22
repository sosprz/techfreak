---
title: NEXBOX MXQ PRO aktualizacja firmware
author: Przemek
type: post
date: 2017-08-24T23:28:33+00:00
url: /nexbox-mxq-pro-aktualizacja-firmware/
featured_image: /wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-5.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6094268790
categories:
  - Elektronika
tags:
  - Android
  - tvbox

---
Ponad rok temu zakupiłem TV BOX NEXBOX MXQ PRO z Androidem i wiedziałem, że uda mi się go zaktualizować do nowszej wersji.

<!--more-->

Pomyślałem, że zobaczę jak działa TV Box z Androidem 5.1, gotowy produkt, cztery procki, 64 bity, odpalę KODI do oglądania filmów, pogram gry z google play. Będzie fajnie. Skończyło się na tym, że za każdym razem odpalałem tylko KODI i dokupiłem [pilot na WiFi,][1] bo na podczerwień do niczego się nie nadawał. Aktualizacje KODI trzeba robić ręcznie bo jest jakiś problem ze sklepem play. Generalnie BOX TV spełnia soje zadanie na 100% ale co z tymi dodatkami co z aktualizacjami? Zacząłem szukać, przeglądać i pomimo, że nie znalazłem żadnej działającej aktualizacji to nauczyłem się jak wgrywać firmware do TV BOX&#8217;ów z procesorem Amlogic.

#### MXQ PRO

Mój TV BOX jaki to posiadam to NEXBOX MXQ PRO o specyfikacji CPU Amlogic S905 2.0GHz Quad Core, GPU Mali-450 MP, RAM: DDR3 1G, ROM 8G, czyli całkiem dobry sprzęt do oglądania filmików :)

[<img class="aligncenter size-full wp-image-13068" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-3.jpg" alt="" width="1000" height="500" />][2] [<img class="aligncenter size-full wp-image-13069" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-4.jpg" alt="" width="1000" height="500" />][3] [<img class="aligncenter size-full wp-image-13070" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-5.jpg" alt="" width="1000" height="500" />][4][<img class="aligncenter size-full wp-image-13074" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-9.jpg" alt="" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-13071" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-6.jpg" alt="" width="1000" height="500" />][6]

Na różnych forach, stronach znajdowałem różne pliki z firmware, które chciałem wypróbować ale jak je wgrywać? Sprawa niby prosta bo to android wchodzisz do rekowery zaznaczasz plik ZIP i powinno być ok. Nie. Nie udało mi się do niego wejść. W slocie AV jest ukryty guziczek, który powinien mi zapewnić możliwość wejścia do rekowery ale nie działa, zwieranie pinów też. Wszelkie filmy na YT pokazują że tak powinno być. W samym androidzie jest opcja aktualizacji z aplikacji, która też ani razu nie zaktualizowała mi systemu. Raz natomiast po wybraniu nie właściwego pliku z firmware wszedłem do rekowery. To też mi nie dało za wiele bo nie miałem dobrego pliku.

[<img class="aligncenter size-full wp-image-13073" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-8.jpg" alt="" width="1000" height="500" />][7]

&nbsp;

Na wszelakich formach można było znaleźć pliki, które trzeba było wgrać poprzez USB burning tool, który jest programem do wgrywania systemu na pamięć NAND ale aby uruchomić taki tryb wgrywania trzeba podobno mieć działający guzik w wejściu AV. Nie fortunnie zacząłem całą zabawę na systemie Windows 7 na VirtualBox po dłuższym czasie okazało się, że pomimo, że USB burning tool wykrywa TV BOX to niestety nie może wgrać na niego wymaganych plików w tamtym momencie nie wiedziałem czy to wina guzika czy systemu czy jeszcze czegoś innego. Przesiadłem się na zwykły komputer z czystym systemem. Po paru próbach okazało się wgrywanie jest bardzo proste i wymaga tylko podłączenia TV BOX&#8217;a do komputera za pomocą kabla USB [male to male][8]. I tyle, żadnych guzików, żadnych sekwencji wkładania kabli.

[<img class="aligncenter size-full wp-image-13078" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-13.jpg" alt="" width="1000" height="500" />][9] [<img class="aligncenter size-full wp-image-13079" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-14.jpg" alt="" width="1000" height="500" />][10] [<img class="aligncenter size-full wp-image-13065" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-0.jpg" alt="" width="1000" height="625" />][11] [<img class="aligncenter size-full wp-image-13066" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-1.jpg" alt="" width="1000" height="625" />][12] [<img class="aligncenter size-full wp-image-13067" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-2.jpg" alt="" width="1000" height="625" />][13]

To był dobry kierunek, miałem sprzęt, wiedziałem jak wgrywać ale nie miałem dobrych plików. W zasadzie miałem nadzieje, że znajdę nowy firmware z androidem 6.0. No to leciałem ze wszystkimi nazbieranymi plikami po kolei. Trafiłem na AM2.1\_1\_1, który po uruchomieniu miał androida 6.0 ale nie działało WiFi. po wgraniu kolejnego pliku udało mi się zbrikować (od brick, cegła) BOX&#8217;a czyli uśmiercić go na maxa. Jedyne co mogłem zobaczyć to czerwona dioda, która oznaczała, że mój BOX będzie teraz podstawką pod kwiaty.

[<img class="aligncenter size-full wp-image-13077" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-12.jpg" alt="" width="1000" height="500" />][14]

Na powyższym zdjęciu widać po prawej stronie od radiatora pamięć, na [tym][15] forum znalazłem, że po zwarciu pinów 17,18 będzie możliwe dalsze wgrywanie oprogramowania tak samo jak wcześniej.

[<img class="aligncenter size-full wp-image-13080" src="//techfreak.pl/wp-content/uploads/2017/08/image_12598.jpg" alt="" width="438" height="429" />][16]

No i udało się, dalej mogłem wgrywać różne systemy. Jeśli ktoś szuka domyślnego dla MXQ PRO to musi szukać pliku **cyx\_MXQPro-NEXBOX\_8189etv\_8g1g\_kodi\_addons\_160603_USB.img**

#### Podsumowanie

Niestety nie udało mi się znaleźć nowszej wersji co nie oznacza, że obecna jest nie poprawnie działająca. Polecam [ten][17] watek dla posiadaczy MXQ PRO i wgranie tej wersji bo naprawdę ładnie wygląda jest czysta i funkcjonalna. Natomiast jeśli jesteś poszukiwaczem swojego TV BOX&#8217;a to polecam zakupić sobie coś nowszego jak [H96 PRO PLUS z Androidem 7][18].

 [1]: https://www.gearbest.com/mice-keyboards/pp_275286.html?lkid=11171035
 [2]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-3.jpg
 [3]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-4.jpg
 [4]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-5.jpg
 [5]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-9.jpg
 [6]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-6.jpg
 [7]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-8.jpg
 [8]: https://www.google.pl/search?q=USB+male+to+male&oq=USB+male+to+male
 [9]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-13.jpg
 [10]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-14.jpg
 [11]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-0.jpg
 [12]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-1.jpg
 [13]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-2.jpg
 [14]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-NEXBOX-MXQ-PRO-amlogic-S905-tvbox-android-12.jpg
 [15]: http://freaktab.com/forum/tv-player-support/amlogic-based-tv-players/s805/others-ab/523003-mxq-ott-s805-box-bricked-red-led-constantly-on
 [16]: //techfreak.pl/wp-content/uploads/2017/08/image_12598.jpg
 [17]: http://freaktab.com/forum/tv-player-support/amlogic-based-tv-players/s905/others-ac/firmware-roms-tools-bj/637014-rom-image-firmware-mxq-pro-4k-p201-android-tv-atv-by-coolio
 [18]: https://www.banggood.com/H96-PRO-PLUS-Amlogic-S912-Octa-Core-3GB-RAM-32GB-ROM-TV-Box-p-1100082.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling