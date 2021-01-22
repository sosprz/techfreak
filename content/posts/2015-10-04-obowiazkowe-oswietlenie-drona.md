---
title: Obowiązkowe oświetlenie drona
author: Przemek
type: post
date: 2015-10-04T17:53:28+00:00
url: /obowiazkowe-oswietlenie-drona/
featured_image: /wp-content/uploads/2015/10/techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_3-624x416.jpg
hits:
  - 304
dsq_thread_id:
  - 4193519035
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - cleanflight
  - fpv

---
Oświetlenie drona to może na początku nie jest obowiązkowa sprawa kiedy lata się blisko i tylko w dzień. Przychodzi taka chwila kiedy oświetlenie swojej maszyny jest potrzebne ze względu na to, że np. latasz z kumplem lub w grupie. Gdzie widoczność jest potrzebna tak jak w samochodzie. W zasadzie to po aby nikt nie wleciał Ci w <del>dupe</del> Ciebie.

<!--more-->

Kiedyś też miałem ledy na pokładzie swojej _dwiesciepiendziesiatki_ ale zastanawiał mnie sens zakładania ich, jeśli inni piloci mieli też ten sam kolor. Fajnie jak każdy na swój. Teraz można zakupić za 16zł pasek ośmiu LED RGB w których można sobie skonfigurować dowolny kolor z  ośmiu dostępnych najbardziej widocznych. Ja na testy zakupiłem pasek ośmiu pikseli WS2812B od firmy MATEK.

<a href="//techfreak.pl/obowiazkowe-oswietlenie-drona/techfreak_ws2812b_led_pixel_cleanflight_drone_quadcopter_1/" rel="attachment wp-att-10392"><img class="aligncenter size-full wp-image-10392" src="//techfreak.pl/wp-content/uploads/2015/10/techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_1.jpg" alt="techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_1" width="1000" height="667" /></a> <a href="//techfreak.pl/obowiazkowe-oswietlenie-drona/techfreak_ws2812b_led_pixel_cleanflight_drone_quadcopter_3/" rel="attachment wp-att-10394"><img class="aligncenter size-full wp-image-10394" src="//techfreak.pl/wp-content/uploads/2015/10/techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_3.jpg" alt="techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_3" width="1000" height="667" /></a> <a href="//techfreak.pl/obowiazkowe-oswietlenie-drona/techfreak_ws2812b_led_pixel_cleanflight_drone_quadcopter_2/" rel="attachment wp-att-10393"><img class="aligncenter size-full wp-image-10393" src="//techfreak.pl/wp-content/uploads/2015/10/techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_2.jpg" alt="techfreak_WS2812B_led_pixel_cleanflight_drone_quadcopter_2" width="1000" height="667" /></a>

Podłączenie odbywa się poprzez podłączenie paska do 5V i GND oraz do 5 pinu w Naze32. Jest to pin do wysyłania danych, czyli cleanflight wysyła w danym momencie komendę na jaki kolor ma zaświecić się dana dioda. Diody RGB WS2812B działają na zasadzie kaskady. Wysyłane są dla każdego piksela 24bity danych. Jeśli mamy 8 pikseli zostanie wysłanych z kontrolera 8x 24bity danych. Przez pierwszy pixel przejdzie 8x 24bity ale &#8222;weźmie&#8221; on tylko 24bity. Przez następnyt przejdzie 7&#215;24 ale też weźmie on tylko 24 bity. Ostatni otrzyma tyko 24bity. Dokładna specyfikacja pod <a href="https://www.adafruit.com/datasheets/WS2812B.pdf" target="_blank" rel="noopener">tym</a> linkiem.

Konfiguracja odbywa się w Cleanflight w zakładce LED strip. Jest to bardzo intuicyjne i proste.

<a href="//techfreak.pl/obowiazkowe-oswietlenie-drona/techfreak_ws2812b_led_pixel_cleanflight/" rel="attachment wp-att-10391"><img class="aligncenter size-full wp-image-10391" src="//techfreak.pl/wp-content/uploads/2015/10/techfreak_WS2812B_led_pixel_cleanflight.jpg" alt="techfreak_WS2812B_led_pixel_cleanflight" width="1000" height="544" /></a>

Poniżej mój filmik z powyższej konfiguracji.



&nbsp;