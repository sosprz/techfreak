---
title: Jak skonfigurować serwer rsyslog + interfejs www na RedHat 6
author: Przemek
type: post
date: 2013-03-19T21:38:24+00:00
url: /jak-skonfigurowac-serwer-rsyslog-interfejs-www-na-redhat-6/
featured_image: /wp-content/uploads/2013/03/loganalyzer_642_362_force.jpg
hits:
  - 1755
dsq_thread_id:
  - 1150154262
categories:
  - Linux
tags:
  - redhat

---
<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/03/loganalyzer_642_362_force.jpg"><img class="aligncenter  wp-image-2551" alt="loganalyzer_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/03/loganalyzer_642_362_force.jpg" width="385" height="217" /></a>
</p>

Każdy admin prędzej czy później spotyka się z taką sytuacja że potrzebuje mieć serwer sysloga który będzie zbierał logi ze wszystkich urządzeń w sieci. Generalnie z różnych powodów a może być ich wiele nie ma co wnikać, można robić to też dla fanu ;)

Ja robię to z potrzeby i mam nadzieje że komuś się przyda chociaż można powiedzieć też RTFM :)

<!--more-->

<span style="font-size: 14px; line-height: 1.5;"><strong>Założenia</strong>:</span>

Serwer syslog &#8211; 192.168.0.1

Klient sysloga &#8211; 192.168.0.2

**Konfiguracja rsyslog:**

<pre class="lang:default decode:true">nano /etc/rsyslog.conf</pre>

<span style="font-size: 14px; line-height: 1.5;">Usuwamy hasze jak poniżej:</span>

<pre class="lang:default highlight:0 decode:true"># Provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514</pre>

<span style="font-size: 14px; line-height: 1.5;">Mi było potrzebne logowanie do różnych plików dla różnych adresów IP, realizują to poniższe dwie linijki:</span>

<pre class="lang:default decode:true">$template FILENAME,"/var/log/rsyslog/%fromhost-ip%/syslog.log"
*.* ?FILENAME</pre>

Jeśli chce to moge logować wszystko do jednego pliku

<pre class="lang:default decode:true">*.* /var/log/rsyslog/all.log</pre>

Lub logować logi z odpowiednich sieci do odpowiednich plików:

<pre class="lang:default decode:true">if $fromhost-ip startswith '192.168.2' then /var/log/rsyslog/switche.log
& ~
if $fromhost-ip startswith '192.168.3.' then /var/log/rsyslog/serwery.log
& ~</pre>

<span style="font-size: 14px; line-height: 1.5;">Po restarcie usługi stworzy ona wszystkie potrzebne katalogi i pliki</span>

<pre class="lang:default decode:true">/etc/init.d/rsyslog restart</pre>

Na tym etapie może patrzeć już czy w pliku pojawiają się jakieś wpisy i pliki jak poniżej:

<pre class="lang:default decode:true">ls /var/log/rsyslog
127.0.0.1 all.log</pre>

Dla testu można włączyć logowanie na jakimś hoście konfigurując syslog jako klienta.

Najlepiej na samym dole rsyslog.conf dopisać:

<pre class="lang:default decode:true">*.* @192.168.0.1</pre>

**Loganalyzer**

<span style="font-size: 14px; line-height: 1.5;">Wszystko fajnie ale dobrze było by przeglądać sobie logi przez jakiś interfejs www</span>

Pobieramy loganalyzer z <a href="http://loganalyzer.adiscon.com/" target="_blank">loganalyzer.adiscon.com</a>. Dla ciekawskich demko do obejżeni na <a href=" http://loganalyzer-demo.adiscon.com/" target="_blank">loganalyzer-demo.adiscon.com</a>.

Instalujemy httpd i php

<pre class="lang:default decode:true">yum install httpd php php-gd</pre>

Uruchamiamy server http

<pre class="lang:default decode:true">/tec/init.d/httpd start</pre>

<span style="font-size: 14px; line-height: 1.5;">Nadajemy uprawnienia dla katalogu rsyslog</span>

<pre class="lang:default decode:true">chmod -R 755 /var/log/rsyslog</pre>

Wchodzimy na nasz IP serwera w tym przypadku 192.168.0.1/loganalyzer/install.php i przechodzimy przez proces konfiguracji gdzie podajemy plik sysloga który ma być obrabiany /var/log/rsyslog/all.log

