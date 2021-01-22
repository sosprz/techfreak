---
title: Jak włączyć proxy w RedHat dla repozytorium i jak korzystać z proxy ?
author: Przemek
type: post
date: 2012-10-03T20:57:35+00:00
url: /jak-wlaczyc-proxy-w-redhat-dla-repozytorium-i-jak-korzystac-z-proxy/
featured_image: /wp-content/uploads/2012/10/redhat.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 242
dsq_thread_id:
  - 1022489654
categories:
  - Linux
tags:
  - proxy
  - redhat

---
Jak włączyć proxy dla systemu Redhat ?

<!--more-->

Edytujemy plik w którym definiujemy proxy dla repozytorium redhata:

<pre class="nums:false lang:default highlight:0 decode:true">nano /etc/sysconfig/rhn/up2date</pre>

<pre class="lang:default highlight:0 decode:true">enableProxy[comment]=Use a HTTP Proxy
enableProxy=1

proxyPassword[comment]=The password to use for an authenticated proxy
proxyPassword=wpisz hasło dla proxy lub zostaw puste

proxyUser[comment]=The username for an authenticated proxy
proxyUser=wpisz login dla proxy lub zostaw puste

httpProxy[comment]=HTTP proxy in hostort format, e.g. squid.redhat.com:3128
httpProxy=wpisz IP serwera proxy i port 

enableProxyAuth[comment]=To use an authenticated proxy or not
enableProxyAuth=0</pre>

Następnie sprawdzamy czy możemy się zarejestrować w redhat:

<pre class="lang:default highlight:0 decode:true">rhn_register</pre>

&nbsp;

Aby użyć proxy np. dla wget:

<pre class="lang:default highlight:0 decode:true">http_proxy=squid.redhat.com:3128 wget http://speedtest.wdc01.softlayer.com/downloads/test500.zip</pre>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;