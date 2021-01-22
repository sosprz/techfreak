---
title: Instalacja ipsec/l2tp (strongswan4 + xl2tpd) na OpenWRT działa z Androidem
author: Przemek
type: post
date: 2011-01-14T06:09:13+00:00
url: /instalacja-ipsecl2tp-strongswan4-xl2tpd-na-openwrt-dziala-z-androidem/
featured_image: /wp-content/uploads/2012/01/openwrt_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 342
dsq_thread_id:
  - 1024582702
categories:
  - Network
tags:
  - ipsec
  - l2tp

---
Jak postawić serwer IPsec/l2tp na OpenWrt ? Poniższa konfiguracja działa z Androidem

<!--more-->

Obraz został skompilowany ze wszystkimi pakietami z poniższej listy zaczynających się od kmod, czyli ze wszystkimi potrzebnymi modułami dla IPsec. Cała lista zainstalowanych pakietów:

<pre class="lang:default decode:true">opkg list_installed

base-files - 43.15-r26590
block-extroot - 0.0.1-2
block-mount - 0.1.0-2
busybox - 1.15.3-2
crda - 1.1.1-1
dnsmasq - 2.55-6
dropbear - 0.52-4
e2fsprogs - 1.41.11-1
firewall - 2-24
hotplug2 - 1.0-beta-2
ip - 2.6.29-1-2
ipsec-tools - 0.7.3-3
iptables - 1.4.6-2
iptables-mod-conntrack - 1.4.6-2
iptables-mod-ipsec - 1.4.6-2
iptables-mod-nat - 1.4.6-2
iw - 0.9.22-1
kernel - 2.6.32.27-1
kmod-b43 - 2.6.32.27+2011-04-06-2
kmod-b43legacy - 2.6.32.27+2011-04-06-2
kmod-cfg80211 - 2.6.32.27+2011-04-06-2
kmod-crc-ccitt - 2.6.32.27-1
kmod-crypto-aes - 2.6.32.27-1
kmod-crypto-arc4 - 2.6.32.27-1
kmod-crypto-authenc - 2.6.32.27-1
kmod-crypto-core - 2.6.32.27-1
kmod-crypto-des - 2.6.32.27-1
kmod-crypto-hmac - 2.6.32.27-1
kmod-crypto-md5 - 2.6.32.27-1
kmod-crypto-sha1 - 2.6.32.27-1
kmod-diag - 2.6.32.27-7.1
kmod-fs-ext2 - 2.6.32.27-1
kmod-ipip - 2.6.32.27-1
kmod-ipsec - 2.6.32.27-1
kmod-ipsec4 - 2.6.32.27-1
kmod-ipt-conntrack - 2.6.32.27-1
kmod-ipt-core - 2.6.32.27-1
kmod-ipt-ipsec - 2.6.32.27-1
kmod-ipt-nat - 2.6.32.27-1
kmod-iptunnel4 - 2.6.32.27-1
kmod-mac80211 - 2.6.32.27+2011-04-06-2
kmod-nls-base - 2.6.32.27-1
kmod-pcmcia-core - 2.6.32.27-1
kmod-pcmcia-yenta - 2.6.32.27-1
kmod-ppp - 2.6.32.27-1
kmod-pppoe - 2.6.32.27-1
kmod-scsi-core - 2.6.32.27-1
kmod-switch - 2.6.32.27-4
kmod-usb-core - 2.6.32.27-1
kmod-usb-ohci - 2.6.32.27-1
kmod-usb-storage - 2.6.32.27-1
kmod-usb-uhci - 2.6.32.27-1
kmod-usb2 - 2.6.32.27-1
libblkid - 1.41.11-1
libc - 0.9.30.1-43.15
libext2fs - 1.41.11-1
libgcc - 4.3.3+cs-43.15
libgmp - 4.3.1-2
libip4tc - 1.4.6-2
libip6tc - 1.4.6-2
libiptc - 1.4.6-2
libnl-tiny - 0.1-1
libopenssl - 0.9.8p-1
libpthread - 0.9.30.1-43.15
librt - 0.9.30.1-43.15
libuci - 12012009.6-3
libuuid - 1.41.11-1
libxtables - 1.4.6-2
mtd - 13
nvram - 7
opkg - 576-1
ppp - 2.4.4-16
ppp-mod-pppoe - 2.4.4-16
strongswan4 - 4.3.7-1
strongswan4-app-charon - 4.3.7-1
strongswan4-app-pluto - 4.3.7-1
strongswan4-default - 4.3.7-1
strongswan4-mod-aes - 4.3.7-1
strongswan4-mod-attr - 4.3.7-1
strongswan4-mod-des - 4.3.7-1
strongswan4-mod-dnskey - 4.3.7-1
strongswan4-mod-fips-prf - 4.3.7-1
strongswan4-mod-gmp - 4.3.7-1
strongswan4-mod-hmac - 4.3.7-1
strongswan4-mod-md5 - 4.3.7-1
strongswan4-mod-pem - 4.3.7-1
strongswan4-mod-pgp - 4.3.7-1
strongswan4-mod-pkcs1 - 4.3.7-1
strongswan4-mod-pubkey - 4.3.7-1
strongswan4-mod-random - 4.3.7-1
strongswan4-mod-resolve - 4.3.7-1
strongswan4-mod-sha1 - 4.3.7-1
strongswan4-mod-sha2 - 4.3.7-1
strongswan4-mod-stroke - 4.3.7-1
strongswan4-mod-updown - 4.3.7-1
strongswan4-mod-x509 - 4.3.7-1
strongswan4-mod-xcbc - 4.3.7-1
strongswan4-utils - 4.3.7-1
uci - 12012009.6-3
udevtrigger - 106-1
wireless-tools - 29-4
wpad-mini - 20110402-1
xl2tpd - 1.2.5-1
zlib - 1.2.3-5</pre>

