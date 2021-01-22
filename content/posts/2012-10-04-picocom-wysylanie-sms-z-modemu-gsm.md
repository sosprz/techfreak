---
title: Picocom – wysyłanie sms z modemu GSM
author: Przemek
type: post
date: 2012-10-04T06:57:06+00:00
url: /picocom-wysylanie-sms-z-modemu-gsm/
bfa_virtual_template:
  - hierarchy
hits:
  - 1228
dsq_thread_id:
  - 1015977970
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - bash
  - picocom

---
Jak wysyłać sms z konsoli ? Posłuży do tego program picocom.

<!--more-->

Dlaczego picocom do interakcji z modemem a nie np: minicom ? Ponieważ skrypt w którym za pomocą expect&#8217;a wydajemy polecenia do picocom&#8217;a możemy spokojnie umieścić w cronie. Nie musisz się martwić żeby mieć otwarty terminal lub ze wystąpi błąd: No cursor motion capability (cm).

Uruchomienie picocom na com1 z szybkością 115200

<pre class="lang:default highlight:0 decode:true">picocom -b 115200 /dev/ttyS0</pre>

<pre class="lang:default highlight:0 decode:true">picocom v1.4

port is        : /dev/ttyS0
flowcontrol    : none
baudrate is    : 115200
parity is      : none
databits are   : 8
escape is      : C-a
noinit is      : no
noreset is     : no
nolock is      : no
send_cmd is    : ascii_xfr -s -v -l10
receive_cmd is : rz -vv

Terminal ready
AT
OK
AT+CMGF=1
OK
AT+CMGS="888999000"
&gt;Test z modemu ES75
CTRL-Z
+CMGS: 1

OK</pre>

&nbsp;

AT &#8211; test połączenia pomiedzy modemem a terminalem.  
AT+CMGF=1 &#8211; wejście w tryb pisania sms.  
AT+CMGS=&#8221;888999000&#8243; &#8211; Rozpoczecie pisania sms z wpisanym numerem odbiorcy  
gdy pojawi sie znak > oznacza to że trzeba wpisać teść sms  
kończymy pisanie sms wciskając CTRL-Z.

Aby powyższe zadziałało jako skrypt wykonywalny bez otwartego terminala trzeba ubrać to w expect&#8217;a:

<pre class="lang:default highlight:0 decode:true">#!/usr/bin/expect -f
set speed "-b 115200"
set dev "/dev/ttyS0"
spawn picocom $speed $dev
expect "Terminal Ready"
send "ATr"
expect "OK"
send "AT+CMGF=1r"
expect "OK"
send "AT+CMGS="888999000"r"
expect "&gt;"
send "Test z modemu ES75r"
send "\032"       #CTRL-Z
expect eof</pre>

&nbsp;

Bardzo prosto stworzyć można z tego bramke sms pisząc formularz w PHP  
który będzie umieszczał powyższy plik ze zmienionym numerem i treścią sms w  
określonym miejscu a cron co minute bedzie go wykonywał.

&nbsp;

&nbsp;