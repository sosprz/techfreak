---
title: Jak masowo dodawać logo do zdjęć?
author: Przemek
type: post
date: 2014-10-10T13:52:32+00:00
url: /masowo-dodawac-logo-zdjec/
featured_image: /wp-content/uploads/2014/10/konwertowanie_fotek_1.jpg
hits:
  - 272
dsq_thread_id:
  - 3103293296
colormag_page_layout:
  - default_layout
onesignal_meta_box_present:
  - 1
categories:
  - Linux
tags:
  - ubuntu

---
Jak przeglądacie czasem tę stronę możecie zauważyć że fotki które są dodawane do wpisów zawierają logo. Kiedyś pomyślałem sobie że to może być dobra reklama przy wyszukiwaniu grafiki w przeglądarkach. Czasem w obszernych wpisach fotek jest naprawdę dużo np. <a href="http://techfreak.pl/drukarka-3d-profab-gate-le/" target="_blank" rel="noopener">Drukarka 3D</a>, <a href="http://techfreak.pl/zbudowac-quadcopter-fpv250-naze32-dys-be1806/" target="_blank" rel="noopener">quadcopter</a>. Kto myślał że dodaje logo ręcznie naprawdę się pomylił. Używam do tego małego skryptu który zaprezentuje poniżej.

<!--more-->

### Jak to wygląda?

[<img class="aligncenter size-full wp-image-7821" src="http://techfreak.pl/wp-content/uploads/2014/10/konwertowanie_fotek_1.jpg" alt="konwertowanie_fotek_1" width="1000" height="567" />][1]

### Co robi skrypt i co potrzeba?

Na pewno potrzebny jest pakiet imagemagick i logo w formacie png. U mnie skrypt siedzi w pliku res a nazwa loga to logo.png

<pre>#! /bin/bash

mkdir new 2 &gt;/dev/null

ls=`ls |grep -E "jpg|JPG"`
count=`ls |grep -cE "jpg|JPG"`
i=0
echo "Do skonwertowania $count pliki"

for img in $ls; do
filename=${img%.*}
convert "$filename.*" -resize 1000 -quality 75% new/"$nazwa$filename"_1.jpg
composite -gravity SouthEast logo.png new/"$nazwa$filename"_1.jpg new/"$nazwa$filename"_1.jpg
let i=$i+1
echo -n -e "skonwertowane $i - $count \r"
done
</pre>

### Tłumaczenie

1. Skrypt tworzy katalog new do którego będzie wrzucał gotowe fotki.

2. ls z grepem szukają plików z rozszerzeniem JPG

3. Pętla for wykona dwa działania na znalezionych plikach JPG

4. convert &#8211;  zmniejszy plik JPG do rozdzielczości 1000px i obniży jego jakość do 75%. Co spowoduje znaczne zmniejszenie wielkości pliku.  
5. composite &#8211; wstawi logo w prawy dolny róg

6. echo -n -e \r wyświetla odliczanie plików w tej samej linii.

[ ][1]

 [1]: http://techfreak.pl/wp-content/uploads/2014/10/konwertowanie_fotek_1.jpg