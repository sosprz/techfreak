---
title: Jak wyświetlić zawartość certyfikatu ?
author: Przemek
type: post
date: 2012-10-18T09:50:44+00:00
url: /jak-wyswietlic-zawartosc-certyfikatu/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1018108312
hits:
  - 381
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - certyfikaty
  - ssl

---
Jak sprawdzić właściwości i wyświetlić zawartość certyfikatu np: ze strony z https ?

<!--more-->

Wyświetlanie zawartości certyfikatu:

<pre>openssl x509 -in public_client.crt -text</pre>

Wyświetlanie zawartości certyfikatu zdalnego:

<pre>openssl s_client -connect pop3.wp.pl:995</pre>

&nbsp;