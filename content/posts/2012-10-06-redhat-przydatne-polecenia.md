---
title: Redhat – przydatne polecenia
author: Przemek
type: post
date: 2012-10-06T17:36:53+00:00
url: /redhat-przydatne-polecenia/
featured_image: /wp-content/uploads/2012/10/redhat.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 318
dsq_thread_id:
  - 1020976036
categories:
  - Linux
tags:
  - redhat

---
Spis przydatnych poleceń dla systemy Redhat

<!--more-->

Listuje zainstalowane pakiety:

<pre class="lang:default decode:true">rpm -qa</pre>

Dodawanie do startupu RHEL:

<pre class="lang:default decode:true">chkconfig ntp on</pre>

Updatuje paczkę: -v krzyczy -h pokazuje:

<pre class="lang:default decode:true">rpm -Uvh pakiet.rpm</pre>

Czyści i buduje ponownie cache yum&#8217;a:

<pre class="lang:default decode:true">yum clean all
yum makecache</pre>

Listuje dostępne paczki z taka nazwa:

<pre class="lang:default decode:true">yum list available python26*</pre>

&nbsp;