---
title: Raspberry Pi zawiesza się? zrób automatyczny restart
author: Przemek
type: post
date: 2013-05-15T06:34:55+00:00
url: /raspberry-pi-zawiesza-sie-zrob-automatyczny-restart/
featured_image: /wp-content/uploads/2013/05/RaspiModelB_canvas.jpg
hits:
  - 2653
dsq_thread_id:
  - 1289543231
categories:
  - Linux
tags:
  - Raspberry pi

---
#### [<img class="aligncenter  wp-image-3220" alt="nettemp_GPIO" src="http://techfreak.pl/wp-content/uploads/2013/01/nettemp_GPIO.jpg" width="600" height="450" />][1]

#### Raspberry Pi zawiesza się ?! Czasem&#8230;

Czasem może zaistnieć taka sytuacja że pracujemy zdalnie na Raspberry PI i puścimy coś co spowoduje zawieszenie. Co zrobić aby RPi samo zrestartowało się w takiej sytuacji ?

<!--more-->

#### <span style="line-height: 1.5em;">Raspberry Pi zawiesza się, co robić ?</span>

Okazuje się że Raspberry Pi ma zainstalowany procesor na Broadcom BCM2835 SoC i został on wyposażony w sprzętowy timer który zrestartuje Rpi gdy będzie taka potrzeba. Trzeba zainstalować pakiet <a href="http://pl.wikipedia.org/wiki/Watchdog" target="_blank">watchdog</a> który bedzię pilnował poprawnej pracy.

Nie trzeba wiele się narobić aby uruchomić tą funkcjonalność instrukcja poniżej:

Dodanie modułu bcm2708_wdog aby uruchamiał się przy starcie systemu:

<pre>echo "bcm2708_wdog" | sudo tee -a /etc/modules</pre>

Instalacja watchdog i dodanie do autostartu systemu

<pre>sudo apt-get install watchdog
sudo update-rc.d watchdog defaults</pre>

Odznaczenie w /etc/watchdog.conf urządzenia /dev/watchdog które pojawiło się po załadowaniu modułu.

<pre><span style="line-height: 1.61538em;">watchdog-device	= /dev/watchdog</span></pre>

Odznaczenie w /etc/watchdog.conf opcji która przy dużym obciążeniu zrestartuje RPI. Trzeba pamiętać że jest to bezpieczna opcja i nigdy RPI nie zostanie zrestartowane przy normalnym obciążeniu.

<pre>max-load-1 = 24</pre>

Wszystkie komendy do wklejenia za jednym razem :)

<pre>echo "bcm2708_wdog" | sudo tee -a /etc/modules
sudo apt-get install watchdog
sudo update-rc.d watchdog defaults
sed -i -e '10s/#max-load-1/max-load-1/' /etc/watchdog.conf 
sed -i -e '23s/#watchdog-device/watchdog-device/' /etc/watchdog.conf</pre>

Oczywiście watchdog ma wiele opcji konfiguracji które trzeba wybierać z głową aby przypadkiem nie zapętlić sprzętu.

#### Jak sprawdzić czy watchgod działa ?

Wystarczy puścić <a href="http://pl.wikipedia.org/wiki/Fork-bomba" target="_blank">forkbomb</a> w terminalu. A Raspberry Pi powinno się po chwili zrestartować.

<pre>:(){ :|:& };:</pre>

<a href="http://blog.ricardoarturocabral.com/2013/01/auto-reboot-hung-raspberry-pi-using-on.html" target="_blank">źródło</a>

 [1]: http://techfreak.pl/wp-content/uploads/2013/01/nettemp_GPIO.jpg