---
title: Instalacja BusyBox na Androidze bez root access :D
author: Przemek
type: post
date: 2012-12-07T10:04:30+00:00
url: /instalacja-busybox-na-androidze-bez-root-access-d/
featured_image: /wp-content/uploads/2012/12/ico_force_compress4.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 1131
dsq_thread_id:
  - 1004871664
categories:
  - Linux

---
Adam Outler z XDA developers pokazał jak zainstalować BusyBox na Androidzie bez posiadania super uprawnień na urządzeniu. Zrobił to kopiując przez ADB (Android Developer Bridge) plik busybox. I zainstalował go po wejściu do ADB shell. Obrazek z wykonanych poleceń poniżej :

<!--more-->

[<img class="aligncenter size-full wp-image-116" title="install-busybox-on-unrooted-android" alt="" src="http://techfreak.pl/wp-content/uploads/2012/12/install-busybox-on-unrooted-android.jpg" width="580" height="225" />][1]

&nbsp;

BusyBox to &#8222;Swiss Army Knife of Embedded Linux&#8221; posiada w sobie wiele przydatnych poleceń które pozwalają na prace w konsoli między innymi ls, ps, grep, dmesg, mkdir. touch, mount itd. Oczywiście BusyBox musi być kompatybilny z architekturą ARM i taką właśnie wersje można ściągnąć <a href="https://teamkomin.googlecode.com/svn/trunk/system/bin/busybox" target="_blank">tu</a>.



[<a href="http://hackaday.com/2012/12/05/common-linux-tools-on-android-without-root-by-installing-busybox/" target="_blank">source</a>]

 [1]: http://techfreak.pl/wp-content/uploads/2012/12/install-busybox-on-unrooted-android.jpg