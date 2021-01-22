---
title: jak zmienić lub dodać nowy routing ?
author: Przemek
type: post
date: 2012-10-18T10:37:31+00:00
url: /jak-zmienic-lub-dodac-nowy-routing/
bfa_virtual_template:
  - hierarchy
hits:
  - 385
dsq_thread_id:
  - 1033376120
categories:
  - Linux

---
Jak posługiwać się routingiem ?

<!--more-->

Wyświetlanie routingu:

<pre class="lang:default decode:true">route
netstat -rn</pre>

Dodawanie routingu:

<pre class="lang:default highlight:0 decode:true">route add default gw 10.0.0.1
route add -net 10.0.99.0 netmask 255.255.255.0 gw 10.0.0.1 dev eth1</pre>

Dodawanie routingu blokującego: (nie używać jako firewala)

<pre class="lang:default highlight:0 decode:true">route add 192.168.1.1 reject</pre>

Usuwanie routingu blokującego:

<pre class="lang:default highlight:0 decode:true">route add 192.168.1.1 dev eth0</pre>

&nbsp;