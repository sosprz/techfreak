---
title: Libreswan – konfiguracja VPN
author: Przemek
type: post
date: 2015-02-19T15:00:25+00:00
url: /libreswan-konfiguracja-vpn/
featured_image: /wp-content/uploads/2015/02/libreswan_-624x624.jpg
hits:
  - 524
xyz_fbap:
  - 1
dsq_thread_id:
  - 3529769576
categories:
  - Network
tags:
  - checkpoint
  - Cisco
  - ipsec
  - vpn

---
Dawno nie pisałem nic o VPN a ogólnie na co dzień robię dużo różnych konfiguracji. Zresztą na TF można znaleźć parę krótkich opisów jak zestawić VPN <a href="http://techfreak.pl/tag/vpn-2" target="_blank">techfreak.pl/tag/vpn-2/</a>. Tym razem krótki opis jak skonfigurować VPN site 2 site przy pomocy Libreswan. Jest to kolejny fork popularnego pakietu OpenSwan.

<!--more-->

Na początek schemat przykładowego połączenia jednej sieci lokalnej z drugą. Jak był by ktoś ciekawy, to takie rysuneczki robi się na linuksie za pomocą programu DIA.

<a href="http://techfreak.pl/libreswan-konfiguracja-vpn/libreswan_vpn_site_to_site/" rel="attachment wp-att-9087"><img class="aligncenter size-full wp-image-9087" src="http://techfreak.pl/wp-content/uploads/2015/02/libreswan_vpn_site_to_site.jpeg" alt="libreswan_vpn_site_to_site" width="645" height="221" /></a>

Ja skupiam się na swojej stronie &#8222;left&#8221; czyli na swojej sieci 192.168.0.0/24 i hoście &#8222;linux Libreswan&#8221;. Połączenie VPN będzie realizowane w trybie tunelowym, czyli sieć do sieci. Cel jest taki aby hosty z jednej sieci miały połączenie do drugiej w obie strony. Czasem połączenie nie działa w obie strony bo nie zgadzają się SA po którejś stronie. Wtedy zazwyczaj w logach można zauważyć komunikat INVALID ID INFORMATION.

### ipsec.conf

Na początek trzeba skonfigurować główne parametry w pliku /etc/ipsec.conf. Na początek opcja virtual_private tu trzeba wyciągnąć swoją sieć z tego zakresu, czyli %v4:!192.168.0.0/24. Wykrzyknik to exclude. Wszystkimi opcjami left\* i right\* określam swoją stronę (left) i peera (right). Czyli adres IP bramy i adresy sieci. Opcja PFS to **perfect forward secrecy,** tu jest na off ale przy różnych scenariuszach trzeba o niej pamiętać czy druga strona ją włączyła czy nie. Auth by secret oznacza że połączenie jest zestawiane na podstawie hasła PSK które konfiguruje się w pliku /etc/ipsec.secrets. IKE i ESP w zasadzie najważniejsza opcja bo tu najczęściej występują problemy nie tyle co w komunikacji pomiędzy adminami to w poprawnym zapisie.  W poniższej konfiguracji jest zastosowane szyfrowanie w fazie pierwszej (IKE) i drugiej (ipsec), AES256 i SHA1 z grupa DH1024.

&nbsp;

<pre># /etc/ipsec.conf - Libreswan IPsec configuration file

config setup
     protostack=netkey
     plutostderrlog=/var/log/pluto.log
     dumpdir=/var/run/pluto/
     nat_traversal=yes
     virtual_private=%v4:!192.168.0.0/24,%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:25.0.0.0/8,%v4:100.64.0.0/10,%v6:fd00::/8,%v6:fe80::/10

conn ipsec
     type=tunnel
     authby=secret
     left=83.83.83.83
     leftsubnet=192.168.0.0/24
     leftnexthop=%defaultroute
     right=84.84.84.84
     rightsubnet=192.168.1.0/24
     ike=aes256-sha1;modp1024
     esp=aes256-sha1;modp1024
     keyexchange=ike
     pfs=no
     auto=start</pre>

&nbsp;

### ipsec.secrets

W pliku /etc/ipsec.secrets określa się dla jakich bram jakie hasło ma ipsec użyć. Od lewej moje IP bramy następnie, IP bramy right. Hasło PSK &#8222;vfbgnhmj&#8221;.

<pre>83.83.83.83 84.84.84.84 : PSK "vfbgnhmj"</pre>

### Z czym..

