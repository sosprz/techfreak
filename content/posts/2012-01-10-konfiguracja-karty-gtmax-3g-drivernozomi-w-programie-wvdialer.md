---
title: Konfiguracja karty gtmax 3G (driver:nozomi) w programie wvdialer
author: Przemek
type: post
date: 2012-01-10T08:58:54+00:00
url: /konfiguracja-karty-gtmax-3g-drivernozomi-w-programie-wvdialer/
bfa_virtual_template:
  - hierarchy
hits:
  - 72
dsq_thread_id:
  - 1059607535
categories:
  - Linux

---
<!--more--> Konfiguracja karty gtmax 3G (driver:nozomi) w programie wvdialer Edytujemy plik: /etc/wvdial.conf

<pre class="lang:default decode:true">Dialer Defaults]
Modem = /dev/noz0
Baud = 460800
SetVolume = 0
Dial Command = ATDT
FlowControl = NOFLOW
Init1 = ATZ
Init2 = ATM0
Auto DNS = 1

[Dialer iplus]
Username = any
Password = any
Phone = *99***1#
Stupid Mode = 1
Init3 = AT+CGDCONT=1,"IP","www.plusgsm.pl"
Dial Attempts = 3</pre>

Edytujemy plik: /etc/ppp/peers/wvdial

<pre class="lang:default decode:true">noauth
debug
/dev/noz0
115200
defaultroute
crtscts
lock
local
nodetach
usepeerdns
lcp-echo-failure 4
lcp-echo-interval 65535</pre>

Uruchamianie:

<pre class="lang:default decode:true">wvdial iplus</pre>