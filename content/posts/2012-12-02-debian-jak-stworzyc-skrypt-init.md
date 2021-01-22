---
title: Debian – Jak stworzyć skrypt init
author: Przemek
type: post
date: 2012-12-01T23:18:54+00:00
url: /debian-jak-stworzyc-skrypt-init/
bfa_virtual_template:
  - hierarchy
hits:
  - 419
dsq_thread_id:
  - 1015680613
categories:
  - Linux
tags:
  - debian
  - Skrypty

---
Tworzymy plik moj.skrypt i uzupełniamy go tak jak poniżej.

<!--more-->

<pre class="lang:default highlight:0 decode:true"><span style="line-height: 1.61538em;">#! /bin/sh</span>
# /etc/init.d/moj.skrypt
#

# Some things that run always
touch /var/lock/moj.skrypt

case "$1" in
start)
echo "Starting tshark "
/home/moj.skrypt start
;;
stop)
echo "Stopping tshark"
/home/moj.skrypts stop
;;
*)
echo "Usage: /etc/init.d/moj.skrypt {start|stop}"
exit 1
;;
esac
exit 0</pre>

Następnie dodajemy go do init.

<pre class="lang:default highlight:0 decode:true">update-rc.d moj.skrypt defaults</pre>

&nbsp;

&nbsp;