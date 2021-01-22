---
title: Jak wejść na zdalną stronę poprzez tunel ssh ?
author: Przemek
type: post
date: 2012-10-08T12:24:42+00:00
url: /jak-wejsc-na-zdalna-strone-poprzez-tunel-ssh/
bfa_virtual_template:
  - hierarchy
hits:
  - 323
dsq_thread_id:
  - 1017642584
colormag_page_layout:
  - default_layout
onesignal_meta_box_present:
  - 1
categories:
  - Linux
tags:
  - ssh

---
Jak wykorzystać ssh do tunelowania? Jak wykorzystać ssh aby dostawać się do zasobów np. www na zdalnym hoście?

<!--more-->

Zakładamy sytuacje że:

1. Potrzebuję wejść na serwis www działający na zdalnym serwerze, który działa na adresie localhost port 80 ale do dyspozycji mam tylko ssh.

W terminalu wpisujemy, gdzie adres 83.x.x.1 to zewnętrzny adres IP zdalnego serwera:

<pre class="lang:default decode:true">ssh -L 8000:localhost:80 username@83.x.x.1</pre>

W przeglądarce na swoim lokalnym komputerze wpisujemy:

http://localhost:8000

&nbsp;