---
title: Jak odsyskać skasowane pliki ? (ext2, ext3, ext4)
author: Przemek
type: post
date: 2012-10-06T11:39:12+00:00
url: /jak-odsyskac-skasowane-pliki-ext2-ext3-ext4/
bfa_virtual_template:
  - hierarchy
hits:
  - 662
dsq_thread_id:
  - 1024560222
categories:
  - Linux

---
## Jak odzyskać skasowane pliki np; zdjęcia ?

<!--more-->

Aby w łatwy sposób odzyskać pliki z różnych systemów plików  
takich jak ext2/ext3/ext4 trzeba zaopatrzyć się w program testdisk  
Program ten zawiera pakiet photorec który służy do odzyskiwania danych.

Przykład:  
Chce odzyskać pliki jpg z przenośnego dysku, pendrive.

Wkładamy dysk do portu usb, jeśli sie zamontował automatycznie trzeba go odmontować.

<pre class="lang:default highlight:0 decode:true">umount /dev/sdb1</pre>

Przed uruchomieniem warto przygotować sobie katalog do którego będziemy odzyskiwać pliki.

<pre class="lang:default highlight:0 decode:true">mkdir odzysk</pre>

Wywołujemy terminal a następnie wpisujemy:

<pre class="lang:default highlight:0 decode:true">photorec</pre>

Poniżej prezentacja procedury odzyskiwania plików jpg

<a href="http://techfreak.pl/jak-odsyskac-skasowane-pliki-ext2-ext3-ext4/photorec/" rel="attachment wp-att-1240"><img class="aligncenter size-full wp-image-1240" alt="photorec" src="http://techfreak.pl/wp-content/uploads/2012/10/photorec.jpg" width="545" height="362" /></a>