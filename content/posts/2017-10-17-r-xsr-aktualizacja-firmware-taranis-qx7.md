---
title: R-XSR aktualizacja firmware przez Taranis QX7
author: Przemek
type: post
date: 2017-10-17T13:46:46+00:00
url: /r-xsr-aktualizacja-firmware-taranis-qx7/
featured_image: /wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update2.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6221415919
categories:
  - Drony
tags:
  - frsky

---
Jak zaktualizować najlżejszy i najmniejszy nadajnik FrSky [R-XSR][1] posiadając aparaturę Taranis QX7

<!--more-->

Po co aktualizować firmware w odbiorniku? Można z tego powodu aby zmienić rodzaj z LBT na International lub na odwrót, napisałem trochę o tym ostatnio &#8211; [Taranis QX7 zmiana firmware][2]. Głównie warto aktualizować bo nowszy firmware zawiera w sobie przydatne poprawki takie jak, możliwość sterowania PID poprzez aparaturę. Zresztą taki sam bug wystąpił w popularnym odbiorniku XSR. Więc sprawa jest prosta wystarczy pobrać firmware z oficjalnej strony [FrSky][3].

[<img class="aligncenter wp-image-14000" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update0.png" alt="" width="860" height="456" />][4]

W katalogu będą znajdować się dwa pliki, które odpowiadają za wersję LBT i FCC. Trzeba jeden z nich wgrać na kartę SD aparatury, najlepiej do katalogu FIRMWARES. Musisz wiedzieć jaką masz wersję firmware modułu nadawczego w aparaturze, inaczej urządzenia się nie dogadają.

[<img class="aligncenter size-full wp-image-14001" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update1.png" alt="" width="333" height="187" />][5]

Jak widać poniżej R-XSR jest naprawdę mały i lekki. W zestawie z odbiornikiem znajduje się przewód do aktualizacji firmware i jest on prawidłowym przewodem aby aktualizacje przeprowadzić ze slotu u dołu aparatury. Od lewej przewody czarny GND, czerwony 5V, żółty SPORT.

[<img class="aligncenter size-full wp-image-14002" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update2.jpg" alt="" width="1000" height="650" />][6]

Gdy plik jest już na karcie trzeba przejść do menu urządzenia i w zakładce SD-CARD wybrać folder FIRMWARES, następnie wybrać pokrętłem plik i nacisnąć je zaznaczając flash Ext. Device.

[<img class="aligncenter size-full wp-image-14003" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update3.jpg" alt="" width="1000" height="650" />][7] [<img class="aligncenter size-full wp-image-14004" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update4.jpg" alt="" width="1000" height="650" />][8]

Poniżej widać prawidłowe podłączenie. Diody na odbiorniku zapalą się tylko wtedy, kiedy zostanie nawiązana prawidłowa komunikacja z aparaturą po zainicjowaniu wgrywania firmware.

[<img class="aligncenter size-full wp-image-14005" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update5.jpg" alt="" width="1000" height="650" />][9]

To tyle aktualizacja jest prosta i bezproblemowa jak posiada się zestaw od jednego producenta. W przypadku Taranisa X9D procedura jest taka sama za wyjątkiem tego, że trzeba podłączyć się do innego portu &#8211; można przeczytać o tym tu [techfreak.pl/aktualizacja-frsky-x4r-do-cppm][10].

Jeśli chcesz zakupić R-XSR to zakup go z tego linku [R-XSR][1].

&nbsp;

 [1]: https://www.banggood.com/FrSky-R-XSR-Ultra-SBUSCPPM-D16-16CH-Mini-Redundancy-Receiver-1_5g-p-1186057.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling
 [2]: https://techfreak.pl/taranis-qx7-zmiana-firmware/
 [3]: https://www.frsky-rc.com/r-xsr/
 [4]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update0.png
 [5]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update1.png
 [6]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update2.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update3.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update4.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-R-XSR-firmware-taranis-QX7-update5.jpg
 [10]: https://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/