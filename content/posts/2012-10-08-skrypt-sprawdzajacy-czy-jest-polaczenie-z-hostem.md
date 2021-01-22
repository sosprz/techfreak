---
title: Skrypt sprawdzający czy jest połączenie z hostem
author: Przemek
type: post
date: 2012-10-08T11:52:49+00:00
url: /skrypt-sprawdzajacy-czy-jest-polaczenie-z-hostem/
bfa_virtual_template:
  - hierarchy
hits:
  - 792
dsq_thread_id:
  - 1015855520
categories:
  - Linux

---
Jak napisać skrypt który sprawdza czy jest połączenie ze zdalnym hostem ?

<!--more-->

Skrypt sprawdzający czy jest połączenie ze zdalnym hostem. W przypadku braku połączenia loguje zdażenie a po ponownym połączeniu wysyła maila na wskazany adres. Wrzucamy do crona np: co 15 min

\# crontab -e  
0/15 \* \* \* \* /nazwa\_ponizszego\_skryptu

<pre class="lang:default highlight:0 decode:true">#! /bin/sh
if ping -c 3 wp.pl
then
echo "jest ping"
if du -sh /tmp/czas
then
cat /tmp/czas |sendmail moj@mail.pl
rm /tmp/czas
echo "jest czas wysylam maila"
fi
elif du -sh /tmp/czas
then
echo "jest czas"
else
echo "From: " > /tmp/czas
echo "To: " >> /tmp/czas
echo "Subject: nie bylo netu" >> /tmp/czas
echo "nie bylo netu od:" >> /tmp/czas
echo "`date +%H%M`" >> /tmp/czas
fi</pre>

&nbsp;