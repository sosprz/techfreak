---
title: Gentoo – przydatne polecenia
author: Przemek
type: post
date: 2012-12-01T23:23:20+00:00
url: /gentoo-przydatne-polecenia/
bfa_virtual_template:
  - hierarchy
hits:
  - 213
dsq_thread_id:
  - 1023644187
categories:
  - Linux
tags:
  - gentoo

---
Spis przydatnych poleceńdla systemy Linux Gentoo

<!--more-->

Wypisanie zainstalowanych programów przez użytkownika (wymagany: gentoolkit):

<pre class="lang:default highlight:0 decode:true">equery list -i &gt; lista</pre>

Reinstalacja programów zawierająca w nazwie &#8222;lib&#8221;:

<pre class="lang:default highlight:0 decode:true">emerge `qlist -I -C lib`</pre>

update-world:

<pre class="lang:default highlight:0 decode:true">emerge --sync && emerge -vpuDN world</pre>

Aktualizacja zmiennych:

<pre class="lang:default highlight:0 decode:true">env-update && source /etc/profile</pre>

Czytanie newsów gentoo:

<pre class="lang:default highlight:0 decode:true">eselect news list</pre>

Odświeżanie cache ikonek:

<pre class="lang:default highlight:0 decode:true">gtk-update-icon-cache -f /usr/share/icons/hicolor</pre>

Problemy z plikami *.la:

<pre class="lang:default highlight:0 decode:true">emerge dev-util/lafilefixer
lafilefixer --justfixit</pre>

&nbsp;

Skanuje system w poszukiwaniu zepsutych bibliotek:

<pre class="lang:default highlight:0 decode:true">revdep-rebuild</pre>

Wykazuje programy zależne od innego pakietu:

<pre class="lang:default highlight:0 decode:true">equery d poppler</pre>

&nbsp;

Wymagany pakiet app-portage/genlop:  
Wypisuje listę zainstalowanych/przeinstalowanych pakietów:

<pre class="lang:default highlight:0 decode:true"># genlop -l</pre>

Wypiszę (podczas kompilacji pakietu) ile trwała kompilacja tego pakietu wcześniej.

<pre class="lang:default highlight:0 decode:true"># genlop -c</pre>

&nbsp;

Przeinstalowanie modułów (wymagany pakiet sys-kernel/module-rebuild):  
Zdarza się że w źródłach jajka nie ma modułu, który by nas interesował, ale jest on w portage.  
Przykładem może być:  
app-laptop/tp_smapi -HDAPS  
app-emulation/virtualbox-modules -wirtualizacja  
sys-fs/vhba -drive emulator  
Podczas instalowaniu w/w pakietów/modułów używa on źródeł kernela który obecnie jest uruchomiony.  
Co się dzieje po zamianie jajka na nowe? &#8211; trzeba prze-kompilowywać pakiety pod nowe źródła jajka. Do tego służy module-rebuild.  
Jednym poleceniem prze-kompilowuje on moduły, którego źródła wskazywane są przez dowiązanie symboliczne /usr/src/linux.

<pre class="lang:default highlight:0 decode:true"># module-rebuild rebuild</pre>

Pokazuje listę pakietów do prze-kompilowania

<pre class="lang:default highlight:0 decode:true"># module-rebuild list</pre>

&nbsp;