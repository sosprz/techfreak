---
title: iperf – narzędzie do pomiaru przepustowości łącza, sieci
author: Przemek
type: post
date: 2012-10-04T07:09:15+00:00
url: /iperf-narzedzie-do-pomiaru-przepustowosci-lacza-sieci/
bfa_virtual_template:
  - hierarchy
hits:
  - 591
dsq_thread_id:
  - 1026033014
colormag_page_layout:
  - default_layout
categories:
  - Network

---
Jak zmierzyć przepustowość łącza na systemie linux ?

<!--more-->

Na zdalnym hoście uruchamiam iperf -s czyli tryb serwera (nasłuchu)

<pre class="lang:default highlight:0 decode:true">iperf -s</pre>

Na lokalnym hoscie uruchamiam z opcja -c czyli klienta

<pre class="lang:default highlight:0 decode:true">iperf -c hostIP</pre>

Aby zwiększyć czas wykonywanego testu do 5 min uruchamiam iperf z opcja -t

<pre class="lang:default highlight:0 decode:true">iperf -c hostIP -t 300</pre>

Aby zwiększyć ilość równoległych połączeń używam iperf z opcja -P

<pre class="lang:default highlight:0 decode:true">iperf -c hostIP -t 300 -P 10</pre>