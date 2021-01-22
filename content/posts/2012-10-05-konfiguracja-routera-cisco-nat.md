---
title: Konfiguracja routera cisco – nat
author: Przemek
type: post
date: 2012-10-05T19:50:21+00:00
url: /konfiguracja-routera-cisco-nat/
featured_image: /wp-content/uploads/2012/10/cisco.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 2150
dsq_thread_id:
  - 1015977100
categories:
  - Network
tags:
  - Cisco
  - router

---
Przykład trochę skomplikowanego użycia NAT w cisco . Ukrywanie sieci lokalnej z adresacją 192.168.1.0 pod siecią z adresacji 172.16.1.0 w przypadku łączenia się do konkretnego hosta np: 10.0.0.1. Przydatne przy połączeniach VPN.

<!--more-->

Linia 44  &#8211; definiuje pule adresów o nazwie my_nat

Linia 48 &#8211; definiuje access listę która zawiera źródło i cel (10.0.0.1)

Linia 45 &#8211; wskazuje która access lista (100) ba być tłumaczona na jakie adresy (my_nat)

access listy deny są po to żeby żądanie połączenie nie wychodziło na świat (routing) tylko było pchane w tunel VPN.

Linia 55-56 &#8211; przypisuje do route mapy konkretne access listy

Linia 46 &#8211; wskazuje które route mapy maja wychodzić jakim interfejsem

&nbsp;

<pre class="nums:true lang:sh decode:true">!
ip dhcp excluded-address 172.18.10.1
ip dhcp excluded-address 192.168.1.1
!
ip dhcp pool vlan1pool
   network 172.16.1.0 255.255.255.0
   default-router 172.16.1.1 
!
ip dhcp pool vlan2pool
   network 192.168.1.0 255.255.255.0
   default-router 192.168.1.1 
!
vlan 2 
!
interface FastEthernet0
!
interface FastEthernet1
 switchport access vlan 2
!
interface FastEthernet2
!
interface FastEthernet3
!
interface FastEthernet4
 ip address 83.83.83.82 255.255.255.252
 ip nat outside
 ip virtual-reassembly
 duplex auto
 speed auto
!
interface Vlan1
 ip address 172.16.1.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly
!
interface Vlan2
 ip address 192.168.1.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly
!
ip forward-protocol nd
ip route 0.0.0.0 0.0.0.0 83.83.83.81
!
ip nat pool my_nat 172.16.1.0 172.16.1.254 netmask 255.255.255.0
ip nat inside source list 100 pool my_nat overload
ip nat inside source route-map my_rmap1 interface FastEthernet4 overload
!
access-list 100 permit ip 192.168.1.0 0.0.0.255 host 10.0.0.1
access-list 101 deny   ip 172.16.1.0 host 10.0.0.1
access-list 101 permit ip 172.16.1.0 0.0.0.255 any
access-list 110 deny   ip 192.168.1.0 0.0.0.255 host 10.0.0.1
access-list 110 permit ip 192.168.1.0 0.0.0.255 any

!
route-map my_rmap1 permit 1
 match ip address 101 110
!</pre>

&nbsp;

&nbsp;