---
title: Czyszczenie cache – czyli zwalnienie pamięci podręcznej
author: Przemek
type: post
date: 2012-10-18T10:35:19+00:00
url: /czyszczenie-cache-czyli-zwalnienie-pamieci-podrecznej/
bfa_virtual_template:
  - hierarchy
hits:
  - 761
dsq_thread_id:
  - 1016441894
categories:
  - Linux

---
Jak zwolnić pagecache, dentries, inodes ?

<!--more-->

Przed zwalnianiem czegokolwiek warto użyć sync aby zrzucić dane z pamięci na dysk

<pre class="lang:default highlight:0 decode:true">sync</pre>

Zwalnianie pagecache:

<pre class="lang:default highlight:0 decode:true">echo 1 &gt; /proc/sys/vm/drop_caches</pre>

Zwalnianie dentries and inodes:

<pre class="lang:default highlight:0 decode:true">echo 2 &gt; /proc/sys/vm/drop_caches</pre>

Zwalnianie pagecache, dentries and inodes:

<pre class="lang:default highlight:0 decode:true">echo 3 &gt; /proc/sys/vm/drop_caches</pre>

&nbsp;

&nbsp;