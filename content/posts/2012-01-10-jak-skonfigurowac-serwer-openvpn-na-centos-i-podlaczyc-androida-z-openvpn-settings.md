---
title: Jak skonfigurować serwer OpenVpn na CentOS i podłączyć androida z OpenVpn Settings
author: Przemek
type: post
date: 2012-01-10T06:53:01+00:00
url: /jak-skonfigurowac-serwer-openvpn-na-centos-i-podlaczyc-androida-z-openvpn-settings/
bfa_virtual_template:
  - hierarchy
hits:
  - 579
dsq_thread_id:
  - 1017587369
categories:
  - Linux
  - Network
tags:
  - centos
  - openvpn
  - vpn

---
Jak skonfigurować serwer OpenVPN i Androida jako klienta ?<span style="color: #ff0000;"><span style="text-decoration: line-through;"><br /> </span></span>

<!--more-->

#### **Konfiguracja serwera:**

Instalacja:

<pre class="lang:default highlight:0 decode:true">yum install openvpn</pre>

Generowanie certyfikatów:

<pre class="lang:default highlight:0 decode:true">cd /usr/share/doc/openvpn*/easy-rsa/2.0/
chmod 744 /usr/share/doc/openvpn*/easy-rsa/2.0/*
. ./vars
./clean-all
./build-ca
./build-dh
./build-key-server server
./build-key user1</pre>

Kopiowanie kluczy:

Klucze zapisały się w katalogu /usr/share/doc/openvpn*/easy-rsa/2.0/keys

<pre class="lang:default highlight:0 decode:true">cd /usr/share/doc/openvpn*/easy-rsa/2.0/keys
cp ca.crt server.crt server.key dh1024.pem /etc/openvpn/</pre>

Nadawanie uprawnień:

<pre class="lang:default highlight:0 decode:true">chmod 666 /etc/openvpn/ipp.txt</pre>

Konfiguracja openvpn.conf

nano /etc/openvpn/openvpn.conf

<pre class="lang:default highlight:0 decode:true">port 1194
proto udp
tls-server
mode server
dev tun
local x.x.x.x	
server 10.30.0.0 255.255.255.0	 
ifconfig-pool-persist /etc/openvpn/ipp.txt	
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
push "route 10.0.5.0 255.255.255.0"</pre>

linia 6 &#8211; wpisz adres IP serwera Ubuntu

linia 7 &#8211; zakres sieci vpn dla klientów, pierwszy zawsze dla serwera, klienci z tego zakresu pobierają ip

linia 8 &#8211; plik w którym zapisywane są pobrane ip klientów

linia 21 &#8211; routing który zaciągają klienci, ważna opcja jeśli chcemy mieć dostęp do innych sieci

Włączanie przekazywania pakietów:

<pre class="lang:default highlight:0 decode:true">/sbin/sysctl -w net.ipv4.ip_forward=1</pre>

#### Konfiguracja klienta:

Kopiujemy klucze z serwera na stacje lokalną:

<pre class="lang:default decode:true">scp root@x.x.x.x:/usr/share/doc/openvpn*/easy-rsa/2.0/keys/ca.crt ~/Pulpit/openvpn
scp root@x.x.x.x:/usr/share/doc/openvpn*/easy-rsa/2.0/keys/user1.crt ~/Pulpit/openvpn
scp root@x.x.x.x:/usr/share/doc/openvpn*/easy-rsa/2.0/keys/user1.key ~/Pulpit/openvpn</pre>

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

server:

<pre class="lang:default decode:true">tail -f /var/log/openvpn.log</pre>

&nbsp;