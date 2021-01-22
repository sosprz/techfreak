---
title: Przykłady użycia pakietu Expect
author: Przemek
type: post
date: 2012-10-08T11:49:17+00:00
url: /przyklady-uzycia-pakietu-expect/
bfa_virtual_template:
  - hierarchy
hits:
  - 356
dsq_thread_id:
  - 1023628028
categories:
  - Network
tags:
  - Backup
  - HP Procurve

---
Jak używać programu Expect do interakcji z programami odpalanymi w terminalu ?

<!--more-->

Expect jest to biblioteka która pozwala na interakcję z aplikacjami terminalowymi. Mały przykład zastosowania:  
1. Expect ma za zadanie połączyć się po ssh na maszynę a następnie wysłać z niej po scp plik test.

<pre class="lang:default highlight:0 decode:true">#!/usr/bin/expect -f

set user "user"
set user2 "user2"
set pass "haslo_usera"
set pass2 "haslo_usera2"
set host 10.0.0.1
set host2 10.0.0.2

spawn ssh $user@$host

expect "password:" { send "$passr"; exp_continue }
send "scp test $user2@$host2:/r"
expect "password:" {send "$pass2r"; exp_continue }
send "exitr"

expect eof</pre>

&nbsp;

Przykład jak można tworzyć kopię zapasową przełączników za pomocą expect&#8217;a:

<pre class="lang:default highlight:0 decode:true">#!/usr/bin/expect -f
#Expect Skript zum automatisierten Abziehen einer Konfig vom HP Switch
#per scp und password auth
#v 0.1 20080630 Steffen M. Steck pablofiasko@gmail.com
#
#Usage ./scpconfigsaver.exp IP

set user "manager"
set pass "managers_passwd"
set host [lindex $argv 0]
set timeout 60
set date [exec date +%Y%m%d%H%M]
set output "$host_$date"
set dstdir /home/bkup/hpswitche

proc ssh_failed { } {
send_user "ERROR: SSH LOGIN FAILEDn"
exit
}

proc scp_ok { } {
send_user "SCP SUCCEEDEDn"
}

spawn scp $user@$host:/cfg/running-config $dstdir/$output.cfg

#check if login is successful and import ssh key if not yet in known_hosts
expect {
"Connection refused" { ssh_failed }
"No route to host" { ssh_failed }
"Permission denied" { ssh_failed }
"bad password." { ssh_failed }
"(yes/no)?" { send "yesr";
exp_continue }
"password:" { send "$passr";
exp_continue }
"Password:" { send "$passr";
exp_continue }
"100% " { scp_ok }
default { ssh_failed }
}

wait
expect eof</pre>

&nbsp;