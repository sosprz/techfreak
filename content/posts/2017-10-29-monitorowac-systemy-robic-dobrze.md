---
title: Jak monitorować systemy i robić to dobrze?
author: Przemek
type: post
date: 2017-10-29T18:19:24+00:00
url: /monitorowac-systemy-robic-dobrze/
featured_image: /wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-7.png
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6249952855
categories:
  - Linux
tags:
  - debian
  - netdata
  - Raspberry pi
  - redhat

---
Jak dobrze monitorować systemy, zbierać i wyświetlać dane tak aby wszystko było podane jak na tacy? Zacząć używać monitoringu [Netdata][1].

<!--more-->

Często gdy występuje jakiś problem na serwerze administrator musi szukać problemu we wszystkich zakamarkach systemu kończąc na aplikacji, którą nie koniecznie się zajmuje. Wtedy podstawowy monitoring, który sprawdza CPU, pamięć, dysk, ilość procesów może nie wystarczyć. W przypadku złożonej awarii zaczyna się wielkie szukanie i gdybanie w czym był problem. Bez robienia dokładnego monitoringu przez głowę przechodzą pomysły zaczynające się od I/O wait a kończą się na bug&#8217;u w systemie. Wyjściem z tej sytuacji może być monitoring zainstalowany lokalnie na maszynie o nazwie Netdata. Netdata przedstawia się jako szybki, prosty i monitorujący wszystko w czasie rzeczywistym program, który działa od razu po zainstalowaniu. Tak to prawda, instalacja jest prosta i działa chyba na każdym popularnym systemie tj. Ubuntu, Centos, Redhat itd. Na Raspberry Pi zużywa tylko 3% procesora. Co wyróżnia Netdata to, że nie trzeba go wstępnie konfigurować, przy uruchomieniu sam wykrywa działające serwisy i zaczyna je monitorować. A jeśli potrzebuje jakiegoś dostępu jak np. do bazy danych to jest to do skonfigurowania w plikach.

### 

### Instalacja

Na początek trzeba zainstalować wymagane paczki

<pre><strong>redhat</strong>
yum install autoconf automake curl gcc git libmnl-devel libuuid-devel lm-sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel python-mysqldb</pre>

<pre><strong>ubuntu</strong>
apt-get install zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autoconf-archive autogen automake pkg-config curl python-mysqldb</pre>

Instalacja programu to przede wszystkim zaciągnięcie danych z github

<pre>cd /root/
git clone https://github.com/firehol/netdata.git --depth=1
cd netdata./netdata-installer.sh</pre>

[<img class="aligncenter size-full wp-image-14250" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-2.png" alt="" width="931" height="551" />][2]

[<img class="aligncenter size-full wp-image-14251" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-3.png" alt="" width="759" height="609" />][3]

Po instalacji netdata wystawia webserwis na porcie 19999. Można ograniczyć i zmienić dostęp, ustawiając nasłuchiwanie na localhost ale dostęp do monitoringu będzie ograniczony. Natomiast nie da się ustawić żadnego zabezpieczenia na login i hasło. Chyba że dodatkowo postawimy serwer www np. nginx w trybie proxy z htaccess. Dlatego wyjściem jest ustawienie nasłuchiwania na localhost i tunelowania się po ssh na ten serwis. np. ssh -L 8000:localhost:19999 root@techfreak.pl. W takim przypadku na swoim komputerze localhost:8000 jestem w stanie otworzyć zdalnego localhosta:19999. Ok, tyle z dostępów.

Poniżej widać tablice wyświetlającą podstawowe parametry a przechodząc niżej, wszystkie inne szczegółowe wykresy. Widać też, że monitorowane są takie serwisy jak redis, nginx, mysql (mariadb).

[<img class="aligncenter size-full wp-image-14252" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-7.png" alt="" width="1860" height="873" />][4]

Jeśli mam więcej serwerów do monitorowania każde wejście na konkretny host zostanie zapisane w przeglądarce a tym samym utworzy się menu w którym mam do wyboru moje hosty.

[<img class="aligncenter size-full wp-image-14262" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-21.png" alt="" width="681" height="342" />][5]

### Powiadomienia

Ważną sprawą jest to aby się jak najwcześniej dowiedzieć o problemie. W przypadku gdy patrze akurat na dashobard to powiadomienie o problemie lub jego zakończeniu dostanę w przeglądarce i nie przyjdzie ono na pocztę. Natomiast odłoży się w logach.

[<img class="aligncenter size-full wp-image-14259" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-0.png" alt="" width="475" height="249" />][6] [<img class="aligncenter size-full wp-image-14260" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-20.png" alt="" width="421" height="201" />][7]

[<img class="aligncenter size-full wp-image-14261" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-22.png" alt="" width="909" height="861" />][8]

&nbsp;

Jeśli w systemie jest skonfigurowany sendmail i nie zobaczę powiadomienia to zostanie wysłana wiadomość o alarmie na pocztę. Aby to skonfigurować nie trzeba robić nic innego jak zdefiniować adres na jaki ma przychodzić wiadomość. Definiuje się to w pliku **/etc/netdata/health\_alarm\_notify.conf**, więcej można przeczytać na [github][9].

[<img class="aligncenter size-full wp-image-14256" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-10.png" alt="" width="722" height="727" />][10] [<img class="aligncenter size-full wp-image-14257" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-11.png" alt="" width="731" height="764" />][11]

A co z serwisami jak nginx, mysql, co w przypadku gdy któryś przestanie działać? Oczywiście netdata zaraz o tym powiadomi a na wykresach zostawi pustą przestrzeń,

[<img class="aligncenter size-full wp-image-14263" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-6.png" alt="" width="776" height="831" />][12]

### Demo

Dla bardziej zainteresowanych polecam zobaczyć po prostu [demo][13], które pokaże możliwość netdata.

### Debug

W razie problemów z połączeniem do konkretnych usług warto odpalić debug aby zobaczyć co jest grane.

<pre>sudo su -s /bin/sh netdata

#mysql

/usr/libexec/netdata/plugins.d/python.d.plugin debug 1 mysql

#mongodb

/usr/libexec/netdata/plugins.d/python.d.plugin debug 1 mongodb

#nginx

/usr/libexec/netdata/plugins.d/python.d.plugin debug 1 nginx</pre>

&nbsp;

&nbsp;

 [1]: https://github.com/firehol/netdata
 [2]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-2.png
 [3]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-3.png
 [4]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-7.png
 [5]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-21.png
 [6]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-0.png
 [7]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-20.png
 [8]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-22.png
 [9]: https://github.com/firehol/netdata/wiki/email-notifications
 [10]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-10.png
 [11]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-11.png
 [12]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-netdata-monitoring-serwerow-6.png
 [13]: http://london.my-netdata.io/default.html#menu_system_submenu_load;theme=slate