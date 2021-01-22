---
title: Konfiguracja sieci dla routera cisco serii 800
author: Przemek
type: post
date: 2012-10-06T10:13:53+00:00
url: /konfiguracja-sieci-dla-routera-cisco-serii-800/
featured_image: /wp-content/uploads/2012/10/cisco.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 1008
dsq_thread_id:
  - 1023099160
categories:
  - Network
tags:
  - Cisco
  - router

---
Jak skonfigurować podstawy w routerze Cisco ?

<!--more-->

Poniżej przedstawiam podstawową konfiguracje routera cisco serii 800

Na początek czyścimy konfiguracje:

<pre class="lang:default highlight:0 decode:true">erase startupconfig
reload</pre>

Poniższa konfiguracje można wklejać do terminala:

<pre class="lang:default highlight:0 decode:true">ip dhcp pool dhcppool
network 192.168.1.0 255.255.255.0
default-router 192.168.1.1
dns-server 212.212.212.212
exit

ip dhcp excluded-address 192.168.1.1

interface vlan 1 
ip address 192.168.1.1 255.255.255.0 
ip nat inside 
no shutdown
exit

interface FastEthernet0
no shutdown
exit
interface FastEthernet1
no shutdown
exit
interface FastEthernet2
no shutdown
exit
interface FastEthernet3
no shutdown
exit

interface FastEthernet 4 
no shutdown
ip address 83.83.83.81 255.255.255.252
ip nat outside
exit

ip nat inside source list 1 interface fastethernet4 overload
access-list 1 permit 192.168.1.0 0.0.0.255
ip route 0.0.0.0 0.0.0.0 83.83.83.82</pre>

&nbsp;

&nbsp;