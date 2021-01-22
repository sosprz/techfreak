---
title: Screen – manager terminali
author: Przemek
type: post
date: 2012-10-03T07:05:46+00:00
url: /screen-manager-terminali/
bfa_virtual_template:
  - hierarchy
hits:
  - 128
dsq_thread_id:
  - 1046783423
categories:
  - Linux

---
## Jak nie stracić zadań po wyjściu z konsoli ?

<!--more-->

Screen &#8211; przydatny dla irca lub gdy wykonujemy jakieś zadania np: find a jest możliwośś że zaraz stracimy terminal lub wychodzimy z pracy ;)

&nbsp;

**Uruchamianie:**

<pre class="lang:default highlight:0 decode:true">screen</pre>

**ctrl a c** &#8211; nowe okno  
**ctrl a &#8222;** &#8211; lista okien  
**ctrl a d** &#8211; odłączenie się  
**ctrl a [** &#8211; wejscie w tryb kopiowania tekstu  
**h** &#8211; poruszanie kursorem w lewo (w trybie kopiowania tekstu)  
**j** &#8211; poruszanie kursorem w dół (w trybie kopiowania tekstu)  
**k** &#8211; poruszanie kursorem do góry (w trybie kopiowania tekstu)  
**l** &#8211; poruszanie kursorem w prawo (w trybie kopiowania tekstu)  
**spacja** &#8211; zaznaczenie tekstu, koniec zaznaczania (w trybie kopiowania tekstu)  
**ctrl a ]** &#8211; wklejenie tekstu

&nbsp;

**Przywracanie konsoli:**

<pre class="lang:default highlight:0 decode:true">screen -r</pre>

&nbsp;