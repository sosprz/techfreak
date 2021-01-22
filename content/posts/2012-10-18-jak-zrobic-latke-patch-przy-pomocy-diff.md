---
title: Jak zrobić łatkę patch przy pomocy diff ?
author: Przemek
type: post
date: 2012-10-18T10:28:07+00:00
url: /jak-zrobic-latke-patch-przy-pomocy-diff/
bfa_virtual_template:
  - hierarchy
hits:
  - 299
dsq_thread_id:
  - 1020743387
categories:
  - Linux
tags:
  - bash
  - diff

---
&#8222;Paczowanie&#8221; czyli jak zrobić łatkę przy pomocy diff.

<!--more-->

1. Przypuśćmy ze mamy do zrobienia jakieś zmiany w pliku test.c ponieważ skrypt kończy z błędem syntax error. A wygląda on tak:

<pre class="lang:default decode:true">if [ ! -e test.c ]
then { echo "nie ma takiego pliku";}
else { echo "plik istnieje"}
fi</pre>

2. Chcemy go poprawić żeby wyglądał tak:

<pre class="lang:default decode:true">if [ ! -e test.c ]
then { echo "nie ma takiego pliku";}
else { echo "plik istnieje";}
fi</pre>

Więc tworzymy plik test2.c i wklejamy tam poprawną wersje.

3. Następnie tworzymy łatkę poprawiającą:

<pre class="lang:default highlight:0 decode:true">diff -uN test.c test2.c &gt; test.c.patch</pre>

Wygląda ona następująco:

<pre class="lang:default decode:true">--- test.c 2010-05-10 12:06:17.507217702 +0200
+++ test2.c 2010-05-10 12:06:45.153591995 +0200
@@ -1,4 +1,4 @@
if [ ! -e test.c ]
then { echo "nie ma takiego pliku";}
-else { echo "plik istnieje";}
+else { echo "plik istnieje"}
fi</pre>

4. Na końcu nakładamy łatkę test.c.patch dla pliku test.c

<pre class="lang:default highlight:0 decode:true">patch test.c &lt; test.c.patch</pre>

&nbsp;