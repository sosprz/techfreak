---
title: Jak zrobić dostęp do Raspberry Pi po Wifi
author: Przemek
type: post
date: 2014-10-29T06:33:48+00:00
url: /zrobic-dostep-raspberry-pi-wifi/
featured_image: /wp-content/uploads/2014/10/raspberry_pi_accesspoint-624x468.jpg
hits:
  - 897
dsq_thread_id:
  - 3167969053
colormag_page_layout:
  - default_layout
categories:
  - Network
tags:
  - Raspberry pi
  - tplink

---
Przy okazji prezentacji programu <a href="https://github.com/sosprz/nettemp" target="_blank" rel="noopener">nettemp</a> na <a href="http://techfreak.pl/foto-relacja-freemake-2014/" target="_blank" rel="noopener">FreeMake w Gdyni</a> musiałem dać zdalny dostęp do Raspberry Pi po WiFi. Zabranie routera ze sobą było by najlepszym wyjściem. Podłączył bym RPi do routera i każdy miał by dostęp do strony www z nettempem. Pojawił się jeden problem rozwiązywanie nazw. Na zwykłym routerze nie postawie prostego DNS a na wgrywanie OpenWRT do mojego WR1043N nie miałem czasu. Wtedy wpadłem na pomysł że przecież zrobię z RPi access pointa.

<!--more-->

### O co chodzi z nazwami?

Rozwiązywanie nazw w moim przypadku było by o tyle fajne że nie musiałbym każdemu zainteresowanemu podawać adresu IP, loginu i hasła i generalnie tłumaczyć. Tylko podać dane: SSID: nettemppl, hasło: nettemppl, www: nettemp lub nettemppl lub nettemp.pl. A żeby mieć taki miały DNS który by obsłużył wszystkie te nazwy, wystarczyło zainstalować DNSmasq który też posiada funkcje DHCP.  Czyli wszystko się idealnie złożyło.

### Karta WiFi

Na stanie miałem dwie karty wifi na USB TPlink TL-WN821N (RTL8188CUS) które kurzą się od długiego czasu więc nie musiałem szukać odpowiedniego sprzętu.

### Install

Mam wszystko pomysł, kartę wifi i Raspberry Pi. Trzeba zainstalować soft i pozmieniać parę konfigów. Zaraz pokaże że zrobienie zdalnego dostępu do Raspberry Pi po wifi to nie taka ciężka sprawa.

Na początek aktualizacja repozytoriów i instalacja hostapd odpowiedzialnego za funkcję accesspointa i DNSmasq dostarczającego funkcję serwera DHCP i DNS.

<pre>apt-get update
apt-get -y install hostapd dnsmasq</pre>

### Wlan0

Czas na zmianę /etc/network/interfaces, trzeba wyłączyć trzy linie dotyczące wlan0 i wstawić nowe ze stałym adresem IP.  Poniższe linie można od razu wklejać do terminala nie edytując pliku. Tak jest łatwiej ;)

<pre>sed -i 's/iface wlan0 inet manual/#iface wlan0 inet manual/g' /etc/network/interfaces 
sed -i 's/wpa-roam \/etc\/wpa_supplicant\/wpa_supplicant.conf/#wpa-roam \/etc\/wpa_supplicant\/wpa_supplicant.conf/g' /etc/network/interfaces 
sed -i 's/iface default inet dhcp/#iface default inet dhcp/g' /etc/network/interfaces 
sed -i '$aiface wlan0 inet static' /etc/network/interfaces 
sed -i '$aaddress 192.168.0.1' /etc/network/interfaces 
sed -i '$anetmask 255.255.255.0' /etc/network/interfaces</pre>

Ważna sprawa do zrobienia. Trzeba wyjąć z pod kontroli ifplugd wlan0 bo inaczej będzie znikał adres IP z wlan0.

<pre>sed -i 's/INTERFACES="auto"/INTERFACES="eth0"/g' /etc/default/ifplugd
sed -i 's/HOTPLUG_INTERFACES="all"/HOTPLUG_INTERFACES="eth0"/g' /etc/default/ifplugd</pre>

I restart serwisu ifplugd

<pre>service ifplugd restart</pre>

Wyłączenie i włączenie spowoduje zastosowanie powyższych danych z pliku interfaces

<pre>ifdown wlan0
ifup wlan0</pre>

### Hostapd

Konfiguracja hostapd odbywa się w pliku /etc/hostapd/hostapd.conf, trzeba dodać poniższe linie. Gdzie najważniejsze to ssid, wpa\_passphrase, wpa, wpa\_key_mgmt

<pre>interface=wlan0
driver=nl80211
ssid=nettemppl
hw_mode=g
channel=6
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=nettemppl
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP

</pre>

### Ifplugd

W pliku /etc/default/hostapd wskazuje gdzie leży plik hostapd.conf

<pre>sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/g' /etc/default/hostapd</pre>

### DNSmasq

Konfiguracja DNSmasq jest prosta, trzeba dodać tylko zakres dla DHCP i interfejs na którym mają być rozdawane IP. Można dodać na końcu pliku bo domyślnie te linie są wyłączone.

<pre>sed -i '$ainterface=wlan0' /etc/dnsmasq.conf
sed -i '$adhcp-range=192.168.0.1,192.168.0.250,255.255.255.0,1h' /etc/dnsmasq.conf</pre>

### IPforward

Standardowo pozwalamy na przekazywanie pakietów pomiędzy interfejsami.

<pre>sysctl -w net.ipv4.ip_forward=1 
sed -i -e '$anet.ipv4.ip_forward=1\' /etc/sysctl.conf</pre>

### Moje nazwy

Do /etc/hosts dodaje nazwy jakie chce aby DNSmasq rozwiązywał. DNSmasq poprzez dhcp przekaże klientom jakiego dns mają używać, czyli siebie.

<pre>sed -i '$a192.168.0.1 nettemp' /etc/hosts
sed -i '$a192.168.0.1 nettemp.pl' /etc/hosts
sed -i '$a192.168.0.1 nettemppl' /etc/hosts</pre>

&nbsp;

Jeszcze tylko restart serwisów.

<pre>service hostapd restart
service dnsmasq restart</pre>

### Connecting

Po połączeniu się do ssid nettemppl, wpisaniu hasła nettemppl, dostałem z DHCP adres IP z puli 192.168.0.0/24. I od razu wszedłem na stronę nettemp.pl która jest rozwiązywana na adres karty wlan0 czyli 192.168.0.1.

### Bonus

Jeśli ktoś przeszedł przez te wszystkie linijki może odetchnąć i ściągnąć gotowy skrypt z mojego <a href="https://raw.githubusercontent.com/sosprz/nettemp/beta/other/nettemp_accesspoint" target="_blank" rel="noopener">githuba</a>.

<pre>wget  https://raw.githubusercontent.com/sosprz/nettemp/beta/other/nettemp_accesspoint
chmod +x nettemp_accesspoint
./nettemp_accesspoint</pre>

&nbsp;

No to powodzenia z konfiguracją. Dawajcie znać czy wam również działa.