---
title: ssh – jak logować się bez hasła ?
author: Przemek
type: post
date: 2012-10-08T07:18:51+00:00
url: /ssh-jak-logowac-sie-bez-hasla/
bfa_virtual_template:
  - hierarchy
hits:
  - 368
dsq_thread_id:
  - 1025091840
categories:
  - Linux

---
Jak logować się poprzez ssh bez hasła ?

<!--more-->

### SSH bez hasła sposób 1:

Na host wykonaj A:

<pre class="lang:default highlight:0 decode:true">ssh-keygen -t rsa

3x enter
ssh-keygen -t rsa - tworzy w /home/user/.ssh/ dwa pliki: id_rsa i id_rsa.pub</pre>

Kopiujemy id_rsa.pub na host B:

<pre class="lang:default highlight:0 decode:true">scp /home/user/.ssh/id_rsa.pub user@10.10.10.10:/home/user/.ssh/</pre>

ssh na host B, jeszcze z podaniem hasła:

<pre class="lang:default highlight:0 decode:true">ssh user@10.10.10.10</pre>

Na host wykonaj B:

<pre class="lang:default highlight:0 decode:true">cat /home/user/.ssh/id_rsa.pub &gt;&gt; /home/user/.ssh/authorized_keys
chmod 755 /home/user/
chmod 700 /home/user/.ssh
chmod 600 /home/user/.ssh/authorized_keys</pre>

Ctrl-D

Z hosta A na hosta B ssh już bez hasła:

<pre class="lang:default highlight:0 decode:true">su - user
ssh 10.10.10.10</pre>

&nbsp;

### SSH bez hasła sposób 2, szybszy:

Na host wykonaj A:

<pre class="lang:default highlight:0 decode:true">su - Joe
ssh-keygen -t rsa

3x enter
ssh-keygen -t rsa - tworzy w /home/Joe/.ssh/ dwa pliki: id_rsa i id_rsa.pub</pre>

Kopiujemy id_rsa.pub na host B:

<pre class="lang:default highlight:0 decode:true">cd ~/.ssh
ssh-copy-id -i id_rsa.pub Joe@10.10.10.10</pre>

Z hosta A na hosta B ssh już bez hasła:

<pre class="lang:default highlight:0 decode:true">ssh Joe@10.10.10.10</pre>

&nbsp;

&nbsp;

&nbsp;