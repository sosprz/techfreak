---
title: Jak sprawdzić dostępną/zajętą pamięć RAM ?
author: Przemek
type: post
date: 2012-10-18T10:55:37+00:00
url: /jak-sprawdzic-dostepnazajeta-pamiec-ram/
bfa_virtual_template:
  - hierarchy
hits:
  - 510
dsq_thread_id:
  - 1016243822
categories:
  - Linux

---
Sprawdzanie dostępnej/zajętej pamięci RAM

<!--more-->

<pre class="lang:default highlight:0 decode:true">ps aux | sort -nr -k 4 | head -10

ps -A --sort -rss -o comm,pmem | head -n 11

ps -A --sort -rss -o pid,comm,pmem,rss

ps -A --sort -rss -o pid,comm,pmem | head -n 11

cat /proc/meminfo

free -t -m

vmstat -S M</pre>

&nbsp;

&nbsp;