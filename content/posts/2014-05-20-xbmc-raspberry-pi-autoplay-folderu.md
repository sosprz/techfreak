---
title: Xbmc + Raspberry Pi + autoplay z folderu
author: Przemek
type: post
date: 2014-05-20T05:47:42+00:00
url: /xbmc-raspberry-pi-autoplay-folderu/
featured_image: /wp-content/uploads/2014/05/peppa_pig.jpg
hits:
  - 575
dsq_thread_id:
  - 2698683258
categories:
  - Linux
tags:
  - Android
  - Raspberry pi
  - xbmc

---
Nadchodzi taki czas w życiu mężczyzny kiedy musi oddać swoim dzieciakom telewizor i Raspberry Pi. Dzieciaki dorastają zaczynają programować, lutować i prosić o kasę na nową elektronikę z chin. Szybsze laptopy, większe dyski i szybsze smartfony z Androidem 5.4.

<!--more-->

Dobra trochę mnie poniosło :) ale czy wiedzieliście że w tv lecą ciągle te same bajki? Jak setny raz widziałem na dobranoc tę samą bajkę a żona na początku mówiła co będzie na końcu. To pomyślałem że przecież mogę wgrać parę bajek na pena i puszczać to z Raspberry Pi bo przecież świetnie działa z XBMC. Na RPI Miałem już wcześniej wgrane <a href="http://www.raspbmc.com/" target="_blank">raspbmc</a>.

## Autoplay

Jedynym problemem było skonfigurowanie tak xbmc aby odtwarzał przy starcie bajki z dysku usb i to w dodatku losowo. Sprawa okazała się całkiem prosta. Jedyne co trzeba było zrobić to umieścić w pliku /home/pi/.xbmc/userdata/autoexec.py poniższe wpisy:

<pre>import sys 
 import xbmczie
 xbmc.executebuiltin( "PlayMedia(/media/6023-A3D8/bajki/)" )
 xbmc.executebuiltin( "PlayerControl(RandomOn)" )</pre>

opis:

  * PlayMedia(/media/6023-A3D8/bajki/) &#8211; wskazałem folder z różnymi bajkami. W tym przypadku pendrive z katalogiem bajki. Ważne aby na końcu ścieżki był /.
  * PlayerControl(RandomOn) &#8211; Włączyłem losowe wybieranie.

Dzieciaki zadowolone, ja też. Powyższy skrypcik to tylko autoplay. Jeśli chcesz możesz w dalszym ciągu sterować XBMC poprzez aplikacje na Androida. Czyli np. przełączać się pomiędzy wideo lub włączyć nowe z innego katalogu.

Fotka: http://cdn.tempi.it/wp-content/uploads/2013/07/peppa-pig-21.jpg

EDIT: Na XBMC w wersji GOTHAM już trzeba wkleić do autoexec inny skrypt:

<pre>import xbmc
xbmc.executebuiltin('xbmc.PlayMedia("/storage/videos/","isdir")')
xbmc.executebuiltin('xbmc.PlayerControl(repeatall)')
xbmc.executebuiltin("Action(Fullscreen)")</pre>

&nbsp;

Skrypt pochodzi z <a href="https://gist.github.com/schlomo/1c9b352ba19b5e33f9c4" target="_blank">GITHUB</a> i jak widać wiele się nie różni. Ale działa :)