---
title: Jak skonfigurować VPN na MikroTik?
author: Przemek
type: post
date: 2018-05-12T08:43:18+00:00
url: /jak-skonfigurowac-vpn-na-mikrotik/
featured_image: /wp-content/uploads/2018/05/microtick.png
colormag_page_layout:
  - default_layout
categories:
  - Network
tags:
  - checkpoint
  - Cisco
  - mikrotik
  - vpn

---
Mały wstęp do systemu RouterOS, który jest tworzony przez firmę MikroTik, łotewskiego producenta sprzętu do zastosowań sieciowych i bezprzewodowych.

<!--more-->

Kto nie słyszał o MikroTik? Wszyscy, którzy siedzieli choć trochę w sieciach na pewno mieli okazję chociaż poczytać o tym rozwiązaniu. Przede wszystkim to w miarę tani sprzęt i darmowy software który można w miarę łatwo skonfigurować w shellu lub poprzez aplikację WinBox. Ja osobiście wolę wykonywać konfiguracje poprzez linie komend bo są jasne i pozwalają na szybkie działanie. Do czego zmierzam? Dziś chciałbym pokazać pare komend w RouterOS przydatnych na początek a jako główny temat chciałbym pokazać jak można łatwo skonfigurować tunel VPN Site 2 Site. No ale dlaczego akurat RouterOS i Mikrotik? RouterOS jest też niezależnym od sprzętu MiktoTik systemem, który można postawić w chmurze czy na wirtualnej maszynie lub dedykowanej maszynie. Więc dobrze nadaje się jako firewall, router lub brama VPN. Wiadomo, że po drugiej stronie tunelu zawsze musi być jakieś inne rozwiązanie. Co to może być z czym to zadziała? Z każdym rozwiązaniem które obsługuje IPsec np. Cisco, Checkpoint, Pfsense, OpenSwan, LibreSwan, StrongSwan, Racoon, ShrewSoft, RouterOS :) Na blogu można znaleźć moje inne konfiguracje VPN.

Mój scenariusz jest taki sam jak zawsze czyli mamy dwie sieci lokalne po dwóch różnych stronach, za dwoma różnymi bramami VPN, które musza się ze sobą skomunikować.

[<img class="aligncenter size-full wp-image-14615" src="http://techfreak.pl/wp-content/uploads/2018/05/routerOSv1.png" alt="" width="814" height="185" />][1]

Poniżej pare podstawowych komend, które pomogą się w poruszaniu po RouterOS. Na całe szczęście można komendy wpisywać w całość nie trzeba obowiązkowo wchodzić do każdej sekcji po kolei. Działa też skracanie i dopisywanie komend jak np. w przełącznikach Cisco czy HP. Ważną sprawa jest to jak dodawać i jak usuwać i ustawiać wartości. Robi się to poprzez danie na końcu linii add, remove lub set. W przypadku chęci usunięcia jakiegoś wpisu wyświetl całą tablicę poprzez print, każdy wpis jest numerowany więc aby usunąć wpis na końcu sekcji wpisz np. ip firewall nat remove 1.

### Podstawowe komendy w RouterOS

Reboot systemu:

<pre>system reboot</pre>

Wyświetlenie fizycznych interfejsów:

<pre>interface ethernet print</pre>

Wyświetlenie interfejsów:

<pre>interface print</pre>

Wyświetlenie rutingu:

<pre>ip route print</pre>

Wyświetlenie adresacji:

<pre>ip address print</pre>

Ustawienie serwera DNS:

<pre>ip dns set servers=8.8.8.8</pre>

Pingowanie adresu:

<pre>ping wp.pl
ping 212.77.100.101</pre>

Pingowanie ze wskazaniem adresu żródłowego:

<pre>ping src-address=172.18.11.1 172.18.10.10</pre>

Ustawienie aliasu na interfejsie:

<pre>ip address add address=172.18.11.1/24 interface=ether1 network=172.18.11.0</pre>

Włączenie DHCP na interfejsie:

<pre>ip dhcp-client add interface=ether1 disabled=no</pre>

Wyświetlenie reguł firewalla:

<pre>ip firewall filter print</pre>

Wyświetlenie reguł NAT:

<pre>ip firewall nat print</pre>

Wyświetlenie ostatnich logów:

<pre>log print</pre>

Wyświetlenie całej wprowadzonej lub zmienionej konfiguracji

<pre>export</pre>

Zmiana hasła:

<pre>user set root password</pre>

Wyświetlenie kiedy były robione zmiany w systemie:

<pre>system history print</pre>

### Konfiguracja VPN

Dodaje propozycje szyfrowania w fazie 2 Ipsec, które zawiera algorytm szyfrujący, haszujący, czas i wyłączony PFS.

<pre>ip ipsec proposal set default enc-algorithms=aes128-cbc auth-algorithms=sha1 lifetime=3600s pfs-group=none</pre>

