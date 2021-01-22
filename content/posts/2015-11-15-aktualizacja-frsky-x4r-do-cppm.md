---
title: Aktualizacja FrSky X4R do CPPM
author: Przemek
type: post
date: 2015-11-15T11:35:35+00:00
url: /aktualizacja-frsky-x4r-do-cppm/
featured_image: /wp-content/uploads/2015/11/techfreak_FrSky_X4R_taranis_CPPM_12-624x416.jpg
hits:
  - 260
dsq_thread_id:
  - 4320518515
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - frsky
  - OpenTX
  - taranis

---
Do mojego nowego quadkoptera o wymiarach 180mm zakupiłem odbiornik FrSky X4R który działa na S.BUS. Poniżej pokażę jak łatwo zaktualizować oprogramowanie aby odbiornik działał w trybie CPPM.

<!--more-->

Na początek może wyjaśnię czym jest jest CPPM i SBUS. Jest to po prostu agregacja wszystkich kanałów w jednym przewodzie sygnałowym. Dzięki takim rozwiązaniom żegnasz się z makaronem kabelków które idą z odbiornika RC do kontrolera lotu (FC).

Posiadam kontroler lotu (FC) naze32 rev5 który nie działa z odbiornikami na SBUS. Można dokupić odpowiedni konwerter ale nie o to chodzi aby dokładać do modelu koleje urządzenia. Generalnie SBUS to protokół cyfrowy i szybszy od CPPM który jest protokołem analogowym. Patrząc od drugiej strony mógłbym mieć kontroler i odbiornik RC kompatybilny z SBUS i nie było by o czym rozmawiać. Naze32 to sprawdzona płytka która jest w miarę tania i jedynym jej minusem jest brak regulatora na 5V do jej zasilenia. Tak wiec podsumowując mam Naze32 rev5  i dobiornik FrSky X4R który domyślnie działa tylko z SBUS. Zadanie jakie mam do wykonanie to wgranie nowego oprogramowania do X4R które pozwala przesyłać dane do FC za pomocą protokołu CPPM.

Jeśli jesteś posiadaczem aparatury FrSky Taranis i chcesz zaktualizować odbiornik FrSky X4R to masz szczęście, nie musisz nic dokupywać ani nie potrzebujesz żądnych konwerterów USB  aby zabrać się za aktualizację. Jest jedno ale, twoja aparatura musi mieć wgrany OpenTX 2.1 który pozwala aktualizować oprogramowanie przez SBUS, który jest wyprowadzony w slocie na zewnętrzny nadajnik (klapka z tyłu aparatury Taranis) Aby zaktualizować aparaturę wystarczy ściągnąć <a href="http://www.open-tx.org/2015/11/11/opentx-2.1.6/" target="_blank" rel="noopener">Companion 2.1</a> który od razu powiadomi Cię o możliwości wgrania najnowszego oprogramowania.

<a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsky-x4r-taranis-cppm_1/" rel="attachment wp-att-10700"><img class="aligncenter size-full wp-image-10700" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSky-X4R-taranis-CPPM_1.jpg" alt="techfreak-FrSky-X4R-taranis-CPPM_1" width="1000" height="667" /></a>

#### Podłączenie FrSky X4R

W zestawie z X4R przychodzi kabelek z którego pomocą wgramy nowy firmware i podłączymy odbiornik do aparatury taranis.

  * Zwróć uwagę na podłączenie odbiornika do aparatury gdzie czerwony to 3.3V, czarny GND, zółty SYGNAŁ. W aparaturze trzeci od lewej to VCC, czwarty GND, piąty SYGNAŁ. Poniższe fotki pokazują odpowiednie podłączenie.
  * Po podłączeniu odbiornik się nie włączy dopóki nie zaczniesz wgrywać nowego oprogramowania, więc nie zasilaj go dodatkowo z innego źródła.

<a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak_frsky_x4r_taranis_cppm_12/" rel="attachment wp-att-10706"><img class="aligncenter size-full wp-image-10706" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak_FrSky_X4R_taranis_CPPM_12.jpg" alt="techfreak_FrSky_X4R_taranis_CPPM_12" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak_frsky_x4r_taranis_cppm_13/" rel="attachment wp-att-10707"><img class="aligncenter size-full wp-image-10707" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak_FrSky_X4R_taranis_CPPM_13.jpg" alt="techfreak_FrSky_X4R_taranis_CPPM_13" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak_frsky_x4r_taranis_cppm_14/" rel="attachment wp-att-10708"><img class="aligncenter size-full wp-image-10708" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak_FrSky_X4R_taranis_CPPM_14.jpg" alt="techfreak_FrSky_X4R_taranis_CPPM_14" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak_frsky_x4r_taranis_cppm_15/" rel="attachment wp-att-10709"><img class="aligncenter size-full wp-image-10709" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak_FrSky_X4R_taranis_CPPM_15.jpg" alt="techfreak_FrSky_X4R_taranis_CPPM_15" width="1000" height="667" /></a>

