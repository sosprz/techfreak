---
title: Jak ustawić dostęp do strony www na podstawie certyfikatu ?
author: Przemek
type: post
date: 2012-10-08T07:02:57+00:00
url: /jak-ustawic-dostep-do-strony-www-na-podstawie-certyfikatu/
bfa_virtual_template:
  - hierarchy
hits:
  - 302
dsq_thread_id:
  - 1018509095
categories:
  - Linux
tags:
  - certyfikaty
  - serwery www

---
Jak ustawić dostęp do strony www na podstawie certyfikatu ? (działa z Androidem)

<!--more-->

Całość realizowana na Apache2.

Na początek generujemy certyfikaty:

**Generowanie CA:**

<pre class="lang:default highlight:0 decode:true">openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -out ca.csr
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt</pre>

**Generowanie Certyfikatu dla klienta:**

<pre class="lang:default highlight:0 decode:true">openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr</pre>

**Podpisywanie Certyfikatu Klienta certyfikatem CA:**

<pre class="lang:default highlight:0 decode:true">openssl x509 -req -days 365 -CA ca.crt -CAkey ca.key -CAcreateserial -in client.csr -out public_client.crt</pre>

**Certyfikat końcowy podpisany przez nasze ca i zabezpieczony hasłem:**

<pre class="lang:default highlight:0 decode:true">openssl pkcs12 -export -clcerts -in public_client.crt -inkey client.key -out public_client.p12</pre>

**W pliku konfiguracyjnym ssl wskazujemy gdzie leży nasze CA.**

I włączamy weryfikacje certyfikatu po stronie serwera czyli wrzucamy poniższe linie do sekcji naszego virtualhosta:

<pre class="lang:default highlight:0 decode:true">SSLCACertificateFile /etc/ssl/private/ca.crt
SSLRequireSSL
SSLVerifyClient require
SSLVerifyDepth 10</pre>

&nbsp;

Następnie instalujemy w przeglądarce końcowy certyfikat &#8222;public_client.p12&#8221;

i sprawdzamy czy mamy dostęp do zabezpieczonej strony.

&nbsp;

&nbsp;