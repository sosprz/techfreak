---
title: Jak używać DD z monitorowaniem postępu?
author: Przemek
type: post
date: 2018-10-06T19:19:06+00:00
url: /linux-dd-monitorowanie-postepu/
featured_image: /wp-content/uploads/2018/10/techfrea-linux-dd-staus-progress.jpg
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - dd
  - Raspberry pi

---
Zawsze zapominam jak włączyć monitorowanie postępu gdy używam dd!

<!--more-->

Zawsze gdy nagrywam jakieś obrazy systemów na kartę SD chcę widzieć postęp. Bardzo często się zdarza, że karty są uszkodzone a bez podglądu nie widać aktualnych transferów. Co za tym idzie takie przegrywanie może odbywać się w nieskończoność. Więc aby polecenie dd pokazywało status zawsze trzeba na koniec linii dopisać: **status=progress**. Poniżej podaje przykład użycia.

<pre>dd if=obraz.img of=/dev/mmcblk0 bs=4M status=progress</pre>

Poniżej wycinek z realnego użycia polecenia ze statusem

<pre>root@E74:/home/sosprz/Downloads# dd if=OpenELEC-RPi.arm-8.0.4.img of=/dev/mmcblk0 bs=4M status=progress
570425344 bytes (570 MB, 544 MiB) copied, 19 s, 30,6 MB/s
137+0 records in
137+0 records out
574619648 bytes (575 MB, 548 MiB) copied, 18,6702 s, 30,8 MB/s</pre>