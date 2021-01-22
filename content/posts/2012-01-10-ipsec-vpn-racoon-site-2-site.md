---
title: IPsec VPN racoon site 2 site
author: Przemek
type: post
date: 2012-01-10T09:07:01+00:00
url: /ipsec-vpn-racoon-site-2-site/
bfa_virtual_template:
  - hierarchy
hits:
  - 483
dsq_thread_id:
  - 1024840238
categories:
  - Linux
  - Network
tags:
  - checkpoint
  - ipsec
  - racoon
  - vpn

---
Połączenie VPN site to site po między hostem z systemem linuks z pakietem Racoon (ipsec) a Checkpoint NGX R65 (ipsec).  
Poniższa konfiguracja racoon jest o tyle uniwersalna że może się łączyć z każdym innym urządzeniem obsługującym ipsec.

<!--more-->

Konfiguracja racoon ipsec

UWAGA:  
W tym przypadku naszym hostem który będzie inicjował połączenie nie będzie brama tylko host w sieci lokalnej z zainstalowanym pakietem ipsec racoon.

Pliki do konfiguracji:  
racoon.conf  
setkey.conf  
psk.txt

Schemat połączenia:

<pre class="lang:default decode:true">(racoon)                                  (checkpoint)
(lan)            (lan gw)     (ext gw)           (ext gw) (routing) (host1)
192.168.1.2/24&gt;192.168.1.1&gt;82.82.82.82&gt;[internet]&lt;83.83.83.83&lt;&lt;&lt;192.168.2.2
     |                                                               |
     |__ping request &gt;&gt;&gt;--------------------------&lt;&lt;&lt; ping reply_____|</pre>

&nbsp;

setkey.conf

<pre>#!/usr/sbin/setkey -f

flush;
spdflush;
spdadd 192.168.1.2 192.168.2.0/24 any -P out ipsec esp/tunnel/192.168.1.2-83.83.83.83/require;
spdadd 192.168.2.0/24 192.168.1.2 any -P in ipsec esp/tunnel/83.83.83.83-192.168.1.2/require;</pre>

racoon.conf

<pre class="lang:default decode:true">log info;
path pre_shared_key "`pwd`/psk.txt";
listen {
adminsock "/var/run/racoon/racoon.sock" "root" "operator" 0660;
isakmp_natt 192.168.1.2 [4500];
isakmp 192.168.1.2 [500];
}

remote 83.83.83.83 {
exchange_mode main;
nat_traversal on;
ike_frag on;
mode_cfg on;
passive off;
proposal_check obey;
proposal {
encryption_algorithm 3des;
hash_algorithm sha1;
authentication_method pre_shared_key;
dh_group 2;
}
}

sainfo address 192.168.1.2 any subnet 192.168.2.0/24 any {
lifetime time 1 hour;
pfs_group 2;
encryption_algorithm 3des;
authentication_algorithm hmac_sha1;
compression_algorithm deflate;
}</pre>

psk.txt

<pre class="lang:default decode:true">83.83.83.83 password</pre>

nadanie uprawnien dla pliku psk.txt

<pre class="lang:default decode:true">chmod 600 psk.txt</pre>

Uruchomienie:

<pre class="lang:default decode:true"> ./setkey.conf
 racoon -F -d -v -f racoon.conf
 ping 192.168.2.2</pre>

lub samo podniesienie tunelu:

<pre class="lang:default decode:true">racoonctl vpn-connect 83.83.83.83</pre>

&nbsp;

Jak skonfigurować Check Point R65 aby działał z Racoon:

<http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/>