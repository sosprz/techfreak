---
title: OpenSwan VPN – troubleshooting
author: Przemek
type: post
date: 2015-05-20T14:48:22+00:00
url: /openswan-vpn-troubleshooting/
featured_image: /wp-content/uploads/2015/05/Openswan-624x387.jpg
hits:
  - 319
xyz_fbap:
  - 1
dsq_thread_id:
  - 3779933146
colormag_page_layout:
  - default_layout
categories:
  - Network
tags:
  - ipsec
  - Raspberry pi
  - vpn

---
Dziś kolejny wpis na temat IPsec VPN a dokładnie trochę o konfiguracji OpenSwan który jest trochę bardziej popularny niż LibreSwan (fork) o którym pisałem <a href="http://techfreak.pl/libreswan-konfiguracja-vpn/" target="_blank" rel="noopener">ostatnio</a>. W zasadzie konfiguracja nie będzie się wiele różnić dlatego napisze coś o problemach przy zestawianiu takiego połączenia. Osobiście zestawiałem takie połączenia np. z <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/" target="_blank" rel="noopener">checkpointem</a>, <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-dla-cisco-do-urzadzen-innych-niz-cisco/" target="_blank" rel="noopener">cisco</a> czy <a href="http://techfreak.pl/ipsec-vpn-racoon-site-2-site/" target="_blank" rel="noopener">racoon</a>.

<!--more-->

#### Przykładowy diagram połączenia

<a href="http://techfreak.pl/openswan-vpn-troubleshooting/diagram1/" rel="attachment wp-att-9499"><img class="aligncenter size-full wp-image-9499" src="http://techfreak.pl/wp-content/uploads/2015/05/Diagram1.jpg" alt="Diagram1" width="732" height="221" /></a>

Połączenie VPN będzie realizowane w trybie tunelowym, czyli sieć do sieci (strona do strony, site 2 site). Celem wykreowania połączenia VPN jest dostęp jednej sieci do drugiej i na odwrót.

#### ipsec.conf

W zasadzie konfiguracja jest całkiem prosta bo sprowadza się do określenia stron. Lewa strona MY, prawa ONI. Na diagramie widać, że openswan nie jest uruchomiony bezpośrednio na routerze a dopiero za min. Trzeba włączyć nat_traversal. Warto włączyć logowanie do pliku &#8211; plutostderrlog. Aby tunel wstawał zawsze przy uruchomieniu demona ustaw auto=start. Dodaj opcje leftnexthop aby zadziałał ruting. Inaczej ping nie będą trafiać w tunel jeśli tego nie wskażesz (ping -I).

ipsec.conf

<pre>config setup
	# Do not set debug options to debug configuration issues!
	# plutodebug / klipsdebug = "all", "none" or a combation from below:
	# "raw crypt parsing emitting control klips pfkey natt x509 dpd private"
	# eg:
	plutodebug="none"
	# Again: only enable plutodebug or klipsdebug when asked by a developer
	#
	# enable to get logs per-peer
	# plutoopts="--perpeerlog"
	#
	# Enable core dumps (might require system changes, like ulimit -C)
	# This is required for abrtd to work properly
	# Note: incorrect SElinux policies might prevent pluto writing the core
	dumpdir=/var/run/pluto/
	#
	# NAT-TRAVERSAL support, see README.NAT-Traversal
	nat_traversal=yes
	# exclude networks used on server side by adding %v4:!a.b.c.0/24
	# It seems that T-Mobile in the US and Rogers/Fido in Canada are
	# using 25/8 as "private" address space on their 3G network.
	# This range has not been announced via BGP (at least upto 2010-12-21)
	virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:!172.16.0.0/12,%v4:25.0.0.0/8,%v6:fd00::/8,%v6:fe80::/10,%v4:!172.18.10.0/24
	# OE is now off by default. Uncomment and change to on, to enable.
	oe=off
	# which IPsec stack to use. auto will try netkey, then klips then mast
	# Use this to log to a file, or disable logging on embedded systems (like openwrt)
	protostack=netkey
	#plutostderrlog=/dev/null
        plutostderrlog=/var/log/pluto.log
       
       