Taką konfigurację można zastosować z Cisco, Checkpoint i innymi &#8222;urządzeniami&#8221; do VPN. Oczywiście po drugiej stronie też może być host z libreswan.

### logi

Zawsze przy takich połączeniach trzeba patrzeć w logi w tym przypadku będą przydatne trzy polecenia które podpowiedzą co jest nie tak:  systemctl status ipsec, ipsec auto &#8211;status, ip xfrm policy

<pre>[root@libreswan ~]# systemctl status ipsec
ipsec.service - Internet Key Exchange (IKE) Protocol Daemon for IPsec
Loaded: loaded (/usr/lib/systemd/system/ipsec.service; enabled)
Active: active (running) since wto 2019-02-17 03:52:19 EST; 58min ago
Process: 717 ExecStartPre=/usr/libexec/ipsec/_stackmanager start (code=exited, status=0/SUCCESS)
Process: 707 ExecStartPre=/usr/libexec/ipsec/addconn --config /etc/ipsec.conf --checkconfig (code=exited, status=0/SUCCESS)
Main PID: 1321 (sh)
CGroup: /system.slice/ipsec.service
├─1321 /bin/sh -c eval `/usr/libexec/ipsec/pluto --config /etc/ipsec.conf --nofork $PLUTO_OPTIONS`
├─1326 /bin/sh -c eval `/usr/libexec/ipsec/pluto --config /etc/ipsec.conf --nofork $PLUTO_OPTIONS`
├─1328 /usr/libexec/ipsec/pluto --config /etc/ipsec.conf --nofork
└─1660 _pluto_adns</pre>

