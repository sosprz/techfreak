---
title: Test prędkości dysku z graficznym interfejsem w Ubuntu
author: Przemek
type: post
date: 2017-02-05T17:07:56+00:00
url: /test-predkosci-dysku-graficznym-interfejsem-ubuntu/
featured_image: /wp-content/uploads/2017/02/test-gnome-test-disk-utility-sd-card-11.png
dsq_thread_id:
  - 5524518188
categories:
  - Linux
tags:
  - ubuntu
  - xubuntu

---
Czasami trzeba sprawdzić dysk na USB lub kartę SD czy nie zawiera błędów lub czy prędkość karty jest odpowiednia. Pytanie jak to zrobić na Ubuntu, Xubuntu? :)

<!--more-->

Aby sprawdzić prędkość karty lub innego dysku na USB trzeba na początek zainstalować Disks czyli gnome-disk-utility. Można to zrobić prze Ubuntu Software Center lub apt.

### apt-get

<pre>sudo apt-get install gnome-disk-utility
</pre>

### Ubuntu Software Center

[<img class="aligncenter wp-image-12617" src="http://techfreak.pl/wp-content/uploads/2017/02/Screenshot_2017-02-05_17-30-43.png" alt="" width="559" height="384" />][1]

[<img class="aligncenter wp-image-12623" src="http://techfreak.pl/wp-content/uploads/2017/02/test-gnome-test-disk-utility-sd-card-10.png" alt="" width="578" height="505" />][2]

Poniżej widać testy prędkości zapisu i odczytu

[<img class="aligncenter wp-image-12624" src="http://techfreak.pl/wp-content/uploads/2017/02/test-gnome-test-disk-utility-sd-card-11.png" alt="" width="570" height="510" />][3]

&nbsp;

### Badblocks

Badblocks uruchomia się z shella, aby sprawdzić pod jakim urządzeniem pojawił się dysk można wykonać polecenia:

#### ls

<pre>root@E74:/# ls /dev/mmc*
/dev/mmcblk0 /dev/mmcblk0p1</pre>

&nbsp;

#### fdisk

<pre>root@E74:/# fdisk -l

Disk /dev/mmcblk0: 29 GiB, 31104958464 bytes, 60751872 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device Boot Start End Sectors Size Id Type
/dev/mmcblk0p1 * 8192 60751871 60743680 29G c W95 FAT32 (LBA)</pre>

&nbsp;

Test odczytu można przeprowadzić za pomocą komendy:

<pre>badblocks -sv /dev/mmcblk0p1</pre>

[<img class="aligncenter wp-image-12620" src="http://techfreak.pl/wp-content/uploads/2017/02/Screenshot_2017-02-05_15-35-42.png" alt="" width="581" height="423" />][4]

Test zapisu

<pre>badblocks -wsv /dev/mmcblk0p1</pre>

[<img class="aligncenter wp-image-12621" src="http://techfreak.pl/wp-content/uploads/2017/02/Screenshot_2017-02-05_17-16-38.png" alt="" width="581" height="423" />][5]

Okazało się, że moja karta SD jest sprawna! Mam nadzieje, że twoja też.

 [1]: http://techfreak.pl/wp-content/uploads/2017/02/Screenshot_2017-02-05_17-30-43.png
 [2]: http://techfreak.pl/wp-content/uploads/2017/02/test-gnome-test-disk-utility-sd-card-10.png
 [3]: http://techfreak.pl/wp-content/uploads/2017/02/test-gnome-test-disk-utility-sd-card-11.png
 [4]: http://techfreak.pl/wp-content/uploads/2017/02/Screenshot_2017-02-05_15-35-42.png
 [5]: http://techfreak.pl/wp-content/uploads/2017/02/Screenshot_2017-02-05_17-16-38.png