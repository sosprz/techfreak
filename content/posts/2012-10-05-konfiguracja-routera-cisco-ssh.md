---
title: Konfiguracja routera cisco – ssh
author: Przemek
type: post
date: 2012-10-05T20:00:22+00:00
url: /konfiguracja-routera-cisco-ssh/
featured_image: /wp-content/uploads/2012/10/cisco.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 1910
dsq_thread_id:
  - 1019624050
categories:
  - Network
tags:
  - Cisco
  - router

---
Jak włączyć ssh na routerze Cisco ?

<!--more-->

Sprawdzamy czy ssh jest włączone

<pre class="lang:default highlight:0 decode:true">show ip ssh</pre>

Jeśli nie to przystępujemy do konfiguracji

<pre class="lang:default highlight:0 decode:true">conf 
ip domain-name router1
hostname router1
crypto key generate rsa</pre>

Przy pytaniu o długość klucza wpisujemy 1024

Sprawdzamy ustawienia ssh:

<pre class="lang:default highlight:0 decode:true">show ip ssh</pre>

Następnie konfiguruje urzytkownika: login i haslo cisco

<pre class="lang:default highlight:0 decode:true">username cisco privilege 15 secret 0 cisco</pre>

pięć lini telnet:

<pre class="lang:default highlight:0 decode:true">line vty 0 4</pre>

poziom uprawnień:

<pre class="lang:default highlight:0 decode:true">privilege level 15</pre>

pobieraj loginy z lokalnej bazy:

<pre class="lang:default highlight:0 decode:true">login local</pre>

Cały ruch ma odbywać się po ssh:

<pre class="lang:default highlight:0 decode:true">transport input ssh</pre>

&nbsp;

&nbsp;

&nbsp;