<pre>[root@libreswan ~]# sudo ipsec auto --status
000 using kernel interface: netkey
000 interface lo/lo ::1
000 interface lo/lo 127.0.0.1
000 interface lo/lo 127.0.0.1
000 interface eth0/eth0 83.83.83.83
000 interface eth0/eth0 83.83.83.83
000  
000 fips mode=disabled;
000 SElinux=disabled
000  
000 config setup options:
000  
000 configdir=/etc, configfile=/etc/ipsec.conf, secrets=/etc/ipsec.secrets, ipsecdir=/etc/ipsec.d, dumpdir=/var/run/pluto/, statsbin=unset
000 sbindir=/usr/sbin, libdir=/usr/libexec/ipsec, libexecdir=/usr/libexec/ipsec
000 pluto_version=3.8, pluto_vendorid=OE-Libreswan-3.8
000 nhelpers=-1, uniqueids=yes, retransmits=yes, force_busy=no
000 ikeport=500, strictcrlpolicy=no, crlcheckinterval=0, listen=
000 secctx_attr_value=32001
000 myid = (none)
000 debug none
000  
000 nat_traversal=yes, keep_alive=20, nat_ikeport=4500, disable_port_floating=no
000 virtual_private (%priv):
000 - allowed 6 subnets: 10.0.0.0/16, 172.16.0.0/12, 25.0.0.0/8, 100.64.0.0/10, fd00::/8, fe80::/10
000 - disallowed 3 subnets: 192.168.0.0/24, 192.168.0.0/16
000  
000 ESP algorithms supported:
000  
000 algorithm ESP encrypt: id=2, name=ESP_DES, ivlen=8, keysizemin=64, keysizemax=64
000 algorithm ESP encrypt: id=3, name=ESP_3DES, ivlen=8, keysizemin=192, keysizemax=192
000 algorithm ESP encrypt: id=6, name=ESP_CAST, ivlen=8, keysizemin=40, keysizemax=128
000 algorithm ESP encrypt: id=7, name=ESP_BLOWFISH, ivlen=8, keysizemin=40, keysizemax=448
000 algorithm ESP encrypt: id=11, name=ESP_NULL, ivlen=0, keysizemin=0, keysizemax=0
000 algorithm ESP encrypt: id=12, name=ESP_AES, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=13, name=ESP_AES_CTR, ivlen=8, keysizemin=160, keysizemax=288
000 algorithm ESP encrypt: id=14, name=ESP_AES_CCM_A, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=15, name=ESP_AES_CCM_B, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=16, name=ESP_AES_CCM_C, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=18, name=ESP_AES_GCM_A, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=19, name=ESP_AES_GCM_B, ivlen=12, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=20, name=ESP_AES_GCM_C, ivlen=16, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=22, name=ESP_CAMELLIA, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=252, name=ESP_SERPENT, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP encrypt: id=253, name=ESP_TWOFISH, ivlen=8, keysizemin=128, keysizemax=256
000 algorithm ESP auth attr: id=1, name=AUTH_ALGORITHM_HMAC_MD5, keysizemin=128, keysizemax=128
000 algorithm ESP auth attr: id=2, name=AUTH_ALGORITHM_HMAC_SHA1, keysizemin=160, keysizemax=160
000 algorithm ESP auth attr: id=5, name=AUTH_ALGORITHM_HMAC_SHA2_256, keysizemin=256, keysizemax=256
000 algorithm ESP auth attr: id=6, name=AUTH_ALGORITHM_HMAC_SHA2_384, keysizemin=384, keysizemax=384
000 algorithm ESP auth attr: id=7, name=AUTH_ALGORITHM_HMAC_SHA2_512, keysizemin=512, keysizemax=512
000 algorithm ESP auth attr: id=8, name=AUTH_ALGORITHM_HMAC_RIPEMD, keysizemin=160, keysizemax=160
000 algorithm ESP auth attr: id=9, name=AUTH_ALGORITHM_AES_CBC, keysizemin=128, keysizemax=128
000 algorithm ESP auth attr: id=251, name=AUTH_ALGORITHM_NULL_KAME, keysizemin=0, keysizemax=0
000  
000 IKE algorithms supported:
000  
000 algorithm IKE encrypt: v1id=0, v1name=0??, v2id=20, v2name=AES_GCM_C, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=0, v1name=0??, v2id=19, v2name=AES_GCM_B, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=0, v1name=0??, v2id=18, v2name=AES_GCM_A, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=0, v1name=0??, v2id=16, v2name=AES_CCM_C, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=0, v1name=0??, v2id=15, v2name=AES_CCM_B, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=0, v1name=0??, v2id=14, v2name=AES_CCM_A, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=5, v1name=OAKLEY_3DES_CBC, v2id=3, v2name=3DES, blocksize=8, keydeflen=192
000 algorithm IKE encrypt: v1id=7, v1name=OAKLEY_AES_CBC, v2id=12, v2name=AES_CBC, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=65004, v1name=OAKLEY_SERPENT_CBC, v2id=65004, v2name=SERPENT_CBC, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=65005, v1name=OAKLEY_TWOFISH_CBC, v2id=65005, v2name=TWOFISH_CBC, blocksize=16, keydeflen=128
000 algorithm IKE encrypt: v1id=65289, v1name=OAKLEY_TWOFISH_CBC_SSH, v2id=65289, v2name=TWOFISH_CBC_SSH, blocksize=16, keydeflen=128
000 algorithm IKE hash: id=1, name=OAKLEY_MD5, hashsize=16
000 algorithm IKE hash: id=2, name=OAKLEY_SHA1, hashsize=20
000 algorithm IKE hash: id=4, name=OAKLEY_SHA2_256, hashsize=32
000 algorithm IKE hash: id=5, name=OAKLEY_SHA2_384, hashsize=48
000 algorithm IKE hash: id=6, name=OAKLEY_SHA2_512, hashsize=64
000 algorithm IKE dh group: id=2, name=OAKLEY_GROUP_MODP1024, bits=1024
000 algorithm IKE dh group: id=5, name=OAKLEY_GROUP_MODP1536, bits=1536
000 algorithm IKE dh group: id=14, name=OAKLEY_GROUP_MODP2048, bits=2048
000 algorithm IKE dh group: id=15, name=OAKLEY_GROUP_MODP3072, bits=3072
000 algorithm IKE dh group: id=16, name=OAKLEY_GROUP_MODP4096, bits=4096
000 algorithm IKE dh group: id=17, name=OAKLEY_GROUP_MODP6144, bits=6144
000 algorithm IKE dh group: id=18, name=OAKLEY_GROUP_MODP8192, bits=8192
000 algorithm IKE dh group: id=22, name=OAKLEY_GROUP_DH22, bits=1024
000 algorithm IKE dh group: id=23, name=OAKLEY_GROUP_DH23, bits=2048
000 algorithm IKE dh group: id=24, name=OAKLEY_GROUP_DH24, bits=2048
000  
000 stats db_ops: {curr_cnt, total_cnt, maxsz} :context={0,2,64} trans={0,2,3072} attrs={0,2,2048} 
000  
000 Connection list:
000  
000 "ipsec": 192.168.0.1/32===83.83.83.83---83.83.83.84...84.84.84.84===192.168.1.0/24; erouted; eroute owner: #2
000 "ipsec":     oriented; my_ip=192.168.1.1; their_ip=unset;
000 "ipsec":   xauth info: us:none, them:none,  my_xauthuser=[any]; their_xauthuser=[any]; ;
000 "ipsec":   modecfg info: us:none, them:none, modecfg policy:push, dns1:unset, dns2:unset, domain:unset, banner:unset;
000 "ipsec":   labeled_ipsec:no, loopback:no; 
000 "ipsec":    policy_label:unset; 
000 "ipsec":   ike_life: 3600s; ipsec_life: 28800s; rekey_margin: 540s; rekey_fuzz: 100%; keyingtries: 0;
000 "ipsec":   sha2_truncbug:no; initial_contact:no; cisco_unity:no; send_vendorid:no;
000 "ipsec":   policy: PSK+ENCRYPT+TUNNEL+PFS+UP+IKEv2ALLOW+SAREFTRACK+IKE_FRAG; 
000 "ipsec":   conn_prio: 32,16; interface: eth0; metric: 0; mtu: unset; sa_prio:auto;
000 "ipsec":   newest ISAKMP SA: #3; newest IPsec SA: #2; 
000 "ipsec":   IKE algorithms wanted: AES_CBC(7)_256-SHA1(2)_000-MODP1024(2)
000 "ipsec":   IKE algorithms found:  AES_CBC(7)_256-SHA1(2)_160-MODP1024(2)
000 "ipsec":   IKE algorithm newest: AES_CBC_256-SHA1-MODP1024
000 "ipsec":   ESP algorithms wanted: AES(12)_256-SHA1(2)_000; pfsgroup=MODP1024(2)
000 "ipsec":   ESP algorithms loaded: AES(12)_256-SHA1(2)_160
000 "ipsec":   ESP algorithm newest: AES_256-HMAC_SHA1; pfsgroup=MODP1024
000  
000 Total IPsec connections: loaded 1, active 1
000  
000 State list:
000  
000 #3: "ipsec":500 STATE_MAIN_I4 (ISAKMP SA established); EVENT_SA_REPLACE in 1720s; newest ISAKMP; nodpd; idle; import:admin initiate
000 #2: "ipsec":500 STATE_QUICK_I2 (sent QI2, IPsec SA established); EVENT_SA_REPLACE in 24524s; newest IPSEC; eroute owner; isakmp#1; idle; import:admin initiate
000 #2: "ipsec" esp.c7b0328@84.84.84.84 esp.b531330@83.83.83.83 tun.0@83.83.83.83 tun.0@83.83.83.83 ref=0 refhim=4294901761 Traffic: ESPin=588B ESPout=588B! ESPmax=4194303B 
000 #1: "ipsec":500 STATE_MAIN_I4 (ISAKMP SA established); EVENT_SA_EXPIRE in 75s; nodpd; idle; import:admin initiate
000  
000 Shunt list:
000</pre>

