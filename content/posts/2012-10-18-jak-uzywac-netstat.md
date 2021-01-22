---
title: Jak używać netstat ?
author: Przemek
type: post
date: 2012-10-18T10:39:33+00:00
url: /jak-uzywac-netstat/
bfa_virtual_template:
  - hierarchy
hits:
  - 552
dsq_thread_id:
  - 1018305847
categories:
  - Linux

---
Jak używać netstat aby sprawdzić otwarte porty?

<!--more-->

Wyświetlenie nasłuchujących portów:

<pre class="lang:default highlight:0 decode:true">netstat --tcp -ln</pre>

Zliczanie połączeń otrzymywanych z sieci:

<pre class="lang:default highlight:0 decode:true">netstat -n -p|grep SYN_REC | wc -l</pre>

Zliczanie aktywnych połączeń na porcie 80:

<pre class="lang:default highlight:0 decode:true">netstat -n | grep :80 |wc -l</pre>

Wyświetlanie listy programów nasłuchujących na portach TCP UDP

<pre class="lang:default highlight:0 decode:true">netstat -tulpn</pre>

&nbsp;

&nbsp;