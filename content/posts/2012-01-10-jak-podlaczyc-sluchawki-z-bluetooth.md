---
title: Jak podłączyć sluchawki z bluetooth?
author: Przemek
type: post
date: 2012-01-10T08:42:02+00:00
url: /jak-podlaczyc-sluchawki-z-bluetooth/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1064438336
hits:
  - 65
categories:
  - Linux
tags:
  - bluetooth

---
<!--more--> w pliku ~/.asoundrc

<pre class="lang:default decode:true">{ pcm.bluetooth
type bluetooth
device xx:xx:xx:xx:xx:xx (mac adres sluchawek bluetooth)
profile "auto"
}</pre>