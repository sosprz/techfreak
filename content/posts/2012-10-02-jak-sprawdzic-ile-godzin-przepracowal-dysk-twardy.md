---
title: Jak sprawdzić ile godzin przepracował dysk twardy ?
author: Przemek
type: post
date: 2012-10-02T17:26:06+00:00
url: /jak-sprawdzic-ile-godzin-przepracowal-dysk-twardy/
bfa_virtual_template:
  - hierarchy
hits:
  - 888
dsq_thread_id:
  - 1018486859
categories:
  - Linux

---
## Jak sprawdzić ile przepracowanych godzin ma dysk twardy ? np: jak sprawdzić dysk przed zakupem ?

<!--more-->

Na początek trzeba zainstalować smartmontools

<pre class="lang:default highlight:0 decode:true">sudo aptitude install smartmontools</pre>

Narzędzie smartctl z opcja -all pokazuje informacje SMART

<pre class="lang:default highlight:0 decode:true">smartctl --all /dev/sda</pre>

Z opcją -x pokaże informacje o dysku między innymi Power\_On\_Hours

<pre class="lang:default highlight:0 decode:true">smartctl -x /dev/sda |grep Power_On</pre>

Output:

<pre class="lang:default highlight:0 decode:true">9 Power_On_Hours -O--CK 099 099 --- - 1759</pre>

1759 tyle przepracował testowany dysk