conn peer
        authby=secret
        auto=start
        ike=aes256-sha1
        keyexchange=ike
        phase2=esp
        phase2alg=aes256-sha1
        compress=no
        pfs=yes
        type=tunnel
        left=172.18.10.7
        leftsubnet=172.18.10.0/24
        leftnexthop=%defaultroute
        right=2.2.2.2
        rightsubnet=192.168.1.0/24
</pre>

### Nie działa ..

Zakładam, że po przeczytaniu powyższej konfiguracji i poprzedniej o libreswan tunel działa. Poniżej logi które pojawią się w sytuacji jeśli wszystko jest ok. Pierwsza i druga faza zestawiona, poniżej pogrubiona.

<pre>ipsec auto --status

000 stats db_ops: {curr_cnt, total_cnt, maxsz} :context={0,2,36} trans={0,2,1008} attrs={0,2,1344} 
000  
000 "peer": 172.18.10.0/24===172.18.10.7[+S=C]---172.18.10.254...2.2.2.2[+S=C]===192.168.1.0/24; erouted; eroute owner: #2
000 "peer":     myip=unset; hisip=unset;
000 "peer":   ike_life: 3600s; ipsec_life: 28800s; rekey_margin: 540s; rekey_fuzz: 100%; keyingtries: 0
000 "peer":   policy: PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK+lKOD+rKOD; prio: 24,8; interface: eth0; 
000 "peer":   newest ISAKMP SA: #1; newest IPsec SA: #2; 
000 "peer":   IKE algorithms wanted: AES_CBC(7)_256-SHA1(2)_000-MODP1536(5), AES_CBC(7)_256-SHA1(2)_000-MODP1024(2); flags=-strict
000 "peer":   IKE algorithms found:  AES_CBC(7)_256-SHA1(2)_160-MODP1536(5), AES_CBC(7)_256-SHA1(2)_160-MODP1024(2)
000 "peer":   IKE algorithm newest: AES_CBC_256-SHA1-MODP1024
000 "peer":   ESP algorithms wanted: AES(12)_256-SHA1(2)_000; flags=-strict
000 "peer":   ESP algorithms loaded: AES(12)_256-SHA1(2)_160
000 "peer":   ESP algorithm newest: AES_256-HMAC_SHA1; pfsgroup=
000  
000 #2: "peer":500 STATE_QUICK_I2 (sent QI2, <strong>IPsec SA established</strong>); EVENT_SA_REPLACE in 27450s; newest IPSEC; eroute owner; isakmp#1; idle; import:admin initiate
000 #2: "peer" esp.bc14928a@2.2.2.2 esp.e3387064@172.18.10.7 tun.0@2.2.2.2 tun.0@172.18.10.7 ref=0 refhim=4294901761
000 #1: "peer":500 STATE_MAIN_I4 (<strong>ISAKMP SA established</strong>); EVENT_SA_REPLACE in 2193s; newest ISAKMP; nodpd; idle; import:admin initiate

tail -f /var/log/pluto.log

"peer" #1: initiating Main Mode
"peer" #1: ignoring Vendor ID payload [FRAGMENTATION]
"peer" #1: transition from state STATE_MAIN_I1 to state STATE_MAIN_I2
"peer" #1: STATE_MAIN_I2: sent MI2, expecting MR2
"peer" #1: transition from state STATE_MAIN_I2 to state STATE_MAIN_I3
"peer" #1: STATE_MAIN_I3: sent MI3, expecting MR3
"peer" #1: Main mode peer ID is ID_IPV4_ADDR: '2.2.2.2'
"peer" #1: transition from state STATE_MAIN_I3 to state STATE_MAIN_I4
"peer" #1: STATE_MAIN_I4: ISAKMP SA established {auth=OAKLEY_PRESHARED_KEY cipher=aes_256 prf=oakley_sha group=modp1024}
"peer" #2: initiating Quick Mode PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK {using isakmp#1 msgid:bfd862a6 proposal=AES(12)_256-SHA1(2)_160 pfsgroup=OAKLEY_GROUP_MODP1024}
"peer" #2: ignoring informational payload, type IPSEC_RESPONDER_LIFETIME msgid=bfd862a6
"peer" #2: transition from state STATE_QUICK_I1 to state STATE_QUICK_I2
"peer" #2: STATE_QUICK_I2: sent QI2, IPsec SA established tunnel mode {ESP=&gt;0xe74132bb</pre>

