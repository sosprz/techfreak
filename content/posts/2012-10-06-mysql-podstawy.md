---
title: MySql podstawy
author: Przemek
type: post
date: 2012-10-06T17:16:41+00:00
url: /mysql-podstawy/
bfa_virtual_template:
  - hierarchy
hits:
  - 268
dsq_thread_id:
  - 1018673939
categories:
  - Linux
tags:
  - mysql

---
Spis podstawowych komend dla Mysql

<!--more-->Logowanie do bazy:

<pre class="lang:default highlight:0 decode:true">mysql -u root -h localhost -p</pre>

Wyświetlanie dostępnych baz:

<pre class="lang:default highlight:0 decode:true">SHOW DATABASES;</pre>

Tworzenie bazy:

<pre class="lang:default highlight:0 decode:true">CREATE DATABASE baza1;</pre>

Wybór bazy:

<pre class="lang:default highlight:0 decode:true">USE baza1;</pre>

Wyświetlanie tabel:

<pre class="lang:default highlight:0 decode:true">SHOW TABLES;</pre>

Nadawanie uprawnień do baz:

<pre>GRANT ALL ON twoja_baza.* TO 'backup'@'localhost' IDENTIFIED BY 'b4ckup';</pre>

Backup bazy:

<pre class="lang:default highlight:0 decode:true">mysqldump -h localhost -u backup --password=haslo baza1 | gzip -9 &gt; /backup_bazy.gz</pre>

Mysql time zone:

<pre class="lang:default highlight:0 decode:true">nano etc/mysql/my.cnf

[mysqld_safe]
timezone = Europe/Warsaw</pre>

Sprawdzanie czasu:

<pre class="lang:default highlight:0 decode:true">SELECT NOW();</pre>

Skrypt robi dumpa bazy danych i wysyła maila na podany adres:

<pre>#! /bin/bash -x

db1="twoja_baza"
dir="/home/backup/mysql/"
name="mysql"
time=`date +%y%m%d`
mail=twoj@mail.pl

mkdir -p $dir$time
chmod -R 770 $dir$time
if mysqldump -h localhost -u backup --password=tajne_haslo $db1 | gzip -9 &gt; $dir$time/$name\_$time.gz
then echo "backup $db1 ok" &gt; $dir$time/info
else echo "backup $db1 failed" &gt;&gt; $dir$time/info
fi
du -sh $dir$time/$name\_$time.gz &gt; $dir$time/info
cat $dir$time/info |mail -s mysql_backup_stat $mail</pre>

&nbsp;