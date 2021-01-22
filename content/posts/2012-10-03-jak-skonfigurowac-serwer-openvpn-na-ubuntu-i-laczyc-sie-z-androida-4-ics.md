---
title: Jak skonfigurować serwer OpenVpn na Ubuntu i łączyć się z Androida 4 (ICS+)
author: Przemek
type: post
date: 2012-10-03T06:35:58+00:00
url: /jak-skonfigurowac-serwer-openvpn-na-ubuntu-i-laczyc-sie-z-androida-4-ics/
bfa_virtual_template:
  - hierarchy
hits:
  - 3880
dsq_thread_id:
  - 1015594402
categories:
  - Linux
  - Network
tags:
  - openvpn
  - ubuntu

---
Opis instalacji serwera OpenVpn na Ubuntu i łączenie z Androida

<!--more-->

**Informacje: **

  * Nie wymaga root&#8217;a  na telefonie
  * Jeśli to serwer podłączony bezpośrednio do internetu to trzeba otworzyc port <span style="color: #ff0000;">udp 1194</span>
  * Jeśli to serwer za routerem trzeba zrobić forward portów na lokalny ip serwera na port <span style="color: #ff0000;">udp 1194</span>

**1. Konfiguracja servera Ubuntu (12.04):**

Instalacja:

<pre class="lang:default highlight:0 decode:true">aptitude install openvpn</pre>

Generowanie certyfikatów:

<pre class="lang:default highlight:0 decode:true">cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/
chmod 744 /usr/share/doc/openvpn/examples/easy-rsa/2.0/*
. ./vars
./clean-all
./build-ca
./build-dh
./build-key-server server
./build-key user1</pre>

Na potrzeby telefonu potrzebujemy certyfikat p12 który bedzie się składał z user1.crt i user1.key:

<pre class="lang:default highlight:0 decode:true">cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys/
openssl pkcs12 -export -clcerts -in user1.crt -inkey user1.key -out user_openvpn.p12</pre>

Kopiowanie kluczy:

Klucze zapisały się w katalogu /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys i trzeba je skopiować do /etc/openvpn

<pre class="lang:default highlight:0 decode:true">cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys
cp ca.crt server.crt server.key dh1024.pem /etc/openvpn/</pre>

Nadawanie uprawnień:

<pre class="lang:default highlight:0 decode:true">chmod 666 /etc/openvpn/ipp.txt</pre>

Konfiguracja openvpn.conf

nano /etc/openvpn/openvpn.conf

<pre class="nums:true lang:default highlight:0 decode:true">port 1194
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

linia 6 &#8211; wpisz adres IP serwera Ubuntu

linia 7 &#8211; zakres sieci vpn dla klientów, pierwszy zawsze dla serwera, klienci z tego zakresu pobierają ip

linia 8 &#8211; plik w którym zapisywane są pobrane ip klientów

linia 21 &#8211; routing który zaciągają klienci, ważna opcja jeśli chcemy mieć dostęp do innych sieci

&nbsp;

Włączenie przekazywania pakietów:

<pre class="lang:default highlight:0 decode:true">/sbin/sysctl -w net.ipv4.ip_forward=1</pre>

Właczanie usługi:

<pre class="lang:default highlight:0 decode:true">service openvpn start</pre>

Dodanie do automatycznego uruchamiania:

<pre class="lang:default highlight:0 decode:true">update-rc.d openvpn enable</pre>

Odpalamy plik z logami openvpn:

<pre class="lang:default highlight:0 decode:true">tail -f /var/log/openvpn.log</pre>

** **

**2. Konfiguracja klienta:**

Klucze do skopiowania z serwera na stacje lokalną lub na telefon:

<pre class="lang:default highlight:0 decode:true">/usr/share/doc/openvpn/examples/easy-rsa/2.0/keys/ca.crt
/usr/share/doc/openvpn/examples/easy-rsa/2.0/keys/user_openvpn.p12</pre>

Aby dodać certyfikat user_openvpn.p12 przechodzimy na telefonie do:

<span style="color: #008000;">Security > Creditential storage > Install form phone storage > wybieramy certyfikat </span>

Przechodzimy na strone **<a title="xda-developers" href="http://forum.xda-developers.com/showthread.php?t=1591585" target="_blank">xda-developers</a>**  gdzie jest do sciagniecia aplikacja openvpn i instalujemy ją w telefonie (nie wymaga root&#8217;a)

Odpalamy aplikacje OpenVPN:

Add VPN  
VPN name &#8211; <span style="color: #008000;">wpisujemy nazwe</span>  
Set VPN server &#8211; <span style="color: #008000;">wpisujemy IP servera Ubuntu</span>  
User authentication &#8211; <span style="color: #008000;">tu nic nie wpisujemy</span>  
Certyficate authority (CA) certificate &#8211; <span style="color: #008000;">wybieramy ca.crt z karty lub lokalnej pamięci</span>  
User certificate &#8211; <span style="color: #008000;">Wybieramy wczesniej zainstalowany user_openvpn.p12</span>

Wybieramy menu i klikamy advanced zaznaczamy <span style="color: #ff0000;">LZO compression</span>  
Wybieramy menu i klikamy <span style="color: #ff0000;">save</span>

Następnie klikajac na nazwe połączenia łączymy się z serwerem.