---
title: Jak uruchamiać wiele obrazów ISO z jednego USB?
author: Przemek
type: post
date: 2013-12-15T19:02:39+00:00
url: /jak-uruchamiac-wiele-obrazow-iso-z-jednego-usb/
featured_image: /wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_12.jpg
hits:
  - 949
dsq_thread_id:
  - 2052462433
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - boot iso
  - grub
  - live usb

---
Dziś chciałbym przedstawić mój wynik poszukiwań softu do szybkiego robienia flasha z którego można uruchomić wiele obrazów ISO. Testowałem między innymi takie programy jak <a href="http://sourceforge.net/projects/multibootusb/files/Linux/Debian-Ubuntu/" target="_blank" rel="noopener">multibootusb</a>, <a href="http://www.pendrivelinux.com/yumi-multiboot-usb-creator/" target="_blank" rel="noopener">YUMI</a> i <a href="http://liveusb.info/dotclear/index.php?pages/install" target="_blank" rel="noopener">multisystem</a>. Oczywiście wszystko pod xubuntu.

<!--more-->

Dla przypomnienia świetnym i naprawdę prostym programem do tworzenia bootowalnego pendrajwa z ISO jest <a href="http://unetbootin.sourceforge.net/" target="_blank" rel="noopener">UNetbootin</a> ale może on wgrać tylko jedno ISO co w tym przypadku go eliminuje.

Ostatecznie tylko program Multisystem działał poprawnie i ze stworzonego flasha bez problemu mogłem uruchomić wybrane obrazy ISO.  Bardzo fajną opcją w programie Mulisystem jest odpalanie QEMU, czyli wirtualnej maszyny aby sprawdzić czy flash rzeczywiście jest boot&#8217;owalny. Dzięki czemu oszczędzamy sporo czasu i nie trzebą restartować komputera. W moim przypadku na pierwszy ogień poszedł knoppix a potem tails a instrukcja instalacji jest całkiem prosta:

<pre>sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
 wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- | sudo apt-key add -
 sudo apt-get update
 sudo apt-get install multisystem</pre>

Zobaczcie poniżej, jak mniej więcej wygląda instalacja obrazu na USB.

&nbsp;

[<img class="aligncenter size-full wp-image-5595" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_0.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_0" width="784" height="530" />][1] [<img class="aligncenter size-full wp-image-5596" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_1.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_1" width="1031" height="528" />][2] [<img class="aligncenter size-full wp-image-5597" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_2.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_2" width="964" height="520" />][3] [<img class="aligncenter size-full wp-image-5598" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_3.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_3" width="1007" height="508" />][4] [<img class="aligncenter size-full wp-image-5599" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_4.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_4" width="1065" height="489" />][5] [<img class="aligncenter size-full wp-image-5600" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_5.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_5" width="1056" height="533" />][6] [<img class="aligncenter size-full wp-image-5601" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_6.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_6" width="983" height="534" />][7] [<img class="aligncenter size-full wp-image-5602" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_7.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_7" width="1003" height="531" />][8] [<img class="aligncenter size-full wp-image-5603" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_8.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_8" width="963" height="505" />][9] [<img class="aligncenter size-full wp-image-5604" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_9.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_9" width="1011" height="534" />][10] [<img class="aligncenter size-full wp-image-5605" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_10.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_10" width="1029" height="520" />][11] [<img class="aligncenter size-full wp-image-5606" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_11.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_11" width="883" height="559" />][12] [<img class="aligncenter size-full wp-image-5607" src="//techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_12.jpg" alt="techfreak_pl_USB_ISO_lumtiboot_12" width="821" height="503" />][13]

 [1]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_0.jpg
 [2]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_1.jpg
 [3]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_2.jpg
 [4]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_3.jpg
 [5]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_4.jpg
 [6]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_5.jpg
 [7]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_6.jpg
 [8]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_7.jpg
 [9]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_8.jpg
 [10]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_9.jpg
 [11]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_10.jpg
 [12]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_11.jpg
 [13]: //techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_USB_ISO_lumtiboot_12.jpg