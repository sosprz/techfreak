---
title: Raspberry Pi jako radio!
author: Przemek
type: post
date: 2012-12-11T13:15:01+00:00
url: /raspberry-pi-jako-radio/
featured_image: /wp-content/uploads/2012/12/raspberry_pi_radio.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 728
dsq_thread_id:
  - 1004343307
categories:
  - Elektronika
tags:
  - Raspberry pi

---
[<img class="size-full wp-image-208 aligncenter" title="raspberry_pi_radio" alt="" src="http://techfreak.pl/wp-content/uploads/2012/12/raspberry_pi_radio.jpg" width="621" height="342" />][1]

Raspberry Pi jako radio bez żadnych dodatkowych układów elektronicznych ? Tak ale raczej jako rozgłośnia radiowa niż odbiornik. Jedyny **hardware** jaki do tego jest potrzebny to 20 cm przewód który zapewnia zasięg do 100 metrów.

<!--more-->

Jak to działa ? Do RPi trzeba podłączyć przewód do GPIO 4 (GPIO 4 pozwala generować sygnały z rozproszonym widmem), wgrać program ze strony <a href="http://www.icrobotics.co.uk/wiki/index.php/Turning_the_Raspberry_Pi_Into_an_FM_Transmitter" target="_blank">http://www.icrobotics.co.uk</a> i skompilować go. Następnie można nadawać ! A dokładnie puszczać szesnastobitowe pliki wav które można usłyszeć na częstotliwości 100.0 MHz. Wystarczy wykonywać program z nazwą pliku wav jako argument.

Ha ciekawe co ? Prezentacje można obejrzeć poniżej a więcej informacji i kod na stronie <a href="http://www.icrobotics.co.uk/wiki/index.php/Turning_the_Raspberry_Pi_Into_an_FM_Transmitter" target="_blank">http://www.icrobotics.co.uk</a>

 [1]: http://techfreak.pl/wp-content/uploads/2012/12/raspberry_pi_radio.jpg