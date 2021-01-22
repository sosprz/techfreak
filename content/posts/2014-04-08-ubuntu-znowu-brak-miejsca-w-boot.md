---
title: Ubuntu – Znowu brak miejsca w boot
author: Przemek
type: post
date: 2014-04-08T17:53:56+00:00
url: /ubuntu-znowu-brak-miejsca-w-boot/
featured_image: /wp-content/uploads/2014/04/ubuntu_no_space_on_boot_1.jpg
hits:
  - 1849
dsq_thread_id:
  - 2596563505
categories:
  - Linux
tags:
  - bash
  - ubuntu

---
Dziś chciałbym napisać, pokazać lub przypomnieć, co zrobić jak na partycji /boot  zabraknie miejsca. Moi znajomi często mają ten problem przez który nie kończy się aktualizacja systemowa, dokładnie chodzi o Ubuntu. Wiadomo nikt nie lubi czerwonych wykrzykników w prawym górnym rogu. Ja używam xubuntu.

<!--more-->

Zaczynając od początku. W pewnym momencie pracy wyskakuje okienko **Software Updatera**. Ja klikam zawsze **Install now**.

[<img class="aligncenter size-full wp-image-6822" alt="ubuntu_brak_miejsca_na_partycji_boot0" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot0.jpg" width="461" height="430" />][1]

&nbsp;

Po paru chwilach mielenia i ściągania pakietów okazuje się ze zabrakło miejsca na /boot. To oznacza że, za dużo mamy tam kerneli. Trzeba jakoś oczyścić tą partycję.

[<img class="aligncenter size-full wp-image-6823" alt="ubuntu_brak_miejsca_na_partycji_boot1" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot1.jpg" width="457" height="404" />][2]

W tym celu na początek wyświetlam listę kerneli aby jeszcze przed rebootem mieć w pamięci co tam było i ile tego było.

<pre>dpkg -l |grep linux-image</pre>

[<img class="aligncenter size-full wp-image-6824" alt="ubuntu_brak_miejsca_na_partycji_boot2" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot2.jpg" width="695" height="157" />][3]

Kiedyś znalazłem w necie skrypt który używam do dziś. Usuwa on wszystkie kernele oprócz aktualnie używanego.

<pre>sudo apt-get remove --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d')</pre>

[<img class="aligncenter size-full wp-image-6825" alt="ubuntu_brak_miejsca_na_partycji_boot3" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot3.jpg" width="1008" height="157" />][4]

Wszystkie stare kernele usunięte można kontynuować aktualizacje.

[<img class="aligncenter size-full wp-image-6826" alt="ubuntu_brak_miejsca_na_partycji_boot4" src="http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot4.jpg" width="783" height="481" />][5]

Wyżej widać że wszystko poszło dobrze. I doinstalowało się jedno nowe jądro.

ps. Wiem z tymi znajomymi przesadziłem. Ale to na potrzeby wpisu :)

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot0.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot2.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot3.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/04/ubuntu_brak_miejsca_na_partycji_boot4.jpg