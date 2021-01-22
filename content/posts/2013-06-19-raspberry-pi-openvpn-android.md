---
title: Raspberry Pi OpenVPN Android
author: Przemek
type: post
date: 2013-06-19T12:21:12+00:00
url: /raspberry-pi-openvpn-android/
featured_image: /wp-content/uploads/2013/06/raspberrypi_openvpn_android.jpg
hits:
  - 3602
dsq_thread_id:
  - 1412167224
dsq_needs_sync:
  - 1
categories:
  - Linux
  - Network
tags:
  - openvpn
  - Raspberry pi

---
<span style="line-height: 1.5em;">Myślę że szał na Raspberry Pi szybko nie minie a to z powodu niewielkiej ceny za mini komputer a po drugie rzeszy fanów i dużego wsparcia. Raspberry Pi OpenVPN Android w jednej całości to jest to czego sam używam i dlatego postanowiłem napisać poradnik jak skonfigurować OpenVPN na Raspberry Pi i podłączać się do niego smartfonem z Androidem.</span>

<!--more-->

<p style="text-align: center;">
  <span style="line-height: 1.5em;"><img class="aligncenter size-full wp-image-3701" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/raspberrypi_openvpn_android2.jpg" alt="raspberry pi openvpn android" width="637" height="233" /></span>
</p>

<span style="line-height: 1.5em;">Poniżej przestawię jak skonfigurować na Raspberry Pi serwer OpenVPN. Logowanie będzie odbywać się przy pomocy certyfikatu ca i loginu/hasła z systemu a nie z pliku lub jakiejś dodatkowej bazy. Postaram się to zrobić w miarę szczegółowo i pokazać co będzie działo się w konsoli po wpisaniu niektórych komend aby ułatwić i dobrze zobrazować proces instalacji.</span>

Moim celem jest połączyć się z telefonu do Raspberry Pi który jest w sieci 172.18.10.0/24 i otworzyć stronkę mojego projektu <a title="Monitoring temperatury" href="http://techfreak.pl/nettemp" target="_blank">nettemp.pl</a>. W tym celu muszę wypchać routing do klienta dla sieci 172.18.10.0/24 ponieważ OpenVPN zestawi tunel na zupełnie innej adresacji 10.8.0.0/24. Raspberry Pi ma IP 172.18.10.7 i jak poniżej zobaczycie do takiego IP też się łącze ponieważ robię to lokalnie po wifi. Aby łączyć się z zewnątrz mam przekierowany na routerze port UDP 1194 na 172.18.10.7. Trzeba pamiętać aby zmienić IP na zewnętrzne aby łączyć się po włączeniu transmisji danych w telefonie. Ja tego nie zrobiłem od razu ponieważ mam obecnie awarie internetu w domu, ale czy IP lokalny czy zewnętrzny nie ma to żadnego znaczenia.

## Raspberry Pi OpenVPN Android

Moje Raspberry Pi posiada system z oficjalnego obrazu który można pobrać na stronie <a href="http://www.raspberrypi.org/downloads" target="_blank">raspberrypi.org</a>

#### Logowanie i przejście na root

Hasło i login: pi/raspberry

<pre>ssh pi@172.18.10.7
sudo su -</pre>

<pre>root@raspberrypi:~#</pre>

#### Instalacja OpenVPN

<pre>aptitude install openvpn</pre>

<pre>root@raspberrypi:~# aptitude install openvpn
The following NEW packages will be installed:
 openvpn 
0 packages upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/480 kB of archives. After unpacking 1,024 kB will be used.
Preconfiguring packages ... 
Selecting previously unselected package openvpn.
(Reading database ... 63340 files and directories currently installed.)
Unpacking openvpn (from .../openvpn_2.2.1-8_armhf.deb) ...
Processing triggers for man-db ...
Setting up openvpn (2.2.1-8) ...
[ ok ] Restarting virtual private network daemon.:.</pre>

#### Certyfikaty

Teraz generuje certyfikaty potrzebne dla serwera OpenVPN w tym ca.crt. Poniżej trzeba będzie podać dane takie jak Common Name lub Name ale nie musimy przywiązywać tu dużej uwagi te dane nam się nie przydadzą później. Moje wpisy zostały pogrubione można wziąć to na wzór.

<pre>cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/
. ./vars 
./clean-all 
./build-ca 
./build-dh 
./build-key-server server</pre>

<pre>root@raspberrypi:~# cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys/
root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0#</pre>

<pre>. ./vars</pre>

<pre>root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0# . ./vars 
NOTE: If you run ./clean-all, I will be doing a rm -rf on /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys</pre>

