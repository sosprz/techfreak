---
title: Replikacja w MYSQL
author: Przemek
type: post
date: 2012-11-20T10:21:52+00:00
url: /replikacja-w-mysql/
bfa_virtual_template:
  - hierarchy
hits:
  - 237
dsq_thread_id:
  - 1015673569
categories:
  - Linux
tags:
  - gentoo
  - mysql

---
Jak zrobić replikacje baz danych pomiędzy hostami ?

<!--more-->

Jeżeli chcemy kopiować (w locie) bazy danych/tabele na innego hosta to do tego możemy użyć replikacji. Replikacja to jak by aktualny backup naszej bazy na innym hoscie.  
W przypadku updatu tabeli na masterze wszystkie komendy wykonują się również na slave.(uwaga z funkcjami do generowania liczb)  
**I. Podstawowa instalacja serwera mysql**  
1) Konfiguracja serwera mysqld (master,slave):

<pre class="lang:pgsql decode:true"># /usr/bin/mysql_install_db
# /etc/init.d/mysql start
# /usr/bin/mysqladmin -u root password 'naszehaslo'</pre>

Łączymy się do serwera i zmieniamy ustawienia dot. połączenia (umożliwiamy łączenie się wszystkich hostów do naszego serwera)

<pre class="lang:pgsql decode:true"># mysql -u root -p
mysql&gt; update mysql.user set host='%' where host='localhost';
mysql&gt; FLUSH PRIVILEGES;
mysql&gt; quit</pre>

2) na serwerze master:  
Założenia: używamy silnika MyISAM  
Zmieniamy parametry pliku /etc/mysql/my.cnf na:

<pre class="lang:pgsql decode:true">bind-address                            = 0.0.0.0
log-bin                                 = mysql-bin
max_binlog_size                         = 40M
server-id                               = 1</pre>

Po zmianach w my.cnf robimy restart mysqld

<pre class="lang:pgsql decode:true"># /etc/init.d/mysql restart
# mysql -u root -p
mysql&gt; GRANT REPLICATION SLAVE ON *.* TO 'user-do-replikacji'@'%' IDENTIFIED BY 'nasze_haslo_do replikacji';
mysql&gt; show master status;</pre>

Zapamiętujemy: File oraz Position  
3) konfiguracja na serwerze slave:  
Zmieniamy parametry pliku /etc/mysql/my.cnf na:

<pre>bind-address                            = 0.0.0.0
log-bin
server-id                               = 2</pre>

Po zmianach w my.cnf robimy restart mysqld

<pre class="lang:pgsql decode:true">mysql&gt; CHANGE MASTER TO MASTER_HOST='host-mysql-master.example.net.pl', MASTER_USER='user-do-replikacji', MASTER_PASSWORD='nasze_haslo_do replikacji', MASTER_LOG_FILE='nazwa-plik-bin-log', MASTER_LOG_POS=numer-pozycji;
mysql&gt; START SLAVE;</pre>

4) Przydatne komendy:

<pre class="lang:pgsql decode:true">mysql&gt; show master statusG;
mysql&gt; show slave statusG;
mysql&gt; show VARIABLES;</pre>

**II. Zamiana serwera slava na master**  
1) na serwerze slave wykonujemy:

<pre># /etc/init.d/mysql stop
# rm -r /var/lib/mysql/</pre>

Potem czynności z Pkt. I Podpunkt 1 oraz 2.  
UWAGA: „server-id” na każdym serwerze muszą być unikatowe !!

**III. Połączanie kolejnego Slave:**  
Metoda ta jest w 1 kroku skomplikowana (chodzi o mastera) ale potem połączenie kolejnych slave&#8217;ów jest bardzo proste.  
1. Master:  
Trzeba do bin-loga zapisać wszystkie dane po swirzej instalacji mysql.  Zapamiętać pozycje po czystej instalacji(podstawowe rzeczy jak w I.1 oraz I.2)  
Wgrać dane z wcześniej zrobionego mysqldump&#8217;a.  
2. slave:  
Standardowo procedura jak I.1 oraz I.3 a pozycje wpisujemy jaka była mastera po świeżej instalacji.