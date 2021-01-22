---
title: Konfiguracja tunelu VPN site to site dla Cisco do urządzeń innych niż cisco
author: Przemek
type: post
date: 2012-10-06T08:56:32+00:00
url: /konfiguracja-tunelu-vpn-site-to-site-dla-cisco-do-urzadzen-innych-niz-cisco/
featured_image: /wp-content/uploads/2012/10/cisco.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 1203
dsq_thread_id:
  - 1015976815
categories:
  - Network
tags:
  - Cisco
  - router
  - vpn

---
Jak skonfigurować tunel VPN site 2 site na Cisco ?

<!--more-->

W poniższej konfiguracji istotna cześć tycząca się tunelu została pogrubiona. Tunel zabezpieczony hasłem psk. Szyfrowanie dla pierwszej fazy i drugiej to 3des i sha1. Kolorki mają pomóc w zrozumieniu konfiguracji.

<span style="color: #ff6600;">Pomarańczowy</span> to faza pierwsza ISAKMP (IKE) czyli wymiana kluczy znanych po obu stronach.  
<span style="color: #ff0000;">Czerwony</span> to faza druga (IPsec) gdzie tworzy się tunel.  
<span style="color: #0000ff;">Niebieski</span> to crypto mapa która spina w sobie wszystkie potrzebne konfiguracje i informacje  
czyli adres ip peer&#8217;a i na <span style="color: #008000;">zielono</span> adresy sieci pomiędzy jakimi ma zostać nawiązany tunel.  
Natomiast bez list dostępowych oznaczonych na <span style="color: #ffff00;">żółto</span> nie było by wyjśćia na świat bo cały ruch  
jest kierowany w tunel. Dlatego blokujemy w tej liscie ruch do tunelu i puszczany cały inny poprzez NAT oznaczony kolorem <span style="color: #800080;">fioletowym.</span>

&nbsp;

ip dhcp excluded-address 192.168.1.1  
!  
ip dhcp pool vlan1pool  
network 192.168.1.0 255.255.255.0  
default-router 192.168.1.1  
dns-server 194.204.159.1  
!  
**crypto isakmp policy <span style="color: #ff9900;">1</span>**  
 **encr 3des**  
 **authentication pre-share**  
 **group 2**  
**crypto isakmp key zmień\_swój\_secretpass address 83.83.83.83 no-xauth**  
**!**  
**crypto ipsec transform-set <span style="color: #ff0000;">my_phase2</span> esp-3des esp-sha-hmac**  
**!**  
**crypto map <span style="color: #0000ff;">my_cry_map</span> <span style="color: #ff9900;">1</span> ipsec-isakmp**  
 **set peer 83.83.83.83**  
 **set transform-set <span style="color: #ff0000;">my_phase2 </span>**  
 **set pfs group2**  
 **match address <span style="color: #008000;">100</span>**  
!  
interface FastEthernet4  
ip address 82.82.82.82 255.255.255.252  
ip nat outside  
ip virtual-reassembly  
duplex auto  
speed auto  
**crypto map <span style="color: #0000ff;">my_cry_map</span>**  
!  
interface Vlan1  
ip address 192.168.1.1 255.255.255.0  
ip nat inside  
ip virtual-reassembly  
!  
ip forward-protocol nd  
ip route 0.0.0.0 0.0.0.0 82.82.82.81  
!  
**ip nat inside source route-map <span style="color: #800080;">my_rmap1</span> interface FastEthernet4 overload**  
!  
access-list <span style="color: #008000;">100</span> permit ip 192.168.1.0 0.0.0.255 192.168.2.0 0.0.0.255  
access-list <span style="color: #ffff00;">101</span> deny ip 192.168.1.0 0.0.0.255 192.168.2.0 0.0.0.255  
access-list <span style="color: #ffff00;">101</span> permit ip 192.168.1.0 0.0.0.255 any  
access-list <span style="color: #ffff00;">101</span> permit ip any any  
!  
**route-map <span style="color: #800080;">my_rmap1</span> permit 1**  
 **match ip address 101**  
!