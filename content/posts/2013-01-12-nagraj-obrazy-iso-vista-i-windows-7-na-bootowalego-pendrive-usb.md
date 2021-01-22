---
title: Nagraj obrazy iso Vista i Windows 7 na bootowalego pendrive USB
author: Przemek
type: post
date: 2013-01-12T08:52:59+00:00
url: /nagraj-obrazy-iso-vista-i-windows-7-na-bootowalego-pendrive-usb/
featured_image: /wp-content/uploads/2013/01/winusbgui_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 587
dsq_thread_id:
  - 1021473955
categories:
  - Linux
tags:
  - ubuntu
  - usb

---
<p style="text-align: left;">
  Czasem każdemu linuksiarzowi trafi się temat instalacji Windows 7 lub co gorzej Visty jakiemuś znajomemu lub miłej koleżance no i co zrobić jak nie ma się w swoim hakerskim lapku DVD? Jest opcja :D
</p>

<p style="text-align: left;">
  <!--more-->
</p>

<p style="text-align: left;">
  To że trzeba mieć iso wybranych systemów jest nie do przeskoczenia :) Z pomocą przychodzi program <strong>winusb</strong> który zainstaluje nam obraz ISO Windows 7 lub Vista na pendrive i będzie on bootowalny. W Ubuntu nie ma go w oficjalnych repozytoriach wiec trzeba go dodać:
</p>

<pre class="lang:default decode:true">sudo add-apt-repository ppa:colingille/freshlight
sudo apt-get update
sudo apt-get install winusb</pre>

Uruchamiamy winusb wskazujemy ISO, urządzenie USB i czekamy. Jedyne co zauważyłem chyba jest problem z paskiem postępu ale działa :)

<a href="http://techfreak.pl/nagraj-obrazy-iso-vista-i-windows-7-na-bootowalego-pendrive-usb/winusbgui_642_362_force/" rel="attachment wp-att-1332"><img alt="winusbgui_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/01/winusbgui_642_362_force.jpg" width="385" height="217" /></a>

Jeśli ktoś chce skorzystać z command line nie ma przeszkód :

<pre class="lang:default decode:true">sudo winusb --format &lt;iso path&gt; &lt;device&gt;
sudo winusb --install &lt;iso path&gt; &lt;partition&gt;</pre>

Powodzenia

<p style="text-align: left;">
  <p style="text-align: left;">