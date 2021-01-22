---
title: Szukasz fajnego GUI do firewalla ?
author: Przemek
type: post
date: 2012-12-23T13:01:12+00:00
url: /szukasz-fajnego-gui-do-firewalla/
featured_image: /wp-content/uploads/2012/12/firewall_rules.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 599
dsq_thread_id:
  - 1004261999
categories:
  - Linux
tags:
  - firewall
  - router

---
Dziś chciałbym przypomnieć, pokazać dosyć znaną dystrybucje pod router/firewall opartą na forku innej znanej dystrybucji <a href="http://m0n0.ch/" target="_blank">m0n0wall</a> a mowa o  <a href="http://www.pfsense.org/" target="_blank">pfSense</a>.

<!--more-->

Dlaczego dziś o pfSense ? Bo jaki techFreak kupuje gotowy router w sklepie za 150 zł. Nie nie .. prawdziwy freak nie idzie na łatwiznę. A tak naprawdę przypomniało mi się o tej dystrybucji bo na <a href="http://distrowatch.com" target="_blank">distrowatch.com</a> wyszło info o updacie do 2.0.2. No ale wracając do sensu dlaczego freak nie kupuje &#8222;gotowego routera&#8221;, no bo trzeba czasem pomieszać, zepsuć, wyłączyć **żonie** pudelka żeby się czegoś nauczyć, dowiedzieć. ( zamiast **żonie** wstaw sobie co chcesz: dziewczyna, babcia, mama?! )

No więc co to jest pfSense ? To darmowa oparta na FreeBSD dystrybucja do zastosowań jako firewall/router która skierowana jest głównie dla PC. Minimalne wymagania dla maszyny to 100Mhz i 128MB RAM, dysk 1G.

**Co jest fajnego w pfSense ?**

Ktoś może mi napisać że prawdziwy techFeak nap..<del>isze</del> z konsoli <a href="http://pl.wikipedia.org/wiki/Iptables" target="_blank">iptables</a>y. Spoko ja to umiem :D WebUI to dla was na początek ;) To właśnie o Web UI chodzi, cały system firewalla/routera udostępnia stronę na której wszystko się konfiguruje. Od zaawansowanych reguł firewalla, do zaawansowanych wpisów NAT. Dla mnie to było najważniejsze, więc wybierając taka dystrybucje macie pewność że żadna wymyślona przez was funkcjonalność nie stanie się przeszkodą. Dodatkowo obsługuje VPN, OpenVPN &#8211; połączysz się nawet z nie zrootowanego Androida, IPsec &#8211; zapniesz tunel Site-2-Site z innym routerem, z androida też. To własnie te funkcje moim skromnym zdaniem przewyższają funkcjonalnością kupne routery w niskich granicach cenowych. Mówi się coś za coś .. router jest mały a pc trochę większy. Zależy co się ma na stanie myślę o microATX.

Dobra za dużo piszę czas na jakieś screeny i może filmik.

<div id='gallery-2' class='gallery galleryid-497 gallery-columns-3 gallery-size-colormag-featured-image'>
  <figure class='gallery-item'> 
  
  <div class='gallery-icon landscape'>
    <a href='http://techfreak.pl/szukasz-fajnego-gui-do-firewalla/firewall_rules/'><img width="626" height="362" src="http://techfreak.pl/wp-content/uploads/2012/12/firewall_rules.jpg" class="attachment-colormag-featured-image size-colormag-featured-image" alt="Szukasz fajnego GUI do firewalla ?" /></a>
  </div></figure><figure class='gallery-item'> 
  
  <div class='gallery-icon landscape'>
    <a href='http://techfreak.pl/szukasz-fajnego-gui-do-firewalla/port_forward/'><img width="450" height="362" src="http://techfreak.pl/wp-content/uploads/2012/12/port_forward.jpg" class="attachment-colormag-featured-image size-colormag-featured-image" alt="Szukasz fajnego GUI do firewalla ?" /></a>
  </div></figure><figure class='gallery-item'> 
  
  <div class='gallery-icon landscape'>
    <a href='http://techfreak.pl/szukasz-fajnego-gui-do-firewalla/rrd_graphs_2/'><img width="561" height="362" src="http://techfreak.pl/wp-content/uploads/2012/12/rrd_graphs_2.jpg" class="attachment-colormag-featured-image size-colormag-featured-image" alt="Szukasz fajnego GUI do firewalla ?" /></a>
  </div></figure>
</div>

Ha jest całkiem fajny filmik



Wiem wiem, istnieje jeszcze OpenWRT ale to jest inny długi temat. Podsumowując jeśli szukasz fajnej, a przede wszystkim stabilnej dystrybucji pod router/firewall polecam przetestować pfSense.

A jak by ktoś chciał napisać &#8222;co to za słaby opis buu&#8221;, to proszę mi tu nie hejtować chciałem tylko pokazać że wiem co to jest ;P

[źródła fotek pfsense.org]

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;