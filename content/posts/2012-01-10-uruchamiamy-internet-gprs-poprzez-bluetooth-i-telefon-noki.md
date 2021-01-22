---
title: Jak uruchomić internet (GPRS) poprzez bluetooth i telefon Nokia ?
author: Przemek
type: post
date: 2012-01-10T09:22:43+00:00
url: /uruchamiamy-internet-gprs-poprzez-bluetooth-i-telefon-noki/
bfa_virtual_template:
  - hierarchy
hits:
  - 139
dsq_thread_id:
  - 1029704449
categories:
  - Linux
tags:
  - nokia

---
<!--more-->

<pre class="lang:default decode:true">#! /bin/bash -x
#tworzeenie nokia
echo "/dev/rfcomm1 noauth nocrtscts noipdefault novj novjccomp defaultroute" &gt; /etc/ppp/peers/nokia
echo "connect 'chat -v -f /etc/ppp/nokia2'" &gt;&gt; /etc/ppp/peers/nokia
#tworzeenie nokia2
echo "'' ATZ" &gt; /etc/ppp/nokia2
echo "OK AT+CGDCONT=1,"IP","internet"" &gt;&gt; /etc/ppp/nokia2
echo "OK "ATD*99***1#"" &gt;&gt; /etc/ppp/nokia2
echo "CONNECT ''" &gt;&gt; /etc/ppp/nokia2</pre>

hcid

<pre class="lang:default decode:true">sdptool browse
hcitool scan
hciconfig -a</pre>

&nbsp;

<pre class="lang:default decode:true">ls -la /dev/rfcomm*
read x

C=0;
while [ $C -lt 16 ]; do
if [ ! -c /dev/rfcomm$C ]; then
mknod -m 666 /dev/rfcomm$C c 216 $C
fi
C=`expr $C + 1`
done</pre>

&nbsp;

<pre class="lang:default decode:true">echo "" &gt;&gt; /etc/bluetooth/rfcomm.conf
echo "frcomm1 {" &gt;&gt; /etc/bluetooth/rfcomm.conf
echo "bind yes;" &gt;&gt; /etc/bluetooth/rfcomm.conf
echo "device "twoj mac telefonu";" &gt;&gt; /etc/bluetooth/rfcomm.conf #dla E51
echo "channel 4;" &gt;&gt; /etc/bluetooth/rfcomm.conf
echo "comment "gprs nokia";" &gt;&gt; /etc/bluetooth/rfcomm.conf
echo "}" &gt;&gt; /etc/bluetooth/rfcomm.conf
/etc/init.d/bluetooth restart
mknod /dev/ppp c 108 0
rfcomm bind 1 "twoj mac telefonu nokia"
echo "nameserver 212.2.96.51" &gt; /etc/resolv.conf
echo "nameserver 212.2.96.52" &gt;&gt; /etc/resolv.conf</pre>

uruchomienie:

<pre class="lang:default decode:true">pppd call nokia && passkey-agent --default "0000"</pre>