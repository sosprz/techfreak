---
title: host – jak przeszukiwać DNS ?
author: Przemek
type: post
date: 2012-10-18T10:46:30+00:00
url: /narzedzia-dns-host/
bfa_virtual_template:
  - hierarchy
hits:
  - 97
dsq_thread_id:
  - 1023657763
categories:
  - Linux
tags:
  - dns

---
Jak przeszukiwać, sprawdzać DNS przy pomocy host ?

<!--more-->

Jak sprawdzić ip dla hosta ?

<pre class="lang:default highlight:0 decode:true">host -t a h4ckm3.org</pre>

Jak sprawdzić serwery nazw dla hosta:

<pre class="lang:default highlight:0 decode:true">host -t ns domena.pl</pre>

Jak sprawdzić serwery poczty dla hosta:

<pre class="lang:default highlight:0 decode:true">host -t mx domena.pl</pre>

&nbsp;