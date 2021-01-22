---
title: l2tp linux client – połączenie do serwera xl2tpd
author: Przemek
type: post
date: 2012-01-10T08:21:11+00:00
url: /l2tp-linux-client-polaczenie-do-serwera-xl2tpd/
bfa_virtual_template:
  - hierarchy
hits:
  - 231
dsq_thread_id:
  - 1038198268
categories:
  - Network
tags:
  - vpn

---
Jak skonfigurować klienta aby połączył się do serwera VPN xl2tpd ?

<!--more-->

Pliku **xl2tpd.conf** konfigurujemy jak poniżej:

<pre class="lang:default decode:true">[global]
port = 1701
access control = no

[lac openwrt]
lns = ip_serwerka_xl2tpd
length bit = yes
require chap = yes
refuse pap = yes
require authentication = yes
name = openwrt
ppp debug = yes
pppoptfile = /etc/ppp/options.xl2tpd</pre>

W pliku **xl2tp-secrets** ustawiamy wspólna nazwę i hasło:

<pre class="lang:default decode:true"># Secrets for authenticating l2tp tunnels
# us them secret
* openwrt tajnehaslo</pre>

W pliku **options.xl2tpd** ustawiamy dodatkowe opcje:

<pre class="lang:default decode:true">user naszuser
noipdefault
noaccomp
auth
idle 1800
mtu 1460
mru 1460
refuse-eap
debug
logfd 2
logfile /var/log/xl2tpd.log
ipcp-accept-local
ipcp-accept-remote
nodefaultroute
lock
crtscts
connect-delay 5000</pre>

Uruchamianie tunelu:

<pre class="lang:default decode:true">echo "c openwrt" &gt; /var/run/xl2tpd/l2tp-control</pre>

Dodawanie routingu na naszej sieci wewęntrznej po stronie serwera:

<pre class="lang:default decode:true">route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.254.200</pre>

Rozłączanie tunelu:

<pre class="lang:default decode:true"> echo "d openwrt" &gt; /var/run/xl2tpd/l2tp-control</pre>

&nbsp;

&nbsp;