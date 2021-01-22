---
title: Jak szukać plików ?
author: Przemek
type: post
date: 2011-01-14T09:05:31+00:00
url: /jak-szukac-plikow/
bfa_virtual_template:
  - hierarchy
hits:
  - 155
dsq_thread_id:
  - 1027765625
categories:
  - Linux

---
Jak szukać plików  w systemie linux ?

<!--more-->

<pre class="lang:default decode:true">find
slocate
which
type
whereis</pre>

Szukanie plików po nazwie:

<pre class="lang:default decode:true">find / -type -f -name plik -print</pre>

Szukanie i kasowanie plików starszych niż 1 dzień:

<pre class="lang:default decode:true">find /home/backup/ -type f -mtime +1 -exec rm {} ;</pre>

Szukanie i kasowanie katalogów starszych niż 1 dzień:

<pre class="lang:default decode:true ">find /home/backup/ -type d -mtime +1 -exec rm {} ;</pre>

Szukanie i kasowanie plików starszych niż 1 min:

<pre class="lang:default decode:true ">find /home/backup/ -type f -mmin +1 -exec rm {} ;</pre>

Kto korzysta z katalogu:

<pre class="lang:default decode:true ">stat /home/</pre>

Wyświetlanie wielkości plików i katalogów:

<pre class="lang:default decode:true ">du -m -k -mega -kilo
du -sh</pre>

&nbsp;

&nbsp;