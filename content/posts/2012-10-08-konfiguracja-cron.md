---
title: Konfiguracja cron
author: Przemek
type: post
date: 2012-10-08T09:47:07+00:00
url: /konfiguracja-cron/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1026165493
hits:
  - 412
categories:
  - Linux

---
Jak ustawić zadania cykliczne w cronie ?

<!--more-->

Aby edytować plik crontab wpisz:

<pre class="lang:default highlight:0 decode:true">crontab -e</pre>

Opis:

<pre class="lang:default highlight:0 decode:true">* * * * * /bin/bash skrypt

| | | | |- dzień tygodnia 0-6, 0 - sunday
| | | |--- miesiąc 1-12
| | |----- dzień miesiąca 1-31
| |------- godzina 0-23
|--------- minuta 0-59</pre>

Wykonaj kazdego dnia o 6 rano:

0 6 \* \* * /usr/sbin/ntpdate 10.0.0.1

Wykonaj w środy o 6 rano:  
0 6 \* \* 3 /usr/sbin/ntpdate 10.0.0.1

Wykonaj co minute:  
\*/1 \* \* \* * /usr/sbin/ntpdate 10.0.0.1

Wykonaj w patrzyste minuty:  
0-58/2

Wykonaj w nieparzyste minuty:  
1-59/2

&nbsp;

&nbsp;

&nbsp;