---
title: DIG – program do wysłania zapytań do serwerów DNS
author: Przemek
type: post
date: 2012-10-08T12:27:35+00:00
url: /dig-program-do-manualnego-wysylania-zapytan-do-serwerow-dns/
bfa_virtual_template:
  - hierarchy
hits:
  - 633
dsq_thread_id:
  - 1018165907
categories:
  - Linux
tags:
  - dns
  - domeny

---
Jak korzystać z programu dig? np. wyświetlać właściwości domeny? jak sprawdzić czas życia?

<!--more-->

Droga jaką pokonuje zapytanie do serwera DNS

<pre class="lang:default highlight:0 decode:true">dig shops.lpp.com.pl +trace</pre>

Szukanie serwerów DNS dla danej domeny

<pre class="lang:default highlight:0 decode:true">dig lpp.pl NS +noall +answer</pre>

Sprawdzanie czy można transferować domene

<pre class="lang:default highlight:0 decode:true">dig lnadmin.pl AXFR</pre>

Wyświetlanie ustawień zony

<pre class="lang:default highlight:0 decode:true">dig +nocmd lpp.com.pl any +multiline +noall +answer</pre>

Zamiana IP na nazwe

<pre class="lang:default highlight:0 decode:true">dig -x 212.77.100.101 +short</pre>

Czas życia domeny:

<pre> dig techfreak.pl +noall +answer</pre>

&nbsp;