---
title: Quadcopter na Raspberry Pi
author: Przemek
type: post
date: 2014-07-27T18:18:12+00:00
url: /quadcopter-na-raspberry-pi/
featured_image: /wp-content/uploads/2014/07/raspberry_pi_quadcopter_1.jpg
hits:
  - 974
dsq_thread_id:
  - 2874383270
categories:
  - Elektronika
tags:
  - arduino
  - quadcopter
  - Raspberry pi

---
To było nie do uniknięcia że to co było kiedyś sterowane przez pierwsze wersje arduino teraz będzie przenoszone na coraz to bardziej zaawansowane platformy z większymi możliwościami. Chodzi dokładnie o quadcopter który wykorzystuje Raspberry Pi jako jednostkę sterującą. Wiadomo że Raspberry Pi nie ma żyroskopu ani akcelerometru więc niezbędne komponenty takie jak IMU 10DOF są podłączone do GPIO a dokładnie do szyny I2C. Zresztą jak cała reszta dodatkowych komponentów jak GPS, czy płytka do sterowania PWM. Raspberry Pi ma tylko jedno wyjście PWM a potrzeba czterech na kontrolery silników ESC.<!--more-->

Quadcopter na Raspberry Pi

Więc tak powoli z samego C kontrolery lotu przenoszą się na &#8222;Linuxa&#8221;. Choć to nie pierwszy quadcopter na linuxie bo od czterech lat bardzo popularny AR.Drone lata na ARM pod kontrolą właśnie linuxa.

Całość projektu można zobaczyć na githubie <https://github.com/PenguPilot/PenguPilot>

[<img class="aligncenter size-full wp-image-7376" src="http://techfreak.pl/wp-content/uploads/2014/07/raspberry_pi_quadcopter_1.jpg" alt="raspberry_pi_quadcopter_1" width="750" height="500" />][1] [<img class="aligncenter size-full wp-image-7375" src="http://techfreak.pl/wp-content/uploads/2014/07/raspberry_pi_quadcopter_0.png" alt="raspberry_pi_quadcopter_0" width="750" height="645" />][2]

Zapraszam do obejrzenia filmiku z lotu.



### Dedykowana nakładka dla Raspberry Pi

Przy okazji warto wspomnieć że jakiś czas temu na indiegogo wystartował projekt nakładki dla Raspberry Pi która ma wszystkie potrzebne elementy takie jak GPS, barometr, żyroskop, akcelerometr i wyjścia PWM. A nawet na serwa i inne potrzebne wejścia np. na odbiornik RC.

Kampania zebrała 33k$ a celem było tylko 6k$ więc zainteresowanie jest naprawdę duże.

[  
<img class="aligncenter size-full wp-image-7384" src="http://techfreak.pl/wp-content/uploads/2014/07/raspberry_pi_shield_quadcopter.png" alt="raspberry_pi_shield_quadcopter" width="959" height="1764" />][3] 

Filmik z kampanii:



Informacje znalezione na: <a href="http://diydrones.com/profiles/blogs/raspberry-pi-quadrotor-running-pengupilot-on-linux" target="_blank">diydrones.com</a>

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/07/raspberry_pi_quadcopter_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/07/raspberry_pi_quadcopter_0.png
 [3]: http://techfreak.pl/wp-content/uploads/2014/07/raspberry_pi_shield_quadcopter.png