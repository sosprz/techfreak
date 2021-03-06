---
title: VPS dla bloga? Testy DigitalOcean
author: Przemek
type: post
date: 2014-11-29T11:24:28+00:00
url: /vps-dla-bloga-testy-digitalocean/
featured_image: /wp-content/uploads/2014/11/techfreak_digitalocean-624x352.jpg
hits:
  - 611
dsq_thread_id:
  - 3273468919
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - mysql

---
Tak to jest z tymi hostingami www że jak trzeba wybrać jakiś dla siebie to nie wiadomo co. Najlepiej jak był by tani i wydajny miał opcje backupu i żeby było wszystko zrobione z automatu. Sam ostatnio migrowałem się z jednego na drugi z powodu opłat a potem wybrałem jeszcze inny z powodu kłopotów technicznych a teraz testuje <a href="http://pl.wikipedia.org/wiki/Virtual_Private_Server" target="_blank" rel="noopener">VPS</a> który polecił mi użytkownik forum webhostingtalk.pl. Dokładnie chodzi o wirtualny serwer prywatny w <a href="https://www.digitalocean.com/?refcode=ae21189b009e" target="_blank" rel="noopener">DigitalOcean</a> za 5$ miesięcznie.

<!--more-->

Mi miesięczne rozliczenia bardziej pasują niż płacenie na raz ale okazuje się że w DO opłaty wynoszą 0.007$ za godzinę używania serwera. Co oznacza że np. mogę sobie kupić na godzinę serwerek potestować go i skasować. Ktoś może powiedzieć że, ale po co, testy można robić lokalnie na kompie. Tak można ale testową maszynę w DigitalOcean można postawić w 60 sekund z backupu lub obrazu serwera produkcyjnego. Co już jest dużą wygodą i oszczędnością czasu, nawet nie opłaca się zapisywać na kartce pomysłów bo maszyna już jest gotowa.

Ja zakupiłem sobie serwerek VPS w najniższej opcji 512MB ramu, 1 CPU, 20G HDD i 1TB transferu miesięcznie. Do wyboru miałem region w którym chcę go zainstalować (czyli maja ileś tam serwerowni do dyspozycji) i opcje automatycznego backupu za dodatkowego dolara. Obrazy/image serwera można robić tylko gdy jest wyłączony ale to i tak zajmuje tylko do 2 min a po zrobieniu maszyna automatycznie wstaje sama. A w opcji za 1$ backupy robią się co dwa dni bez restartu. System jaki można wybrać to albo czysty ubuntu, debian, centos, coreos, fedora albo już z zainstalowanymi aplikacjami np. wordpress, LAMP, LEMP, Magentoo, Ruby.  Można wybrać maszynę z obrazu lub wcześniej wykonanego backupu. I robisz tak w kółko stawiasz, kasujesz, stawiasz, kasujesz. Co ciekawe jeśli robimy to w obrębie jednego datacenter to kasując produkcyjną starą, maszynę i stawiając inna przetestowaną n.p z innego obrazu dostaniemy ten sam IP. Co ogólnie mogło by być ryzykowne ale przy takiej akcji nie trzeba nawet DNS zmieniać. Taki sam schemat jest przy przenoszeniu się na wyższy plan np 2GB ramu i 2CPU. 5 min i maszyna jest szybsza bez modyfikacji danych. I to jest właśnie wirtualizacja. Trzeba wspomnieć o ważnej funkcji którą jest VNC/KVM dzięki której w przypadku zablokowania dostępu do serwera zawsze z panelu mogę to odkręcić bo mam dostęp do konsoli.

DigitalOcean ma program poleceń w którym polecający dostaje 25$ a kupujący 10$ na start. Więc zachęcam do rejestrowania z mojego linku <a href="https://www.digitalocean.com/?refcode=ae21189b009e" target="_blank" rel="noopener">digitalocean.com</a> będę mógł utrzymać techfreak na 5 mc za free lub więcej ;)

### Testy

Dobra jak coś polecam to wypada jakieś testy wykonać czy coś :) Na pierwszy test poszły dyski, DO chwali się że ma tylko SSD. No i mają, wynik 440MB/sec.

