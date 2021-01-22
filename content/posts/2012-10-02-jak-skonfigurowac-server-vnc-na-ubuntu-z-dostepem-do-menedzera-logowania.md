---
title: Jak skonfigurować server VNC na ubuntu z dostepem do menedzera logowania ?
author: Przemek
type: post
date: 2012-10-02T17:41:04+00:00
url: /jak-skonfigurowac-server-vnc-na-ubuntu-z-dostepem-do-menedzera-logowania/
bfa_virtual_template:
  - hierarchy
hits:
  - 1271
dsq_thread_id:
  - 1017961821
categories:
  - Linux
tags:
  - ubuntu

---
Jak skonfigurować VNC aby łączyć się do nie zalogowanego komputera np. po restarcie ?

<!--more-->

**Instalacja paczek i tworzenie nowego pliku:**

<pre class="lang:default highlight:0 decode:true">apt-get install xinetd x11vnc
touch /etc/xinetd.d/x11vnc 
mcedit /etc/xinetd.d/x11vnc</pre>

**Edycja pliku x11vnc:**

nano /etc/xinetd.d/x11vnc

<pre class="lang:default highlight:0 decode:true">service x11vnc
{
  type = UNLISTED
  disable = no
  socket_type = stream
  protocol = tcp
  wait = no
  user = root
  server = /usr/bin/x11vnc
  server_args = -inetd -o /var/log/x11vnc.log -display :0 -forever -bg -rfbauth /etc/vncpasswd -shared -enablehttpproxy -forever -nolookup -auth /var/run/lightdm/root/:0    
  port = 5900
  flags = IPv6
}</pre>

Nadanie uprawnień i hasło do vnc:

<pre class="lang:default highlight:0 decode:true">chmod a+x /etc/xinetd.d/x11vnc
x11vnc -storepasswd "tu wpisz hasło vnc" /etc/vncpasswd</pre>

&nbsp;