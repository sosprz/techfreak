---
title: Iptables – redirect portów, przekierowanie portów
author: Przemek
type: post
date: 2012-10-06T10:16:43+00:00
url: /iptables-redirect-portow-przekierowanie-portow/
bfa_virtual_template:
  - hierarchy
hits:
  - 3280
dsq_thread_id:
  - 1015741337
categories:
  - Linux
tags:
  - firewall
  - router

---
Jak ustawić przekierowanie portów na iptables ?

<!--more-->

Przekierowanie kazdego adresu IP łączącego sie na port 8080 na port 80

<pre class="lang:default highlight:0 decode:true">iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j REDIRECT --to-port 80</pre>

Przekierowanie kazdego adresu IP łączącego sie na adres IP 83.83.83.83 na port 8080 na hosta w sieci lokalnej 192.168.1.2 na port 80

<pre class="lang:default highlight:0 decode:true">iptables -t nat -A PREROUTING -i eth0 -p tcp -d 83.83.83.83 --dport 8080 -j DNAT --to 192.168.1.2:80</pre>

Przekierowanie wybranego adresu IP 82.82.82.82 łączącego sie na adres IP 83.83.83.83 na port  8080 na hosta w sieci lokalnej 192.168.1.2 na port 80

<pre class="lang:default highlight:0 decode:true">iptables -t nat -A PREROUTING -i eth0 -p tcp -s 82.82.82.82 -d 83.83.83.83 --dport 8080 -j DNAT --to 192.168.1.2:80</pre>

&nbsp;