---
title: Jak skonfigurować NFS (Network File System)
author: Przemek
type: post
date: 2013-04-05T16:25:53+00:00
url: /jak-skonfigurowac-nfs-network-file-system/
featured_image: /wp-content/uploads/2012/10/redhat.jpg
hits:
  - 650
dsq_thread_id:
  - 1188915015
categories:
  - Linux
tags:
  - redhat

---
Czasami trzeba udostępnić jakieś katalogi z jednej maszyny na drugą i do tego świetnie nadaje się popularny sieciowy system plików Network File System. Konfiguracja dosyć łatwa a do tego szybka. Mały przykład jak skonfigurować NFS poniżej.

<!--more-->

<span style="font-size: 14px; line-height: 1.5;">Na początek trzeba sprawdzic czy w ogóle coś nasza maszyna udostępnia. </span>

<pre class="lang:default highlight:0 decode:true">exportfs</pre>

Jeśli się nic nie pojawiło oznacza to że nic nie udostępniamy. Przechodzimy do pliku gdzie ustala się reguły dostępowe.

<pre class="lang:default decode:true">mcedit /etc/exports</pre>

<pre class="lang:default highlight:0 decode:true">/home/user1/ 192.168.0.2(rw) (r)
/home/user2/ 192.168.0.2 (rw)</pre>

Powyższe dostępy pozwalają na dostęp z maszyny 192.168.0.2 z uprawnieniami rw i dostęp dla wszystkich ale tylko z prawami read dla katalogu /home/suer1. A z kolei do katalogu /home/user2 maja dostęp wszyscy i maja prawa read/write. Trzeba pamiętać aby nie stawiać spacji pomiędzy ip/nazwą a nawiasem, bo może to poważnie naruszyć bezpieczeństwo udostępnianego katalogu.

Zastosowanie uprawnień:

<pre class="lang:default decode:true">export -r</pre>

Na kliencie sprawdzamy co udpstępnia serwer:

<pre class="lang:default highlight:0 decode:true">showmount -e 192.168.0.1</pre>

<pre class="lang:default highlight:0 decode:true">Export list for 192.168.0.1:
/home/user1 192.168.0.2
/home/user2 192.168.0.2</pre>

Wrzucamy do fstaba montowania

<pre class="lang:default highlight:0 decode:true">192.168.0.1:/home/user1 /user1 nfs defaults 0 0
192.168.0.1:/home/user2 /user2 nfs defaults 0 0</pre>

Monutujemy

<pre class="lang:default highlight:0 decode:true">mount -a</pre>

Wybieramy aby usługa NFS uruchamiała się przy starcie systemu

<pre class="lang:default highlight:0 decode:true">ntsysv</pre>

Problemy z uid czyli brak uprawnien. User1(501) na serwerze 192.168.0.1 i user1(500) na kliencie 192.168.0.2 ma różne uid przez co występują problemy.

Z pomocą przychodzą opcja jak all_squash i anonuid które mapują uid klienta do wskazanego uid na serwerze.

<pre class="lang:default highlight:0 decode:true">/home/user1 192.168.0.2(rw,all_squash,anonuid=501,anongid=501)</pre>

&nbsp;