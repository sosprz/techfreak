---
title: Jak szyfrować pliki?
author: Przemek
type: post
date: 2013-01-22T14:05:05+00:00
url: /jak-szyfrowac-pliki/
featured_image: /wp-content/uploads/2013/01/7zip_password_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 376
dsq_thread_id:
  - 1040409924
categories:
  - Linux

---
<p style="text-align: center">
  <a href="http://techfreak.pl/?attachment_id=1941" rel="attachment wp-att-1941"><img class="aligncenter  wp-image-1941" alt="7zip_password_642_362_force" src="http://techfreak.pl/wp-content/uploads/2013/01/7zip_password_642_362_force.jpg" width="385" height="217" /></a>
</p>

Potrzebowałem zaszyfrować parę pojedynczych plików i w sumie wychodzi na to że gpg jest najlepszym wyborem. Z tego powodu że nawet na innym systemie operacyjnym (jak by co) odczytam zaszyfrowany plik.

<!--more-->

Nie do końca mi się podoba szyfrowanie gpg bo po rozszyfrowaniu tworzy plik obok który musimy ręcznie sami skasować co najbezpieczniej jest zrobić np. programem shred żeby nie został ślad po pliku

<pre class="lang:default decode:true">shred -uvz file.txt</pre>

No dobra ale jak zaszyfrować i odszyfrować plik przy pomocy gpg ?

<pre class="lang:default decode:true">gpg -c secret.txt
gpg secret.txt.gpg</pre>

Można to też zrobić przy pomocy openssl

<pre class="lang:default decode:true">openssl des3 &lt; secret.txt &gt; secret.txt.des3
openssl des3 -d &lt; secret.txt.des3 &gt; secret.txt.decrypted</pre>

Następnym przykładem jest 7zip który używa do szyfrowania AES-256

<pre class="lang:default decode:true">7z a -mhe=on -pTWOJE_HASLO archive.7z
7z e archive.7z</pre>