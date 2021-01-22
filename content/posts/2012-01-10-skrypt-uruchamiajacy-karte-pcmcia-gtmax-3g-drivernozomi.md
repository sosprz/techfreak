---
title: Skrypt uruchamiajacy karte pcmcia gtmax 3G driver:nozomi
author: Przemek
type: post
date: 2012-01-10T10:07:48+00:00
url: /skrypt-uruchamiajacy-karte-pcmcia-gtmax-3g-drivernozomi/
bfa_virtual_template:
  - hierarchy
hits:
  - 82
dsq_thread_id:
  - 1031381568
categories:
  - Linux

---
Skrypt uruchamiający kartę pcmcia gtmax 3G driver:nozomi

<!--more-->

<pre class="lang:default decode:true">#!/bin/bash
#driver w kernelu jako y
echo "tworzeenie pliku iplus-connect"
echo "ABORT BUSY" &gt;/etc/ppp/peers/iplus-connect
echo "ABORT 'NO CARRIER'" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "ABORT ERROR" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "REPORT CONNECT" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "TIMEOUT 10" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "SAY "Connecting to modem..."" &gt;&gt;/etc/ppp/peers/iplus-connect
echo """ "AT&F"" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "OK "ATE1"" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "SAY "Setting up APN"" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "OK 'AT+CGDCONT=1,"IP","pro.plusgsm.pl"'" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "SAY "Calling UMTS/GPRS"" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "TIMEOUT 30" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "OK "ATD*99***1#"" &gt;&gt;/etc/ppp/peers/iplus-connect
echo "CONNECT ' '" &gt;&gt;/etc/ppp/peers/iplus-connect

echo "tworzenie pliku iplus"
echo "/dev/noz0"&gt;/etc/ppp/peers/iplus
echo "connect "/usr/sbin/chat -v -f /etc/ppp/peers/iplus-connect""&gt;&gt;/etc/ppp/peers/iplus
echo "384000"&gt;&gt;/etc/ppp/peers/iplus
echo "defaultroute"&gt;&gt;/etc/ppp/peers/iplus
echo "crtscts"&gt;&gt;/etc/ppp/peers/iplus
echo "lock"&gt;&gt;/etc/ppp/peers/iplus
echo "noauth"&gt;&gt;/etc/ppp/peers/iplus
echo "persist"&gt;&gt;/etc/ppp/peers/iplus
echo "debug"&gt;&gt;/etc/ppp/peers/iplus
echo "nodetach"&gt;&gt;/etc/ppp/peers/iplus
echo "nameserver 212.2.96.51" &gt; /etc/resolv.conf
echo "nameserver 212.2.96.55" &gt;&gt; /etc/resolv.conf

pppd call iplus</pre>

&nbsp;