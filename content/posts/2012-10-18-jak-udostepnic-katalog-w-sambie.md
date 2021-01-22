---
title: Jak udostępnić katalog w sambie ?
author: Przemek
type: post
date: 2012-10-18T09:56:12+00:00
url: /jak-udostepnic-katalog-w-sambie/
bfa_virtual_template:
  - hierarchy
hits:
  - 528
dsq_thread_id:
  - 1017928902
categories:
  - Linux

---
Jak udostępnić katalog ze swojego komputera przy pomocy samby ?

<!--more-->

Trzeba stworzyć przykładowy folder file:

<pre class="lang:default highlight:0 decode:true">mkdir /file</pre>

Sprawdzenie uprawnień Selinux:

<pre class="lang:default highlight:0 decode:true">ls -ldZ /file
drwxrwxr-x. root users unconfined_u:object_r:default_t:s0 /file</pre>

Nadawanie uprawnienia samba\_share\_t (informacja wyciagnieta z komentarza w pliku smb.conf)

<pre class="lang:default highlight:0 decode:true">chcon -t samba_share_t /file</pre>

Sprawdzanie uprawnień SElinux

<pre class="lang:default highlight:0 decode:true">ls -ldZ /file
drwxrwxr-x. root users unconfined_u:object_r:samba_share_t:s0 /file</pre>

Nadawanie uprawnień:

<pre class="lang:default highlight:0 decode:true">chmod -R 775 /file
chown -R root.users /file</pre>

Dodawanie do grupy users, tworzenie loginów, haseł do systemu i samby:

<pre class="lang:default highlight:0 decode:true">adduser user
gpasswd -a user users
smbpasswd user</pre>

nano /etc/samba/smb.conf

<pre class="lang:default highlight:0 decode:true">[global]
workgroup = MYGROUP
server string = Samba Server Version %v
log file = /var/log/samba/log.%m
max log size = 50
security = user
passdb backend = tdbsam

[file]
comment = Public Stuff
path = /file
public = yes
writable = yes
printable = no</pre>

Restart samby

<pre class="lang:default highlight:0 decode:true">/etc/init.d/smb restart</pre>

Sprawdzanie konfiguracji samby:

<pre class="lang:default highlight:0 decode:true">testparm</pre>

&nbsp;