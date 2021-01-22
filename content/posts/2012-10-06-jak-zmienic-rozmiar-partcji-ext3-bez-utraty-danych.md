---
title: Jak zmienić rozmiar partcji ext3 bez utraty danych ?
author: Przemek
type: post
date: 2012-10-06T17:07:04+00:00
url: /jak-zmienic-rozmiar-partcji-ext3-bez-utraty-danych/
bfa_virtual_template:
  - hierarchy
hits:
  - 296
dsq_thread_id:
  - 1025220331
categories:
  - Linux

---
Jak zmienić rozmiar partycji aby nie stracić danych ?

<!--more-->

Operację trzeba wykonać na odmontowanej partycji:

<pre class="lang:default highlight:0 decode:true">umount /dev/sda1</pre>

Usuwamy księgowanie:

<pre class="lang:default highlight:0 decode:true">tune2fs -O ^has_journal /dev/sda1</pre>

Powiększamy system plików:

<pre class="lang:default highlight:0 decode:true">resize2fs /dev/sda1 50G</pre>

Usuwamy partycje fdiskiem i tworzymy ja na nowo i zapisuemy zmiany

(dane nie zostaną utracone!):

<pre class="lang:default highlight:0 decode:true">fdisk /dev/sda</pre>

d &#8211; usuwamy partcje  
n &#8211; tworzymy partycje  
p &#8211; primary  
1 &#8211; pierwsza partycja  
2x enter  
w &#8211; zapisujemy zmiany

Sprawdzamy spujność systemu plików:

<pre class="lang:default highlight:0 decode:true">e2fsck -f /dev/sda1</pre>

Powiększamy system plików teraz bez podawania wielkości:

<pre class="lang:default highlight:0 decode:true">resize2fs /dev/sda1</pre>

Dodajemy księgowanie:

<pre class="lang:default highlight:0 decode:true">tune2fs -j /dev/sda1</pre>

Montujemy:

<pre class="lang:default highlight:0 decode:true">mount /dev/sda1 /mnt/sda</pre>

Sprawdzamy:

<pre class="lang:default highlight:0 decode:true">df -h</pre>

&nbsp;

&nbsp;