Dodaje adres peera (faza pierwsza IKE) gdzie podaje hasło, algorytm szyfrujący, haszujący, czas i DH-group.

<pre>ip ipsec peer add address=1.1.1.1/32 auth-method=pre-shared-key secret="q1w2e3r4" generate-policy=no policy-template-group=default exchange-mode=main send-initial-contact=yes nat-traversal=yes proposal-check=obey hash-algorithm=sha1 enc-algorithm=aes128-cbc dh-group=modp1024 lifetime=1d</pre>

Dodaje politykę pomiędzy jakimi sieciami ma odbywać się szyfrowanie.

<pre>ip ipsec policy add src-address=172.18.11.0/24 src-port=any dst-address=172.18.10.0/24 action=encrypt tunnel=yes sa-src=2.2.2.2 sa-dst=1.1.1.1
ip ipsec policy add src-address=172.18.10.0/24 src-port=any dst-address=172.18.11.0/24 action=encrypt tunnel=yes sa-src=1.1.1.1 sa-dst=2.2.2.2</pre>

Sprawdzam czy mam odpowiedz od zdalnego hosta.

<pre>ping src-address=172.18.11.1 172.18.10.10</pre>

Jak widać poniżej mam odpowiedź od hosta ze zdalnej sieci.

<pre>[root@MikroTik] &gt; ping src-address=172.18.11.1 172.18.10.10
 SEQ HOST SIZE TTL TIME STATUS 
 0 172.18.10.10 56 63 107ms
 1 172.18.10.10 56 63 106ms
 2 172.18.10.10 56 63 105ms
 3 172.18.10.10 56 63 105ms
 4 172.18.10.10 56 63 106ms
 sent=5 received=5 packet-loss=0% min-rtt=105ms avg-rtt=105ms max-rtt=107ms</pre>

### Wyjście na świat, NAT

O ile powyższe zadanie dotyczyło tylko połączeń w tunelu dobrze aby ewentualni klienci mieli też wyjście do internetu. Trzeba ich ukryć za zewnętrznym adresem czyli zrobić maskaradę ale trzeba ustawić jeszcze jedna regułę akceptującą przed aby nie dopuścić do maskowania za zewnętrznym adresem IP.

<pre>ip firewall nat add chain=srcnat action=accept src-address=172.18.11.0/24 dst-address=172.18.10.0/24 place-before=0</pre>

Użyłem powyżej place-before=0 aby ustawić ten wpis na samej górze tablicy. Następnie poniżej dodaje maskowanie.

<pre>ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade
ping src-address=172.18.11.1 wp.pl</pre>

##### Dodatkowa sieć  i NAT

[<img class="aligncenter wp-image-14616" src="http://techfreak.pl/wp-content/uploads/2018/05/routerOSv2.png" alt="" width="575" height="176" />][2]

Jest też możliwy scenariusz, że za routerem 2.2.2.2 znajduje się nie tylko sieć 172.18.11.0/24 a też 172.18.12.0/24. Cały problem polega, że za routerem 1.1.1.1 też znajduje się sieć 172.18.12.0/24. Więc występuje tu przypadek pokrycia się sieci. Z pomocą przychodzi source NAT, który za routerem 2.2.2.2 ukryje siec 172.18.12.0/4 za adresem 172.18.11.1.

<pre>ip firewall nat add chain=srcnat action=src-nat src-address=172.18.12.0/24 dst-address=172.18.10.0/24 to-addresses=172.18.11.1</pre>

Cała tablica NAT wygląda jak poniżej

<pre>[root@MikroTik] &gt; ip firewall nat pr 
Flags: X - disabled, I - invalid, D - dynamic 
0 chain=srcnat action=src-nat to-addresses=172.18.11.1 src-address=172.18.12.0/24 dst-address=172.18.10.0/24

1 chain=srcnat action=accept src-address=172.18.11.0/24 dst-address=172.18.10.0/24

2 chain=srcnat action=masquerade out-interface=ether1</pre>

### Wyświetlanie reguł firewalla

<pre>ip firewall filter print
ip firewall nat print
ip firewall connection print</pre>

### Diagnostyka VPN

<pre>ip ipsec statistic print
ip ipsec policy print
ip ipsec proposal print
ip ipsec remote-peers print
ip ipsec installed-sa print
</pre>

Przykładowy zrzut z powyższych komend:

<pre>[root@MikroTik] &gt; ip ipsec remote-peers print
 Flags: R - responder, N - natt-peer
 # ID STATE REMOTE-ADDRESS DYNAMIC-ADDRESS UPTIME
 0 established 185.244.97.27 4m15s</pre>