Tu trzeba sie zatrzymać i zapamiętać ze takich plików może być wiele np: serwery, switche, NAS. Ale o tym póżniej.

Loganalyzer powinien zgłosić:  
<span style="color: #ff0000;">Syslog file is not readable, read access may be denied</span>

Żeby nie było tak łatwo w RedHacie jest domyślnie włączony SELinux można zrobić setenforce 0 i będzie po kłopocie ale obniżanie bezpieczeństwa nie jest wyjściem wiec poniżej pokaże jak żyć z SELinuxem.

**Konfiguracja SELinux**

Na początek trzeba zainstalować przydatny pakiet do obsługi SELinux który będzie nam podpowiadał co robić.

<pre class="lang:default decode:true">yum install setroubleshoot</pre>

Sprawdzamy czy SELinux jest włączony:

<pre class="lang:default decode:true">getenforce
Enforcing</pre>

Jest włączony lecimy dalej

<span style="font-size: 14px; line-height: 1.5;">W logach /var/log/message można zobaczyć że SELinux zgłasza że serwer httpd nie ma uprawnień do naszego pliku all.log</span>

<pre class="lang:default highlight:0 decode:true">SYSLOG setroubleshoot: SELinux is preventing /usr/sbin/httpd from read access on the file /var/log/rsyslog/all.log. For complete SELinux messages. run sealert -l 030c1aa7-76fe-4588-a4e2-ae10a2b4be74</pre>

Postępujemy zgodnie z wiadomością

<pre class="lang:default highlight:0 decode:true">sealert -l 030c1aa7-76fe-4588-a4e2-ae10a2b4be74</pre>

SELinux podpowiada co mamy zrobić aby odblokować dostęp do pliku dla serwera www

<pre class="lang:default decode:true">grep httpd /var/log/audit/audit.log | audit2allow -M mypol
semodule -i mypol</pre>

Mamy dostęp do plików ale gdy zmienimy port np z 514 na 1514, SELinux też zablokuje tą akcje ponieważ domyślnym portem jest 514. I tak samo patrzymy w logach czy SELinux informuje nas jak nadać uprawnienia dla tego portu.

<pre class="lang:default highlight:0 decode:true">SYSLOG setroubleshoot: SELinux is preventing /sbin/rsyslogd from name_bind access on the udp_socket . For complete SELinux messages. run sealert -l aed7b30e-b878-43e4-a664-fc7a37670e98
semanage port -a -t PORT_TYPE -p udp 1514</pre>

<p class="lang:default decode:true">
  Wykonujemy akcje
</p>

<pre class="lang:default decode:true">semanage port -a -t syslogd_port_t -p udp 1514</pre>

Po każdej zmianie SELinux trzeba restartować usługę:

<pre class="lang:default decode:true">/etc/init.d/rsyslog restart</pre>

I to na tyle można cieszyć się serwerem syslog z interfejsem www.

Wspominałem że trzeba coś zapamiętać, chodzi o to że w LogAnalyzer możemy wybierać pliki które aktualnie analizujemy. Na pewno to pomoże przy dużej ilości klientów gdzie można rozdzielić sobie serwery np. od przełączników.

Źródłowe pliki konfiguruje się w pliku config.php w katalogu w którym leży loganalyzer przykład poniżej.

<pre class="lang:default decode:true">$CFG['DefaultSourceID'] = 'Source1';

$CFG['Sources']['Source1']['ID'] = 'Source1';
$CFG['Sources']['Source1']['Name'] = 'Switche';
$CFG['Sources']['Source1']['ViewID'] = 'SYSLOG';
$CFG['Sources']['Source1']['SourceType'] = SOURCE_DISK;
$CFG['Sources']['Source1']['LogLineType'] = 'syslog';
$CFG['Sources']['Source1']['DiskFile'] = '/var/log/rsyslog/switche.log';

$CFG['Sources']['Source2']['ID'] = 'Source2';
$CFG['Sources']['Source2']['Name'] = 'Serwery';
$CFG['Sources']['Source2']['ViewID'] = 'SYSLOG';
$CFG['Sources']['Source2']['SourceType'] = SOURCE_DISK;
$CFG['Sources']['Source2']['LogLineType'] = 'syslog';
$CFG['Sources']['Source2']['DiskFile'] = '/var/log/rsyslog/serwery.log';</pre>

<span style="font-size: 14px; line-height: 1.5;"> </span>