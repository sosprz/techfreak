---
title: Wygrywanie obrazu/firmware przy pomocy atftp przykład OpenWrt
author: Przemek
type: post
date: 2012-12-01T23:10:00+00:00
url: /wygrywanie-obrazufirmware-przy-pomocy-atftp-przyklad-opnwrt/
featured_image: /wp-content/uploads/2012/01/openwrt_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 242
dsq_thread_id:
  - 1040630291
categories:
  - Linux
  - Network
tags:
  - bash
  - openwrt

---
Jeżeli używasz X&#8217;ów to przed przystąpieniem do działań w konsoli zatrzymaj Network Managera

<!--more-->

<pre class="lang:default highlight:0 decode:true">/etc/init.d/network-manager stop</pre>

Zainstaluj klienta tftp

<pre class="lang:default highlight:0 decode:true">aptitude install tftp</pre>

skonfiguruj sieć

<pre class="lang:default highlight:0 decode:true">ifconfig eth0 192.168.1.2 netmask 255.255.255.0</pre>

Uruchom atftp i wgraj obraz

<pre class="lang:default highlight:0 decode:true">atftp

tftp&gt; connect 192.168.1.1
tftp&gt; verbose
tftp&gt; mode octet
tftp&gt; put openwrt-wrt*-squashfs.bin</pre>

To samo co powyżej tylko że w jednej lini

<pre class="lang:default highlight:0 decode:true">atftp --verbose --put -l openwrt-wrt54g3g-squashfs.bin 192.168.1.1</pre>

Gdy nie można wgrać firmware prawdopodobnie boot_wait jest w stanie OFF

Sprawdzenie stanu boot_wait:

<pre class="lang:default highlight:0 decode:true">nvram get boot_wait</pre>

Włączanie boot_wait=on

<pre class="lang:default highlight:0 decode:true">nvram set boot_wait=on
nvram commit</pre>

Gdy wyskoczy błąd &#8222;incorect patern&#8221;, edytuj plik obrazu openwrt-wrt54g3g-em-squashfs.bin  
Jeśli cztery pierwsze litery w pierwszym wierszu to W3GN, zamieniamy je na W54F. Zapiz obraz i wykonaj powyższą procedurę ponownie.