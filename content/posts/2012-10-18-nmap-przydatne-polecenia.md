---
title: nmap przydatne polecenia
author: Przemek
type: post
date: 2012-10-18T09:47:03+00:00
url: /nmap-przydatne-polecenia/
bfa_virtual_template:
  - hierarchy
hits:
  - 375
dsq_thread_id:
  - 1023758720
categories:
  - Network

---
Jak korzystać z nmap, skanera sieciowego ?

<!--more-->

Przydatne polecenia dla sieciowego skanera nmap

Protocol list

<pre class="lang:default highlight:0 decode:true">nmap -P0 1.1.1.1</pre>

Nmap ping scan

<pre class="lang:default highlight:0 decode:true">namp -sP 1.1.1.1-5</pre>

Wykrywanie confickera:

<pre class="lang:default highlight:0 decode:true">nmap -p 139,445 -T4 -v -n -PN --script smb-check-vulns,smb-os-discovery --script-args safe=1 10.0.0.1</pre>

Agresywne skanowanie, pokazuje MAC karty sieciowej

<pre class="lang:default highlight:0 decode:true">nmap -PN -A -v 10.0.0.1

nmap -T Aggressive -A -v 192.x.x</pre>

&nbsp;