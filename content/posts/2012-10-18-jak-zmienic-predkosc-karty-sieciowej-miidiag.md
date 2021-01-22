---
title: Jak zmienić prędkość karty sieciowej ? (miidiag)
author: Przemek
type: post
date: 2012-10-18T10:42:12+00:00
url: /jak-zmienic-predkosc-karty-sieciowej-miidiag/
bfa_virtual_template:
  - hierarchy
hits:
  - 530
dsq_thread_id:
  - 1017968858
categories:
  - Linux

---
Jak zmienić prędkość karty sieciowej ?

<!--more-->

Zmiana prędkości karty sieciowej:

<pre class="lang:default highlight:0 decode:true">mii-tool -A 10baseTx eth0</pre>

<pre class="lang:default highlight:0 decode:true">mii-tool -A 100baseTx eth0</pre>

<pre class="lang:default highlight:0 decode:true">mii-tool -A 1000baseTx eth0</pre>

&nbsp;