---
title: Netcat – przydatne zadania
author: Przemek
type: post
date: 2012-10-03T17:36:04+00:00
url: /netcat-przydatne-zadania/
bfa_virtual_template:
  - hierarchy
hits:
  - 187
dsq_thread_id:
  - 1018718771
categories:
  - Linux
tags:
  - serwery www

---
## Netcat &#8211; lista przydatnych zadań

<!--more-->

http serwer

<pre class="lang:default highlight:0 decode:true">#!/bin/bash
handle_req()
{
        read req file proto
        echo -e "HTTP/1.1 200 OKrnContent-Type: text/htmlrnrn"
        echo -e "&lt;html&gt;&lt;h1&gt;Hello World&lt;/h1&gt;&lt;/html&gt;"
}
typeset -fx handle_req
nc -l -p 8080 -c handle_req</pre>

&nbsp;

remote terminal

serwer:

<pre class="lang:default decode:true">nc -l -p 4000 -e /bin/sh</pre>

klient:

<pre class="lang:default highlight:0 decode:true">nc ip_host 4000</pre>

&nbsp;

czat  
serwer:

<pre class="lang:default highlight:0 decode:true">nc -lp 8080</pre>

klient:

<pre class="lang:default highlight:0 decode:true">nc ip_host 8080</pre>

&nbsp;

file transfer  
serwer:

<pre class="lang:default highlight:0 decode:true">cat plik | nc -l -p 4000</pre>

klient:

<pre class="lang:default highlight:0 decode:true">nc ip_hosta 4000 &gt; plik</pre>

Zródło: <a href="http://ubuntuforums.org/showthread.php?t=828870" target="_blank">ubuntuforums.org</a>

&nbsp;

&nbsp;

&nbsp;

&nbsp;