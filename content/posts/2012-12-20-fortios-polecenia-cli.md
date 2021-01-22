---
title: FortiOS -polecenia cli
author: Przemek
type: post
date: 2012-12-20T10:32:19+00:00
url: /fortios-polecenia-cli/
featured_image: /wp-content/uploads/2012/12/fortinet.jpg
cyberchimps_slider_hidetitle:
  - 1
cyberchimps_slider_hidecaption:
  - 1
bfa_virtual_template:
  - hierarchy
hits:
  - 361
dsq_thread_id:
  - 1015675442
categories:
  - Linux

---
**Poniżej przydatne polecenia FortiOS.**

<!--more-->

1) Sprawdzanie pamięci

<pre># diag hard sys mem</pre>

2) Sprawdzanie procesów

<pre># diag sys top</pre>

3) Kilowanie procesów

<pre># diag sys kill nr_sygnału nr_procesu</pre>

4) Tablica arp

<pre># diag ip arp list</pre>

5) Tablica rutingu

<pre># diag ip route list</pre>

6) Sprawdzanie pinga:

<pre># execute ping adres_ip</pre>

7) Restart Fortigata

<pre># execute reboot</pre>

8) Snifer FortiOS&#8217;a

<pre># diag sniffer packet nr_interfejsu 'port nr_portu and tcp' 4</pre>

<pre># diag sniffer packet ANY 'net 192.168.11.0/24 and not host 192.168.11.1 and port 80 and TCP' 6</pre>

9) Status debugowania

<pre># diag debug info</pre>

10) Backup konfiguracji FG na linuxa  
Polecenie ściągnie z FG aktualną konfigurację. (Można użyć tego polecenia do skryptu backupującego konfigurację z urządzeń. Koniecznie wtedy logowanie musi odbywać się po kluczu.) Aby zadziałała ta komenda FG musi mieć włączone SCP, oraz SSH(na Interfejcie).

<pre>scp -q -i klucz login@adres_ip_fg:sys_config nazwa-fg.cfg</pre>

11) Sprawdzanie czy FG ma włączone SCP

<pre># get system global</pre>

Szukamy wartości _admin-scp_. Jeżeli jest wyłączona to włączamy ją poleceniem:

<pre># set admin-scp enable</pre>

12) W CLI mamy możliwość użycia pipe/grep:

<pre># show system global | grep hostname</pre>

Przydatnymi parametrami do polecenia grep są: -A,-B