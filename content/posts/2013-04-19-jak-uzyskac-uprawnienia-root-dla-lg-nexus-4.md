---
title: Jak uzyskać uprawnienia root dla LG nexus 4?
author: Przemek
type: post
date: 2013-04-19T05:51:14+00:00
url: /jak-uzyskac-uprawnienia-root-dla-lg-nexus-4/
featured_image: /wp-content/uploads/2013/04/P1050353_642_362_force.jpg
hits:
  - 4301
dsq_thread_id:
  - 1221444284
categories:
  - Elektronika
tags:
  - nexus
  - smartfon

---
<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/04/P1050353_642_362_force.jpg"><img class="aligncenter  wp-image-2858" src="http://techfreak.pl/wp-content/uploads/2013/04/P1050353_642_362_force.jpg" alt="P1050353_642_362_force" width="385" height="217" /></a>
</p>

Ponieważ w internecie można znaleźć naprawdę przydługie opisy jak uzyskać uprawnienia root dla LG Nexus 4. Postanowiłem w skrócie opisać jak to zrobić. Tym bardziej że procedura jest naprawdę prosta i użytkownik nie będzie musiał czytać zbędnych słów kluczowych na potrzeby SEO :)

Opis przetestowałem na swoim telefonie i nie biorę odpowiedzialności za problemy lub uszkodzenia komputera, telefonu lub ciała, pogryzionego kabla. I bardzo mi przyro jeśli po drugim kroku cicho do siebie powiedziałeś &#8222;fakk fotki&#8221;.

<!--more-->

#### Pobierz Android SDK

<http://developer.android.com/sdk/index.html#download>

Ja pobrałem: <a href="http://dl.google.com/android/adt/adt-bundle-linux-x86-20130219.zip" target="_blank">adt-bundle-linux-x86-20130219.zip</a>, w katalogu adt-bundle-linux-x86-20130219/sdk/platform-tools znajduje się plik fastboot. Dzięki niemu będziemy mogli odblokować bootloader lub wgrać custom recovery do telefonu.

#### Odblokuj bootloader

Uruchamiamy telefon włączając tryb <span style="color: #ff0000;">fastboot mode przyciskami &#8222;vol -&#8221; i &#8222;Power&#8221;. Po poniższej operacji na telefonie wyskoczy powiadomienie czy odblokować bootloader. </span>

<pre>fastboot oem unlock</pre>

Jeśli się zgadzasz telefon się zrestartuje do ustawień fabrycznych i utracisz wszystkie dane, fotki i ustawienia ale zyskasz możliwość wygrywania innego oprogramowania niż oryginalne. Po uruchomieniu pojawi się standardowy ekran konfiguracyjny, wybierz język.

#### Wgraj pliki na telefon

Wgrywasz na telefon dwa pliki, <span style="color: #800080;"><a href="http://download.chainfire.eu/315/SuperSU/UPDATE-SuperSU-v1.25.zip" target="_blank" rel="nofollow"><span style="color: #800080;">SuperSU</span></a></span> (by Chainfire) oraz <span style="color: #800080;"><a style="line-height: 1.5em;" href="http://www.mediafire.com/?78fkhdh5icz3zdg" target="_blank" rel="nofollow"><span style="color: #800080;">Revert-Recovery-Disabler</span></a></span><span style="line-height: 1.5em;"> (by fkrone).</span>

Jeśli używasz xubuntu, ubuntu to <a href="http://techfreak.pl/jak-zamontowac-dysk-lg-nexus-4-na-ubuntu-tryb-pamieci-mtp/" target="_blank">tu</a> opisałem jak wgrywać pliki na telefon.

Możesz zrobić to też poprzez adb ale musisz uruchomić developer mode przechodząc do <span style="color: #800080;">Settings > About phone</span> i klikając parę razy na <span style="color: #800080;">Build number. <span style="color: #000000;">Cofając się do</span> Settings <span style="color: #000000;">w</span> Developer Options <span style="color: #000000;">włącz</span> USB debugging.</span>

<pre dir="ltr">adb push UPDATE-SuperSU-v1.25.zip /sdcard</pre>

<pre dir="ltr">adb push revert-recovery-disabler_signed.zip /sdcard</pre>

#### Wgrywanie nowego recovery

Ponownie trzeba zrestartować telefon i uruchomić w trybie <span style="color: #ff0000;">fastboot mode,<span style="color: #000000;"> następnie wgrać recovery pobrane ze strony <a href="http://download2.clockworkmod.com/recoveries/recovery-clockwork-touch-6.0.3.1-mako.img">clockworkmod.com</a></span></span>

<pre>fastboot flash recovery recovery-clockwork-touch-6.0.3.1-mako.img</pre>

#### Restartujemy telefon do nowego recovery

Będąc w fastboot mode przechodzimy do recovery ( 2x vol &#8211; i pwr ) z którego trzeba zainstalować <span style="color: #800080;">Revert-Recovery-Disabler</span> aby zainstalować recovery na stałe i <span style="color: #800080;">superuser</span> aby zwiększyć uprawnienia.

Gdy jesteś już w clockwork recovery.

Wybieramy <span style="color: #3366ff;">Install zip from sdcard</span> następnie <span style="color: #3366ff;">choose zip from sdcard</span>, <span style="color: #3366ff;">sdcard</span>, <span style="color: #3366ff;"><span style="color: #000000;">, <span style="color: #00ff00;">Revert-Recovery-Disabler</span></span></span>

Wybieramy <span style="color: #3366ff;">Install zip from sdcard</span> następnie <span style="color: #3366ff;">choose zip from sdcard</span>, <span style="color: #3366ff;">sdcard</span>, <span style="color: #3366ff;"></span>, <span style="color: #00ff00;">superuser.zip</span>

#### Superuser na pokładzie

Po wyjściu z recovery <span style="color: #00ff00;">reboot system now <span style="color: #000000;">uruchomi się system w którym znajdziemy nowy program superuser.</span></span>

&nbsp;

opis na podstawie <http://forum.xda-developers.com/showthread.php?t=2142201>