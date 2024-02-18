---
title: Taranis QX7 zmiana firmware
author: Przemek
type: post
date: 2017-08-31T21:40:11+00:00
url: /taranis-qx7-zmiana-firmware/
featured_image: /wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-1.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6110779858
categories:
  - Drony
tags:
  - frsky
  - taranis

---
Dziś pokażę jak zmienić, zaktualizować firmware w aparaturze Taranis QX7 do najnowszego OpenTX i nie tylko.

<!--more-->

Taranis QX7 przychodzi z firmware OpenTX 2.2.0 ale w zależności gdzie zakupimy aparaturę może ona przyjść w dwóch wersjach. Jeśli zamówisz z europejskiego sklepu to przyjdzie w firmware w wersji EU, czyli europejskiej. Jeśli będzie to jakiś sklep z poza uni europejskiej to przyjdzie z firmware tgzw. International. Firmware EU został wprowadzony z powodu restrykcji nałożonych przez Unię Europejską dokładnie chodzi o certyfikacje <a href="http://www.etsi.org/deliver/etsi_en/300300_300399/300328/01.08.01_30/en_300328v010801v.pdf" target="_blank" rel="noopener">ETSI EN 300 328 V1.8.1</a>. W skrócie firmware EU posiada LBT czyli Listen Before Talk, który ma za zadanie wykrywać czy coś się nadaje na danej częstotliwości zanim zacznie wysyłać inaczej ma czekać aż przeskoczy na kolejną częstotliwość skanuje, nadaje lub czeka.

  * Radio w wersji z firmware EU nie obsługuje odbiorników w wersji International. Co oznacza, że cały posiadany sprzęt trzeba sprowadzić do wspólnej wersji oprogramowania.
  * Wersja EU nie obsługuje trybu LR12, D8.
  * Wersja EU obsługuje tylko tryb D16 i od jakiegoś czasu LR12.

Ja nie namawiam na przechodzenie z wersji EU na nonEU ale pokazuje tylko na przykładzie jak można zmieniać firmware w dowolnym kierunku.

### Wgrywanie nowego/aktualnego firmware do aparatury Taranis QX7

Na początek trzeba wejść w tryb bootloader przyciskając trimy nad wyświetlaczem i na sekundę kliknąć guzik on/off. Następnie trzeba podłączyć kabel mini USB.

