---
title: Segway czy jednokołowa kurka :)
author: Przemek
type: post
date: 2012-12-17T19:58:20+00:00
url: /segway-czy-jednokolowa-kurka/
featured_image: /wp-content/uploads/2012/12/pale_raptor_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 277
dsq_thread_id:
  - 1012865237
categories:
  - Elektronika
tags:
  - arduino

---
<a href="http://techfreak.pl/segway-czy-jednokolowa-kurka/pale_raptor/" rel="attachment wp-att-312"><img class="aligncenter size-full wp-image-312" alt="pale_raptor" src="http://techfreak.pl/wp-content/uploads/2012/12/pale_raptor.jpg" width="272" height="362" /></a>

Nie, nie naśmiewam się z jednokołowej kurki ;P Znaczy z RAPTORA. A dokładnie chodzi o home made segway&#8217;a zbudowanego przez <a href="http://dl.dropbox.com/u/90324580/Thatch-Industries/Raptor.html" target="_blank">Nick&#8217;a Thatcher&#8217;a</a>.

<!--more-->

Niech nikt nie myśli sobie że naśmiewam się z cudzych projektów, piszę co myślę a ten fajny projekt na pierwszy rzut oka przypomina mi kurkę na kółku :) A na całość składa się jeden kurkowy silnik haha, 24v 350w zasilany dwoma bateriami 12V 7Ah (takie jak w UPS), Arduino UNO &#8211; chyba nie trzeba nikomu przedstawiać tej łatwej w użyciu platformy do programowania która ma parę wyjść <a href="http://en.wikipedia.org/wiki/Pulse-width_modulation" target="_blank">PWM</a>. Aby sterować silnikiem potrzebny jest regulator, w tym projekcie został użyty <a href="http://www.google.pl/imgres?um=1&hl=pl&sa=N&tbo=d&biw=1366&bih=566&authuser=0&tbm=isch&tbnid=rx9xZv9b_VHdcM:&imgrefurl=http://www.superdroidrobots.com/product_info/motor_controllers.aspx&docid=dPOAzzT3TvaPPM&imgurl=http://www.superdroidrobots.com/images/TE-098-125_tn.jpg&w=300&h=248&ei=nHbPUMGoE9DQsgb1l4GIDw&zoom=1&iact=hc&vpx=4&vpy=122&dur=2611&hovh=198&hovw=240&tx=131&ty=77&sig=107703164825888568138&page=1&tbnh=133&tbnw=180&start=0&ndsp=27&ved=1t:429,r:0,s:0,i:87" target="_blank">SyRen 1&#215;25</a>. No ale jak to się dzieje że taki segway się nie przewraca ? Dzieje się to dzięki elementowi o którym jeszcze nie napisałem a jest nim żyroskop. Arduino analizuje położenie i wysyła impulsy do regulatora silnika tak aby całość się nie wywróciła i to wszystko TADA. Polecam popatrzeć sobie <a href="http://dl.dropbox.com/u/90324580/Thatch-Industries/Raptor.html" target="_blank">tutaj</a> na galerie.

Znowu nie ma filmiku &#8230;. ehh

&nbsp;

&nbsp;