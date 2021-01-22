---
title: Wyświetlanie Informacji o użytkownikach
author: Przemek
type: post
date: 2011-01-14T05:58:09+00:00
url: /informacje-o-uzytkownikach/
bfa_virtual_template:
  - hierarchy
hits:
  - 96
dsq_thread_id:
  - 1026667724
categories:
  - Linux

---
Przydatne polecenia wyświetlające informacje o użytkownikach w systemie linux

<pre class="lang:default decode:true ">logname
whoami
id
who -l
who -u
users
finger
last
history</pre>

<!--more-->

### Przykłady użycia:

Historia bash czyszczenie ostatniego polecenia:

<pre class="lang:default decode:true ">ls && history -d $((HISTCMD-2))</pre>

&nbsp;

Historia bash czyszczenie aktualnego polecenia:

<pre class="lang:default decode:true ">ls && history -d $((HISTCMD-1))</pre>

&nbsp;

Historia bash czyszczenie

<pre class="lang:default decode:true ">history -c</pre>

&nbsp;

Historia bash wyświetlanie ostatnich 5 lini:

<pre class="lang:default decode:true ">history 5</pre>

&nbsp;

Ostatnie logowanie:

<pre class="lang:default decode:true ">last -1 (# last pokazuje wszytkie logowania)</pre>

&nbsp;