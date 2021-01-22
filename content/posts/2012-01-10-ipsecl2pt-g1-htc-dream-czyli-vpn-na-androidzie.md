---
title: Ipsec/l2pt + G1 HTC Dream czyli VPN na Androidzie.
author: Przemek
type: post
date: 2012-01-10T09:28:17+00:00
url: /ipsecl2pt-g1-htc-dream-czyli-vpn-na-androidzie/
bfa_virtual_template:
  - hierarchy
hits:
  - 688
dsq_thread_id:
  - 1026919448
categories:
  - Linux
  - Network
tags:
  - ipsec
  - l2tp
  - vpn

---
Jak połączyć się z pierwszego telefonu z Androidem  do serwera VPN na Ipsec/l2tp ?

<!--more-->

Ipsec/l2pt + G1 HTC Dream czyli VPN na Androidzie.

Konfiguracja serwera na linuxie w tym przypadku gentoo:

instalujemy xl2tpd:

<pre class="lang:default decode:true">emerge net-dialup/xl2tpd</pre>

Instalujemy strongswan z flagę &#8222;nat&#8221; zeby nie było problemu z łączeniem se za natu:

<pre class="lang:default decode:true">USE="nat" emerge strongswan</pre>

Edytujemy /etc/xl2tpd/xl2tpd.conf

<pre class="lang:default decode:true">[global]
debug network = yes
debug tunnel = yes
auth file = /etc/xl2tpd/l2tp-secrets
listen-addr = x.x.x.x ; zew.addr.ip

[lns default]
ip range = 10.1.0.1-10.1.0.254 ; wew.pula.addr.ip
local ip = 10.1.0.1 ; addr.wew.srv
refuse pap = yes
require chap = yes
require authentication = yes
name = test
ppp debug = yes
pppoptfile = /etc/ppp/options.l2tpd
length bit = yes
Edytujemy: /etc/xl2tpd/l2tp-secrets:
Edytujemy tajnehaslo:
Zamieniamy "servername" na nazwe naszego serwera:
# Secrets for authenticating l2tp tunnels
# us them secret
servername anonymous tajnehaslo</pre>

&nbsp;

Edytujemy: /etc/ppp/options.l2tpd

<pre class="lang:default decode:true">name test
ipcp-accept-local
ipcp-accept-remote
ms-dns 10.0.0.1
noccp
auth
crtscts
idle 1800
mtu 1410
mru 1410
nodefaultroute
defaultmetric 5
debug
lock
proxyarp
connect-delay 5000
logfile /var/log/xl2tpd.log</pre>

&nbsp;

Edytujemy: /etc/ppp/chap-secrets

<pre class="lang:default decode:true"># Secrets for authentication using CHAP
# client server secret IP addresses
test * test 10.1.0.2</pre>

&nbsp;

Następnie uruchamiamy demona xl2tpd

<pre class="lang:default decode:true">/etc/init.d/xl2tpd start</pre>

&nbsp;

lub dla testów w celu debagu:

<pre class="lang:default decode:true">xl2tpd -D
tail -f /var/log/xl2tpd.log</pre>

&nbsp;

Na tym zakonczyła się konfiguracja servera l2tpd

Konfigurujemy telefon:

Settings-> Wireless controls ->Add VPN -> Add L2TP VPN  
Wypełniamy pola według powyższej konfiguracji:  
VPN name = l2tp  
SET VPN server = x.x.x.x # zew.addr.ip  
Enable L2TP secret [zaznaczymy]  
Set L2TP secret # wpisujemy tajne hasło  
Wracamy do VPN settingsi klikamy na l2tp  
Zostajemy poproszeni o login i pass z pliku /etc/ppp/chap-secrets

Przy takiej konfiguracji mozemy łączyć się po VPN z sieciami za serverem jeśli tylko jest włączone forwardowanie pakietów i jest dodany routing.  
Ale przez to że na telefonie zmienił się default gateway nie ma dostępu do internetu. Aby skonfigurawać udostępnianie internetu poprzez VPN przejdż TU

Jeśli wszystko działa możemy pozostać przy takiej konfiguracji lub przejść o krok dalej czyli konfiguracji IPsec/L2tp:

Edytujemy: /etc/ipsec.conf

<pre class="lang:default decode:true">config setup
nat_traversal=yes
charonstart=yes
plutostart=yes

conn L2TP
authby=psk
pfs=no
rekey=no
type=transport
left=x.x.x.x # zew.addr.ip
leftnexthop=%defaultroute
leftprotoport=17/1701
right=%any
rightprotoport=17/%any
rightsubnetwithin=0.0.0.0/0
auto=add</pre>

Edytujemy nasze hasło PSK: /etc/ipsec.secrets

<pre class="lang:default decode:true"># /etc/ipsec.secrets - strongSwan IPsec secrets file
: PSK "psksecret"</pre>

Przed dwukropkiem nie wpisuje żadnych adresów IP ponieważ chcemy wpuszczać klientów z różnych sieci.

Następnie uruchamiamy demona IPsec

<pre class="lang:default decode:true">/etc/init.d/ipsec start</pre>

Patrzymy w logi:

<pre class="lang:default decode:true">tail -f /var/log/messages</pre>

Na tym zakonczyła się konfiguracja servera IPsec/l2tpd

Konfigurujemy telefon:

Settings-> Wireless controls ->Add VPN -> Add L2TP/IPsec VPN  
Wypełniamy pola według powyższej konfiguracji:  
VPN name = l2tp/ipsec  
SET VPN server = x.x.x.x # zew.addr.ip  
Set IPSec pre-shared key # wpisujemy nasze PSK  
Enable L2TP secret [zaznaczymy] ale nie musimy starczy PSK  
Set L2TP secret # [opcja zalezna czy zaznaczone] wpisujemy tajne hasło  
Wracamy do VPN settings i klikamy na l2tp/ipsec  
Zostajemy poproszeni o login i pass z pliku /etc/ppp/chap-secrets