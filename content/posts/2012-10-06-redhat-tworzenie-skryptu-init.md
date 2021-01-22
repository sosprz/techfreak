---
title: Redhat – tworzenie skryptu init
author: Przemek
type: post
date: 2012-10-06T17:39:57+00:00
url: /redhat-tworzenie-skryptu-init/
featured_image: /wp-content/uploads/2012/10/redhat.jpg
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1025185035
hits:
  - 266
categories:
  - Linux
tags:
  - redhat

---
Poniżej wzór jak tworzyć skrypty startowe w systemie RedHat. Podświetlone line to komenda wykonująca /skrypt jak użytkownik user.

<!--more-->

<pre class="nums:true lang:default mark:10,17 highlight:0 decode:true">#!/bin/sh

# chkconfig: 123456 92 79
# description: super program

RETVAL=0
start()
{
echo -n "start"
su user -c /skrypt
}

stop()
{
echo -n "stop"
echo "."
su user -c /skrypt
echo " done"
}

case "$1" in
start)
start;;
stop)
stop;;
*)
echo $"Usage: $0 {start|stop}"
exit 1
esac
exit $RETVAL</pre>

&nbsp;