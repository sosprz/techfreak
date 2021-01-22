---
title: 'OpenWrt – Serwer VPN na xl2tpd:'
author: Przemek
type: post
date: 2012-01-10T09:38:41+00:00
url: /openwrt-serwer-vpn-na-xl2tpd/
featured_image: /wp-content/uploads/2012/01/openwrt_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 333
dsq_thread_id:
  - 1021884257
categories:
  - Linux
  - Network
tags:
  - l2tp
  - openwrt
  - vpn

---
Jak zainstalować i skonfigurować serwer VPN na OpenWrt ?

<!--more-->

OpenWrt &#8211; Serwer VPN na xl2tpd:

Instalujemy pakiet xl2tpd:

<pre class="lang:default decode:true">opkg install xl2tpd</pre>

W zasadzie na początek nie trzeba nic konfigurować w pliku /etc/xl2tpd/xl2tpd.conf

<pre class="lang:default decode:true">[global]
port = 1701
auth file = /etc/xl2tpd/xl2tp-secrets
access control = no

[lns default]
exclusive = yes
ip range = 192.168.254.202-192.168.254.210
lac = 10.0.1.2
hidden bit = no
local ip = 192.168.254.200
length bit = yes
refuse authentication = yes
name = VersaLink
ppp debug = yes
pppoptfile = /etc/ppp/options.xl2tpd

[lac left]
lns = 10.0.1.2
refuse authentication = yes
name = VersaLink
ppp debug = yes
pppoptfile = /etc/ppp/options.xl2tpd</pre>

Ale trzeba ustawić hasło wspólne w /etc/xl2tpd/xl2tp-secrets

<pre class="lang:default decode:true">* * tajnehaslo</pre>

W pliku /etc/ppp/chap-secrets ustawiamy hasło, login i ip jakie ma dostać user:

<pre class="lang:default decode:true">user * tajnehaslo 192.168.254.202</pre>

Następnie włączamy serwis i uruchamiamy go:

<pre class="lang:default decode:true">/etc/init.d/xl2tpd enable
/etc/init.d/xl2tpd start</pre>

Dodatkowo w zależności od ustawień firewalla trzeba ułożyć reguły iptables:

przykładowo przy polityce Wan DROP, Lan ACCEPT:

<pre class="lang:default decode:true">iptables -A INPUT -i ppp0 -s 192.168.254.202 -j ACCEPT
iptables -A FORWARD -i ppp0 -s 192.168.254.202 -j ACCEPT</pre>

Wszystko zależy od zastosowanej polityki.

Teraz próbujemy połączyć się z np: telefonu z Androidem który wspiera połączenia l2tp.