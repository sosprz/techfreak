---
title: statystyki wejść na stronę www przy pomocy awstats
author: Przemek
type: post
date: 2012-01-10T10:10:18+00:00
url: /statystyki-wejsc-na-strone-www-przy-pomocy-awstats/
bfa_virtual_template:
  - hierarchy
hits:
  - 294
dsq_thread_id:
  - 1035011325
categories:
  - Linux
tags:
  - serwery www

---
## Jak włączyć statystyki wejść na stronę AWstats ?

<!--more-->

Apache2 + fajne statystyki wejść awstats:  
Do vhosta z którego chcemy logować statystyki wpisujemy:  
CustomLog /var/log/apache2/domenka.pl.access.log combined

Tworzymy plik konfiguracyjny awstat dla strony:

<pre class="lang:default decode:true">cp /etc/awstats/awstats.conf /etc/awstats/awstats.domenka.pl.conf</pre>

W pliku awstata wygenerowanego wyżej wpisujemy:

<pre class="lang:default decode:true">LogFile="/var/log/apache2/domenka.pl.access.log"
LogFormat = 1
SiteDomain="domenka.pl"</pre>

Tworzymy nowego vhosta na innym porcie np:81 dostępnego np: tylko z jednego ip:

<pre class="lang:default decode:true">&lt;VirtualHost *:81&gt;
ServerName localhost
&lt;IfModule mpm_peruser_module&gt;
ServerEnvironment apache apache
&lt;/IfModule&gt;
Alias /awstatsclasses "/usr/share/awstats/lib/"
Alias /awstats-icon/ "/usr/share/awstats/icon/"
Alias /awstatscss "/usr/share/doc/awstats/examples/css"
ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
ScriptAlias /awstats/ /usr/lib/cgi-bin/
Options ExecCGI -MultiViews +SymLinksIfOwnerMatch
&lt;directory "/usr/lib/cgi-bin/"&gt;
Options ExecCGI
AllowOverride None
&lt;ifmodule mod_access.c&gt;
Order allow,deny
Allow from all
&lt;/ifmodule&gt;
&lt;/directory&gt;
ScriptAlias /awstats /usr/lib/cgi-bin/awstats.pl
ScriptAlias /awstats.pl /usr/lib/cgi-bin/awstats.pl
&lt;/VirtualHost&gt;</pre>

Aktualizujemy logi najlepiej wrzucić do crona:

<pre class="lang:default decode:true">/usr/lib/cgi-bin/awstats.pl -config=domenka.pl -update</pre>

Następnie możemy oglądać statystyki pod adresem:

 **http://domenka.pl:81/awstats.pl?config=domenka.pl**