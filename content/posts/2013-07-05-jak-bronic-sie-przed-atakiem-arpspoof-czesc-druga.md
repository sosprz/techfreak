---
title: Jak bronić się przed atakiem arpspoof? cześć druga
author: Przemek
type: post
date: 2013-07-05T17:43:04+00:00
url: /jak-bronic-sie-przed-atakiem-arpspoof-czesc-druga/
featured_image: /wp-content/uploads/2013/07/przelacznik_zarzadzalny_arpprotect.jpg
hits:
  - 744
dsq_thread_id:
  - 1470046150
categories:
  - Network
tags:
  - security

---
Po ostatnim wpisie <a href="http://techfreak.pl/jak-bronic-sie-przed-atakiem-arpspoof/" target="_blank">jak bronic się przed atakiem arpspoof</a>, pomyślałem że w sumie to powinienem też pokazać jak bronić się przed atakami arpspoof w sieci, tam gdzie są do dyspozycji zarządzalne przełączniki. Do wykorzystania mam stary przełącznik HP ProCurve 2626 ale jest on w pełni zarządzalny i po odpowiedniej konfiguracji spokojnie ochroni mnie przed atakiem arpspoof.

Poniższa konfiguracja jest naprawdę prosta a dodatkowo będzie działać na wyższych modelach przełączników HP np. HP ProCurve 2600, 3500, 5400.

<!--more-->

### Mechanizmy

Na przełączniku skorzystam z dwóch mechanizmów **dhcp-snooping** i **arp-protect**.

**DHCP snooping** &#8211; jest to mechanizm który ma za zadanie śledzić fizyczna lokalizacje hosta, upewniać się że host używa adresu przypisanego tylko do niego i że host korzysta tylko z upoważnionego serwera DHCP.

**Arp protect** &#8211; jest to funkcja która sprawdza autentyczność pakietów ARP przed ich dalszym przekazaniem. Arp protect nie działa bez DHCP snooping.

### Konfiguracja

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/07/przelacznik_zarzadzalny_arpprotect.jpg"><img class="aligncenter size-full wp-image-3935" alt="Switch HP arpprotect arpspoof" src="http://techfreak.pl/wp-content/uploads/2013/07/przelacznik_zarzadzalny_arpprotect.jpg" width="642" height="362" /></a>
</p>

Stan jest taki że posiadam zarządzalny przełącznik do którego wpinam na porcie 1 komputer ofiarę z adresem 192.168.0.11, na porcie 3 komputer atakujący z adresem 192.168.0.13 i na porcie 5 link do głównego przełącznika który jest bramą w sieci z adresem ip 192.168.0.254. Za nim jest DHCP, serwery itd. Przełącznik ma skonfigurowany tylko domyślny VLAN 1.

Cała konfiguracja to włączenie mechanizmów, wskazanie vlanu na którym maja mechanizmy działać i wskazanie zaufanego portu. Zazwyczaj będzie to trunk lub tagowany port lub tagowany trunk. Natomiast **arp-protect validate src-mac dest-mac** sprawdza czy wszelkie żądania lub odpowiedzi ARP ze źródłem MAC w nagłówku Ethernet odpowiada adresowi nadawcy MAC w treści pakietu.

<pre><span style="line-height: 1.61538em;">conf</span>
dhcp-snooping
dhcp-snooping vlan 1
dhcp-snooping trust 5
arp-protect
arp-protect trust 5
arp-protect vlan 1
arp-protect validate src-mac dest-mac</pre>

Całość konfiguracji będzie wyglądała jak poniżej. Jest to domyślna konfiguracja plus powyższa.

<pre>hostname "sw" 
snmp-server community "public" Unrestricted 
vlan 1 
 name "DEFAULT_VLAN" 
 untagged 1-26 
 ip address dhcp-bootp 
 exit 
dhcp-snooping
dhcp-snooping vlan 1 
interface 5
 dhcp-snooping trust
 exit
arp-protect
arp-protect validate src-mac dest-mac
arp-protect trust 5
arp-protect vlan 1 
password manager</pre>

&nbsp;

### Diagnostyka

Zabezpieczenia są włączone, sprawdzę jak wyglądają różne statystyki i przydatne informacje przed atakiem.

Wyświetlam statystyki arp-protect

<pre> sh arp-protect statistics</pre>

<pre>ARP Protection Counters for VLAN 1

 ARPs forwarded : 1 Bad Sender/Target IP : 0
 Bad bindings : 0 Source/Sender MAC mismatches : 0
 Malformed pkts : 0 Dest/Target MAC mismatches : 0</pre>