[<img class="aligncenter size-full wp-image-13182" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-4.jpg" alt="" width="1000" height="650" />][1] [<img class="aligncenter size-full wp-image-13183" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-5.jpg" alt="" width="1000" height="650" />][2] [<img class="aligncenter size-full wp-image-13184" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-6.jpg" alt="" width="1000" height="650" />][3]

Po tym zabiegu powinny pojawić się dwa dyski w systemie. Jeden będzie trzyma firmware i ustawienia a drugi to dane z karty SD wsadzonej do aparatury. Kolejnym krokiem jest instalacja programu do obsługi aparatury companion 2.2. I najlepiej od razu sterowników dla taranisa pod system [windows][4]. Dla systemów linux paczkę dfu-util.

[<img class="aligncenter size-full wp-image-13187" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-9.jpg" alt="" width="1000" height="328" />][5]

Małe objaśnienie poniżej, gdzie jakie przyciski są. Na teraz potrzebne są tylko Settings, Download, Write Firmware.

[<img class="aligncenter size-full wp-image-13196" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-10.jpg" alt="" width="1000" height="581" />][6]

W settings ustawiam język, nie zaznaczam EU.

[<img class="aligncenter size-full wp-image-13189" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-11.jpg" alt="" width="1000" height="977" />][7]

Klikam przycisk check for updates aby sprawdzić czy są nowsze pliki do pobrania. Następnie klikam na download aby pobrać firmware, zapisuje je.

[<img class="aligncenter size-full wp-image-13190" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-12.jpg" alt="" width="1000" height="428" />][8] [<img class="aligncenter size-full wp-image-13191" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-13.jpg" alt="" width="1000" height="428" />][9]

Klikam na guzik Write to TX aby zapisać firmware do radia.

[<img class="aligncenter size-full wp-image-13192" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-14.jpg" alt="" width="1000" height="1058" />][10]

Firmware zapisało się poprawnie.

[<img class="aligncenter size-full wp-image-13193" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-15.jpg" alt="" width="1000" height="176" />][11]

Co robić jak radio nie wstaje? Nie świeci wyświetlacz, radio tylko pyka w głośniku przy próbie włączenia. Nie wchodzi do trybu bootloader. Nic straconego. Wyciągnij baterię. Podłącz tylko kabel USB i ponownie kliknij Write Firmware. Trzeba pamiętać o sterownikach o których pisałem wyżej.

[<img class="aligncenter size-full wp-image-13194" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-16.jpg" alt="" width="1000" height="673" />][12] [<img class="aligncenter size-full wp-image-13195" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-17.jpg" alt="" width="1000" height="707" />][13]

Proszę bardzo firmware wgrany poprawnie do radia.

### Jak wgrać firmware do wewnętrznego modułu XJT?

Na początek pobierz firmware z oficjalnej strony [FrSky][14].

[<img class="aligncenter size-full wp-image-13202" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-5.jpg" alt="" width="1000" height="390" />][15]

Po rozpakowaniu zmień nazwę **XJT\_NONEU\_V20_build170317.hex.frk** na krótszą np. **XJT\_NO\_170317.hex.frk** i wgraj plik do radia na kartę SD do folderu FIRMWARES. Zrobić to możesz przez kabel mini USB po wejściu w tryb bootloader, pokażą się dyski w systemie. Jak katalog nie istnieje to trzeba stworzyć.

[<img class="aligncenter size-full wp-image-13203" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-6.jpg" alt="" width="1000" height="133" />][16] [<img class="aligncenter size-full wp-image-13204" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-7.jpg" alt="" width="1000" height="193" />][17] [<img class="aligncenter size-full wp-image-13205" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-8.jpg" alt="" width="1000" height="648" />][18]

Teraz trzeba wgrać firmware do modułu XJT. Robi się to już z radia, trzeba przejść do zakładki SD CARD, wybrać plik **XJT\_NO\_170317.hex.frk**, kliknąć enter i wybrać **Flash int.module**.

[<img class="aligncenter size-full wp-image-13198" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-1.jpg" alt="" width="1000" height="650" />][19] [<img class="aligncenter size-full wp-image-13199" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-2.jpg" alt="" width="1000" height="650" />][20] [<img class="aligncenter size-full wp-image-13200" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-3.jpg" alt="" width="1000" height="650" />][21] [<img class="aligncenter size-full wp-image-13201" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-4.jpg" alt="" width="1000" height="650" />][22]

Jeśli istnieje potrzeba wgrania nowego firmware do odbiorników np. FrSky XSR to robi się to dokładnie tak samo jak powyżej tylko trzeba wybrać **Flash ext. module**. I oczywiście wcześniej pobrać poprawne najnowsze, pliki ze strony producenta. We wpisie <a href="//techfreak.pl/aktualizacja-frsky-x4r-do-cppm/" target="_blank" rel="noopener">aktualizacja-frsky-x4r-do-cppm</a> pokazałem jak podłączyć odbiornik X4R do Taranisa X9D aby zaktualizować w nim firmware, w przypadku tego modelu aparatury jest dokładnie tak samo.

Wszystko jest naprawdę fajne i przyjemnie w aktualizacji. Nie potrzeba żądnych programatorów. Mam nadzieje, że poszło Ci tak samo dobrze jak mi :)

Jeśli zastanawiasz się nad zakupem aparatury lub innych części proszę zakup je z moich linków:

[Taranis QX7 z gearbest.com][23]

[Taranis QX7 z banggood.com][24]

 [1]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-4.jpg
 [2]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-5.jpg
 [3]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-6.jpg
 [4]: http://www.open-tx.org/2013/07/18/taranis-windows-usb-driver-for-manual-installation
 [5]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-9.jpg
 [6]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-10.jpg
 [7]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-11.jpg
 [8]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-12.jpg
 [9]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-13.jpg
 [10]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-14.jpg
 [11]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-15.jpg
 [12]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-16.jpg
 [13]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-firmware-nonEU-17.jpg
 [14]: https://www.frsky-rc.com/xjt/
 [15]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-5.jpg
 [16]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-6.jpg
 [17]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-7.jpg
 [18]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-8.jpg
 [19]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-1.jpg
 [20]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-2.jpg
 [21]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-3.jpg
 [22]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-taranis-QX7-update-XJT-firmware-nonEU-4.jpg
 [23]: https://www.gearbest.com/multi-rotor-parts/pp_604499.html?lkid=11236616
 [24]: https://www.banggood.com/FrSky-ACCST-Taranis-Q-X7-2_4GHz-16CH-Transmitter-White-Black-p-1112717.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling