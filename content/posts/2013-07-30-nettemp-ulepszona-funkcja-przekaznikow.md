---
title: Nettemp – ulepszona funkcja przekażników
author: Przemek
type: post
date: 2013-07-30T05:20:36+00:00
url: /nettemp-ulepszona-funkcja-przekaznikow/
featured_image: /wp-content/uploads/2013/07/raspberry_pi_przekazniki1.jpg
hits:
  - 844
dsq_thread_id:
  - 1546681280
categories:
  - Elektronika
  - Linux
tags:
  - nettemp
  - Raspberry pi

---
Od paru dni nie działo się na techfreak nic bo trochę naszło mnie na dopieszczenie <a title="Monitoring temperatury" href="http://techfreak.pl/nettemp/" target="_blank">nettempa</a>, mojego monitoringu temperatury. Dodatkowo powstało też małe <a title="forum nettemp" href="http://techfreak.pl/forums/forum/nettemp-monitoring-temperatury/" target="_blank">forum</a> na którym chciałbym dyskutować o nettemp i informować co się dzieje z projektem. Ciesze się że te parę osób korzysta z programu i właśnie tam chciałbym skierować wszystkie nasze dyskusje.

Dobra ale przechodząc do przekaźników. Po zakupieniu popularnego dwu przekaźnikowego modułu okazało się ze jest on sterowany masą co zmusiło mnie do zrobienia drobnych zmian w kodzie tak aby można było sterować przekaźnikami i stanem LOW i HIGH. Od teraz można wybrać czy steruje HI czy LO a realizuje to funkcja Reverse, ikonka literki R obok nazwy przekaźnika.

Na ten moment przekaźnikami można sterować tak że można je **włączyć i wyłączyć** i **włączyć na określony** czas np. 5min lub 2 godziny. Poniżej krótki filmik który pokazuje te funkcje. Ale jeszcze zanim filmik to będziecie mogli zobaczyć jeszcze funkcje termometru gdzie można określić czy przekaźnik ma się wyłączyć lub włączyć, kiedy określona temperatura osiągnie żądaną wartość na wybranym czujniku. Ta funkcja jest własnie kończona więc pewnie pojawi się kolejny filmik za jakiś czas.



&nbsp;