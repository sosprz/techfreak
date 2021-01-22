---
title: Iptables – dla stacji roboczej
author: Przemek
type: post
date: 2012-10-18T11:26:06+00:00
url: /iptables-dla-stacji-roboczej/
bfa_virtual_template:
  - hierarchy
hits:
  - 345
dsq_thread_id:
  - 1015666686
categories:
  - Linux
tags:
  - firewall

---
Jak stworzyć standardowe reguły firewalla na iptables dla stacji roboczej ?  
<!--more-->

Czyszczenie wszystkich reguł:

<pre class="lang:default highlight:0 decode:true">iptables -F
iptables -X
iptables -t nat -X
iptables -t nat -F</pre>

Default&#8217;owa polityka DROP:

<pre class="lang:default highlight:0 decode:true">iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP</pre>

Polityka puszczająca localhost:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -o lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT</pre>

Utrzymywanie połączenia nawiązane dla INPUT DROP:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED</pre>

Wpuszczamy wszystko z konkretnej sieci:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -s 83.83.83.83/29 -j ACCEPT</pre>

Wpuszczamy wszystkich na ftp:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p udp --dport 21 -j ACCEPT</pre>

Logujemy i wpuszczamy ssh z limitem na jedno pol. na sek.:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p tcp --dport 22 -j LOG --log-prefix "SSH_"
iptables -A INPUT -m limit --limit 1/second -p tcp --dport 22 -j ACCEPT</pre>

Logujemy i umożliwiamy pingowanie:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p icmp --icmp-type echo-request -j LOG --log-prefix "icmp_"
iptables -A INPUT -s 192.168.1.1 -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP</pre>

Logujemy i umożliwiamy pingowanie:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p tcp --dport 80 -j LOG --log-prefix "www-tcp_"
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p udp --dport 80 -j LOG --log-prefix "www-udp_"
iptables -A INPUT -p udp --dport 80 -j ACCEPT</pre>

Logujemy i blokujemy skanowanie portów:

1. nmap -sS /skanowanie portów:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j LOG --log-prefix "SKANOWANIE SYN_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j DROP</pre>

2. nmap -sA /filt pakietów:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j LOG --log-prefix "SKANOWANIE FILTR_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j DROP</pre>

3. nmap -sF:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j LOG --log-prefix "SKANOWANIE3_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j DROP</pre>

4. nmap -sX / Xmas Tree:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN,URG,PSH -j LOG --log-prefix "SKANOWANIE xmas_"
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN,URG,PSH -j DROP</pre>

&nbsp;

Syn-flood protection:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT</pre>

Furtive port scanner:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT</pre>

Ping of death:

<pre class="lang:default highlight:0 decode:true">iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT</pre>

SYN flood protection:

<pre class="lang:default highlight:0 decode:true">echo "1" &gt; /proc/sys/net/ipv4/tcp_syncookies</pre>

Wyłączamy odpowiedzi na pingi:

<pre class="lang:default highlight:0 decode:true">echo "1" &gt; /proc/sys/net/ipv4/icmp_echo_ignore_all</pre>

Ochrona przed atakami typu Smurf:

<pre class="lang:default highlight:0 decode:true">echo "1" &gt; /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts:</pre>

Włączamy ochronę przed komunikacją ICMP error:

<pre class="lang:default highlight:0 decode:true">echo "1" &gt; /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses</pre>

Włącza logowanie dźiwnych pakietów (spoofed. source routed. redirects):

<pre class="lang:default highlight:0 decode:true">echo "0" &gt; /proc/sys/net/ipv4/conf/all/log_martians</pre>

Nie akceptujemy datagramu IP z opcją &#8222;source route&#8221;:

<pre class="lang:default highlight:0 decode:true">echo "0" &gt; /proc/sys/net/ipv4/conf/all/accept_source_route</pre>

Nie przyjmujemy pakietów ICMP redict, które mogą zmienić naszą tablicę routingu:

<pre class="lang:default highlight:0 decode:true">echo "0" /proc/sys/net/ipv4/conf/all/accept_redirects</pre>

Wszystkie karty nie bedą przyjmowały pakietów z sieci innych niż te z tablicy routingu:

<pre class="lang:default highlight:0 decode:true">echo "0" /proc/sys/net/ipv4/conf/all/rp_filter</pre>

&nbsp;

&nbsp;