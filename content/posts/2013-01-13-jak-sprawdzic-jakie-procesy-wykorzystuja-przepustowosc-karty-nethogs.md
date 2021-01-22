---
title: Jak sprawdzić jakie procesy wykorzystują przepustowość karty? nethogs
author: Przemek
type: post
date: 2013-01-13T18:31:14+00:00
url: /jak-sprawdzic-jakie-procesy-wykorzystuja-przepustowosc-karty-nethogs/
featured_image: /wp-content/uploads/2013/01/nethogs_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 554
dsq_thread_id:
  - 1024463648
categories:
  - Linux

---
Czasem jest potrzeba aby sprawdzić jakie procesy w systemie zabierają nam przepustowość karty sieciowej. Z pomocą przychodzi programik podobny do **top**a, **nethogs**.

<!--more-->

Aby zainstalować go w Ubuntu:

<pre class="lang:default decode:true">aptitude install nethogs</pre>

Program uruchamiamy poleceniem nethogs + **eth0** lub **wlan0**:

<pre class="lang:default decode:true">sudo nethogs</pre>

<a href="http://techfreak.pl/jak-sprawdzic-jakie-procesy-wykorzystuja-przepustowosc-karty-nethogs/nethogs_642_362_force/" rel="attachment wp-att-1468"><img class="aligncenter size-full wp-image-1468" alt="nethogs_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/01/nethogs_642_362_force.jpg" width="642" height="362" /></a>