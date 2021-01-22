---
title: Jak naprawić chrome?
author: Przemek
type: post
date: 2014-01-17T14:03:59+00:00
url: /naprawic-chrome/
featured_image: /wp-content/uploads/2014/01/vimeo_error.jpg
hits:
  - 357
dsq_thread_id:
  - 2134336816
categories:
  - Linux

---
Ja na swoim xubuntu używam przeglądarki Chromium. Do niedawna cieszyłem się tym, że wszystko działa i nie muszę się o nic martwić. Od jakiegoś czasu po kolei, powoli przestają działać mi niektóre funkcje. Miarka się przebrała. Poniżej pokaże jak naprawić Chromium który nie możne wyświetlić&#8230; niczego.

<!--more-->

Przestał działać Youtube. Komunikat &#8222;Nie można wyświetlić tego filmu&#8221; czy coś w tym stylu. Doprowadzał mnie do czerwoności a tym bardziej że w Firefoxie wszystko działa. Następnie, Vimeo pokazało mi komunikat &#8222;Ouch! This video can&#8217;t be played with Your current setup&#8221;.

[<img class="aligncenter size-full wp-image-5758" alt="vimeo_error" src="http://techfreak.pl/wp-content/uploads/2014/01/vimeo_error.jpg" width="1068" height="594" />][1]

Mało tego, przestały działać aplikacje webowe jak <a href="http://www.thingiverse.com/thing:228098" target="_blank">Thingiverse customizer</a>.

Pogrzebałem trochę w necie i znalazłem rozwiązania.

Na początek vimeo. Trzeba tylko zainstalować dodatkowe kodeki.

<pre>sudo apt-get  install chromium-codecs-ffmpeg-extra</pre>

Co do YT i reszty. Na początek trzeba zobaczyć czy po wklepaniu <chrome://gpu/> mamy coś takiego jak poniżej:

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2014/01/chrome_graphic_feature_status.jpg"><img class=" wp-image-5759 aligncenter" alt="chrome graphic feature status" src="http://techfreak.pl/wp-content/uploads/2014/01/chrome_graphic_feature_status.jpg" width="678" height="261" /></a>
</p>

<p style="text-align: left;">
  Jeśli tak, trzeba to zmienić wchodząc do <a href="chrome://flags/">chrome://flags/</a>, szukając linii z <strong>Override software rendering list </strong>kliknąć<strong> ENABLE. </strong>Poniżej jak to ma wyglądać.<strong><br /> </strong>
</p>

<p style="text-align: left;">
  <a href="http://techfreak.pl/wp-content/uploads/2014/01/chrome_graphic_feature_status_ok.jpg"><img class="aligncenter size-full wp-image-5761" alt="chrome_graphic_feature_status_ok" src="http://techfreak.pl/wp-content/uploads/2014/01/chrome_graphic_feature_status_ok.jpg" width="504" height="264" /></a>
</p>

<p style="text-align: left;">
  Została jeszcze jedna rzecz do <strong>odznaczenia &#8222;</strong>Block third-party cookies and site data<strong>&#8222;.</strong>
</p>

<p style="text-align: left;">
  <a href="http://techfreak.pl/wp-content/uploads/2014/01/chrome_current_settings_block_third_party_cookies.jpg"><img class="aligncenter size-full wp-image-5762" alt="chrome_current_settings_block_third_party_cookies" src="http://techfreak.pl/wp-content/uploads/2014/01/chrome_current_settings_block_third_party_cookies.jpg" width="648" height="570" /></a>
</p>

<p style="text-align: left;">
  Po tych zabiegach odzyskałem wszystkie wyżej wymienione braki. Mam nadzieje że nie tylko ja.
</p>

 [1]: http://techfreak.pl/wp-content/uploads/2014/01/vimeo_error.jpg