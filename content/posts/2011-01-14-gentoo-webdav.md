---
title: Gentoo – WebDav
author: Przemek
type: post
date: 2011-01-13T23:01:51+00:00
url: /gentoo-webdav/
bfa_virtual_template:
  - hierarchy
hits:
  - 216
dsq_thread_id:
  - 1032881529
categories:
  - Linux

---
Celem tego Howto jest pokazanie w jaki sposób skonfigurować na dystrybucji Gentoo serwer WebDav, który posłuży nam np. do wymiany  
plików pomiędzy telefonem (Nokia e55) a komputerami. Komunikacja będzie szyfrowana z użyciem certyfikatów SSL .Serwer taki będzie dodatkowo ochroniony loginem i hasłem.

<!--more-->

Konfiguracja serwera WebDAV

Aby zainstalować na Gentoo serwer WebDav posłużymy się dodatkowymi modułami w programie Apache  
o nazwie mod_dav. Apache zainstalowany z flagami:

www-servers/apache-2.2.21-r1 ([ www-servers/apache-2.2.21-r1 USE=&#8221;ldap ssl -debug&#8221; APACHE2_MODULES=&#8221;actions alias  
auth\_basic authn\_alias authn\_anon authn\_dbm authn\_defaultauthn\_file authz\_dbm authz\_default authz\_groupfile authz\_host  
authz\_owner authz\_user autoindex cache cgi cgid dav dav\_fs dav\_lock deflate dir disk\_cache env expires ext\_filter file_cache  
filter headers include info log\_config logio mem\_cache mime mime\_magic negotiation rewrite setenvif speling status unique\_id  
userdir usertrack vhost\_alias &#8221; APACHE2\_MPMS=&#8221;peruser &#8221; 0 kB )

Najważniejsze z nich to:  
APACHE2\_MODULES=&#8221;dav dav\_fs dav_lock&#8221;

Po zainstalowaniu/przeinstalowaniu Apache z dodatkowymi flagami w /etc/conf.d/apache2 dodajemy dodatkowy parametr startujący -D DAV

Plik /etc/conf.d/apache2  
APACHE2_OPTS=&#8221;-D PERUSER -D SSL -D LANGUAGE -D PHP5 -D DAV&#8221;

Nie ma potrzeby dodawać -D DAV\_FS -D DAV\_LOCK jak to opisują inne artykuły bo to już się ładuje razem z -D DAV.  
Następnym krokiem jest założenie sobie katalogu na pliki www i nadanie mu odpowiednich praw z jakimi działa nasz serwer Apache:  
User/Grupa z jakimi działa nasz serwer możemy spr. wydając komendę:  
grep -v ^&#8217;#’ /etc/apache2/httpd.conf |grep -E ‚User|Group

Tworzymy katalog i ustawiamy uprawnienia dla niego:  
mkdir -p /home/www/webdav ; chown -R twoj\_user:twoja\_grupa /home/www/webdav

ps. ja korzystam z modułu peruser w Apachu więc usera/grupa definiuje sobie w virtual hoście.

Tworzę plik .htpasswd z loginami i hasłami dostępu do strony:  
htpasswd -c /home/www/.htpasswd user

Za user podstawiamy nazwę użytkownika który ma mieć dostęp do plików przez protokół webdav.  
ps. Drugiego usera dodajemy bez opcji -c.

Modyfikujemy plik /etc/apache2/modules.d/45\_mod\_dav.conf:

<IfDefine DAV>  
#DavLockDB &#8222;/var/lib/dav/lockdb&#8221;  
<IfModule setenvif_module>  
BrowserMatch &#8222;Microsoft Data Access Internet Publishing Provider&#8221; redirect-carefully  
BrowserMatch &#8222;MS FrontPage&#8221; redirect-carefully  
BrowserMatch &#8222;^WebDrive&#8221; redirect-carefully  
BrowserMatch &#8222;^WebDAVFS/1.[012345678]&#8221; redirect-carefully  
BrowserMatch &#8222;^gnome-vfs/1.0&#8221; redirect-carefully  
BrowserMatch &#8222;^XML Spy&#8221; redirect-carefully  
BrowserMatch &#8222;^Dreamweaver-WebDAV-SCM1&#8221; redirect-carefully  
</IfModule>  
</IfDefine>

DavLockDB -jest zaheszowany ponieważ definiuje mu inną ścieżkę w moim VirtualHości(VH)

Potem tworzymy plik VirtualHosta np: /etc/apache2/vhosts.d/1000.conf :

Plik 1000.conf:  
#Jeśli używacie modułu peruser zdefiniujcie dyrektywę Processor + ServerEnvironment.  
<Processor webdav>  
User user #Wasz user systemy z którym ma działać proces apacha dla tego VH.  
Group grupa #To co wyżej tyle ze grupa  
</Processor>  
Listen *:443 #nie używam domyślnych configów więc deklaruje nasłuchiwanie tu apacha.  
<VirtualHost *:443>  
<IfModule mod_ssl.c>  
SSLEngine on #włączenie silnika ssl  
SSLCipherSuite ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP:+eNULL #minimalne wymagania naszych certów  
SSLCertificateFile /etc/ssl/domena.crt #nasz cert  
SSLCertificateKeyFile /etc/ssl/domena.key #nasz klucz  
ErrorLog /var/log/apache2/ssl\_error\_log  
ServerName nasza_domena #wpisujemy tu naszą domenę dla tego VH  
ServerEnvironment webdav # nazwa srodowska (jeśli korzystasz z modułu peruser)  
CustomLog /var/log/apache2/ssl\_request\_log &#8222;%t %h %{SSL\_PROTOCOL}x %{SSL\_CIPHER}x &#8222;%r&#8221; %b&#8221;  
DocumentRoot &#8222;/home/www/webdav&#8221; #scieżka do katalogu którą wcześniej stworzyliśmy  
Alias / /home/www/webdav/ #musi być alias bo bez tego mi nie działo (kod 405)  
</IfModule>  
<Directory /home/www/webdav>  
AllowOverride All  
Options Indexes FollowSymLinks #widzę katalogi przez www  
AuthName &#8222;WebDAV&#8221;  
AuthType Basic  
AuthUserFile /home/www/.htpasswd #sciezka do pliku z loginem i hasłem userów  
AuthGroupFile /dev/null  
require valid-user  
Order deny,allow  
</Directory>  
<IfModule mod_dav.c>  
DavLockDB &#8222;/home/www/.htlock&#8221; #nasz plik do blokady  
<Location />  
#Options None #jeżeli chcemy przez Firefoxa widzieć pliki heszujemy to  
DAV On #włączamy WebDav  
#<Limit GET PUT POST DELETE PROPFIND PROPPATCH MKCOL COPY MOVE LOCK UNLOCK> #możemy tworzyć limity dla userów -ale po co teraz :)  
#</Limit>  
</Location>  
</IfModule>  
</VirtualHost>

info: Nie będę opisał jak generować dla siebie certyfikatów ponieważ możecie znaleźć to na tej stronie.

Startowanie apacha (jeśli nie był używany wcześniej):  
\# /etc/init.d/apache2 start

Do testowania jako klienta WebDava możemy użyć telefonu albo linuxa:  
a) aby w Nokii E55 dodać dysk należy wejść w Menu -> Biuro -> Mndź.plik potem wybrać Opcje -> Napędy zdalne -> Mapuj Nowy napęd.  
Podajemy tam: Nazwę, Adres, Nazwę usera i hasło do strony.  
b) oczywiście możemy przeglądać pliki na serwerze przez przeglądarkę WWW ale musimy w VirtualHoscie zadeklarować Options Indexes  
FollowSymLinks  
c) W KDE mamy możliwość skorzystania z aplikacji kde-base/knetattach (asystenta tworzenia folderów sieciowych -otwórz Dolphin i w  
lewym menu wybierz Sieć). d) do połączenia z serwerem (po konsoli w linuxie) możemy użyć programu net-misc/cadaver  
Po zdefiniowaniu nowego zdalnego dysku/folderu możemy pomiędzy telefonem a komputerem synchronizować pliki (programy, zdjęcia itp).  
Jakie błędy w logach ( polecam przeglądać logi z apacha ;P )  
a) A lock database was not specified with the DAVLockDB directive. One must be specified to use the locking functionality. [500, #401]  
-sprawdż plik z blokadą ,prawa do niego itp.

Wszystkie treści w tym wiki, którym nie przyporządkowano licencji, podlegają licencji:  
CC Attribution-Noncommercial-Share Alike 3.0 Unported [http://creativecommons.org/licenses/by-nc-sa/3.0/]

Autor: Kamil M.