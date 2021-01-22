---
title: Jak wykorzystać port com jako konsole ?
author: Przemek
type: post
date: 2012-10-03T10:46:21+00:00
url: /jak-wykorzystac-port-com-jako-konsole/
bfa_virtual_template:
  - hierarchy
hits:
  - 150
dsq_thread_id:
  - 1017589558
categories:
  - Linux
tags:
  - grub

---
<!--more-->

Wykorzystać port com jako konsole to przydatna rzecz gdy mamy serwer bez monitora i chcemy podłączyć się do terminala.

Można zastosować do tego kabel DB9 lub moduł &#8222;serial to ethernet&#8221; aby mieć zdalny &#8222;fizyczny&#8221; dostęp do maszyny.

Wystarczy wyedytować dwa pilki: grub.conf i inittab.

Warto skonfigurować gruba bo może nastąpić taka sytuacja że maszyna nie będzie uruchamiać się z żądanego jadra a w takim przypadku po restarcie fizycznym  jesteśmy w stanie wejść przez konsole do gruba i wystartować maszynę z innego jądra.

Natomiast inittab uruchamia konsole na porcie com po starcie kernela.

**GRUB**

nano /boot/grub/grub.conf

Dwie linie poniżej haszujemy:

<pre class="lang:default highlight:0 decode:true">#splashimage=(hd0,0)/grub/splash.xpm.gz
#hiddenmenu</pre>

Dwie linie dodajemy:

<pre class="lang:default highlight:0 decode:true">serial --unit=0 --speed=115200
terminal --timeout=8 console serial</pre>

Na końcu każdego kernela dodajemy &#8222;console=tty0 console=ttyS0,115200n8&#8221;

<pre class="lang:default highlight:0 decode:true">title CentOS (2.6.32-220.4.1.el6.i686)
	root (hd0,0)
	kernel /vmlinuz-2.6.32-220.4.1.el6.i686 console=tty0 console=ttyS0,115200n8</pre>

**inittab**

nano /etc/inittab

<pre class="lang:default highlight:0 decode:true">1:12345:respawn:/sbin/agetty -h -L ttyS0 115200 vt100</pre>

&nbsp;

**INFO:** 

ttyS0 to com1, ttyS1 to com2

<span style="color: #ff0000;">Przez dostęp do gruba można zmienić hasło na root metodą singleuser lub init=/bin/bash</span>

ale na <span style="color: #008000;">grub można założyć hasło</span>

&nbsp;

&nbsp;

&nbsp;