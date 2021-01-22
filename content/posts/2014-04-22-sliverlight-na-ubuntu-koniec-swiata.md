---
title: Sliverlight na ubuntu. Koniec świata..
author: Przemek
type: post
date: 2014-04-22T14:00:52+00:00
url: /sliverlight-na-ubuntu-koniec-swiata/
featured_image: /wp-content/uploads/2014/04/ubuntu_sliverlight_1.jpg
hits:
  - 478
dsq_thread_id:
  - 2630491466
categories:
  - Linux
tags:
  - ubuntu

---
Nie jestem zwolennikiem <a href="http://pl.wikipedia.org/wiki/Microsoft_Silverlight" target="_blank">mikrosoftowego silverlight&#8217;a</a> ale niestety niektóre aplikacje, najczęściej firmowe z niego korzystają. Ja używam [xubuntu][1] no i czasem muszę się przystosować. Więc pokaże jak uruchomić silverlight pod linuxem.

<!--more-->

[<img class="aligncenter size-full wp-image-6862" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_sliverlight_0.jpg" alt="ubuntu_sliverlight_0" width="358" height="267" />][2]

Całkiem przypadkowo wpadłem jak uruchomić silverlight na ubuntu. Uwierzcie mi nie szukałem tego. No może kiedyś próbowałem z projektem mono ale nic z tego nie wyszło.

Sprawa jest prosta trzeba wydać poniższe polecenia, czyli zainstalować pakiet pipelight.

<pre>sudo add-apt-repository ppa:pipelight/stable
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi
sudo pipelight-plugin --update</pre>

A następnie włączyć wtyczkę

<pre>sudo pipelight-plugin --enable silverlight</pre>

Testowo wlazłem na player.pl czyli tvn&#8217;owe VOD i ku mojemu zaskoczeniu obejrzałem reklamy. No ale jednak nie było mi dane oglądanie szopki Gesslerowej kucharki. Więc jednak pipelight nie do końca zadziałał.

[<img class="aligncenter size-full wp-image-6864" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_sliverlight_2.jpg" alt="ubuntu_sliverlight_2" width="1182" height="597" />][3]

Ale na TVN świat się nie kończy bo mamy jeszcze vod.tvp.pl za które pewnie będziemy musieli płacić przymusowy abonament ;) No ale będzie za co, bo okazało się że, tu wtyczka zadziałała i mogłem wszystko obejrzeć. (barwy szczęścia <3)

[<img class="aligncenter size-full wp-image-6865" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_sliverlight_3.jpg" alt="ubuntu_sliverlight_3" width="950" height="575" />][4]

Co do aplikacji firmowych jak sharepoint wszystko działa. Więc swoją rolę wtyczka spełniła. Jesli ktoś chce się bardziej zagłębić to zapraszam na stronę projektu <a title="pipelight" href="http://fds-team.de/cms/pipelight-installation.html#section_1_1" target="_blank">pipelight</a>.

Może ktoś wie dlaczego player.pl nie działa do końca? (żona każe)

 [1]: http://xubuntu.org/ "normalne ubuntu"
 [2]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_sliverlight_0.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_sliverlight_2.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_sliverlight_3.jpg