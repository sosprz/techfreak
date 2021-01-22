---
title: Zonk przy bootowaniu xubuntu lub ubuntu
author: Przemek
type: post
date: 2014-12-09T04:00:00+00:00
url: /zonk-przy-bootowaniu-xubuntu-lub-ubuntu/
featured_image: /wp-content/uploads/2014/12/techfreak_xubuntu-624x434.jpg
hits:
  - 245
dsq_thread_id:
  - 3304816055
categories:
  - Linux
tags:
  - ubuntu
  - xubuntu

---
Ostatnio natrafiłem na całkiem nieprzyjemny komunikat przy starcie mojego systemu xubuntu. Jedyny sugerowany sposób z internetów to reinstalka. Słabo, ale jednak udało mi się to naprawić w parę chwil. Zobacz jak.

<!--more-->

### Komunikat

<pre>/scripts/local-top/cryptroot: line 1: can't open /dev/mapper/ubuntu--vg-root: no such file
/scripts/local-top/cryptroot: line 1: can't open /dev/mapper/xubuntu--vg-root: no such file</pre>

Mam szyfrowaną partycję root i myślałem że może to jest jakiś mega problem. Ubuntu domyślnie ma recovery mode do którego wchodzi się przez naciśnięcie strzałki przy uruchamianiu gruba i uruchamia wybrany kernel z opcją recovery. Po wejściu, system zapytał mnie o hasło do partycji i zamontował wszystko poprawnie. No to pomyślałem wtf dlaczego może nie działać normalnie? i dlaczego mogło coś się popsuć tak od któregoś uruchomienia. Jedyne co, to update kernela no bo co innego? Do głowy przyszło mi że initramfs może być skopany i trzeba go wygenerować ponownie.

<pre>update-initramfs -k all -c</pre>

U mnie pomogło. Daj znać czy u ciebie też.