---
title: Jak wygląda mój pulpit Ubuntu z Gnome Shell
author: Przemek
type: post
date: 2018-06-13T20:51:20+00:00
url: /ubuntu-gnome-shell/
featured_image: /wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-21.jpg
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - ubuntu

---
Spotkałem się z różnymi opiniami o Ubuntu i Ubuntu Gnome Shell. Większości chodziło o wygląd. Ciągle była mowa o unity jakie to dziwne było. Gnome wolno działa i zwalnia, animacje lagują jak 15 lat temu. Najlepsze XFCE! No to pokażę wam mój pulpit.

<!--more-->

Długo użytkowałem Ubuntu XFCE, działało w większości przypadków, w domu w pracy. Spoko. Niedawno wyszedł Ubuntu z gnome shell i postanowiłem sobie sprawdzić jak to wygląda i jak działa.  Używałem gnome shell od wersji 17.04. Wcześniejsze Unity było nie do przejścia dla mnie więc zmiana na plus. Po instalacji jednak brakowało mi belki na górze. Okazało się, że są wtyczki i zaraz dostosuje sobie wszystko do moich potrzeb. Jedyną rzeczą z jaką był problem to lagi efektów wizualnych, które po prostu wyłączyłem. Po tej zmianie jestem z gnome shell już ponad rok.

Jak zrobić sobie fajny pulpit moim zdaniem?

Nic innego jak zainstalować wtyczkę **gnome-shell-extension-dash-to-panel**, czyli wtyczkę, która przenosi boczną tacę do góry i umieszcza ją w już istniejącym panelu. Co sprawia, że pulpit staje się prosty i użyteczny. Jak zainstalować powyższą wtyczkę? Najlepiej zainstalować wcześniej dwie aplikacje **gnome-tweaks** i **chrome-gnome-shell**. Pierwsza aplikacja zmienia różne najpopularniejsze funkcje systemu np. czy ikonki maja być jednak na pulpicie czy może juz nie. Przede wszystkim daje dostęp do opcji zainstalowanych rozszerzeń. Druga apka **chrome-gnome-shell** pozwala przeglądarce firefox i chrome na instalacje dodatków ze strony [extensions.gnome.org][1].

<pre>sudo apt install gnome-chrome-shell gnome-tweaks</pre>

Po instalacji trzeba wejść na stronę dodatków i wyszukać **dash to panel**. Dalej już konfiguracja wedle uznania. Poniżej zobacz taki mały slajd show jak to u mnie wygląda krok po kroku w wersji 18.04. Przede wszystkim przesuwam datę na prawa stronę, wyłączam efekty wizualne, zmieniam wielkość belki, ustawiam procentowe wyświetlanie zużycia baterii, wyłączam ikonę kosza.

&nbsp;

[<img class="aligncenter size-full wp-image-14868" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-1.jpg" alt="" width="1000" height="650" />][2] 
[<img class="aligncenter size-full wp-image-14871" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-4.jpg" alt="" width="1000" height="650" />][3] 
[<img class="aligncenter size-full wp-image-14872" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-5.jpg" alt="" width="1000" height="650" />][4] 
[<img class="aligncenter size-full wp-image-14873" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-6.jpg" alt="" width="1000" height="650" />][5] 
[<img class="aligncenter size-full wp-image-14874" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-7.jpg" alt="" width="1000" height="650" />][6] 
[<img class="aligncenter size-full wp-image-14875" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-8.jpg" alt="" width="1000" height="650" />][7] 
[<img class="aligncenter size-full wp-image-14876" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-9.jpg" alt="" width="1000" height="650" />][8] 
[<img class="aligncenter size-full wp-image-14877" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-10.jpg" alt="" width="1000" height="650" />][9] 
[<img class="aligncenter size-full wp-image-14878" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-11.jpg" alt="" width="1000" height="650" />][10] 
[<img class="aligncenter size-full wp-image-14879" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-12.jpg" alt="" width="1000" height="650" />][11] 
[<img class="aligncenter size-full wp-image-14880" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-13.jpg" alt="" width="1000" height="650" />][12] 
[<img class="aligncenter size-full wp-image-14881" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-14.jpg" alt="" width="1000" height="650" />][13] 
[<img class="aligncenter size-full wp-image-14882" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-15.jpg" alt="" width="1000" height="650" />][14] 
[<img class="aligncenter size-full wp-image-14883" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-16.jpg" alt="" width="1000" height="650" />][15] 
[<img class="aligncenter size-full wp-image-14884" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-17.jpg" alt="" width="1000" height="650" />][16] 
[<img class="aligncenter size-full wp-image-14885" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-18.jpg" alt="" width="1000" height="650" />][17] 
[<img class="aligncenter size-full wp-image-14886" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-19.jpg" alt="" width="1000" height="650" />][18] 
[<img class="aligncenter size-full wp-image-14887" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-20.jpg" alt="" width="1000" height="650" />][19] 
[<img class="aligncenter size-full wp-image-14888" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-21.jpg" alt="" width="1000" height="650" />][20] 
[<img class="aligncenter size-full wp-image-14889" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-22.jpg" alt="" width="1000" height="650" />][21] 
[<img class="aligncenter size-full wp-image-14890" src="http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-23.jpg" alt="" width="1000" height="650" />][22]

&nbsp;

 [1]: https://extensions.gnome.org/
 [2]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-4.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-5.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-6.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-7.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-8.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-9.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-10.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-11.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-12.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-13.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-14.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-15.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-16.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-17.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-18.jpg
 [18]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-19.jpg
 [19]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-20.jpg
 [20]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-21.jpg
 [21]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-22.jpg
 [22]: http://techfreak.pl/wp-content/uploads/2018/06/techfreak-gnome-shell-dahs-to-panel-23.jpg