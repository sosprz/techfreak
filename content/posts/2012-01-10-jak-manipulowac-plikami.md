---
title: Jak manipulować plikami ?
author: Przemek
type: post
date: 2012-01-10T08:39:28+00:00
url: /jak-manipulowac-plikami/
bfa_virtual_template:
  - hierarchy
hits:
  - 72
dsq_thread_id:
  - 1029705395
categories:
  - Linux
tags:
  - grep

---
Spis programów do manipulowania plikami:

<!--more-->

Manipulowanie plikami:

<pre class="lang:default decode:true">grep
uniq
tee
cut
paste
cut
paste
tr 
sort</pre>

&nbsp;

Wypisuje wiersze które nie pasują.

<pre class="lang:default decode:true">grep -v</pre>

Wypisuje liczbę wierszy które pasuję

<pre class="lang:default decode:true">grep -c</pre>

Nie są sprawdzane wielkości liter

<pre class="lang:default decode:true">grep -i</pre>

Przeszukuje pliki i katalogi

<pre class="lang:default decode:true">grep -r</pre>

Usuwa wszystkie znaki ^M z pliku.

<pre class="lang:default decode:true">tr -d '1532' &lt; plikzm &gt; plikbezm</pre>

&nbsp;