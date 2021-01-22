---
title: Operacje na swap
author: Przemek
type: post
date: 2012-10-18T11:01:23+00:00
url: /operacje-na-swap/
bfa_virtual_template:
  - hierarchy
hits:
  - 150
dsq_thread_id:
  - 1015693657
categories:
  - Linux
tags:
  - bash

---
Wyświetlanie wartości swappines &#8211; czym jest ona mniejsza tym system mniej korzysta ze swapa.

<!--more-->

cat /proc/sys/vm/swappiness

Ustawianie niskiej wartości swap

<pre class="lang:default highlight:0 decode:true">sysctl -w vm.swappiness=10
echo "vm.swappiness=10" &gt;&gt; /etc/sysctl.conf
echo 10 &gt; /proc/sys/vm/swappiness</pre>

Wyłączenie swap&#8217;a

<pre class="lang:default highlight:0 decode:true">swapoff /dev/sdx</pre>

&nbsp;