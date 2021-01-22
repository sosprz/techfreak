---
title: lftp – wgrywanie zmian lub nowych plikow na serwer ftp
author: Przemek
type: post
date: 2012-10-04T07:15:26+00:00
url: /lftp-wgrywanie-zmian-lub-nowych-plikow-na-serwer-ftp/
bfa_virtual_template:
  - hierarchy
hits:
  - 384
dsq_thread_id:
  - 1015977334
categories:
  - Linux
tags:
  - bash
  - lftp

---
Potrzebowałem skryptu który wgra mi automatycznie zmiany które robie na stronie bez wgrywania wszystkiego za każdym razem przez ftp. Do tego nadaje się świetnie lftp. Jest to zaawansowany program to transferu plików. Do spełnienia mojego celu użyje lftp z opcją **mirror**. Służy ona do uaktualniania katalogu zdalnego z lokalnym lub na odwrót. W przypdku kiedy musze wrzucić pliki na serwer fpt musze użyć opcji -R (reverse mirror (put files)).

<!--more-->

Do wyboru mam:  
**mirror -e -R &#8211;only-newer** czyli wgraj na zdalny serwer tylko nowsze pliki, skasuj zdalne nie istniejące po stronie lokalnej (-e)  
**mirror -R &#8211;only-newer** czyli wgraj na zdalny serwer tylko nowsze pliki  
**mirror -R** wgraj wszystko na zdalny serwer  
**mirror** sciągnij pliki ze zdalnego serwera

cd /public\_html/twoja\_strona/ wejdz do katalogu zdalnego  
lcd /var/www/twoja_strona wejdz do katalogu lokalnego

A jeszcze lepiej będzie gdy to wszystko jest wywoływane przez jeden skrypt:

<pre class="lang:default highlight:0 decode:true">#! /bin/bash
lftp -d -u userFpt,hasloFTP serwer.ftp.com.pl &lt;</pre>

opcja -d debug  
opcja -vvvv verbose level 3

&nbsp;

&nbsp;

&nbsp;