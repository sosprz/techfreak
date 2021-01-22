---
title: PostgreSQL podstawy
author: Przemek
type: post
date: 2012-10-06T17:27:56+00:00
url: /postgresql-podstawy/
bfa_virtual_template:
  - hierarchy
hits:
  - 834
dsq_thread_id:
  - 1032121729
categories:
  - Linux

---
Spis podstawowych komend dla PostgreSQL

<!--more-->

Logowanie do bazy postgres na użytkowniku postgres:

<pre class="lang:default highlight:0 decode:true">psql -d postgres -U postgres</pre>

Backup:

<pre class="lang:default highlight:0 decode:true">pg_dump dbname &gt; backup</pre>

Restore:

<pre class="lang:default highlight:0 decode:true">psql dbname &lt; backup</pre>

Backup gzip:

<pre class="lang:default highlight:0 decode:true">pg_dump dbname | gzip &gt; backup.gz</pre>

Restore gzip:

<pre class="lang:default highlight:0 decode:true">createdb dbnamegunzip -c backup.gz | psql dbname</pre>

lub

<pre class="lang:default highlight:0 decode:true">cat backup.gz | gunzip | psql dbname</pre>

Zmiana hasła:

<pre class="lang:default highlight:0 decode:true">ALTER USER Postgres WITH PASSWORD 'nowehaslo';</pre>

Logowanie do bazy bez hasła:

<pre class="lang:default highlight:0 decode:true">echo "hostname:port:database:username:password" &gt; ~/.pgpass</pre>

Jeśli damy * w polu database użytkownik który jest włąścicielem wszystkich baz bedzie mogł

się logować bez hasła do tych baz.

&nbsp;

&nbsp;