<pre>root@srv0:~# hdparm -tT /dev/disk/by-label/DOROOT
/dev/disk/by-label/DOROOT:
 Timing cached reads: 14590 MB in 2.00 seconds = 7302.70 MB/sec
 Timing buffered disk reads: 1322 MB in 3.00 seconds = 440.12 MB/sec</pre>

Co mnie zaskoczyło to transfery z domu do serwera na poziomie 80Mbps, od razu zainstalowałem iperf.

<pre>root@dell:~# iperf -c 178.62.177.47
------------------------------------------------------------
Client connecting to 178.62.177.47, TCP port 5001
TCP window size: 43.8 KByte (default)
------------------------------------------------------------
[ 3] local 172.18.10.105 port 60975 connected with 178.62.177.47 port 5001
[ ID] Interval Transfer Bandwidth
[ 3] 0.0-10.0 sec 95.8 MBytes 80.2 Mbits/sec</pre>

Restart serwera w 10 sekund, nawet pinga nie przerwało.

<pre>64 bytes from 178.62.177.47: icmp_seq=762 ttl=50 time=50.3 ms
64 bytes from 178.62.177.47: icmp_seq=763 ttl=50 time=73.2 ms
64 bytes from 178.62.177.47: icmp_seq=764 ttl=50 time=176 ms
64 bytes from 178.62.177.47: icmp_seq=765 ttl=50 time=36.2 ms
64 bytes from 178.62.177.47: icmp_seq=766 ttl=50 time=35.3 ms
64 bytes from 178.62.177.47: icmp_seq=767 ttl=50 time=41.5 ms
64 bytes from 178.62.177.47: icmp_seq=768 ttl=50 time=33.8 ms</pre>

Czas na wydajność samego serwera www. Ja postanowiłem postawić NGINX + PHP-FPM + WP Super Cache. To własnie Super Cache robi największą robotę bo tworzy statyczne pliki serwowanych stron. Przez co oszczędza CPU i MEM nie zaglądając do bazy i nie wykonując kodu PHP. Szczerze przetestowałem wiele opcji NGINX + memcache, memcached, fastcgi cache, ngx_pagespeed i jeszcze ileś innych opcji i przy takim małym serwerku opłaca się tylko zrobić NGINX +FPM + WP Super Cache lub W3 Total Cache na wordpressie. Wyniki jakie uzyskiwałem to ok nawet 190 obsłużonych zapytań na sekundę. Do testów użyłem Apache Bench poniżej jeden z wyników 201 req/ps.

