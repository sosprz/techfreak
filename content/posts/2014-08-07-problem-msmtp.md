---
title: Problem z msmtp
author: Przemek
type: post
date: 2014-08-07T08:52:53+00:00
url: /problem-msmtp/
featured_image: /wp-content/uploads/2014/08/matrix_bash1.jpg
hits:
  - 209
dsq_thread_id:
  - 2907321340
categories:
  - Linux
tags:
  - bash
  - iptables

---
Ostatnio pewien użytkownik nettempa z Kandy zgłosił się do mnie z problemem który dotyczył powiadomień mailowych. Nettemp do wysyłania powiadomień używa lekkiego klienta msmtp. Błąd jaki wyskakiwał to:

<pre>msmtp: cannot create socket: Address family not supported by protocol 
msmtp: could not send mail</pre>

Google podpowiadało to że może to być problem z ipv6 lub z konfiguracją klienta msmtp. Okazało się że to problem z zablokowanym portem SMTP 587.

### Jak można sprawdzić czy port jest zablokowany?

jak zawsze telnetem :)

<pre>root@raspberrypi:/#telnet smtp.gmail.com 587
Trying 74.125.136.109...
telnet: Unable to connect to remote host: Address family not supported by protocol</pre>

Jak widać wyżej port jest zablokowany. Ale musiałem symulować sobie taką blokadę używając reguł iptables.

<pre>iptables -A OUTPUT -p tcp --dport 587 -j DROP</pre>

Po odblokowaniu portu przez &#8222;iptables -F&#8221; &#8211; czyli wyczyszczenie wszystkich reguł na firewallu maile przechodziły poprawnie.

### Jak wysyłać maile przez msmtp?

Do testowania stworzyłem sobie mały skrypcik który ułatwia wysyłanie wiadomości. Trzeba tylko podmienić dane na swoje. Na końcu zapyta o hasło do konta.

<pre>#! /bin/bash -x
from="nettemp device"
reci="test@techfreak.pl"
subject="Testowy mail"
body="blablabla"
host="smtp.gmail.com"
port="587"
sender="test@gmail.com"
(echo "From: $from"; echo "To: $reci"; echo "Subject: $subject" ;echo -e "$body";) | msmtp \
--read-envelope-from \
--host=$host --port=$port --auth=on --user=$sender \
--tls=on --tls-starttls=on --tls-certcheck=on --tls-trust-file=/etc/ssl/certs/ca-certificates.crt \
--timeout=10 -t $reci

</pre>

### Wnioski

Tak więc zawsze trzeba sprawdzić czy na pewno nie blokują Cię żadne zapory. I nie jest to takie trudne. Mam nadzieje że komuś to pomoże. Dawać znać w komentarzach

&nbsp;