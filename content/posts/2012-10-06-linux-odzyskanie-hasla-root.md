---
title: Linux jak odzyskać hasło root ?
author: Przemek
type: post
date: 2012-10-06T17:34:19+00:00
url: /linux-odzyskanie-hasla-root/
bfa_virtual_template:
  - hierarchy
hits:
  - 1043
dsq_thread_id:
  - 1020249716
categories:
  - Linux
tags:
  - grub

---
Jak odzyskać hasło na root w systemie linux ?

<!--more-->

Sposób 1:

W menu Grub edytujemy linie kernel na końcu wpisujemy &#8222;1&#8221; (jako singleuser)  
Po poprawnym uruchomieniu i pojawiniu sie shella wyłączamy selinux:

<pre class="lang:default decode:true">setenforce 0
passwd</pre>

&nbsp;

Sposób 2:

W menu Grub edytujemy linie kernel na końcu wpisujemy init=/bin/bash  
po pojawieniu sie shella montujemy partycje z prawami do zapisu:

<pre class="lang:default decode:true">mount -a remount,rw /
passwd</pre>

&nbsp;