<pre>root@dell:~# ab -k -c 200 -n 500 http://techfreak.pl/wyciagnie-wifi-ac-test-routera-archer-c7/
This is ApacheBench, Version 2.3 &lt;$Revision: 1604373 $&gt;
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking techfreak.pl (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Finished 500 requests


Server Software:        nginx
Server Hostname:        techfreak.pl
Server Port:            80

Document Path:          /wyciagnie-wifi-ac-test-routera-archer-c7/
Document Length:        166 bytes

Concurrency Level:      200
Time taken for tests:   2.477 seconds
Complete requests:      500
Failed requests:        133
   (Connect: 0, Receive: 0, Length: 133, Exceptions: 0)
Non-2xx responses:      367
Keep-Alive requests:    367
Total transferred:      6059158 bytes
HTML transferred:       5965590 bytes
Requests per second:    201.84 [#/sec] (mean)
Time per request:       990.876 [ms] (mean)
Time per request:       4.954 [ms] (mean, across all concurrent requests)
Transfer rate:          2388.65 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   23  30.0      0      82
Processing:    36  678 912.3    172    2435
Waiting:       36  545 691.2    172    1850
Total:         36  701 930.1    172    2476

Percentage of the requests served within a certain time (ms)
  50%    172
  66%    298
  75%   2084
  80%   2149
  90%   2341
  95%   2370
  98%   2380
  99%   2444
 100%   2476 (longest request)
</pre>

### Co dalej

Szczerze, strona teraz chodzi fajnie ale nie jestem przekonany do testowania tylko jednym narzędziem może za jakiś czas będzie nowy raport. Przede wszystkim techfreak.pl chodzi teraz płynniej, szybciej i nie jestem przycięty w żaden sposób na zasoby chociaż nie jest ich wiele. Jestem przygotowany na większy ruch który wystąpił np. dzięki temu wpisowi <a href="http://techfreak.pl/ukryta-karta-micro-sd-intenso-karcie-sd-platinet/" target="_blank" rel="noopener">http://techfreak.pl/ukryta-karta-micro-sd-intenso-karcie-sd-platinet/</a>. Przez cały dzień na stronie było ok 130 osób, 35 tyś wyświetleń na samym wykopie. Oczywiście serwer wyświetlał Resources Limited is Reached i lecieli z gogle cache. Po zainstalowaniu WP Super Cache było trochę lepiej. Dostawca hostingu odpisał że VPS&#8217;a mogę sobie kupić jak by co ;)

W sumie zauważyłem same plusy po przejściu na nowy serwer zwiększyła się liczba odwiedzin. Na PageSpeed strona dostaje 85 punktów na 100 i tym samym zielony kolorek gdzie wcześniej zawsze był czerwony.

<a href="http://techfreak.pl/vps-dla-bloga-testy-digitalocean/techfreak_efekt_wykop/" rel="attachment wp-att-8209"><img class="aligncenter size-full wp-image-8209" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_efekt_wykop.jpg" alt="techfreak_efekt_wykop" width="1078" height="542" /></a>

### 

## Migracja wordpressa na VPS

Jeśli Ty tak samo jak ja chcesz przejść na VPS zgraj swój katalog WP i zrób eksport bazy. Poniżej pokażę jak skonfigurować NGINX i PHP-FPM i prę innych rzeczy na serwerze aby twoja strona mogła śmigać. System jaki wybrałem to Debian 7 Wheezy.

### repo dotdeb.org

Przydało by się na serwerze aby mieć w miarę aktualne paczki php i serwera www. Aby to uzyskać trzeba dodać nieoficjalne repo dotdeb.org.

<pre>wget http://www.dotdeb.org/dotdeb.gpg
sudo apt-key add dotdeb.gpg
echo "deb http://packages.dotdeb.org wheezy all" &gt;&gt; /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" &gt;&gt; /etc/apt/sources.list
echo "deb http://packages.dotdeb.org wheezy-php55 all" &gt;&gt; /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy-php55 all" &gt;&gt; /etc/apt/sources.list
cat /etc/apt/sources.list
aptitude update
aptitude upgrade</pre>

### Instalacja potrzebnych pakietów

<pre>aptitude install nginx mysql-server-5.5 php5-fpm php5-mysql</pre>

### Mysql

Na początek można zająć się bazą i nie będzie potrzeby aby do niej wracać później. Według kolejności:

  * logowanie
  * tworzę bazę
  * usera tech z hasłem freak
  * nadaje uprawniania do bazy
  * resetuje uprawniania
  * wychodzę

<pre>mysql -u root -p
CREATE DATABASE techfreak;
CREATE USER 'tech'@'localhost' IDENTIFIED BY 'freak';
GRANT ALL PRIVILEGES ON techfreak . * TO 'tech'@'localhost';
FLUSH PRIVILEGES;
quit;</pre>

###  Kończenie instalacji mysql

<pre>/usr/bin/mysql_secure_installation</pre>

Odpowiadamy na wszystko tak chyba że nie chcemy zmieniać hasła

### Dump restore

W tym kroku przywracam bazę z kopi zapasowej starego serwera i podaje hasło.

<pre>mysql -h localhost -u tech -p techfreak &lt; backup_db.sql.gz</pre>

### DIR

Tworzę katalog  którym będą leżały pliki html/wordpressa

<pre>mkdir /var/www/techfreak.pl</pre>

Kopiuje pliki wp do /var/www/techfreak.pl i nadaje uprawnienia

<pre>cd /var/www/
chown www-data:www-data -R * 
find . -type d -exec chmod 755 {} \; 
find . -type f -exec chmod 644 {} \;</pre>

### WP-config

Zmień hasło, login i hosta do mysql w wp-config.php na te których użyłeś wcześniej.

<pre>nano /var/www/techfreak.pl/wp-config.php</pre>

### GIT

Jak wiadomo cała konfiguracja składa się z plików i będę zmieniał je aby wszystko uruchomić. Najlepiej zrobić kopie ale zamiast tego można użyć wersjonowania. Czyli w przypadku problemów lub niepoprawnej konfiguracji zawsze można się cofnąć do wersji działającej. Jeśli nie chcesz tego robić możesz pominąć.

Wchodzę do katalogu etc i poleceniem init git zaczynam pracę w tym katalogu a następnie dodaje dwa katalogi z konfiguracjami: php5 i nginx, git status pokazuje jakie pliki zostały zmienione albo jakich brakuje. Git commit to zapisanie danej wersji z komentarzem.

<pre>cd /etc
git init
git add php5 nginx
git status
git commit -am "przed konfiguracja"</pre>

### OPcache

Zalecane ustawienia można zobaczyć pod linkiem https://github.com/zendtech/ZendOptimizerPlus

sed -i ‚s/;opcache.enable=0/opcache.enable=1/g’ /etc/php5/fpm/php.ini  
sed -i ‚s/;opcache.memory\_consumption=64/opcache.memory\_consumption=64/g’ /etc/php5/fpm/php.ini  
sed -i ‚s/;opcache.max\_accelerated\_files=2000/opcache.max\_accelerated\_files=2000/g’ /etc/php5/fpm/php.ini  
sed -i ‚s/;opcache.revalidate\_freq=2/opcache.revalidate\_freq=60/g’ /etc/php5/fpm/php.ini  
sed -i ‚s/;opcache.fast\_shutdown=0/opcache.fast\_shutdown=1/g’ /etc/php5/fpm/php.ini

#### BONUS

Dodatkowo można sobie zaciągnąć pliczek <a href="https://raw.githubusercontent.com/rlerdorf/opcache-status/master/opcache.php" target="_blank" rel="noopener">opcache.php</a> i wgrać go do katalogu głównego aby na stronie http://mojastrona.ołje/opcache.php zobaczyć statystyki i zużycie.

#### git

Przy okazji można zobaczyć jak działa wersjonowanie w git po wydaniu polecenia git diff w /etc

<pre>@@ -1837,7 +1837,7 @@ opcache.revalidate_freq=60
 ;opcache.load_comments=1
 
 ; If enabled, a fast shutdown sequence is used for the accelerated code
-;opcache.fast_shutdown=0
+opcache.fast_shutdown=1
 
 ; Allow file existence override (file_exists, etc.) performance feature.
 ;opcache.enable_file_override=0</pre>

Aby podejrzeć listę commit&#8217;ów wydaj polecenie git log

<pre>git log
commit f4d4695b19accc8e373da6a082fbf3ffdb91c574
Author: root &lt;root@d1stkfactory&gt;
Date: Wed Nov 26 21:12:17 2014 +0000

przed konfiguracja</pre>

Aby cofnąć się do jakiejś pożądanej konfiguracji wystarczy wydać polecenie git reset z numerem commitu.

<pre>git reset --hard f4d4695b19accc8e373da6a082fbf3ffdb91c574</pre>

&nbsp;

### Konfiguracja NGINX

Tworzę nowego vhosta na podstawie domyślnego:

<pre>cp /etc/nginx/sites-available/default /etc/nginx/sites-available/techfreak.pl</pre>

Wyłączam domyślną stronę:

<pre>rm /etc/nginx/sites-enabled/default</pre>

W pliku /etc/nginx/sites-available/techfreak.pl trzeba wykonać parę zmian.  
Wskazać gdzie leżą pliki strony, zamień

<pre>root /usr/share/nginx/html; 
na 
root /var/www/techfreak.pl;</pre>

Dodaj do index index.php, zamień

<pre>index index.html index.htm; 
na 
index index.php index.html index.htm;</pre>

Dodaj nazwy serwera i zamień

<pre>server_name localhost; 
na 
server_name techfreak.pl www.techfreak.pl;</pre>

Wyłącz sekcje locations, zamineń:

<pre>location / { 
 # First attempt to serve request as file, then 
 # as directory, then fall back to displaying a 404. 
 try_files $uri $uri/ =404; 
 # Uncomment to enable naxsi on this location 
 # include /etc/nginx/naxsi.rules; 
 } 
na 
#location / { 
 # First attempt to serve request as file, then 
 # as directory, then fall back to displaying a 404. 
# try_files $uri $uri/ =404; 
 # Uncomment to enable naxsi on this location 
 # include /etc/nginx/naxsi.rules; 
# }
</pre>

Dodaj na końcu:

<pre>include common/wpsc.conf;
include common/wpcommon.conf; 
include common/locations.conf;
</pre>

Ja też musiałem zacząć do jakiegoś przykładu i wsparłem się konfiguracją z programu <a href="https://github.com/rtCamp/easyengine" target="_blank" rel="noopener">easyengine</a> który już w ogóle z automatu stawia za Ciebie wszystko i wspiera konfigurację pod WP Super Cache. Potrzebna jest ona z tego powodu że WPSC działa na module rewrite który kieruje od razu zapytania do statycznych plików.

Te trzy includy które własnie dodałeś to po kolei konfiguracja dla WP Super Cache, dostępy do katalogów wordpressa i innych. Trzeba je zaciągnąć wgetem.

<pre>cd /etc/enginx
 mkdir common</pre>

<pre>wget https://raw.githubusercontent.com/rtCamp/easyengine/master/config/nginx/common/locations.conf
wget https://raw.githubusercontent.com/rtCamp/easyengine/master/config/nginx/common/wpsc.conf
wget https://raw.githubusercontent.com/rtCamp/easyengine/master/config/nginx/common/wpcommon.conf</pre>

I wykonać parę zmian:

PHP-FPM domyślnie nasłuchuje na /var/run/php5-fpm.sock więc zmień z php.

<pre>sed -i 's/fastcgi_pass php;/fastcgi_pass unix:\/var\/run\/php5-fpm.sock;/g' /etc/nginx/common/wpsc.conf</pre>

w pliku /etc/nginx/common/locations.conf skasuj wszystko poniżej razem z Status pages

<pre># Status pages
#location /nginx_status {
#	stub_status on;
#	access_log   off;
#	include common/acl.conf;
#}
....</pre>

### SSL

do pliku common/ssl.conf dodaj:

<pre>ssl_certificate /etc/nginx/ssl/certyfikat.crt;
ssl_certificate_key /etc/nginx/ssl/certyfikat.key;
ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;</pre>

Ważne aby do certyfikat.crt dodać wszystkie root crt które dostało się wraz z certyfikatem dla domeny.

a w sites-available/techfreak.pl pod listen 80; dodaj:

<pre>listen 80; ## listen for ipv4; this line is default and implied

	listen 443 ssl;
	include common/ssl.conf;</pre>

### Włączenie strony

<pre>ln -s /etc/nginx/sites-available/techfreak.pl /etc/nginx/sites-enabled/techfreak.pl</pre>

### test Nginx&#8217;a

Odpal komendę nginx -t która sprawdza poprawność konfiguracji, jeśli wszystko jest ok to można go zrestartować.

<pre>service nginx restart</pre>

### WP-start

Teraz można wejść na stronę zainstalować WP Super Cache i go włączyć. Na pewno będzie krzyczał że nie ma zainstalowanego mod_rewrite nie przejmuj się :)

<a href="http://techfreak.pl/vps-dla-bloga-testy-digitalocean/techfreakpl_wpsupercache/" rel="attachment wp-att-8256"><img class="aligncenter size-full wp-image-8256" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreakpl_wpsupercache.jpg" alt="techfreakpl_wpsupercache" width="815" height="549" /></a>

### Podstawy

Zainstaluj iptables i program do zapisywania i automatycznego przywracania przy starcie

<pre>apt-get install iptables-persistent</pre>

Wklej podstawowe reguły:

<pre>iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP</pre>

Wyświetlanie reguł:

<pre>iptables -L 
iptables -L --line-numbers
iptables -S</pre>

Kasowanie po numerach reguł:

<pre>iptables -D INPUT 4</pre>

Zapisywanie reguł:

<pre>iptables-save &gt; /etc/iptables/rules.v4</pre>

Przydatny alias ipts do zapisywania reguł, zapisz go do .bashrc:

<pre>alias ipts="iptables-save &gt; /etc/iptables/rules.v4"
ipts
</pre>

### SSH

Wymień klucz prywatny z serwerem aby logować się bez hasła:  
<a href="http://techfreak.pl/ssh-jak-logowac-sie-bez-hasla/" target="_blank" rel="noopener">http://techfreak.pl/ssh-jak-logowac-sie-bez-hasla/</a>

Wyłącz logowanie na hasło, masz przecież klucz:  
W pliku /etc/ssh/sshd_config zmień PasswordAuthentication no

<pre>service ssh restart</pre>

### Inne przydatne

Zainstaluj dodatek do wordpressa, EWWW Image Optimizer świetnie optymalizuje obrazy.

### Przeczytaj

<a href="https://rtcamp.com/easyengine/" target="_blank" rel="noopener">https://rtcamp.com/easyengine/</a>

<a href="https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps" target="_blank" rel="noopener">https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps</a>

<a href="http://wiki.nginx.org/" target="_blank" rel="noopener">http://wiki.nginx.org/</a>

<a href="https://ewan.im/900/10-million-hits-a-day-with-wordpress-using-a-15-server" target="_blank" rel="noopener">https://ewan.im/900/10-million-hits-a-day-with-wordpress-using-a-15-server</a>

<a href="http://www.narga.net/recommended-nginx-configuration-high-traffic-wordpress/" target="_blank" rel="noopener">http://www.narga.net/recommended-nginx-configuration-high-traffic-wordpress/</a>

<a href="https://www.digitalocean.com/community/tutorials/how-to-use-top-netstat-du-other-tools-to-monitor-server-resources#netstat" target="_blank" rel="noopener">https://www.digitalocean.com/community/tutorials/how-to-use-top-netstat-du-other-tools-to-monitor-server-resources#netstat</a>

<a href="https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian" target="_blank" rel="noopener">https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian</a>

### Backup

Jak nie chcesz dawać dolca za backupy to rób je ręcznie. Nie no żartowałem kup to :)  
Znalazłem ten skrypcik gdzieś w necie, robi backup plików, bazy i etc.

