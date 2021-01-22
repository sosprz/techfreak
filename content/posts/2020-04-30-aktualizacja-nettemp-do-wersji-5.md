---
title: Aktualizacja nettemp do wersji 5
author: Przemek
type: post
date: 2020-04-30T19:29:06+00:00
url: /aktualizacja-nettemp-do-wersji-5/
featured_image: /wp-content/uploads/2020/04/techfreak-nettemp-wersja-5-3.png
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - nettemp

---
W najnowszej wersji nettemp parę istotnych zmian. 

Najnowsza wersja nettemp z jednej strony została odświeżona i przyniosła parę dobrych zmian z drugiej zabrała parę funkcji. Przede wszystkim nowa wersja została całkowicie przepisana z PHP do pythona co znacznie ja zoptymalizowało i sprawiło że nettemp jest znacznie łatwiejszy do modyfikacji i rozwoju co w poprzedniej wersji przy tylu funkcjach było znacznie utrudnione.
Nettemp 5 został oparty o framework flask (python) i MariaDB jako główna baza i sqlite3 jako baza dla odczytów z czujników. Dlaczego? Z testów wyszło, że wąskim gardłem jest sqlite3 dla głównej bazy, który w tym samym czasie musi zapisywać wiele odczytów z czujników do statusu jak i w tym samym czasie odczytywać dane z bazy dla ogólnego działania jak wysyłka maili lub weryfikacja odczytów. Przez to odczyty były pomijane co mogło powodować różnego rodzaju problemy.

<img src="http://techfreak.pl/wp-content/uploads/2020/04/techfreak-nettemp-wersja-5-3.png" alt="" class="wp-image-15460" /> </figure> 

Nowa wersja to zmiana serwera www z lighttpd na nginx, wymuszenie szyfrowanego połączenia https czy standaryzacja wysyłki danych do nettemp w formacie json. Wysłanie danych do nettemp jest zabezpieczone poprzez zastosowanie Json Web Token (JWT). Jak wysyłać dane opisałem na <a rel="noreferrer noopener" href="https://github.com/sosprz/nettemp" target="_blank">github</a> wraz z <a rel="noreferrer noopener" href="https://github.com/sosprz/nettemp/blob/nettemp5/app/scripts/test/jwt_test.py" target="_blank">przykładem</a>. Standaryzacja i kod napisany w pythone znacznie ułatwia dodawanie czujników podłączanych po I2C.

<img src="https://techfreak.pl/wp-content/uploads/2020/04/techfreak-nettenp-new-version1.png" alt="" class="wp-image-15469" /></figure> 

Pojawiła się zakładka Alarms w której zapisywane są statusy alarmów tak aby można było do nich wrócić. Wcześniej akcja to było tylko wysłanie maila.

<img src="https://techfreak.pl/wp-content/uploads/2020/04/techfreak-nettenp-new-version2.png.png" alt="" class="wp-image-15470" /></figure>

Zmiany graficzne to możliwość&nbsp; sortowania i grupowania statusu pod swoje potrzeby poprzez przesuwanie elementów myszką oraz nowy ciemny motyw. Pojawiło się więcej klikalnych linków, które ułatwiają poruszanie. <figure class="wp-block-image size-large">

<img src="https://techfreak.pl/wp-content/uploads/2020/04/techfreak-nettenp-new-version3.png" alt="" class="wp-image-15471" /> </figure> 

W tej wersji zabrakło sterowania GPIO, może w kolejnych dołączę ta opcję. Na ten moment chciałem się skupić na głównej funkcji czyli kontrola wartości, wyświetlanie i alarmowanie. Nowa wersja nie jest kompatybilna z poprzednimi wersjami. Najlepiej instalację przeprowadzić od nowa. 

W przypadku chęci zgłoszenia jakiegoś problemy zapraszam do komentowania poniżej lub na github: <https://github.com/sosprz/nettemp>