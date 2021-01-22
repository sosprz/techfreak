---
title: hasło na stronę www przy pomocy htaccess
author: Przemek
type: post
date: 2012-01-10T07:47:27+00:00
url: /haslo-na-strone-www-przy-pomocy-htaccess/
bfa_virtual_template:
  - hierarchy
hits:
  - 139
dsq_thread_id:
  - 1017676580
categories:
  - Linux
tags:
  - serwery www

---
<!--more--> Zakładanie loginu i hasła dla serwera Apache w .htaccess:

<pre class="lang:default decode:true crayon-selected">htpasswd -bc /etc/apache2/htpasswd nowy_login haslo</pre>

Tworzenie dostępów na login i hasło w .htaccess:

<pre class="lang:default decode:true">AuthUserFile /etc/apache2/htpasswd
AuthGroupFile /dev/null
AuthName "Password Protected Area"
AuthType Basic
Require user nowy_login</pre>