#### Firmware

Frsky wypuściło oficjalne oprogramowane do X4R które umożliwia używanie CPPM ale do wyboru mamy dwie wersje EU dla Europy i non-EU dla reszty świata. Moj Taranis ma w nadajniku firmware non EU więc do mojego odbiornika X4R wgrywam też non EU. To jest warunek aby urządzenia się bindowały. Firmware EU został wprowadzony z powodu restrykcji nałożonych przez Unię Europejską dokładnie chodzi o certyfikacje <a href="http://www.etsi.org/deliver/etsi_en/300300_300399/300328/01.08.01_30/en_300328v010801v.pdf" target="_blank" rel="noopener">ETSI EN 300 328 V1.8.1</a>.

Ze strony <a href="http://www.frsky-rc.com/download/index.php?sort=Firmware" target="_blank" rel="noopener">FrSky</a> trzeba ściągnąć firmware i wgrać na kartę SD Taranisa i wrzucić do folderu np. FIRMWARES

Non-EU

<a href="http://www.frsky-rc.com/download/view.php?sort=Firmware&down=210&file=X4R-X4RSB-CPPM-%20Non-EU%20Version" target="_blank" rel="noopener">http://www.frsky-rc.com/download/view.php?sort=Firmware&down=210&file=X4R-X4RSB-CPPM-%20Non-EU%20Version</a>

EU

<a href="http://www.frsky-rc.com/download/view.php?sort=Firmware&down=209&file=X4R-X4RSB-CPPM-EU%20Version" target="_blank" rel="noopener">http://www.frsky-rc.com/download/view.php?sort=Firmware&down=209&file=X4R-X4RSB-CPPM-EU%20Version</a>

Po przejściu już na aparaturze do folderu FIRMWARES wystarczy kliknąć na odpowiedni firmware i wybrać **Flash External Device**

<a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-12/" rel="attachment wp-att-10712"><img class="aligncenter size-full wp-image-10712" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-12.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-12" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-13/" rel="attachment wp-att-10713"><img class="aligncenter size-full wp-image-10713" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-13.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-13" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-14/" rel="attachment wp-att-10714"><img class="aligncenter size-full wp-image-10714" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-14.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-14" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-15/" rel="attachment wp-att-10715"><img class="aligncenter size-full wp-image-10715" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-15.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-15" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-16/" rel="attachment wp-att-10716"><img class="aligncenter size-full wp-image-10716" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-16.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-16" width="1000" height="667" /></a>

#### Bindowanie

W aparaturze przechodzimy do ustawień swojego modelu klikamy BIND. W odbiorniku zakładam zworkę na piny 2 i 3. Ponieważ CPPM uruchamia się dopiero wtedy gdy przy bindowaniu jest założona zworka. Podłączam napięcie do odbiornika z wciśniętym guziczkiem F/S. Na aparaturze klikam enter. I odłączam zasilanie do odbiornika. I tyle Taranis z odbiornikiem X4R są połączone. Sygnalizuje to zielona dioda na odbiorniku.

<a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-firmware-12_1/" rel="attachment wp-att-10719"><img class="aligncenter size-full wp-image-10719" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-firmware-12_1.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-firmware-12_1" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-firmware-13_1/" rel="attachment wp-att-10720"><img class="aligncenter size-full wp-image-10720" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-firmware-13_1.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-firmware-13_1" width="1000" height="667" /></a>

<a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-firmware-bind12/" rel="attachment wp-att-10721"><img class="aligncenter size-full wp-image-10721" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-firmware-bind12.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-firmware-bind12" width="1000" height="667" /></a> <a href="http://techfreak.pl/aktualizacja-frsky-x4r-do-cppm/techfreak-frsk-x4r-taranis-cppm-update-firmware-bind13/" rel="attachment wp-att-10722"><img class="aligncenter size-full wp-image-10722" src="http://techfreak.pl/wp-content/uploads/2015/11/techfreak-FrSk-X4R-taranis-CPPM-update-firmware-bind13.jpg" alt="techfreak-FrSk-X4R-taranis-CPPM-update-firmware-bind13" width="1000" height="667" /></a>

Dawajcie znać czy wszystko działa!