---
title: Raspberry pi jako Access Point
author: Przemek
type: post
date: 2013-01-01T20:53:56+00:00
url: /raspberry-pi-jako-access-point/
featured_image: /wp-content/uploads/2013/01/edimax-pi3_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 1972
dsq_thread_id:
  - 1004053469
categories:
  - Elektronika
tags:
  - Raspberry pi
  - wifi

---
<a href="http://techfreak.pl/raspberry-pi-jako-access-point/edimax-pi3_642_362_force/" rel="attachment wp-att-689"><img class="aligncenter size-full wp-image-689" alt="edimax-pi3_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/01/edimax-pi3_642_362_force.jpg" width="642" height="362" /></a>

Witam w nowym roku i już atakuje fajnymi projektami. Sam mam Raspberry pi i tworzę w wolnej chwili swój projekt <a href="http://nettemp.pl" target="_blank">pomiaru temperatury</a> co za tym idzie ciekawią mnie różne pomysły innych freaków. Ostatnio na oficjalnej stronie raspberry pi pisano o <a href="http://www.pi-point.co.uk/" target="_blank">Pi-Point</a>.

<!--more-->

Co to jest Pi-Point ? Jest to projekt access pointa, **punktu dostępowego** WiFi ( pomostu pomiędzy siecią WiFi a LAN ) na znanej i lubianej platformie mini komputera R**aspberry PI**. Ogólnie rzecz biorąc nie różni się to pewnie od kupionych w sklepie access pointów ale ile jest zabawy i dumy ze składania to twoje :) to tak jak z modelami w podstawówce tylko teraz jest to trochę droższe i na innym poziomie &#8211; tak mi żona powtarza&#8230;.:P

No to zaczynając od strony www autora projektu, jest prosta przyjemna i można znaleźć na niej wszystko co potrzeba, od dokumentacji do gotowego obrazu systemu. **Jakiego sprzętu potrzebujemy aby uruchomić Pi-Point?** To że trzeba posiadać R-PI już nie wspomnę, **Karta SD** 2-4G obowiązkowo. Główny bohater projektu to : **karta WiFi na USB**, ale nie każda tylko taka która obsługuje **tryb AP. **Jakie tryby karta Wifi obsługuje można sprawdzić komendą: **_iw list_** i szukać w  &#8222;**_Supported interface modes:_**&#8221; trybu **_AP_**, zaraz obok** _monitor_**, **_managed_**.

Dobranie odpowiedniej karty na USB to chyba jedyny problem jaki można napotkać przy Pi-Point. Cała reszta czyli konfiguracja pakietów takich jak demona punktu dostępowego (hostap) lub DNS i DHCP (dnsmasq) to pestka, dodatkowo w grę wchodzi filtr pakietów iptables. Jak to skonfigurować aby działało można przeczytać w dokumentacji naprawdę nic trudnego.

Takie projekty zawsze raczej zostawiają za sobą otwarte drzwi i można doinstalowywać dodatkowe pakiety takie jak Squid (proxy) aby logować lub ucinać ruch. Jak już pisałem projekt ciekawy, łatwy i przyjemny więc jak komuś brakuje Apka w domu to polecam :D

&nbsp;

[fotka ikony: raspberrypi.org/phpBB3/viewtopic.php?t=11309&p=201923]

&nbsp;