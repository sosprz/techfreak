---
title: Server Openvpn na CentOS + klient – telefon z systemem android
author: Przemek
type: post
date: 2012-01-10T09:32:03+00:00
url: /server-openvpn-na-centos-klient-telefon-z-systemem-android/
bfa_virtual_template:
  - hierarchy
hits:
  - 441
dsq_thread_id:
  - 1017780812
categories:
  - Linux
  - Network
tags:
  - centos
  - ipsec
  - vpn

---
Jak skonfigurować serwer OpenVPN i Androida jako klienta ?

<!--more-->

1. Konfiguracja serwera:

Instalacja:

<pre class="lang:default decode:true">yum install openvpn</pre>

Generowanie certyfikatów:

<pre class="lang:default decode:true">cd /usr/share/doc/openvpn*/easy-rsa/2.0/
chmod 744 /usr/share/doc/openvpn*/easy-rsa/2.0/*
. ./vars
./clean-all
./build-ca
./build-dh
./build-key-server server
./build-key user1</pre>

Kopiowanie kluczy:

Klucze zapisały się w katalogu /usr/share/doc/openvpn*/easy-rsa/2.0/keys

<pre class="lang:default decode:true">cd /usr/share/doc/openvpn*/easy-rsa/2.0/keys
cp ca.crt server.crt server.key dh1024.pem /etc/openvpn/</pre>

&nbsp;

Nadawanie uprawnień:

<pre class="lang:default decode:true">chmod 666 /etc/openvpn/ipp.txt</pre>

&nbsp;

Konfiguracja openvpn.conf  
mcedit /etc/openvpn/openvpn.conf

<pre class="lang:default decode:true">port 1194
proto tcp-server
tls-server
mode server
dev tun
local x.x.x.x ;ip wan
server 10.30.0.0 255.255.255.0 ;zakres sieci vpn dla klientĂłw
;pierwszy zawsze dla serwera, klienci z tego zakresu pobierajÄ ip.
ifconfig-pool-persist /etc/openvpn/ipp.txt ;plik w ktĂłrym zapisywane sÄ ip klientĂłw
ca /etc/openvpn/ca.crt
cert /etc/openvpn/server.crt
key /etc/openvpn/server.key
dh /etc/openvpn/dh1024.pem
daemon
verb 4
log-append /var/log/openvpn.log
keepalive 10 900
inactive 3600
comp-lzo
persist-tun
persist-key
push "route 10.0.5.0 255.255.255.0" ;routing który zaciągają klienci</pre>

Włączanie przekazywania pakietów:

<pre class="lang:default decode:true">/sbin/sysctl -w net.ipv4.ip_forward=1</pre>

I to na tyle konfiguracji serwera

2. Konfiguracja klienta:

Kopiujemy klucze z serwera na stacje lokalną

<pre class="lang:default decode:true">scp root@x.x.x.x:/usr/share/doc/openvpn*/easy-rsa/2.0/keys/ca.crt ~/Pulpit/openvpn
scp root@x.x.x.x:/usr/share/doc/openvpn*/easy-rsa/2.0/keys/user1.crt ~/Pulpit/openvpn
scp root@x.x.x.x:/usr/share/doc/openvpn*/easy-rsa/2.0/keys/user1.key ~/Pulpit/openvpn</pre>

&nbsp;

Konfigurujemy plik openvpn.conf i zapisujemy w ~/Pulpit/openvpn

<pre class="lang:default decode:true">client
dev tun
remote x.x.x.x 1194 ;ip wan serwera
proto tcp
log-append /sdcard/openvpn/openvpn.log
keepalive 10 60
comp-lzo
persist-key
persist-tun
ca /sdcard/openvpn/ca.crt
cert /sdcard/openvpn/user1.crt
key /sdcard/openvpn/user1.key</pre>

Podłączamy telefon pod kabel USB i kopiujemy pliki:

W telefonie tworzymy katalog openvpn na karcie SD.

<pre class="lang:default decode:true">cd ~/Pulpit/openvpn
adb push user1.crt /sdcard/openvpn/
adb push user1.key /sdcard/openvpn/
adb push ca.crt /sdcard/openvpn/
adb push openvpn.conf /sdcard/openvpn/</pre>

Instalujemy OpenVpn Settings z marketu.

Odpalamy OpenVpn Settings  
Zaznaczamy OpenVPN a następnie  
zaznaczamy openvpn.conf

U mnie działa ta konfiguracja bez problemu w razie kłopotów warto patrzeć w logi:

telefon:

<pre class="lang:default decode:true">cat /sdcard/openvpn/openvpn.log</pre>

lub

<pre class="lang:default decode:true">adb logcat</pre>

serwer:

<pre class="lang:default decode:true">tail -f /var/log/openvpn.log</pre>

&nbsp;