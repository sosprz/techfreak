---
title: Emulacja Raspberry Pi na QEMU
author: Przemek
type: post
date: 2016-04-07T06:45:03+00:00
url: /emulacja-raspberry-pi-qemu/
featured_image: /wp-content/uploads/2016/04/techfreak-raspberry-pi-qemu-4_1.jpg
dsq_thread_id:
  - 4718231467
categories:
  - Linux
tags:
  - Raspberry pi

---
Chociaż każdy może zakupić Raspberry Pi w całkiem niskiej cenie to czasem może zdarzyć się sytuacja, że zajdzie potrzeba emulacji tego mini komputerka na maszynie wirtualnej. Poniżej pokaże jak emulować Raspberry Pi na QEMU.

<!--more-->

### Instalacja QEMU

<pre>apt-get install qemu-system</pre>

### Obraz img

Obraz jak zawsze można pobrać ze strony <a href="https://www.raspberrypi.org/downloads/raspbian/" target="_blank">raspberrypi.org</a>

### Montowanie obrazu

Do pliku **_mount_** wklej poniższy skrypt, który zamontuje druga partycje z obrazu. Obraz img dla RPI ma zawsze dwie partycje boot i root.

Pamiętak o tym aby zamienić *.img na nazwę jeśli w katalogu masz więcej niż jeden obraz IMG.

<pre>#!/bin/bash
where=/mnt
for i in $(file *.img|gawk 'BEGIN {RS="startsector"} NR &gt; 1 {
print $0*512}');do
    mount -o rw,offset=$i *.img $where
    where=/media
done
df</pre>

Odpal skrypt mount

<pre>root@host:/home/hdd/rpi-vm# ./mount
 Filesystem     1K-blocks      Used Available Use% Mounted on
 udev             8141260         0   8141260   0% /dev
 tmpfs            1631936     18108   1613828   2% /run
 /dev/dm-1      229350628 142183784  75493452  66% /
 tmpfs            8159676       304   8159372   1% /dev/shm
 tmpfs               5120         4      5116   1% /run/lock
 tmpfs            8159676         0   8159676   0% /sys/fs/cgroup
 /dev/sda1         240972    103448    125083  46% /boot
 tmpfs            1631936        64   1631872   1% /run/user/1000
 /dev/loop0         61384     20312     41072  34% /mnt
 /dev/loop1       6374456    896492   5190576  15% /media</pre>

Wyłącz linie w pliku: /media/etc/ld.so.preload  
nano /media/etc/ld.so.preload

<pre>#/usr/lib/arm-linux-gnueabihf/libarmmem.so</pre>

Odmontuj obraz.

<pre>umount /media</pre>

### Powiększanie obrazu

Aby można było pracować na systemie po uruchomieniu trzeba powiększyć partycje.

<pre>qemu-img resize 2016-02-26-raspbian-jessie-lite.img +5G</pre>

<pre>WARNING: Image format was not specified for '2016-02-26-raspbian-jessie-lite.img' and probing guessed raw.
 Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
 Specify the 'raw' format explicitly to remove the restrictions.
 Image resized.</pre>

Po takiej akcji już można odpalić system, do tego trzeba pobrać zmodyfikowany kernel, który leży normalnie na partycji boot.

<pre>git clone https://github.com/polaco1782/raspberry-qemu</pre>

Odpalamy pierwszy raz system przez QEMU  
qemu-system-arm -kernel raspberry-qemu/kernel-qemu -cpu arm1176 -m 256 -M versatilepb -hda 2016-02-26-raspbian-jessie-lite.img -append &#8222;root=/dev/sda2 rootfstype=ext4&#8221;

Aby powiększyć partycję trzeba ją usunąć i dodać na nowo. Do tego należy użyć fdisk. **Tą akcje robimy już na wirtualnym systemie.**

_Poniżej sekwencja wprowadzania komend w fdisk_

<pre>fdisk /dev/sda
d
n
p
2
2 x enter
w
</pre>

Po usunięciu i utworzeniu partycji na nowo. Trzeba zrestartować system.

<pre>reboot</pre>

Po uruchomieniu i zalogowaniu należy rozszerzyć system plików

<pre>resize /dev/sda2</pre>

Należy jeszcze usunąć wpis boot w fstabie i zamienić mmcblk na sda

<pre>nano /etc/fstab</pre>

<pre>proc            /proc           proc    defaults          0       0
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    defaults,noatime,nodiratime  0       1

</pre>

Tak ma wyglądać wpis:

<pre>nano /etc/fstab</pre>

<pre>proc            /proc           proc    defaults          0       0
/dev/sda2  /               ext4    defaults,noatime,nodiratime  0       1</pre>

&nbsp;

### Sieć, dostęp po www i ssh

Aby dostać się na port 22 i np. 80 maszyny wirtualnej należy zrobić taki wewnętrzny portforward przy pdpalaniu QEMU

ssh na porcie 8022, www na porcie 8080

<pre>qemu-system-arm -kernel raspberry-qemu/kernel-qemu -cpu arm1176 -m 256 -M versatilepb -hda 2016-02-26-raspbian-jessie-lite.img -append "root=/dev/sda2 rootfstype=ext4" -redir tcp:8022::22 -redir tcp:8080::80</pre>

### Koniec

Mam nadzieje że ta któtka instrukcja pomoże wam szybko testować obrazy raspbiana dla RPI. Jak by co dawajcie znać w komentarzach.

&nbsp;