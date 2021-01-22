---
title: Jak wyświetlić informacje o procesorach ?
author: Przemek
type: post
date: 2012-10-08T07:10:03+00:00
url: /jak-wyswietlic-informacje-o-procesorach/
bfa_virtual_template:
  - hierarchy
hits:
  - 206
dsq_thread_id:
  - 1018944138
categories:
  - Linux

---
Jak wyświetlać informacje o procesorach ?

<!--more-->

Wszystkie informacje o procesorach:

<pre class="lang:default highlight:0 decode:true">cat /proc/cpuinfo</pre>

Wyświetlanie liczby fizycznych procesorów

<pre class="lang:default highlight:0 decode:true">grep 'physical id' /proc/cpuinfo | sort | uniq | wc -l</pre>

Wyświetlanie liczby virtualnych procesorów

<pre class="lang:default highlight:0 decode:true">grep ^processor /proc/cpuinfo | wc -l</pre>

Podgląd cpu na żywo

<pre class="lang:default highlight:0 decode:true">watch grep "cpu MHz" /proc/cpuinfo</pre>

&nbsp;

&nbsp;

&nbsp;