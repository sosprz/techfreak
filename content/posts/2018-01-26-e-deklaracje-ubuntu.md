---
title: e-deklaracje na Ubuntu
author: Przemek
type: post
date: 2018-01-26T09:42:46+00:00
url: /e-deklaracje-ubuntu/
featured_image: /wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-15.png
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6438950826
onesignal_meta_box_present:
  - 1
categories:
  - Linux
tags:
  - ubuntu

---
Zobacz jak zainstalować e-deklaracje na Ubuntu 17.10 aby się rozliczyć z podatku za 2017 rok.

<!--more-->

Poniżej instrukcja jak zainstalować e-deklaracje na Ubuntu 17.10 (64bity), jest ona bardzo prosta. Prostota polega na tym, że trzeba ściągnąć i zainstalować tylko trzy paczki:

  * adobe-air_amd64.deb
  * AdbeRdr9.5.5-1\_i386linux\_enu.deb
  * edeklaracje.deb

Mój sposób różni się od innych instrukcji, które można znaleźć w necie tym że paczki są już gotowe i nie trzeba przechodzić procesów instalacji, które na końcu i tak tworzą i instalują powyższe paczki. Dodatkowo nie ma problemu przy domyślnym serwerze obrazu Xwayland. Od góry pierwsza paczka to **Adobe Air2**, który jest potrzebny do uruchomienia samych e-deklaracji. **AdbeRdr9** to czytnik plików pdf wypuszczony przez Adobe. Najważniejszy to **edeklaracje.deb w wersji 10**. ten plik został stworzony z plików tmp które zebrały się przy normalnej instalacji, której aktualnie nie można przejść. **Nic nie modyfikowałem**, jest tak jak było by po poprawnej instalacji z Adobe AIR2. Pobierz wszystkie trzy pliki z <https://mega.nz/#F!6QcHyYaS!wWK1iZ2QGr-P7NQeh3pXGg> i w powyższej kolejności instaluj je.

Poniżej przygotowałem screen-relację z instalacji i uruchomienia. Na screenie można zobaczyć. że pobieram paczkę AdbrRdr9 wget. Tak czy inaczej paczka jest do pobrania powyżej. Na samym dole będzie instrukcja jak to zrobić.

Hasze MD5 z plików też są poniżej:

  * 9df2a404a5cb82d506c9e8914a31f16f adobe-air_amd64.deb
  * 88036c68998d565c4365e2ad89b04d51 AdbeRdr9.5.5-1\_i386linux\_enu.deb
  * 752cb684e9517465d2823e7619457bb0 edeklaracje.deb

Aktualnie jedyny minus jest taki, że w przypadku aktualizacji e-deklaracji i powiadomieniu o nowej wersji nie zainstaluje się ona sama. Jak wyjdzie wrzucę nową wersję.

Jeśli ktoś ma profil z poprzednich lat bez problemu program to wykryje. Można sobie go spokojnie przenosić leży w: **/home/twoj-user/.appdata/e-Deklaracje.***

## Screen-relacja

[<img class="aligncenter size-full wp-image-14330" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-1.png" alt="" width="1000" height="650" />][1]

[<img class="aligncenter size-full wp-image-14331" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-2.png" alt="" width="1000" height="650" />][2]

[<img class="aligncenter size-full wp-image-14332" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-3.png" alt="" width="1000" height="650" />][3]

[<img class="aligncenter size-full wp-image-14333" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-4.png" alt="" width="1000" height="650" />][4]

[<img class="aligncenter size-full wp-image-14334" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-5.png" alt="" width="1000" height="650" />][5]

[<img class="aligncenter size-full wp-image-14335" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-6.png" alt="" width="1000" height="650" />][6]

[<img class="aligncenter size-full wp-image-14336" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-7.png" alt="" width="1000" height="650" />][7]

[<img class="aligncenter size-full wp-image-14337" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-8.png" alt="" width="1000" height="650" />][8]

[<img class="aligncenter size-full wp-image-14338" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-9.png" alt="" width="1000" height="650" />][9]

[<img class="aligncenter size-full wp-image-14339" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-10.png" alt="" width="1000" height="650" />][10]

[<img class="aligncenter size-full wp-image-14340" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-11.png" alt="" width="1000" height="650" />][11]

[<img class="aligncenter size-full wp-image-14341" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-12.png" alt="" width="1000" height="650" />][12]

[<img class="aligncenter size-full wp-image-14342" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-13.png" alt="" width="1000" height="650" />][13]

[<img class="aligncenter size-full wp-image-14343" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-14.png" alt="" width="1919" height="500" />][14]

[<img class="aligncenter size-full wp-image-14344" src="http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-15.png" alt="" width="1000" height="650" />][15]

###  Dodatkowe:

<pre>wget http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i486linux_enu.bin 
chmod +x ./AdbeRdr9.5.5-1_i486linux_enu.bin 
sudo ./AdbeRdr9.5.5-1_i486linux_enu.bin</pre>

### Aktualizacja 2019

Aby zaktualizować lub zainstalować e-deklaracje trzeba zrobić następujące kroki:

Stowrzyć katalog:

<pre>mkdir -p ~/bin/adobeair</pre>

Stworzyć plik:

<pre>nano ~/bin/adobeair/ar</pre>

Wypełnić go poniższymi liniami:

<pre>#!/bin/bash
if [ "$1" = "qs" ]; then
rm "$2"
fi
exec /usr/bin/ar "$@"</pre>

Stworzyć plik:

<pre>nano ~/bin/adobeair/dpkg-deb</pre>

Wypełnić go poniższymi liniami:

<pre>#!/bin/bash

if [ "$1" = "-b" ]; then
DIR="$2/DEBIAN"
if [ -L "$DIR" ]; then
DEST=`readlink "$DIR"`
rm -Rf "$DIR"
cp -R "$DEST" "$DIR"
fi
fi
/usr/bin/dpkg-deb "$@"</pre>

Nadać uprawnienia do powyższych plików:

<pre>chmod +x ~/bin/adobeair/*</pre>

Ściągnąć oficjalny installer e-deklaracji:

<pre>wget http://www.e-deklaracje.gov.pl/files/dopobrania/e-dek/app/e-DeklaracjeDesktop.air</pre>

Uruchomić powyższy installer z parametrami:

<pre>sudo PATH="$HOME/bin/adobeair:$PATH" /opt/Adobe\ AIR/Versions/1.0/Adobe\ AIR\ Application\ Installer $(pwd)/e-DeklaracjeDesktop.air</pre>

 [1]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-1.png
 [2]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-2.png
 [3]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-3.png
 [4]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-4.png
 [5]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-5.png
 [6]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-6.png
 [7]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-7.png
 [8]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-8.png
 [9]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-9.png
 [10]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-10.png
 [11]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-11.png
 [12]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-12.png
 [13]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-13.png
 [14]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-14.png
 [15]: http://techfreak.pl/wp-content/uploads/2018/01/techfreak-e-deklaracje-linux-ubuntu-pit-15.png