lista modyfikowanych plików:

/etc/ipsec.conf  
/etc/ipsec.secrets  
/etc/xl2tpd/xl2tp-secrets  
/etc/xl2tpd/xl2tpd.conf  
/etc/ppp/options.xl2tpd  
/etc/ppp/chap-secrets  
/etc/config/firewall  
/etc/init.d/firewall-user (nowy)  
/etc/init.d/ipsec (nowy)

Instalacja potrzebnych pakietów:

<pre class="lang:default decode:true">opkg install xl2tpd
opkg install strongswan4-default</pre>

&nbsp;

konfiguracja ipsec  
/etc/ipsec.conf

<pre class="lang:default decode:true">config setup
nat_traversal=yes
charonstart=yes
plutostart=yes
conn L2TP
authby=psk
pfs=no
rekey=no
type=transport
left=x.x.x.x ; zew.addr.ip
leftnexthop=%defaultroute
leftprotoport=17/1701
right=%any
rightprotoport=17/%any
rightsubnetwithin=0.0.0.0/0
auto=add</pre>

ustawiamy haslo PSK dla ipsec

/etc/ipsec-secrets

<pre class="lang:default decode:true">: PSK "tajne_haslo"</pre>

&nbsp;

Przygotowanie skryptu startowego dla ipsec  
/etc/init.d/ipsec

<pre class="lang:default decode:true">#!/bin/sh /etc/rc.common
START=60
start() {
echo ipsec start
ipsec start
}
stop() {
ipsec stop
killall ipsec
killall starter
killall pluto
}</pre>

&nbsp;

Ndajemy uprawnienia do wykoania i włączamy serwis ipsec

<pre class="lang:default decode:true">chmod 755 /etc/init.d/ipsec
/etc/init.d/ipsec enable
/etc/init.d/ipsec start</pre>

&nbsp;

konfiguracja xl2tpd  
/etc/xl2tpd/xl2tpd.conf

