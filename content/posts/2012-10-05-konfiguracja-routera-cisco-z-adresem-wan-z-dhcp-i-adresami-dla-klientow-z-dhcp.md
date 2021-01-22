---
title: Konfiguracja routera Cisco z adresem WAN z dhcp i adresami dla klientów z dhcp
author: Przemek
type: post
date: 2012-10-05T19:55:19+00:00
url: /konfiguracja-routera-cisco-z-adresem-wan-z-dhcp-i-adresami-dla-klientow-z-dhcp/
featured_image: /wp-content/uploads/2012/10/cisco.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 2162
dsq_thread_id:
  - 1019918354
categories:
  - Network
tags:
  - Cisco
  - router

---
Przykład jak skonfigurować router Cisco aby pobierał na interfejsie WAN adres IP z DHCP i rozdawał IP ze swojego DHCP.

<!--more-->

Linie 1-6 to pula dhcp dla klientów z LANu, opcja import all importuje wszystkie potrzebne ustawienia uzyskane z serwera dhcp po stronie WAN do ustawien serwera dhcp po stronie LAN np. DNS.  
Linie 16 i 23 to  ustawienia interfejsu WAN czyli pobieranie adresu z serwera dhcp i ustawienia domyślnego routingu.

<pre class="nums:true lang:default mark:1-6,16,23 highlight:0 decode:true">!
ip dhcp pool vlan1pool
   import all
   default-router 192.168.1.1
   network 192.168.1.0 255.255.255.0
!
interface FastEthernet0
!
interface FastEthernet1
!
interface FastEthernet2
!
interface FastEthernet3
!
interface FastEthernet4
 ip address dhcp
 ip nat outside
!
interface Vlan1
 ip address 192.168.1.1 255.255.255.0
 ip nat inside
!
ip route 0.0.0.0 0.0.0.0 FastEthernet4 dhcp
!
ip nat inside source route-map my_rmap1 interface FastEthernet4 overload
!
access-list 101 permit ip 192.168.1.0 0.0.0.255 any
!
route-map my_rmap1 permit 1
 match ip address 101
!</pre>

&nbsp;