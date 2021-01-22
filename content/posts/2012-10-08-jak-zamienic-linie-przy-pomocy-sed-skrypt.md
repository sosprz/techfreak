---
title: Jak zamienić linie przy pomocy sed ? (skrypt)
author: Przemek
type: post
date: 2012-10-08T07:35:04+00:00
url: /jak-zamienic-linie-przy-pomocy-sed-skrypt/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1026364889
hits:
  - 173
categories:
  - Linux

---
Jak zamienić linie w pliku ?

<!--more-->

Przykład sed (stream editor) zamieniajacy jeden wyraz na drugi we wszystkich plikach zawierających wybrane słowo:

<pre class="lang:default highlight:0 decode:true">#! /bin/bash -x

touch logs
echo "qwe" &gt; logs

echo "Wpisz w jakich plikach mam zmienic zawartosc:"
echo "Przyklad: logs"
read x;
echo "Wpisz wyraz który ma byc zmieniony:"
echo "przyklad: qwe"
read y;
echo "wpisz wyraz na który na byc zmieniony:"
echo "Przyklad: asd"
read z;

for i in `ls`; do
if ls |grep $x ; then
sed -i -e 's/'$y'/'$z'/g' $i
fi
done

cat $i</pre>

&nbsp;