<pre>#!/bin/bash
NOW=$(date +"%Y-%m-%d-%H%M")
FILE="techfreak.$NOW.tar"
BACKUP_DIR="/home/backup"
WWW_DIR="/var/www/techfreak.pl/"

DB_USER="twojuser"
DB_PASS="twojehaslo"
DB_NAME="twoja_nazwa_bazy"
DB_FILE="techfreak.$NOW.sql"

WWW_TRANSFORM='s,^var/www/techfreak.pl,www,'
DB_TRANSFORM='s,^home/backup,database,'

tar -cvf $BACKUP_DIR/$FILE --transform /etc/nginx/ /etc/php5/

tar -cvf $BACKUP_DIR/$FILE --transform $WWW_TRANSFORM $WWW_DIR
mysqldump -u$DB_USER -p$DB_PASS $DB_NAME &gt; $BACKUP_DIR/$DB_FILE

tar --append --file=$BACKUP_DIR/$FILE --transform $DB_TRANSFORM $BACKUP_DIR/$DB_FILE
rm $BACKUP_DIR/$DB_FILE

gzip -9 $BACKUP_DIR/$FILE</pre>

### FTP

Nie używaj ftp, wystarczy że masz ssh włączone które też obsługuje kopiowanie plików ale poprzez sftp.  
No i zgraj ten backup ;)

