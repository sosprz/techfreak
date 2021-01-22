---
title: Jak kontrolować procesy ?
author: Przemek
type: post
date: 2012-12-01T22:59:33+00:00
url: /jak-kontrolowac-procesy/
bfa_virtual_template:
  - hierarchy
hits:
  - 116
dsq_thread_id:
  - 1029053792
categories:
  - Linux
tags:
  - bash

---
Komendy do kontrolowania procesów:

<!--more-->

<pre class="lang:default highlight:0 decode:true">kill
nice
renice</pre>

Zabijanie procesów:

<pre class="lang:default highlight:0 decode:true">kill -9 `ps ax |grep firefox |cut -c 1-5`</pre>

lub

<pre class="lang:default highlight:0 decode:true">killall firefox</pre>

&nbsp;