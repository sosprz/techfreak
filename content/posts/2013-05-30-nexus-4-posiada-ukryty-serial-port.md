---
title: Nexus 4 – ukryty serial port
author: Przemek
type: post
date: 2013-05-30T20:29:27+00:00
url: /nexus-4-posiada-ukryty-serial-port/
featured_image: /wp-content/uploads/2013/05/nexus4_uart-opt_642_362_force.jpg
hits:
  - 987
dsq_thread_id:
  - 1340509443
categories:
  - Elektronika
tags:
  - nexus
  - smartfon

---
Projektanci Nexus 4 umieścili serial port na wejściu jack do którego zazwyczaj podłącza się słuchawki z mikrofonem.

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/05/nexus4_uart-opt_642_362_force.jpg"><img class="aligncenter size-full wp-image-3451" alt="Nexus 4 serial port" src="http://techfreak.pl/wp-content/uploads/2013/05/nexus4_uart-opt_642_362_force.jpg" width="642" height="362" /></a>
</p>

<!--more-->

Okazuje się że dostęp nie jest bezpośredni, trzeba zmniejszyć napięcie pochodzące z przejściówki USB na Serial z 3,3V do ok 3.08V, aby komparator przełączył gniazdko słuchawkowe do portu UART. Nie trzeba wiele robić a tylko dodać rezystor 1k na wyjściu napięcia przejściówki.

Jak to zrobić i pełny opis jest tu: <http://blog.accuvantlabs.com/blog/jdryan/building-nexus-4-uart-debug-cable>

<span style="line-height: 1.5em;">W wolnym czasie też zrobię sobie taką przejściówkę. Nie ma naprawdę dużo roboty :D </span><span style="line-height: 1.5em;">Przy okazji wyczytałem że podobno wszystkie nexusy od google maja taką funkcję.</span>

&nbsp;