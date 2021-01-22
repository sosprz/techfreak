---
title: Jak skopiować pliki przez ssh ? (csp)
author: Przemek
type: post
date: 2012-10-08T12:03:20+00:00
url: /jak-skopiowac-pliki-przez-ssh-csp/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1022917807
hits:
  - 268
categories:
  - Linux

---
Jak kopiować pliki przez ssh przy pomocy scp ?

<!--more-->

scp &#8211; program do bezpiecznego kopiowania na zdalną lokalizację

-p przenosi atrybuty

-r kopiuje katalog

Przykład

<pre class="lang:default highlight:0 decode:true">scp *.tar user@x.x.x.x:/home/user</pre>

&nbsp;