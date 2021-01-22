---
title: Jak sprawdzić czy strona www działa przy pomocy telnet ?
author: Przemek
type: post
date: 2012-10-08T09:36:47+00:00
url: /jak-sprawdzic-czy-strona-www-dziala-przy-pomocy-telnet/
bfa_virtual_template:
  - hierarchy
hits:
  - 221
dsq_thread_id:
  - 1023106840
categories:
  - Linux

---
Jak sprawdzić czy strona www odpowiada lub czy port

<!--more-->

Wykonaj polecenie:

<pre class="lang:default highlight:0 decode:true">telnet test.pl 80</pre>

wpisz:

<pre class="lang:default highlight:0 decode:true">GET / HTTP/1.1

Host: test.pl</pre>

2x enter