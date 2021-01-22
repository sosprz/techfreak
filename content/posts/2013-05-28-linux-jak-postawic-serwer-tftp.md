---
title: Linux jak postawić serwer tftp?
author: Przemek
type: post
date: 2013-05-28T14:29:16+00:00
url: /linux-jak-postawic-serwer-tftp/
featured_image: /wp-content/uploads/2013/05/techfreak_tftp_server_642_362_force.jpg
hits:
  - 809
dsq_thread_id:
  - 1329759605
categories:
  - Linux
tags:
  - tftp

---
Często aktualizuje oprogramowanie na przełącznikach i zawsze zapominam jak postawić serwer tftp. Tak dla siebie i innych wrzucam jak szybko to zrobić.

<!--more-->

Instalacja potrzebnych paczek dla serwera tftp

<pre>sudo apt-get install xinetd tftpd tftp</pre>

Stworzenie i edycja pliku /etc/xinetd.d/tftp

<pre>service tftp
{
protocol = udp
port = 69
socket_type = dgram
wait = yes
user = nobody
server = /usr/sbin/in.tftpd
server_args = /tftp
disable = no
}</pre>

Utworzenie katalogu tftp i uprawnienia

<pre>sudo mkdir /tftp
sudo chmod -R 777 /tftp
sudo chown -R nobody /tftp</pre>

Start demona xinetd

<pre>sudo /etc/init.d/xinetd start</pre>