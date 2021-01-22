---
title: Instalacja freeradius i gui daloradius na RedHat 6
author: Przemek
type: post
date: 2013-03-30T09:01:23+00:00
url: /instalacja-freeradius-i-gui-daloradius-na-redhat-6/
featured_image: /wp-content/uploads/2013/03/freeradius_daloradius_642_362_force.jpg
hits:
  - 835
dsq_thread_id:
  - 1175645119
categories:
  - Linux
tags:
  - radius
  - redhat

---
Tym razem potrzebowałem serwera radius + jakiś www interface. Poniżej moja konfiguracja.

<!--more-->

### Instalacja freeradius, mysql serwer + php

<pre class="lang:default highlight:0 decode:true">yum install freeradius-mysql
yum install freeradius-utils
yum install mysql-server php-mysql php</pre>

Trzeba dodać radiusa do automatycznego uruchamiania przy starcie w tym celu trzeba przejść do ntsysv i tam dodać radiusd.

<pre class="lang:default highlight:0 decode:true">ntsysv</pre>

### Konfiguracja MySql

<pre class="lang:default highlight:0 decode:true">/etc/init.d/mysql start
/usr/bin/mysqladmin -u root password 'tajne'</pre>

Trzeba założyć bazę dla radiusa i nadać uprawnienia dla użytkownika radius hasło radpass

<pre class="lang:default decode:true">CREATE DATABASE radius;
GRANT ALL ON radius.* TO radius@localhost IDENTIFIED BY "radpass";
exit</pre>

Bazę trzeba wypchać tabelkami

<pre class="lang:default decode:true">cd /etc/raddb/sql/mysql/
mysql -uroot -p radius &lt; schema.sql</pre>

### Konfiguracja radiusa

Trzeba upewnić się że w pliku /etc/raddb/radiusd.conf jest odchaszaowana linia:

<pre class="lang:default decode:true">$INCLUDE sql.conf</pre>

Trzeba upewnić się że w pliku /etc/raddb/sites-enabled/default jest odchaszaowana linia:

<span style="font-size: 14px; line-height: 1.5;">w sekcji:</span>

<pre class="lang:default decode:true">authorize {

sql

}</pre>

Ustalamy hasło dla klientów w pliku  /etc/raddb/clients.conf

dla localhost:

<pre class="lang:default decode:true">secret = tajnehaslo</pre>

dla sieci 192.168.0.0

<pre class="lang:default decode:true">client 192.168.0.0/24 {
secret = tajnehaslo
}</pre>

### Testowanie czy działa radius z mysql

Dodajemy do bazy użytkownika test z hasłem tajnehaslo

<pre class="lang:default decode:true">mysql&gt; INSERT INTO radcheck (UserName, Attribute, Value) VALUES ('test', 'Password', 'tajnehaslo');
mysql&gt; INSERT INTO radcheck (UserName, Attribute, Value) VALUES ('test', 'Auth-Type', 'Local');</pre>

Uruchamiamy radius w trybie debug

<pre>radiusd -X</pre>

Poleceniem radtest sprawdzamy czy radius pobiera dane z mysql

<pre class="lang:default decode:true">radtest test password RADIUS 10 secret</pre>

W moim przypadku było potrzebne GUI (radius www interface). Najwygodniejszym chyba jest <a href="http://www.daloradius.com/" target="_blank">daloradius</a>.

Aby daloradius ruszył trzeba go ściągnąć i wrzucić do katalogu /var/www/html/ ale po zainstalowaniu serwera www

<pre class="lang:default decode:true">yum install httpd</pre>

Dalej trzeba skonfigurować daloradiusa czyli wpisać dane do bazy mysql itd.

Jedyną paczką bez której nie działał mi interfejs www była pear DB

<pre class="lang:default decode:true">pear install DB</pre>

<span style="font-size: 14px; line-height: 1.5;">Potem można było bez problemu wchodzić na stronę i konfigurować daloradius. </span>

http://192.168.0.1/daloradius/

[<img class="aligncenter size-full wp-image-2659" alt="freeradius_daloradius_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/03/freeradius_daloradius_642_362_force.jpg" width="642" height="362" />][1]

 [1]: http://techfreak.pl/wp-content/uploads/2013/03/freeradius_daloradius_642_362_force.jpg