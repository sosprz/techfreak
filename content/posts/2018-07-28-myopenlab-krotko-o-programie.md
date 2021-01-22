---
title: MyOpenLab – krótko o programie.
author: Pawel R.
type: post
draft: true
date: 2018-07-28T12:50:12+00:00
url: /myopenlab-krotko-o-programie/
featured_image: /wp-content/uploads/2018/07/Myopen_lab_001.png
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - arduino
  - ubuntu

---
**OK..** udało się mamy już zmontowaną elektronikę &#8211; działa oparta o Arduino albo inny moduł elektroniczny da się tym sterować za pomocą terminala teraz trzeba by nadać temu jakaś formę tak aby zwykły człowiek mógł tym sterować bez zaznajomienia się z dokumentacją &#8211; ja tego uczyć się nie musze bo moje dzieło znam na pamięć&#8230;. no ale graficznie coś trzeba dodać i to najlepiej w ciągu kilku godzin tak aby nie rozgryzać całego środowiska programistycznego.  
Brzmi znajomo ?

<!--more-->

  
Narzędzie MyOpenLab pozwala na dodanie przyjemnego dla oka interfejsu graficznego i funkcji logicznych do dajmy na to własnego rozwiązania opartego na Arduino. Zaleta oprogramowania – &#8222;piszemy” kod metodą graficzną układając bloki funkcyjne czy elementy GUI przeciągając odpowiednie moduły do swojego projektu tak jak ma to miejsce w rozwiązaniu firmy NI – LabVIEW.  
Środowisko w którym tworzymy projekty daje możliwość dopisana swojego modułu w Javie, do pakietu dodane są liczne przykłady rozwiązania np. mastera w Modbus RTU, komunikacji po RS232 funkcji logicznych pozwalających na zapis do pliku np. CSV itd. Oprogramowanie jest dostępne na wolnej licencji i uruchamia się zarówno pod Windowsem jak i linuxem &#8211; tu mogę jedynie zapewnić że pod Ubuntu. Dostępna jest wtyczka dla pakietu Firmata który to sam w sobie jest wart opisania kiedy indziej.

Najnowsze pliki można znaleźć pod [tym linkiem][1]. Obecnie paczka z oprogramowaniem waży około 62Mb. I nie ma co się zniechęcać &#8211; program w odróżnieniu od strony domowej projektu MA INTERFEJS w języku angielskim.

Poniżej dwa screeny z programu w którym został otworzony przykład &#8222;MouseCatch&#8221;. Pierwszy screen pokazuje logikę pracy &#8222;programu w którym mamy obiekty (np.: lampki w postaci czerwonych kropek sygnalizujące pracę i obiekt &#8222;łapiący&#8221; kursor myszy) takie jak lampki sterowane logicznymi sygnałami tj 0/1, bramkę flip/flop itd. W zależności od rodzaju sygnału &#8211; binarnego czy liczbowego kreski łączące poszczególne obiekty mają inne kolory. W górnej części mamy do wyboru wiele elementów dostępnych z podstawowego źródła które możemy edytować i oczywiście tworzyć nowe.<img class="alignleft wp-image-14959 size-large" src="http://techfreak.pl/wp-content/uploads/2018/07/Myopen_lab_001-1024x664.png" alt="" width="800" height="519" />

Drugi screen pokazuje część &#8222;graficzną&#8221; tj elementu GUI rozmieszczone w oknie programu. Jak widać są tutaj obiekty korespondujące z logiczną częścią programu tj. lampki 0/1, wskaźniki analogowe i pola z wartościami liczbowymi. Program mimo prostego interfejsu daje możliwość szybkiego stworzenia GUI z logiką dla własnego projektu.. tak aby osoba<img class="alignright wp-image-14960 size-medium" src="http://techfreak.pl/wp-content/uploads/2018/07/My_open_lab_002-300x230.png" alt="" width="300" height="230" /> mająca styczność pierwszy raz z naszym rozwiązaniem nie uciekła :) Program polecam przetestować każdej osobie. Może będzie to wstęp dla kogoś do programowania w sposób mniej graficzny.

&nbsp;

**Wady** &#8211; są oczywiście.  Po pierwsze Java &#8211; środowisko nie grzeszy prędkością. Wymaga od użytkownika minimum JRE 7\*.  Nie posiada obecnie możliwości eksportu napisanego programu do zapakowanego pliku wykonywalnego pod dany system (do uruchomienia wymaga środowiska &#8222;IDE&#8221; zainstalowanego na maszynie operatora oraz w przypadku istnienia ograniczeń dla konta np.: komputer domenowy w korporacji wymaga uruchomienia części programistycznej przed  kliknięciem wyeksportowanego programu &#8211; w Winodws). Dostarczone moduły bez modyfikacji nie działają prawidłowo z portami RS232 obecnymi na portach USB w systemie linux. W Windows nie ma takiego problemu. Nie każdy jest w stanie przestawić się z pisania kodu na &#8222;przeciąganie&#8221; drucików/sygnałów/strumieniu &#8211; może być to bardzo frustrujące dla kogoś kto posiada doświadczenie w pisaniu kodu za pomocą znaków ascii :) \* &#8211; Java dostępna z np Ubuntu 18.04 jako standardowa paczka nie jest kompatybilna i wymagane jest zainstalowanie JRE Oracla

 [1]: https://myopenlab.org/inicio/descargar-myopenlab/