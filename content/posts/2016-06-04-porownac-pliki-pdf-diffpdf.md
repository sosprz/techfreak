---
title: Jak porównać pliki pdf? DiffPDF
author: Przemek
type: post
date: 2016-06-04T07:24:18+00:00
url: /porownac-pliki-pdf-diffpdf/
featured_image: /wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf.png
dsq_thread_id:
  - 4882666580
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - ubuntu

---
W świecie linuksowym do porównywania plików używany jest diff, który jest prostym poleceniem używanym w wierszu poleceń. Za jego pomocą łatwo znaleźć różnice w dwóch plikach. Co zrobić jeśli do porównania mam np. dwie obszerne oferty handlowe w których nic nie może mi umknąć, a wersji wyszło wiele i to w formacie PDF?

<!--more-->

Na szczęście jest program o nazwie DiffPDF który pokaże różnice pomiędzy dwoma plikami. Po sprawdzeniu podświetli je i pozwoli zapisać to w takim formacie gdzie różnice zostaną ładnie pokazane.

Instalacja na ubuntu wymaga wpisania poniższej komendy:

<pre>sudo apt-get install diffpdf</pre>

Poniżej działanie diffPDF, na którym widać jak po wybraniu dwóch plików pdf, program znalazł w nich różnicę. Zamienione zostało słowo GNOME na GNOM3.

<a href="http://techfreak.pl/wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow.png" rel="attachment wp-att-11580"><img class="aligncenter wp-image-11580 size-full" src="http://techfreak.pl/wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow.png" alt="techfreak-diffPDF-ubuntu-porownywanie-plikow" width="1920" height="1055" /></a>

<a href="http://techfreak.pl/wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf-zoom.png" rel="attachment wp-att-11584"><img class="aligncenter wp-image-11584 size-full" src="http://techfreak.pl/wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf-zoom.png" alt="techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf-zoom" width="1603" height="249" /></a>

Po wybraniu plików, trzeba nacisnąć przycisk Compare, a następnie jeśli pdf jest obszerny klikać Next. Fajną sprawą jest możliwość zapisania pdf z tego widoku.

<a href="http://techfreak.pl/wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf.png" rel="attachment wp-att-11581"><img class="aligncenter wp-image-11581 size-full" src="http://techfreak.pl/wp-content/uploads/2016/06/techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf.png" alt="techfreak-diffPDF-ubuntu-porownywanie-plikow-zapis-pdf" width="1920" height="1055" /></a>

&nbsp;