<pre>[root@site2site ~]# sudo ip xfrm policy
src 192.168.0.0/24 dst 192.168.1.0/24 
	dir out priority 2346 ptype main 
	tmpl src 83.83.83.83 dst 84.84.84.84
		proto esp reqid 16385 mode tunnel
src 192.168.1.0/24 dst 192.168.0.0/24 
	dir fwd priority 2346 ptype main 
	tmpl src 84.84.84.84 dst 83.83.83.83
		proto esp reqid 16385 mode tunnel
src 192.168.1.0/24 dst 192.168.0.0/24
	dir in priority 2346 ptype main 
	tmpl src 84.84.84.84 dst 83.83.83.83
		proto esp reqid 16385 mode tunnel</pre>

### NAT

Jeśli jestem w sytuacji że sieć &#8222;left&#8221; musi być za NAT&#8217;em bo np. jest konflikt sieci lub gdy nie mam ustawionej opcji leftnexthop=%defaultroute. Można zrobić sobie alias na interfejsie i z niego pingować drugą stronę.

<pre>ifconfig eth1:1 192.168.0.2 netmask 255.255.255.0 up
ping -I 192.168.0.2 192.168.1.1</pre>

### koniec

W moich logach się wszystko zgadza i połączenie z sieci do sieci działa. VPN na libreswan został pomyślnie zestawiony. Wiem, że takie konfiguracje zazwyczaj sprawiają trudności ale dawajcie znać w komentarzach czy wam też działa połączenie.

&nbsp;