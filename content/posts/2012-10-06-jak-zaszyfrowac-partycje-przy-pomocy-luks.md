---
title: Jak zaszyfrować partycje przy pomocy LUKS ?
author: Przemek
type: post
date: 2012-10-06T15:07:26+00:00
url: /jak-zaszyfrowac-partycje-przy-pomocy-luks/
bfa_virtual_template:
  - hierarchy
hits:
  - 338
dsq_thread_id:
  - 1017809097
categories:
  - Linux

---
## Jak zaszyfrować partycję i ustawić hasło przy uruchomieniu systemu ?

<!--more-->

**Przygotowanie partycji:**

Tworzymy tablice partycji fdiskiem:

<pre class="lang:default highlight:0 decode:true">fdisk /dev/sda</pre>

W tym wypadku szyfrowaną partycją będzie /dev/sda4

Sprawdzanie czy nie ma błedów na partycji:

<pre class="lang:default highlight:0 decode:true">/sbin/badblocks -c 10240 -s -w -t random -v /dev/sda4</pre>

Wypełnianie partycji losowymi danymi:

<pre class="lang:default highlight:0 decode:true">shred -v /dev/sda4</pre>

&nbsp;

**Inicjalizacja partycji:**

Szyfrujemy partycje domyślnym algorytmem:

<pre class="lang:default highlight:0 decode:true">cryptsetup luksFormat /dev/sda4</pre>

&nbsp;

**Mapowanie:**

Zmapuję /dev/sda4 pod dowolnie wybraną nazwę np: crypt-sda4

<pre class="lang:default highlight:0 decode:true">cryptsetup luksOpen /dev/sda4 crypt-sda4</pre>

&nbsp;

**Tworzenie systemu plików:**

<pre class="lang:default highlight:0 decode:true">mkfs.ext4 -j /dev/mapper/crypt-sda4</pre>

&nbsp;

**Montowanie:**

<pre class="lang:default highlight:0 decode:true">mount /dev/mapper/crypt-sda4 /hdd/</pre>

Na tym etapie mozna zakonczyć szyfrowanie np: pendrive ale jeśli jest to partycja systemowa to

trzeba zamontować ją jeszcze po restarcie a to poniżej:

&nbsp;

**Montowanie po restarcie:**

<pre class="lang:default highlight:0 decode:true">mount /dev/mapper/crypt-sda4 /hdd/
cryptsetup -y luksOpen /dev/sda4
mount /dev/mapper/crypt-sda4 /hdd</pre>

&nbsp;

**Automatyczne montowanie przy starcie systemu:**

Plik: /etc/conf.d/dmcrypt

<pre class="lang:default highlight:0 decode:true">target=crypt-sda4
source=/dev/sda4</pre>

Plik: /etc/fstab

<pre class="lang:default highlight:0 decode:true">/dev/mapper/crypt-sda4 /katalog ext4 noatime 0 0</pre>

I to na tyle, przy starcie systemu będziemy poproszeni o hasło do partycji.

&nbsp;

**Inne przydatne działania:**

Dodawanie klucza do zaszyfrowaniej partycji:

<pre class="lang:default highlight:0 decode:true">cryptsetup luksAddKey /dev/sda4</pre>

Usuwanie klucza z zaszyfrowanej partycji:

<pre class="lang:default highlight:0 decode:true">cryptsetup luksDelKey /dev/sda4 1</pre>

Informacje o kluczach przypisanych do zaszyfrowanej partycji:

<pre class="lang:default highlight:0 decode:true">cryptsetup luksDump /dev/sda4</pre>

Sprawdzamy jakie mamy dostępne algorytmy:

<pre class="lang:default highlight:0 decode:true">cat /proc/crypto</pre>

&nbsp;

&nbsp;

&nbsp;