<pre>scp twojlogin@twojadimena:/home/backup/backup.tar ~</pre>

### DNS

Przy przechodzeniu na inny dns lub sprawdzaniu czy domena ma nowy IP użyj narzędzi.

Zobacz na jaki IP rozwiązuje nazwę twoje domena:

<pre>host -t a techfreak.pl</pre>

Sprawdź jaki masz ustawiony ttl i ile jeszcze czasu tobie zostało na zobaczenie nowego adresu:

<pre>dig +nocmd +noall +answer techfreak.pl</pre>

Sprawdź czy inne DNS na świecie widzą twoja domenę pod nowym adresem:

<a href="http://dnschecker.org/#A/techfreak.pl" target="_blank" rel="noopener">http://dnschecker.org/#A/techfreak.pl</a>

Zawsze w /etc/hosts możesz wpisać IP aby szybciej nie czekając na DNS wejść na swoja nową stronę:

<pre>178.62.177.47 techfreak.pl
178.62.177.47 www.techfreak.pl</pre>

### Koniec

Powyżej przedstawiłem podstawowa konfiguracje dzięki której szybko uruchomisz swoja stronę. Mam nadzieje że na początek się przyda. Jeśli masz jakieś propozycję lub porady to czekam na info w komentarzach. No i pamiętaj aby skorzystać z <a href="https://www.digitalocean.com/?refcode=ae21189b009e" target="_blank" rel="noopener">tego linku</a>. Powodzenia!

&nbsp;