---
title: Nettemp – funkcja UPS status
author: Przemek
type: post
date: 2014-05-21T03:30:58+00:00
url: /nettemp-funkcja-ups-status/
featured_image: /wp-content/uploads/2014/05/nettemp_UPS_APC_USB_0.jpg
hits:
  - 1318
dsq_thread_id:
  - 2701241963
categories:
  - Elektronika
tags:
  - nettemp
  - Raspberry pi
  - usb

---
Jak wiesz co jakiś czas rozwijam nettempa o jakieś nowe funkcje. Lista funkcji które są do zrobienia jest naprawdę długa. Nad niektórymi cały czas pracuje a niektóre wprowadzam wcześniej. I dziś chciał bym zaprezentować funkcje UPS status która prezentuje status podłączonego UPS poprzez port USB.

<!--more-->

Posiadam popularny model UPS&#8217;a, Back UPS ES 550 do którego można podłączyć się kabelkiem USB, który jest w zestawie. Jeśli go nie masz a potrzebujesz to schemat możesz zobaczyć pod tym linkiem:

[http://www.hardwarecanucks.com/forum/attachments/guides-how-tos/19131d1366111103-how-build-apc-u-p-s-data-cable-upsusb.png][1]

Ok zobacz jak wygląda nowa funkcja:

[<img class="aligncenter size-full wp-image-7027" src="http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_1.jpg" alt="nettemp_UPS_APC_USB_1" width="929" height="243" />][2]

[<img class="aligncenter size-full wp-image-7026" src="http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_0.jpg" alt="nettemp_UPS_APC_USB_0" width="925" height="476" />][3]

W statusie są najważniejsze informacje dotyczące UPS&#8217;a:

  * Model
  * Status &#8211; czy jest on line czy off line
  * Napięcie na linii wejścia
  * Procentowe naładowanie baterii
  * Czas podtrzymania na baterii
  * Napięcie baterii

&nbsp;

### Powiadomienia

Gdy UPS wykryje zanik zasilania lub jego przywrócenie. Zdefiniowani użytkownicy zostaną powiadomieni mailem.

[<img class="aligncenter size-full wp-image-7028" src="http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_2.jpg" alt="nettemp_UPS_APC_USB_2" width="540" height="102" />][4] [<img class="aligncenter size-full wp-image-7029" src="http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_3.jpg" alt="nettemp_UPS_APC_USB_3" width="534" height="130" />][5]

## Instalacja

Obecni użytkownicy mogą zrobić update z Tools. Ale i tak ręcznie muszą odpalić skrypt z

<pre>/var/www/nettemp/modules/ups/install</pre>

W planach mam jeszcze możliwość zdefiniowania po jakim czasie po zaniku napięcia UPS ma się wyłączyć. I to na tyle, mam nadzieje, że nowa funkcja przyda się.

&nbsp;

 [1]: http://www.hardwarecanucks.com/forum/attachments/guides-how-tos/19131d1366111103-how-build-apc-u-p-s-data-cable-upsusb.png "Kableke USB APC UPS"
 [2]: http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_0.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_2.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/05/nettemp_UPS_APC_USB_3.jpg