<pre>./clean-all</pre>

<pre>root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0# ./clean-all
root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0#</pre>

<pre>./build-ca</pre>

<pre>root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0# ./build-ca 
Generating a 1024 bit RSA private key
...............................................................................................++++++
.......++++++
writing new private key to 'ca.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:PL
State or Province Name (full name) [CA]:Pomorskie
Locality Name (eg, city) [SanFrancisco]:Gdansk
Organization Name (eg, company) [Fort-Funston]:techfreak.pl
Organizational Unit Name (eg, section) [changeme]:IT
Common Name (eg, your name or your server's hostname) [changeme]:ca_techfreak.pl
Name [changeme]:ca_techfreak.pl
Email Address [mail@host.domain]:mail@gmail.com</pre>

<pre>./build-dh</pre>

<pre>root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0# ./build-dh
Generating DH parameters, 1024 bit long safe prime, generator 2
This is going to take a long time
.................................+..................................+........+...................................................................................................................+................+............+..........................................+..............................................+.....................+....................................................+....+..........+.....+...+.................................................+................................+........+................................................................+.+........................+.................................................+...............................+........+................................................................................................................................................................+............................................................+..............................................+.........+.......+...................................................++*++*++*</pre>

<pre> ./build-key-server server</pre>

<pre>root@raspberrypi:/usr/share/doc/openvpn/examples/easy-rsa/2.0# ./build-key-server server
Generating a 1024 bit RSA private key
..++++++
.++++++
writing new private key to 'server.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:PL
State or Province Name (full name) [CA]:Pomorskie
Locality Name (eg, city) [SanFrancisco]:Gdansk
Organization Name (eg, company) [Fort-Funston]:techfreak.pl
Organizational Unit Name (eg, section) [changeme]:IT
Common Name (eg, your name or your server's hostname) [server]:
Name [changeme]:techfreak_server
Email Address [mail@host.domain]:mail@gmail.com
Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from /usr/share/doc/openvpn/examples/easy-rsa/2.0/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName :PRINTABLE:'PL'
stateOrProvinceName :PRINTABLE:'Pomorskie'
localityName :PRINTABLE:'Gdansk'
organizationName :PRINTABLE:'techfreak.pl'
organizationalUnitName:PRINTABLE:'IT'
commonName :PRINTABLE:'server'
name :T61STRING:'techfreak_server'
emailAddress :IA5STRING:'techfreak.pl@gmail.com'
Certificate is to be certified until Jun 16 16:48:08 2023 GMT (3650 days)
Sign the certificate? [y/n]:y
1 out of 1 certificate requests certified, commit? [y/n] y
Write out database with 1 new entries
Data Base Updated</pre>

Kopiowanie certyfikatów do katalogu /etc/openvpn/

<pre>cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys/
cp ca.crt server.crt server.key dh1024.pem /etc/openvpn/</pre>

Plik ca.crt będzie potrzebny w dalszej części więc trzeba sobie już go zgrać na komputer lub telefon

<pre><span style="line-height: 1.61538em;">root@raspberrypi:/etc/openvpn# scp ca.crt sosprz@172.18.10.103:~</span>
sosprz@172.18.10.103's password:</pre>

#### Konfiguracja OpenVPN

Najlepiej skopiować oryginalny, przykładowy plik server.conf i umieścić go w katalogu /etc/openvpn

<pre>cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/
cd /etc/openvpn/
sudo gunzip server.conf.gz</pre>

Wpisy jakie dodałem do pliku aby uwiarygodnić klienta na podstawie certyfikatu i loginu/hasła to:

<pre>plugin /usr/lib/openvpn/openvpn-auth-pam.so login
client-cert-not-required
username-as-common-name
log-append /var/log/openvpn</pre>

Poniżej zawartość pliku server.conf bez komentarzy i wyłączonej konfiguracji

<pre>port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key 
dh dh1024.pem
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "route 172.18.10.0 255.255.255.0"
keepalive 10 120
comp-lzo
persist-key
persist-tun
status openvpn-status.log
log-append /var/log/openvpn.log
verb 3
plugin /usr/lib/openvpn/openvpn-auth-pam.so login
client-cert-not-required
username-as-common-name</pre>

Włączenie usługi OpenVPN i dodanie jej do autostartu

<pre>update-rc.d openvpn enable
service openvpn start</pre>

<pre>root@raspberrypi:/etc/openvpn# update-rc.d openvpn enable
update-rc.d: using dependency based boot sequencing
root@raspberrypi:/etc/openvpn# service openvpn start
[ ok ] Starting virtual private network daemon: server.</pre>

#### Przekazywanie pakietów

Aby Raspberry Pi przepuszczał pakiety z jednej sieci do drugiej np. z telefonu do naszego LAN&#8217;u trzeba na to zezwolić.

<pre>nano /etc/sysctl.conf
# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1</pre>

#### NAT

Przekazywanie pakietów włączone to teraz musimy ukryć nasze IP klienta pod IP Raspberry Pi aby mieć dostęp do sieci 172.18.10.0/24. Można było by dodawać routing powrotny do urządzeń do których chcemy się łączyć ale NAT jest lepszym rozwiązaniem w tym przypadku.

<pre>root@raspberrypi:~# iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j MASQUERADE
root@raspberrypi:~# iptables-save && iptables-save &gt; /etc/network/iptables
 # Generated by iptables-save v1.4.14 on Thu Jun 20 17:34:41 2013
 *nat
 :PREROUTING ACCEPT [1:84]
 :INPUT ACCEPT [0:0]
 :OUTPUT ACCEPT [3:273]
 :POSTROUTING ACCEPT [3:273]
 -A POSTROUTING -s 10.8.0.0/24 -j MASQUERADE
 COMMIT</pre>

Dodajemy linie pre-up iptables-restore < /etc/network/iptables do pliku /etc/network/interfaces

<pre>nano /etc/network/interfaces

auto lo

iface lo inet loopback
iface eth0 inet dhcp
pre-up iptables-restore &lt; /etc/network/iptables

allow-hotplug wlan0
iface wlan0 inet manual
wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp</pre>

I teraz mamy pewność że reguły iptables zostaną załadowane przy starcie.

#### Podgląd logów

Kazaliśmy demonowi OpenVPN logować wszystko do pliku /var/log/openvpn.log więc trzeba skorzystać z tego. Poniżej można zobaczyć jakie logwanie powinno się zobaczyć przy poprawnej konfiguracji i podłączeniu.

<pre>root@raspberrypi:/etc/openvpn# tail -f /var/log/openvpn</pre>

<pre>Tue Jun 18 17:02:51 2013 Data Channel MTU parms [ L:1542 D:1450 EF:42 EB:135 ET:0 EL:0 AF:3/1 ]
Tue Jun 18 17:02:51 2013 UDPv4 link local (bound): [undef]
Tue Jun 18 17:02:51 2013 UDPv4 link remote: [undef]
Tue Jun 18 17:02:51 2013 MULTI: multi_init called, r=256 v=256
Tue Jun 18 17:02:51 2013 IFCONFIG POOL: base=10.8.0.4 size=62, ipv6=0
Tue Jun 18 17:02:51 2013 ifconfig_pool_read(), in='pi,10.8.0.4', TODO: IPv6
Tue Jun 18 17:02:51 2013 succeeded -&gt; ifconfig_pool_set()
Tue Jun 18 17:02:51 2013 IFCONFIG POOL LIST
Tue Jun 18 17:02:51 2013 pi,10.8.0.4
Tue Jun 18 17:02:51 2013 Initialization Sequence Completed
Tue Jun 18 17:03:04 2013 MULTI: multi_create_instance called
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 Re-using SSL/TLS context
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 LZO compression initialized
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 Control Channel MTU parms [ L:1542 D:138 EF:38 EB:0 ET:0 EL:0 ]
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 Data Channel MTU parms [ L:1542 D:1450 EF:42 EB:135 ET:0 EL:0 AF:3/1 ]
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 Local Options hash (VER=V4): '530fdded'
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 Expected Remote Options hash (VER=V4): '41690919'
Tue Jun 18 17:03:04 2013 172.18.10.101:43347 TLS: Initial packet from [AF_INET]172.18.10.101:43347, sid=c79bd658 05362fcd
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 PLUGIN_CALL: POST /usr/lib/openvpn/openvpn-auth-pam.so/PLUGIN_AUTH_USER_PASS_VERIFY status=0
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 TLS: Username/Password authentication succeeded for username 'pi' [CN SET]
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 Data Channel Encrypt: Cipher 'BF-CBC' initialized with 128 bit key
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 Data Channel Encrypt: Using 160 bit message hash 'SHA1' for HMAC authentication
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 Data Channel Decrypt: Cipher 'BF-CBC' initialized with 128 bit key
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 Data Channel Decrypt: Using 160 bit message hash 'SHA1' for HMAC authentication
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 Control Channel: TLSv1, cipher TLSv1/SSLv3 DHE-RSA-AES256-SHA
Tue Jun 18 17:03:05 2013 172.18.10.101:43347 [pi] Peer Connection Initiated with [AF_INET]172.18.10.101:43347
Tue Jun 18 17:03:05 2013 pi/172.18.10.101:43347 MULTI_sva: pool returned IPv4=10.8.0.6, IPv6=58b7:d0be:78de:f9b6:440b:ffb6:9cd5:46b7
Tue Jun 18 17:03:05 2013 pi/172.18.10.101:43347 MULTI: Learn: 10.8.0.6 -&gt; pi/172.18.10.101:43347
Tue Jun 18 17:03:05 2013 pi/172.18.10.101:43347 MULTI: primary virtual IP for pi/172.18.10.101:43347: 10.8.0.6
Tue Jun 18 17:03:07 2013 pi/172.18.10.101:43347 PUSH: Received control message: 'PUSH_REQUEST'
Tue Jun 18 17:03:07 2013 pi/172.18.10.101:43347 send_push_reply(): safe_cap=960
Tue Jun 18 17:05:46 2013 pi/172.18.10.101:58359 SENT CONTROL [pi]: 'PUSH_REPLY,route 172.18.10.0 255.255.255.0,route 10.8.0.1,topology net30,ping 10,ping-restart 120,ifconfig 10.8.0.6 10.8.0.5' (status=1)</pre>

#### <span style="font-size: 1.42857em; line-height: 2.1em; font-weight: normal;">Konfiguracja Androida</span>

Osobiście do OpenVPN na androida używam dwóch aplikacji pierwsza OpenVPN z forum <a href="http://forum.xda-developers.com/showthread.php?t=1591585" target="_blank">Xda-developers</a> a druga OpenVPN for Android ze <a href="https://play.google.com/store/apps/details?id=de.blinkt.openvpn" target="_blank">sklepu PLAY</a> i obie nie wymagają roota na smartfonie.

  * <span style="line-height: 1.5em;">Upewniamy się że mamy na telefonie już wgrany ca.crt ponieważ jest on wymagany i trzeba go wskazać w programie.</span>
  * <span style="line-height: 1.5em;">Ja w poniższej konfiguracji loguje się na domyślnego użytkownika w systemie Raspberry PI czyli &#8222;</span>pi<span style="line-height: 1.5em;">&#8222;</span>
  * Aby przetestować połączenie do innej sieci wchodzę na adres 172.18.10.7

&nbsp;

### OpenVPN

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_1.jpg"><img class="aligncenter  wp-image-3673" title="Android OpenVpn" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_1.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_2.jpg"><img class="aligncenter  wp-image-3674" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_2.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_3.jpg"><img class="aligncenter  wp-image-3675" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_3.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_4.jpg"><img class="aligncenter  wp-image-3676" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_4.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_5.jpg"><img class="aligncenter  wp-image-3677" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_5.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_6.jpg"><img class="aligncenter  wp-image-3678" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_6.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_7.jpg"><img class="aligncenter  wp-image-3679" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_7.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_8.jpg"><img class="aligncenter  wp-image-3680" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_8.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_9.jpg"><img class="aligncenter  wp-image-3681" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_9.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_10.jpg"><img class="aligncenter  wp-image-3682" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_10.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_11.jpg"><img class="aligncenter  wp-image-3683" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_11.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_12.jpg"><img class="aligncenter  wp-image-3684" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_12.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_13.jpg"><img class="aligncenter  wp-image-3685" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_13.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_14.jpg"><img class="aligncenter  wp-image-3686" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpn_14.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a>
</p>

&nbsp;

### OpenVPN for Android

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_1.jpg"><img class="aligncenter  wp-image-3691" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_1.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_2.jpg"><img class="aligncenter  wp-image-3692" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_2.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_3.jpg"><img class="aligncenter  wp-image-3693" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_3.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_4.jpg"><img class="aligncenter  wp-image-3694" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_4.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_5.jpg"><img class="aligncenter  wp-image-3695" title="raspberrypi openvpn android" src="http://techfreak.pl/wp-content/uploads/2013/06/Android_OpenVpnForAndroid_5.jpg" alt="raspberrypi openvpn android" width="461" height="768" /></a>
</p>

&nbsp;

### Wszystko działa ołłłł jee

Mam nadzieje że wam wszystko działa tak jak mi i konfiguracja nie sprawiła problemu.

### To jeszcze nie koniec

Tematy jakie pozostają do zrobienia to zapora iptables i user/pass z np. pliku a nie systemu.