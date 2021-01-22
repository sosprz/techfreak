---
title: Jak analizować ruch karty sieciowej z konsoli przy pomocy tshark ?
author: Przemek
type: post
date: 2012-12-01T23:32:01+00:00
url: /jak-analizowac-ruch-ethernet-z-konsoli-tshark/
bfa_virtual_template:
  - hierarchy
hits:
  - 331
dsq_thread_id:
  - 1015110649
categories:
  - Linux
tags:
  - wireshark

---
tshark &#8211; Jest to konsolowa wersja analizatora sieci &#8211; Wireshark

<!--more-->

W tym przypadku program nasłuchuje na karcie eth1 i dzieli zebrane logi na 100MB części.

<pre class="lang:default highlight:0 decode:true">nohup tshark -i eth1 -w /home/tshark/log/out.cap -b filesize:100000 &</pre>

&nbsp;