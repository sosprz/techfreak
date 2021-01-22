---
title: Jak odczytać numer UUID partycji ?
author: Przemek
type: post
date: 2012-11-13T22:47:49+00:00
url: /jak-odczytac-numer-uuid-partycji/
bfa_virtual_template:
  - hierarchy
hits:
  - 318
dsq_thread_id:
  - 1024559774
categories:
  - Linux

---
Jak podejrzeć UUID partycji dysku przy pomocy blkid ?

<!--more-->

### Przykłady:

Wyswietlanie wszystkich UUID

<pre class="lang:default decode:true ">blkid -o list -s UUID</pre>

&nbsp;

Wyswietlanie wszystkich UUID sposób drugi

<pre class="lang:default decode:true ">ls -l /dev/disk/by-uuid</pre>

&nbsp;

Wyswietlanie pojedyńczego UUID

<pre class="lang:default decode:true ">blkid /dev/sda1</pre>

&nbsp;