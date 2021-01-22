---
title: Iptables – dla routera – maskarada
author: Przemek
type: post
date: 2011-01-01T22:51:39+00:00
url: /iptables-dla-routera-maskarada/
bfa_virtual_template:
  - hierarchy
hits:
  - 585
dsq_thread_id:
  - 1024115838
dsq_needs_sync:
  - 1
categories:
  - Linux
tags:
  - iptables

---
Regułki iptables dla routera z dynamicznym adresem IP (maskarada) lub statycznym SNAT

<!--more-->

**WAN eth0**  
 **LAN eth1**

Czyszczenie reguł

<pre class="lang:default decode:true">iptables -X
iptables -X -t nat
iptables -F -t nat
iptables -X -t mangle
iptables -F -t mangle</pre>

&nbsp;

Reguły dla localhosta

<pre class="lang:default decode:true">## localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -o lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT</pre>

&nbsp;

Domyślna polotyka wejscie DROP, wyjście ACCEPT

<pre class="lang:default decode:true">## domyslna polityka
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P INPUT DROP</pre>

&nbsp;

Wpuszczamy ruch od strony lokalnej sieci

<pre class="lang:default decode:true">## wpuszczamy lan
iptables -A INPUT -i eth1 -j ACCEPT</pre>

&nbsp;

Nawiązywane połączenia z lanu (OUTPUT ACCEPT) zostaja wpuszczone na wan (INPUT DROP)

<pre class="lang:default decode:true">## utrzymujemy nawiazane
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT</pre>

&nbsp;

Adresy lokalne zostaja ukrywane pod dynamicznie zmieniającym sie adresem wan

<pre class="lang:default decode:true">## maskarada
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE</pre>

&nbsp;

Adresy lokalne zostaja ukrywane pod statycznym adresem wan

<pre class="lang:default decode:true">## SNAT
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 83.83.83.83 # zewnetrzne IP</pre>

&nbsp;

Włączone przekazywanie pakietów pomiędzy interfejsami

<pre class="lang:default decode:true">## włączone forwardowanie pakietów
echo 1 &gt; /proc/sys/net/ipv4/ip_forward</pre>

&nbsp;