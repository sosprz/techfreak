---
title: Raspberry PI jako detektor quadkopterów i dronów
author: Przemek
type: post
date: 2013-05-06T06:13:56+00:00
url: /raspberry-pi-jako-detektor-quadkopterow-i-dronow/
featured_image: /wp-content/uploads/2013/05/DroneShield_642_362_force.jpg
hits:
  - 790
dsq_thread_id:
  - 1265775537
categories:
  - Elektronika
tags:
  - quadcopter
  - Raspberry pi

---
Coraz więcej dronów i quadcopterów nad naszymi głowami a tym samym coraz więcej tych latających szpiegów jest wyposażonych w kamery. Jak się przed tym chronić? Raspberry Pi pomoże.

<!--more--><figure id="attachment_3053" aria-describedby="caption-attachment-3053" style="width: 385px" class="wp-caption aligncenter">

[<img class=" wp-image-3053 " title="Raspberry PI droneshield" alt="Raspberry PI droneshield" src="http://techfreak.pl/wp-content/uploads/2013/05/DroneShield_642_362_force.jpg" width="385" height="217" />][1]<figcaption id="caption-attachment-3053" class="wp-caption-text">Raspberry PI droneshield</figcaption></figure> 

Projekt DroneShield zakłada wykorzystanie Raspberry Pi jako urządzenia wykrywającego latających szpiegów. Robi to przy pomocy mikrofonu i biblioteki <a href="http://pl.wikipedia.org/wiki/FFTW" target="_blank">FFTW</a> która służy do obliczania dyskretnej transformaty Fouriera. Urządzenie przechwytuje dźwięki z mikrofonu, analizuje widmo hałasu z samolotów bezzałogowych, quadów i szuka wpisu w bazie danych sygnatur. Jeśli dopasowanie zostanie znalezione urządzenie wyśle ​​e-mail lub SMS. Filmik poniżej.

http://www.youtube.com/watch?feature=player_embedded&v=ZiWuc5Budqk#!

Projekt możemy znaleźć na <a href="http://www.indiegogo.com/projects/droneshield" target="_blank">indiegogo</a> a stronę samego projektu na <a href="droneshield.org" target="_blank">droneshield.org</a>

<a style="line-height: 1.5em;" href="http://diydrones.com/profiles/blogs/droneshield-raspberry-pi-powered-drone-detector">http://diydrones.com/profiles/blogs/droneshield-raspberry-pi-powered-drone-detector</a>

 [1]: http://techfreak.pl/wp-content/uploads/2013/05/DroneShield_642_362_force.jpg