<pre>[root@MikroTik] &gt; ip ipsec installed-sa print
 Flags: H - hw-aead, A - AH, E - ESP
 0 E spi=0xD7AE27B src-address=1.1.1.1 dst-address=2.2.2.2 state=mature auth-algorithm=sha1 enc-algorithm=3des enc-key-size=192 auth-key="3e932bb2301c65ef74e5f9f5248f6db888f20ee4"
 enc-key="a43512e18968f4a778c971df21b71772ea1b4dcacb014c64" addtime=may/11/2018 10:07:57 expires-in=56m45s add-lifetime=48m/1h current-bytes=1820 current-packets=25 replay=128

1 E spi=0x7DAC2D01 src-address=2.2.2.2 dst-address=1.1.1.1 state=mature auth-algorithm=sha1 enc-algorithm=3des enc-key-size=192 auth-key="7de988e21495a2bd785825890c5157a677b495a2"
 enc-key="8a3d3158f3d004ff67f30abcf75d893abc66882b456a8839" addtime=may/11/2018 10:07:57 expires-in=56m45s add-lifetime=48m/1h current-bytes=1820 current-packets=25 replay=128</pre>

&nbsp;

### Jak zainstalować RouterOS w chmurze?

Ja na testy zainstalowałem RouterOS na Droplecie w [digitalocean][3]. Tani fajny hosting za 5$, mam swoim VPS 1G pamieci, 1 CPU i 25Gb dysku SDD. Niestety nie ma do wyboru instalacji RouterOS. Trzeba to zrobić samemu ale nie jest to proste ponieważ nie można tam samemu instalować systemów. Można za to wybrać automatyczną instalacje Ubuntu 16.4 64Bity i specjalnym skryptem zbudować sobie system już na tym istniejącym Ubuntu i nadpisać jego dysk. Sprytne. Źródło skryptu jest tu: <https://gist.github.com/stroebs/54fc09734a3911e91eeeb43434f117df> a sam skrypt poniżej. Najlepiej jeszcze przejrzeć samemu skrypt aby podmienić potrzebne później danej jak hasło lub wersję RouterOS. Zauważyłem że w paru przypadkach na końcu można dostrzec błędy typu kernel panic ale nie ma co się obawiać po restarcie maszyny wirtualnej system wstaje poprawnie.

<pre>wget http://download2.mikrotik.com/routeros/6.40.5/chr-6.40.5.img.zip -O chr.img.zip && \
gunzip -c chr.img.zip &gt; chr.img && \
apt-get update && \
apt install -y qemu-utils pv && \
qemu-img convert chr.img -O qcow2 chr.qcow2 && \
qemu-img resize chr.qcow2 `fdisk /dev/vda -l | head -n 1 | cut -d',' -f 2 | cut -d' ' -f 2` && \
modprobe nbd && \
qemu-nbd -c /dev/nbd0 chr.qcow2 && \
echo "Give some time for qemu-nbd to be ready" && \
sleep 2 && \
partx -a /dev/nbd0 && \
mount /dev/nbd0p2 /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
/ip service disable telnet
/user set 0 name=root password=xxxxxx
" &gt; /mnt/rw/autorun.scr && \
umount /mnt && \
echo "Magic constant is 65537 (second partition address). You can check it with fdisk before appliyng this" && \
echo "This scary sequence removes seconds partition on nbd0 and creates new, but bigger one" && \
echo -e 'd\n2\nn\np\n2\n65537\n\nw\n' | fdisk /dev/nbd0 && \
e2fsck -f -y /dev/nbd0p2 || true && \
resize2fs /dev/nbd0p2 && \
sleep 1 && \
echo "Compressing to gzip, this can take several minutes" && \
mount -t tmpfs tmpfs /mnt && \
pv /dev/nbd0 | gzip &gt; /mnt/chr-extended.gz && \
sleep 1 && \
killall qemu-nbd && \
sleep 1 && \
echo u &gt; /proc/sysrq-trigger && \
echo "Warming up sleep" && \
sleep 1 && \
echo "Writing raw image, this will take time" && \
zcat /mnt/chr-extended.gz | pv &gt; /dev/vda && \
echo "Sleep 5 seconds (if lucky)" && \
sleep 5 || true && \
echo "sync disk" && \
echo s &gt; /proc/sysrq-trigger && \
echo "Ok, reboot" && \
echo b &gt; /proc/sysrq-trigger
</pre>

### Podsumowanie

Uważam RouterOS za całkiem fajny system w którym dosyć łatwo można skonfigurować różne scenariusze. I bardzo szybko można go postawić na każdej platformie nie zależnie czy to maszyna fizyczna czy VPS.

Dawajcie znać czy przydały wam się powyższe informacje lub czy macie jakieś inne problemy z RouterOS.

 [1]: http://techfreak.pl/wp-content/uploads/2018/05/routerOSv1.png
 [2]: http://techfreak.pl/wp-content/uploads/2018/05/routerOSv2.png
 [3]: https://www.digitalocean.com/?refcode=ae21189b009e