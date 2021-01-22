---
title: Jak wygenerować certyfikat ssl ?
author: Przemek
type: post
date: 2012-10-08T10:52:14+00:00
url: /jak-wygenerowac-certyfikat-ssl/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1021512886
hits:
  - 501
xyz_fbap:
  - 1
categories:
  - Linux
tags:
  - certyfikaty
  - ssl

---
Jak wygenerować własny certyfikat ?

<!--more-->

Generowanie klucza prywatnego:

<pre class="lang:default highlight:0 decode:true">openssl genrsa -des3 -out domena.key 1024</pre>

Usunięcia hasła z klucza prywatnego:

<pre class="lang:default highlight:0 decode:true">openssl rsa -in domena.key -out domena-new.key</pre>

Generowanie CSR według prywatnego klucza RSA:

<pre class="lang:default highlight:0 decode:true">openssl req -new -key domena-new.key -out domena.csr</pre>

Country Name (C) &#8211; dwuliterowy symbol kraju. np: PL.  
State or Province Name (ST) &#8211; nazwa województwa. np: Pomorskie.  
Locality Name (L) &#8211; nazwa miejscowości. np: Gdansk.  
Organization Name (O) &#8211; nazwa organizacji, firmy. np: lnxadmin.pl  
Organizational Unit Name (OU) &#8211; nazwa działu, np: IT  
Common Name (CN) &#8211; Pełna nazwa domenowa (FQDN) serwera.

Dla https://www.domena.pl pole Common Name powinno mieć wartość: www.moja-domena.pl  
Dla https://\*.domena.pl (wildcard) Pole Common Name powinno mieć wartość: \*.domena.pl

Email (e-mail) &#8211; mail@domena.pl

Nie musisz podawać dodatkowych informacji (extra attributes).

Weryfikacja zawartość pliku CSR:

<pre class="lang:default highlight:0 decode:true">openssl req -noout -text -in domena.csr</pre>

Weryfikaja zawartośći klucza prywatnego:

<pre class="lang:default highlight:0 decode:true">openssl rsa -noout -text -in domena.key</pre>

Treaz albo wysyłamy CRS do podpisania przez zewnetrzny urząd certyfikujący lub podpisujemy go sami na rok:

<pre class="lang:default highlight:0 decode:true">openssl x509 -req -days 365 -in domena.csr -signkey domena-new.key -out domena.crt</pre>

Jeśli potrzebujemy pfx&#8217;a:

<pre class="lang:default highlight:0 decode:true">openssl pkcs12 -export -inkey domena-new.key -in domena.crt -out domena.pfx</pre>

Jesli potrzebujemy pfx z root chain

<pre>openssl pkcs12 -export -out domena.pfx -inkey private.key -in certificate.crt -certfile all.ca</pre>

Jeśli potrzebujemy pem&#8217;a:

<pre class="lang:default highlight:0 decode:true">openssl x509 -in domena.crt -out domena.der -outform DER
openssl x509 -in domena.der -inform DER -out domena.pem -outform PEM</pre>

&nbsp;

&nbsp;