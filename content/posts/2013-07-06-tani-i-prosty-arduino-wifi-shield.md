---
title: Tani i prosty Arduino WiFi shield
author: Przemek
type: post
date: 2013-07-06T20:24:13+00:00
url: /tani-i-prosty-arduino-wifi-shield/
featured_image: /wp-content/uploads/2013/07/arduino_TP-LINK-TL-WR702N.jpg
hits:
  - 1951
dsq_thread_id:
  - 1473146237
categories:
  - Elektronika
tags:
  - arduino
  - wifi

---
**Arduino** to tania i fajna płytka do mniej lub bardziej skomplikowanych projektów elektronicznych w których coraz większą rolę odgrywa komunikacja bezprzewodowa. Dlaczego ten rodzaj komunikacji jest taki pożądany nie trzeba tłumaczyć ale dlaczego to tak drogo wychodzi? Poniżej mam dla was fajny i tani (bo tani to fajny a fajny to <del>czasem</del> tani) projekt Arduino WiFi Shield zrealizowany na Ruterze **TL-WR702N**.

<!--more-->

Zobaczmy jakie koszty trzeba ponieść aby mieć cały komplet Arduino z komunikacja bezprzewodową:

  * <span style="line-height: 1.5em;">Arduino jakaś </span><del style="line-height: 1.5em;">fajna</del> <span style="line-height: 1.5em;">podróbka &#8211; ok 60 zł</span>
  * <a style="line-height: 1.5em;" title="Arduino WiFi shield" href="Arduino WiFi Shield (integrated antenna)" target="_blank">Arduino WiFi Shield (integrated antenna)</a><span style="line-height: 1.5em;"> &#8211; ok 300 zł</span>

Ok. 360 zł to trochę dużo ale autor strony [hackanerd.wordpress.com][1] wpadł na całkiem fajny pomysł aby obniżyć koszty. Zamiast kupować WiFi Shield zakupił **Ethernet Shield** ( u nas za ok 50 zł) i mini Ruter **TP-LINK WR702N** który u nas można zakupić za ok. 75 zł. Mini router został bez obudowy a wyciągnięta płyta została zainstalowana na górze Ethernet Shield, szybkie luty i gotowe. Dalej chyba nie trzeba tłumaczyć Ethernet Shield został podłączony krótkim paczkordem do routera i jest jednym z hostów w jego sieci. Najlepiej zainstalować OpenWRT na TP-linku co pozwoli na dowolne modernizacje. I tak właśnie realizowany jest dostęp do samego Arduino bezprzewodowo. Fotki z projektu poniżej.<span style="line-height: 1.5em;"><br /> </span>

[<img class="aligncenter size-full wp-image-3975" alt="TP-LINK TL-WR702N" src="http://techfreak.pl/wp-content/uploads/2013/07/TP-LINK-TL-WR702N.jpg" width="800" height="269" />][2]

[<img class="aligncenter size-full wp-image-3974" alt="arduino_TP-LINK TL-WR702N" src="http://techfreak.pl/wp-content/uploads/2013/07/arduino_TP-LINK-TL-WR702N.jpg" width="800" height="714" />][3]

Mi pomysł się podoba że względu na wymiary mini routera może ktoś ma jeszcze jakieś inne pomysły?

 [1]: http://hackanerd.wordpress.com/2013/07/06/how-to-make-a-simple-arduino-wireless-shield/
 [2]: http://techfreak.pl/wp-content/uploads/2013/07/TP-LINK-TL-WR702N.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/07/arduino_TP-LINK-TL-WR702N.jpg