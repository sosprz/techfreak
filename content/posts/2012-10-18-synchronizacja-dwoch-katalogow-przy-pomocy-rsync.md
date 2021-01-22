---
title: Synchronizacja dwóch katalogów przy pomocy rsync
author: Przemek
type: post
date: 2012-10-18T10:06:13+00:00
url: /synchronizacja-dwoch-katalogow-przy-pomocy-rsync/
featured_image: /wp-content/uploads/2012/10/rsync_kompia_bezpieczenstwa_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 1412
dsq_thread_id:
  - 1015969279
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - Backup
  - rsync

---
Poniżej opis jak zrobić backup przy pomocy programu rsync. Poniższa komenda synchronizuje zawartość jednego katalogu do drugiego. Jeśli zawartość źródłowego zostanie zmieniona w docelowym zostaną skasowane wszystkie pliki których nie ma w źródłowym.

<!--more-->

<pre>rsync --exclude=*.avi --exclude=*.rvmb -r -t -p -o -g -v --progress --delete -l -H /hdd/ /media/disk/hdd/</pre>

&#8211;exclude  &#8211; wyklucza z synchronizacji wszystkie pliki z rozszeżeniem np: .avi  
-r &#8211; rekursja  
-t &#8211; zachowuje czas plików  
-p &#8211; zachowuje uprawnienia  
-o &#8211; zachowuje właściciela  
-g &#8211; zachowuje grupe  
-v &#8211; werbose  
&#8211;progress &#8211; widoczny postęp  
&#8211;delete -kasuje pliki w docelowym katalogu które nie istnieją w źródłowym katalogu  
-l &#8211; kopiuje dowiązania jako dowiązania (czyli nie kopiuje zawartości)  
-H &#8211; zahowuje hardlinki  
/hdd/ &#8211; katalog źródłowy  
/media/disk/hdd/ &#8211; katalog docelowy

&nbsp;

&nbsp;