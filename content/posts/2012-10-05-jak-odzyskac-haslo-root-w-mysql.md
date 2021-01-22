---
title: Jak odzyskać hasło root w MySQL ?
author: Przemek
type: post
date: 2012-10-05T11:43:33+00:00
url: /jak-odzyskac-haslo-root-w-mysql/
bfa_virtual_template:
  - hierarchy
hits:
  - 900
dsq_thread_id:
  - 1019161183
categories:
  - Linux
tags:
  - mysql

---
## Jak odzyskać hasło root na bazie danych Mysql ?

<!--more-->

Zatrzymanie bazy:

<pre class="lang:default highlight:0 decode:true">/etc/init.d/mysqld stop</pre>

Uruchomienie bazy bez hasla:

<pre class="lang:default highlight:0 decode:true">mysqld_safe --skip-grant-tables &</pre>

Logowanie do bazy:

<pre class="lang:default highlight:0 decode:true">mysql -u root</pre>

Użycie bazy mysql i wpisanie nowego hasła:

<pre class="lang:default highlight:0 decode:true">mysql&gt; use mysql;
mysql&gt; update user set password=PASSWORD("WRITE_NEW_PASSWORD") where User='root';
mysql&gt; flush privileges;
mysql&gt; quit</pre>

Zatrzymanie bazy:

<pre class="lang:default highlight:0 decode:true">/etc/init.d/mysqld stop</pre>

Start bazy:

<pre class="lang:default highlight:0 decode:true">/etc/init.d/mysqld start</pre>

Logowanie do bazy z nowym hasłem:

<pre class="lang:default highlight:0 decode:true">mysql -u root -p</pre>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;