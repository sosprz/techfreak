---
title: Telefon z Androidem oczami dla Hexbug
author: Przemek
type: post
date: 2013-01-15T19:23:43+00:00
url: /telefon-z-androidem-oczami-dla-hexbua/
featured_image: /wp-content/uploads/2013/01/android_hexbug_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 376
dsq_thread_id:
  - 1027546833
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - roboty

---
<a href="http://techfreak.pl/telefon-z-androidem-oczami-dla-hexbua/android_hexbug_642_362_force/" rel="attachment wp-att-1870"><img class="aligncenter size-full wp-image-1870" src="http://techfreak.pl/wp-content/uploads/2013/01/android_hexbug_642_362_force.jpg" alt="android_hexbug_642_362_force" width="642" height="362" /></a>

Jakiś czas temu znalazłem projekt przeróbki Hexbug plus smartfon z Androidem ale jakoś mi przeleciał przed oczami i wrzuciłem go do folderu &#8222;do przeglądu&#8221;. Okazuje się że naprawdę warto zobaczyć o co tu chodzi.

<!--more-->

Hexbug to zdalnie sterowana zabawka dla dzieci którą można za stówkę kupić na allegrosie. Budowa jest dosyć sprytna ale prosta, dwa silniki sterowane pilotem na podczerwień. Autor przeróbki postanowił dorobić oczy małemu robocikowi za pomocą kamery w smartfonie, który podąża za wybranym kolorem.

### Dobra ale jak sterować robota telefonem?

I to samo pytanie zadałem sobie. Okazuje się że można sterować wyjściami poprzez tony dźwiękowe od 1Khz do 10Khz z wyjścia audio w telefonie lub tablecie (mini jack). Służy do tego układ <a href="http://buildsmartrobots.ning.com/" target="_blank" rel="noopener">Audio Dual Motor Controller Board (ADMCB)</a> który można zakupić za 20 dolców.

<p style="text-align: center;">
  <a href="http://techfreak.pl/telefon-z-androidem-oczami-dla-hexbua/sam_1868_small/" rel="attachment wp-att-1877"><img class="aligncenter wp-image-1877" src="http://techfreak.pl/wp-content/uploads/2013/01/SAM_1868_small.jpg" alt="SAM_1868_small" width="233" height="175" /></a>
</p>

### I co dalej?

Wiadomo jak są sterowane silniczki, pozostaje kwestia oprogramowania na smartfonie. Aplikacja oparta jest o bibliotekę <a href="http://pl.wikipedia.org/wiki/OpenCV" target="_blank" rel="noopener">OpenCV</a> i została napisana tak aby śledzić w czasie rzeczywistym wskazany kolor i sterować robotem tak aby podążał za nim.

### Jak to zrobić?

Pełna instrukcja jest dostępna na stronie <a href="http://buildsmartrobots.ning.com/profiles/blogs/hacking-the-hexbugm-spider-xl-to-add-computer-vision-using-a-smar" target="_blank" rel="noopener">buildsmartrobots.ning.com</a>

### FILMIK i koniec pisania!



&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

<http://buildsmartrobots.ning.com/profiles/blogs/hacking-the-hexbugm-spider-xl-to-add-computer-vision-using-a-smar>