### Bad pass

Co w przypadku kiedy np. po mojej stronie będę miał złe hasło?  
Żadna faza się nie zestawi u każdej ze stron pojawi się informacja malformed payload albo payload malformed.

<pre>root@raspberrypi:~# ipsec auto --status

000 stats db_ops: {curr_cnt, total_cnt, maxsz} :context={0,1,36} trans={0,1,1008} attrs={0,1,1344} 
000  
000 "peer": 172.18.10.0/24===172.18.10.7[+S=C]---172.18.10.254...2.2.2.2[+S=C]===192.168.1.0/24; prospective erouted; eroute owner: #0
000 "peer":     myip=unset; hisip=unset;
000 "peer":   ike_life: 3600s; ipsec_life: 28800s; rekey_margin: 540s; rekey_fuzz: 100%; keyingtries: 0
000 "peer":   policy: PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK+lKOD+rKOD; prio: 24,8; interface: eth0; 
000 "peer":   newest ISAKMP SA: #0; newest IPsec SA: #0; 
000 "peer":   IKE algorithms wanted: AES_CBC(7)_256-SHA1(2)_000-MODP1536(5), AES_CBC(7)_256-SHA1(2)_000-MODP1024(2); flags=-strict
000 "peer":   IKE algorithms found:  AES_CBC(7)_256-SHA1(2)_160-MODP1536(5), AES_CBC(7)_256-SHA1(2)_160-MODP1024(2)
000 "peer":   ESP algorithms wanted: AES(12)_256-SHA1(2)_000; flags=-strict
000 "peer":   ESP algorithms loaded: AES(12)_256-SHA1(2)_160
000  
000 #2: "peer":500 STATE_MAIN_I3 (sent MI3, expecting MR3); EVENT_RETRANSMIT in 10s; nodpd; idle; import:admin initiate
000 #2: pending Phase 2 for "peer" replacing #0


root@raspberrypi:~# tail -f /var/log/pluto.log 

loading secrets from "/etc/ipsec.secrets"
loading secrets from "/var/lib/openswan/ipsec.secrets.inc"
"peer" #1: initiating Main Mode
"peer" #1: ignoring Vendor ID payload [FRAGMENTATION]
"peer" #1: transition from state STATE_MAIN_I1 to state STATE_MAIN_I2
"peer" #1: STATE_MAIN_I2: sent MI2, expecting MR2
"peer" #1: transition from state STATE_MAIN_I2 to state STATE_MAIN_I3
"peer" #1: STATE_MAIN_I3: sent MI3, expecting MR3
"peer" #1: received 1 <strong>malformed payload</strong> notifies

</pre>

### Bad IKE

W przypadku ustawienia złych algorytmów szyfrowania dla IKE dostaniemy informacje NO\_PROPOSAL\_CHOSEN

<pre>root@raspberrypi:~# ipsec auto --status

000 "peer": 172.18.10.0/24===172.18.10.7[+S=C]---172.18.10.254...2.2.2.2[+S=C]===192.168.1.0/24; prospective erouted; eroute owner: #0
000 "peer":     myip=unset; hisip=unset;
000 "peer":   ike_life: 3600s; ipsec_life: 28800s; rekey_margin: 540s; rekey_fuzz: 100%; keyingtries: 0
000 "peer":   policy: PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK+lKOD+rKOD; prio: 24,8; interface: eth0; 
000 "peer":   newest ISAKMP SA: #0; newest IPsec SA: #0; 
000 "peer":   IKE algorithms wanted: AES_CBC(7)_128-SHA1(2)_000-MODP1536(5), AES_CBC(7)_128-SHA1(2)_000-MODP1024(2); flags=-strict
000 "peer":   IKE algorithms found:  AES_CBC(7)_128-SHA1(2)_160-MODP1536(5), AES_CBC(7)_128-SHA1(2)_160-MODP1024(2)
000 "peer":   ESP algorithms wanted: AES(12)_256-SHA1(2)_000; flags=-strict
000 "peer":   ESP algorithms loaded: AES(12)_256-SHA1(2)_160
000  
000 #1: "peer":500 STATE_MAIN_I1 (sent MI1, expecting MR1); EVENT_RETRANSMIT in 17s; nodpd; idle; import:admin initiate
000 #1: pending Phase 2 for "peer" replacing #0
000  