Sprawdzam czy arp-protect jest włączony i jakie porty zostały oznaczone jako zaufane.

<pre>sh arp-protect</pre>

<pre>ARP Protection Information

ARP Protection Enabled : Yes
Protected Vlans : <strong>1</strong>
Validate :

Port Trust
---- -----
1 No
2 No
3 No
4 No
<strong>5 Yes</strong>
6 No
7 No
8 No
9 No
10 No
11 No
12 No
13 No
14 No
15 No
16 No
17 No
18 No
19 No
20 No
21 No
22 No
23 No
24 No
25 No
26 No</pre>

Sprawdzam jakie mac adresy pojawiły się na przełączniku

<pre>sh mac</pre>

<pre>Status and Counters - Port Address Table
MAC Address Located on Port
 ------------- ---------------

 001e0b-000005 5 
 001e4f-000001 1 
 5c260a-000003 3</pre>

<pre>sh arp</pre>

<pre>IP ARP table
IP Address MAC Address Type Port
 --------------- ----------------- ------- ----
 192.168.0.254 b499ba-000005 dynamic 5</pre>

Sprawdzam czy już zostały przypisane adresy IP do Mac adresów.

<pre>sh dhcp-snooping bindings</pre>

<pre>MacAddress    IP              VLAN Interface Time Left
  ------------- --------------- ---- --------- ---------
  001e4f-000001 192.168.0.11       1    1         28587    
  5c260a-000003 192.168.0.13       1    3         28308</pre>

Sprawdzam statystyki dhcp-snopping

<pre>sh dhcp-snooping stats</pre>

<pre>Packet type  Action   Reason                        Count
 -----------  -------  ----------------------------  ---------
 server       forward  from trusted port              3
 client       forward  to trusted port                13
 server       drop     received on untrusted port     0
 server       drop     unauthorized server            0
 client       drop     destination on untrusted port  0
 client       drop     untrusted option 82 field      0
 client       drop     bad DHCP release request       0
 client       drop     failed verify MAC check        0</pre>

### Po próbie ataku

Aby przetestować ten scenariusz uruchomiłem takie same skrypty jak w poprzednim wpisie <a title="Jak bronić się przed atakiem arpspoof?" href="http://techfreak.pl/jak-bronic-sie-przed-atakiem-arpspoof/" target="_blank">Jak bronić się przed atakiem arpspoof?</a>

<pre>#! /bin/bash
 echo 1 &gt; /proc/sys/net/ipv4/ip_forward
 gateway=192.168.0.254
 target=192.168.0.11
 xterm -e arpspoof -t $gateway $target &
 xterm -e arpspoof -t $target $gateway &
 xterm -e urlsnarf &
 xterm driftnet &</pre>

Sprawdzam statystyki arp-protect już po przypuszczalnym ataku, widać pojawiły się złe powiązania

<pre>sh arp-protect statistics</pre>

<pre>ARP Protection Counters for VLAN 1

  ARPs forwarded  : 22          Bad Sender/Target IP          : 0 
  <strong>Bad bindings    : 36 </strong>         Source/Sender MAC mismatches  : 0 
  Malformed pkts  : 0           Dest/Target   MAC mismatches  : 0</pre>

Wyświetlam logi w których widać że zostały zablokowane pakiety które wychodziły z portu trzeciego (atakujący) które miały na celu okłamać ofiarę i bramę.

<pre>sh run</pre>

<pre>I 07/05/13 05:50:37 arp-protect: Deny ARP Reply 5c260a-000003,192.168.0.11 port 3, vlan 9
I 07/05/13 05:50:37 arp-protect: Deny ARP Reply 5c260a-000003,192.168.0.254 port 3, vlan 9</pre>

Oczywiście atakujący nie zdołał podsłuchać niczego ze stacji ofiary i sieć zostaje bezpieczna pod kątem tego ataku.

### Logowanie

Warto do konfiguracji przełącznika dodać wpis dzięki któremu zaloguje on na zdalny syslog powyższe zdarzenia.

<pre>logging 192.168.0.200</pre>

Nie masz serwera syslog? zobacz jak opisałem konfiguracje we wpisie <a title="Jak skonfigurować serwer syslog?" href="http://techfreak.pl/jak-skonfigurowac-serwer-rsyslog-interfejs-www-na-redhat-6/" target="_blank">Jak skonfigurować serwer syslog?</a>