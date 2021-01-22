---
title: Instalacja proxy na OpenWRT ( tinyproxy )
author: Przemek
type: post
date: 2012-10-18T10:32:27+00:00
url: /instalacja-proxy-na-openwrt-tinyproxy/
featured_image: /wp-content/uploads/2012/01/openwrt_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 533
dsq_thread_id:
  - 1018815334
categories:
  - Linux
  - Network
tags:
  - openwrt
  - proxy

---
Jak zainstalować i skonfigurować proxy na OpenWrt ?

<!--more-->

1. Instalacja tinyproxy:

<pre class="lang:default highlight:0 decode:true">opkg install tinyproxy</pre>

&nbsp;

2. Konfigurujemy proxy w pliku /etc/conf/tinyproxy:

<pre class="lang:default highlight:0 decode:true">option enable 1</pre>

Ustalamy na którym porcie serwer proxy ma nasłuchiwać:

<pre class="lang:default highlight:0 decode:true">option Port 8888</pre>

Ustalamy na którym adresie server proxy ma nasłuchiwać:

<pre class="lang:default highlight:0 decode:true">option Listen 192.168.0.1</pre>

Ustawiamy ile procesów proxy ma zostać uruchomionych przy starcie:

<pre class="lang:default highlight:0 decode:true">option StartServers 10</pre>

Jakie adresy mogą łączyć sie z proxy:

<pre class="lang:default highlight:0 decode:true">list Allow 192.168.0.0/16</pre>

Włączmy filtrowanie, lista blokowanych w pliku /etc/tinyproxy/filter:

<pre class="lang:default highlight:0 decode:true">option FilterURLs On</pre>

&nbsp;

3. Przy pomocy iptables ustawiamy przekierowanie

<pre class="lang:default highlight:0 decode:true">iptables -t nat -I PREROUTING 1 -i br-lan -p tcp --dport 80 -j DNAT --to 192.168.1.1:8888</pre>

&nbsp;

&nbsp;