root@raspberrypi:~# tail -f /var/log/pluto.log 
"peer" #1: initiating Main Mode
"peer" #1: ignoring informational payload, type <strong>NO_PROPOSAL_CHOSEN</strong> msgid=00000000
"peer" #1: received and ignored informational message

</pre>

### Bad ipsec

W przypadku kiedy nieprawidłowo określę algorytmy szyfrowania dla ipsec w logu zobaczę, że faza pierwsza (IKE) się zestawiła ale poniżej dostaje informacje NO\_PROPOSAL\_CHOSEN.

<pre>root@raspberrypi:~# ipsec auto --status

000 "peer": 172.18.10.0/24===172.18.10.7[+S=C]---172.18.10.254...2.2.2.2[+S=C]===192.168.1.0/24; prospective erouted; eroute owner: #0
000 "peer":     myip=unset; hisip=unset;
000 "peer":   ike_life: 3600s; ipsec_life: 28800s; rekey_margin: 540s; rekey_fuzz: 100%; keyingtries: 0
000 "peer":   policy: PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK+lKOD+rKOD; prio: 24,8; interface: eth0; 
000 "peer":   newest ISAKMP SA: #1; newest IPsec SA: #0; 
000 "peer":   IKE algorithms wanted: AES_CBC(7)_256-SHA1(2)_000-MODP1536(5), AES_CBC(7)_256-SHA1(2)_000-MODP1024(2); flags=-strict
000 "peer":   IKE algorithms found:  AES_CBC(7)_256-SHA1(2)_160-MODP1536(5), AES_CBC(7)_256-SHA1(2)_160-MODP1024(2)
000 "peer":   IKE algorithm newest: AES_CBC_256-SHA1-MODP1024
000 "peer":   ESP algorithms wanted: AES(12)_128-SHA1(2)_000; flags=-strict
000 "peer":   ESP algorithms loaded: AES(12)_128-SHA1(2)_160
000  
000 #2: "peer":500 STATE_QUICK_I1 (sent QI1, expecting QR1); EVENT_RETRANSMIT in 27s; nodpd; idle; import:admin initiate
000 #1: "peer":500 STATE_MAIN_I4 (<strong>ISAKMP SA established</strong>); EVENT_SA_REPLACE in 2710s; newest ISAKMP; nodpd; idle; import:admin initiate
000 

root@raspberrypi:~# tail -f /var/log/pluto.log

"peer" #1: initiating Main Mode
"peer" #1: ignoring Vendor ID payload [FRAGMENTATION]
"peer" #1: transition from state STATE_MAIN_I1 to state STATE_MAIN_I2
"peer" #1: STATE_MAIN_I2: sent MI2, expecting MR2
"peer" #1: transition from state STATE_MAIN_I2 to state STATE_MAIN_I3
"peer" #1: STATE_MAIN_I3: sent MI3, expecting MR3
"peer" #1: Main mode peer ID is ID_IPV4_ADDR: '2.2.2.2'
"peer" #1: transition from state STATE_MAIN_I3 to state STATE_MAIN_I4
"peer" #1: STATE_MAIN_I4: ISAKMP SA established {auth=OAKLEY_PRESHARED_KEY cipher=aes_256 prf=oakley_sha group=modp1024}
"peer" #2: initiating Quick Mode PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK {using isakmp#1 msgid:70c6526c proposal=AES(12)_128-SHA1(2)_160 pfsgroup=OAKLEY_GROUP_MODP1024}
"peer" #1: ignoring informational payload, type <strong>NO_PROPOSAL_CHOSEN</strong> msgid=00000000
"peer" #1: received and ignored informational message

</pre>

### Bad net

Częstym problemem jest sytuacja kiedy któraś strona źle określi maskę sieci drugiej strony. Wtedy możliwe że tylko jedna strona będzie miała dostęp do zasobów drugiej.

&nbsp;

&nbsp;

W sumie to na tyle, dawajcie znać jak tam wasze konifguracje Openswan, libreswan i srongswan (strongswan w zasadzie działa dobrze sam ze sobą ale nie z np cisco lub checkpoint).

&nbsp;