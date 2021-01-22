---
title: Zdalna synchronizacja katalogów poprzez rsync
author: Przemek
type: post
date: 2012-10-08T12:15:50+00:00
url: /zdalna-synchronizacja-katalogow-poprzez-rsync/
featured_image: /wp-content/uploads/2012/10/rsync_kompia_bezpieczenstwa_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 577
dsq_thread_id:
  - 1015666876
categories:
  - Linux
tags:
  - Backup
  - bash
  - rsync

---
Poniżej opis jak zrobić zdalny backup, czyli np. jak synchronizować zdalnie dwa katalogi przy pomocy rsync.

<!--more-->

<strong style="line-height: 1.5em;">Na host A:</strong>

Edytuj /etc/rsync.conf

<pre class="lang:default highlight:0 decode:true">[all]
path = /
use chroot = yes
uid = root
gid = root
auth users = backup
secrets file = /etc/rsyncd.pwd
hosts allow = 10.0.0.0/24
read only = yes</pre>

Nadajemy uprawnienia (wymagane):

<pre class="lang:default highlight:0 decode:true">chmod 700 /etc/rsyncd.pwd</pre>

Edytujemy plik z loginem i hasłem:

Edytuj /etc/rsyncd.pwd

<pre class="lang:default highlight:0 decode:true">backup:backup</pre>

&nbsp;

**Host B:**  
Opcja pierwsza:

<pre class="lang:default highlight:0 decode:true"># rsync -av backup@10.0.0.1::all/etc/ /backup/host/etc</pre>

Podajemy hasło: backup

&nbsp;

Jak zrobić aby nie trzeba było podawać hasła? rozwiązane poniżej:

<pre class="lang:default highlight:0 decode:true">touch /etc/rsync.backup
chmod 700 /etc/rsync.backup
echo "backup" &gt; /etc/rsync.backup
rsync -av backup@10.0.0.1::all/etc/ /backup/host/etc --password-file=/etc/rsync.backup</pre>

Podgląd struktury katalogów na zdalnym hoście:

<pre class="lang:default highlight:0 decode:true">rsync -Rnv backup@10.0.0.1::all</pre>

&nbsp;

&nbsp;