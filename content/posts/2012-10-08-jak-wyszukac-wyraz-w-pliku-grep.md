---
title: Jak wyszukać wyraz w pliku ? (grep)
author: Przemek
type: post
date: 2012-10-08T11:17:10+00:00
url: /jak-wyszukac-wyraz-w-pliku-grep/
bfa_virtual_template:
  - hierarchy
hits:
  - 313
dsq_thread_id:
  - 1018984159
categories:
  - Linux
tags:
  - grep

---
Jak szukać fraz grepem w plikach ?

<!--more-->

Wyszukiwanie danego wyrażenia w tym przypadku &#8222;bash&#8221; we wszystkich plikach w katalogu &#8222;skrypty&#8221;:

<pre class="lang:default highlight:0 decode:true">grep -RIlm1 "bash" /skrypty/</pre>

Wyszukiwanie wyrażenia dopasowanego (-x) &#8222;bash&#8221; we wszystkich plikach i wypisanie tych plików w których go nie ma (-L):

<pre class="lang:default highlight:0 decode:true">grep -L -x bash *</pre>

&nbsp;