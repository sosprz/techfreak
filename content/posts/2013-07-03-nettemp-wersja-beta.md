---
title: nettemp wersja 7 beta
author: Przemek
type: post
date: 2013-07-03T13:20:36+00:00
url: /nettemp-wersja-beta/
featured_image: /wp-content/uploads/2013/07/techfreak_nettemp_sms_642_362_force.jpg
hits:
  - 744
dsq_thread_id:
  - 1462621870
categories:
  - Elektronika
  - Linux
tags:
  - nettemp
  - pomiar temperatury

---
Od jakiegoś czasu jest dostępna wersja beta nettemp&#8217;a pod adresem <a href="https://github.com/sosprz/nettemp/tree/v7" target="_blank">https://github.com/sosprz/nettemp/tree/v7</a> w której zostały poprawione różne rzeczy głównie to:

  * <span style="line-height: 1.5em;">wysyłanie SMS przy pomocy gammu </span>
  * odczytywanie wszystkich sms i kasowanie wszystkich sms
  * <span style="line-height: 1.5em;">temperatura jest czytana co minutę i wykresy generują się też co minute </span>
  * <span style="line-height: 1.5em;">sekcja Relays zmieniła się na Gpio ze względu na różne możliwości gpio. Rozpocząłem przygotowania do sterowania przekaźnikami przy pomocy wskazanego czujnika temperatury. Czyli włącz/wyłącz przekaźnik jeśli temperatura będzie powyżej lub poniżej. <strong>Ale to jeszcze nie działa :)</strong></span>
  * Od jakieś wersji wraz z nettemp instaluje się <a href="http://techfreak.pl/raspberry-pi-zawiesza-sie-zrob-automatyczny-restart/" target="_blank">watchdog</a> aby w przypadku zawieszki raspberry pi się samo zrestartowało.

[<img class="aligncenter size-full wp-image-3929" alt="techfreak_nettemp_sms_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/07/techfreak_nettemp_sms_642_362_force.jpg" width="642" height="362" />][1]

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2013/07/techfreak_nettemp_sms_642_362_force.jpg