<pre class="lang:default decode:true">[global]
debug network = yes
debug tunnel = yes
port = 1701
listen-addr = x.x.x.x
[lns default]
ip range = 192.168.254.202-192.168.254.210
local ip = 192.168.254.200
refuse pap = yes
require chap = yes
require authentication = yes
name = user
ppp debug = yes
pppoptfile = /etc/ppp/options.xl2tpd
length bit = yes</pre>

Konfiguracja opcji dla xl2tpd

vi /etc/ppp/options.xl2tpd

<pre class="lang:default decode:true">name user
lock
auth
debug
dump
logfd 2
logfile /var/log/xl2tpd.log
noccp
novj
novjccomp
nopcomp
noaccomp</pre>

Konfiguracja użytkowników i haseł dla xl2tps

vi /etc/ppp/chap-secrets

<pre class="lang:default decode:true">#USERNAME PROVIDER PASSWORD IPADDRESS
user * tajne_haslo 192.168.254.202</pre>

Włączenie i uruchomienie xl2tpd

<pre class="lang:default decode:true">/etc/init.d/xl2tpd enable
/etc/init.d/xl2tpd start</pre>

Zmiany w firewallu (defaultowy firewall zostnie wyłączony)

<pre class="lang:default decode:true">/etc/init.d/firewall disable
touch /etc/init.d/firewall-user
chmod 755 /etc/init.d/firewall-user</pre>

&nbsp;

Firewall wraz ze skryptem startowym  
vi /etc/init.d/firewall-user

<pre class="lang:default decode:true">#!/bin/sh /etc/rc.common
i=/usr/sbin/iptables
START=44
start() {
# czyszcznie regul
$i -F
$i -X
$i -X -t nat
$i -F -t nat
$i -X -t mangle
$i -F -t mangle
# localhost
$i -A INPUT -i lo -j ACCEPT
$i -A FORWARD -o lo -j ACCEPT
$i -A OUTPUT -o lo -j ACCEPT
# domyslna polityka
$i -P OUTPUT ACCEPT
$i -P FORWARD ACCEPT
$i -P INPUT DROP
$i -A INPUT -i eth0 -j ACCEPT
$i -A INPUT -i eth0.0 -j ACCEPT
$i -A INPUT -i br-lan -j ACCEPT
$i -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$i -t nat -A POSTROUTING -o eth0.1 -j MASQUERADE
#dhcp
#$i -A INPUT -i eth0.1 -p udp --dport 68 -j ACCEPT
#ssh
$i -A INPUT -i eth0.1 -p tcp --dport 22 -j ACCEPT
$i -A INPUT -m limit --limit 30/min -p tcp --dport 22 -j ACCEPT
# ipsec + l2tp
$i -A INPUT -i eth0.1 -p esp -j ACCEPT
$i -A INPUT -i eth0.1 -p ah -j ACCEPT
$i -A INPUT -i eth0.1 -p udp --dport 500 -j ACCEPT
$i -A INPUT -i eth0.1 -p udp --dport 4500 -j ACCEPT
$i -A INPUT -i eth0.1 -p udp --dport 1701 -j ACCEPT
#Syn-flood protection:
$i -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
#Furtive port scanner:
$i -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
}
stop() {
$i -F
$i -X
$i -X -t nat
$i -F -t nat
$i -X -t mangle
$i -F -t mangle
$i -P INPUT ACCEPT
$i -P OUTPUT ACCEPT
$i -P FORWARD ACCEPT
}</pre>

&nbsp;

Włączenie nowego firewalla

<pre class="lang:default decode:true">/etc/init.d/firewall-user start
/etc/init.d/firewall-user enable</pre>

Ręczne startowanie serwisów

<pre class="lang:default decode:true">ipsec start
xl2tpd -D</pre>

&nbsp;

Debug tunelu

<pre class="lang:default decode:true">tail -f /var/log/xl2tpd.log</pre>

&nbsp;

Manuale  
http://linux.die.net/man/8/pppd  
http://linux.die.net/man/5/xl2tpd.conf