---
title: Jak rozszerzyć dysk na LVM?
author: Przemek
type: post
date: 2017-04-26T13:35:31+00:00
url: /jak-rozszerzyc-dysk-na-lvm/
featured_image: /wp-content/uploads/2017/04/lvm-resize-rozszerzanie-partycji.png
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 5786721178
categories:
  - Linux
tags:
  - dysk
  - lvm

---
Zobacz jak rozszerzyć dysk/partycje która jest zarządzana przez LVM i nie stracić danych.

<!--more-->

Mam ogromną ilość wejść na artykuł [konfiguracja-lvm][1] i bardzo się cieszę, że ta instrukcja pomaga wam skonfigurować dyski pod kontrolą LVM. Są tam opisane dwa ćwiczenia [Zmniejszanie dysku][2] i [Rozszerzanie dodawanie nowego dysku do wolumen grupy][3], natomiast brakuje w tym poradniku jak obsłużyć powiększoną partycje np. z poziomu jakiegoś wirtualizatora VirtualBox czy VMware. Najczęstszym przypadkiem jest sytuacja kiedy mamy konkretny dysk systemowy i możemy go powiększyć i nie chcemy dodawać kolejnych dysków tylko trzymać wszystko na jednym. Bardzo łatwo jest powiększyć dysk od strony wirtualizatora ale co z tego jak system tego nie zobaczy automatycznie. Dokładniej mówiąc partycja sama się nie powiększy, system oczywiście z poziomu fdisk na pewno zobaczy tą zmianę np. po restarcie maszyny ale nic więcej się nie stanie. Poniżej pokaże jak krok po kroku wykonać tą operację na parycji z systemem plików ext* lub xfs . Zadanie to zajmie koło 10min pomimo to zalecam zrobić backup maszyny, dysku lub czegokolwiek aby w razie problemów mieć się z czego odzyskać. Backup zajmie chwile więc polecam obejrzeć w tym czasie [meksykanin programista][4].

#### Zarządzanie miejscem za pomocą LVM

Aktualny dysk posiada rozmiar 10G

<pre>root@ubuntu:~# df -h
Filesystem Size Used Avail Use% Mounted on
udev 473M 0 473M 0% /dev
tmpfs 100M 3.2M 96M 4% /run
/dev/mapper/ubuntu--vg-root 8.8G 1.5G 6.9G 17% /
tmpfs 496M 0 496M 0% /dev/shm
tmpfs 5.0M 0 5.0M 0% /run/lock
tmpfs 496M 0 496M 0% /sys/fs/cgroup
tmpfs 99M 0 99M 0% /run/user/1000</pre>

pvs pokazuje informacje o fizycznych volumenach

<pre>root@ubuntu:~# pvs
 PV VG Fmt Attr PSize PFree 
 /dev/sda1 ubuntu-vg lvm2 a-- 10.00g 36.00m</pre>

Na VirtualBox powiększyłem dysk za pomocą poniższej komendy do 12G

<pre>root@test:/home/VirtualBox VMs/ubuntu# VBoxManage modifyhd ubuntu.vdi --resize 12000
 0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
</pre>

Sprawdzam fdisk&#8217;iem czy dysk rzeczywiście został powiększony, jak widać niżej został powiększony

<pre>root@ubuntu:~# fdisk -l
 Disk /dev/sda: 11.7 GiB, 12582912000 bytes, 24576000 sectors
 Units: sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes
 Disklabel type: dos
 Disk identifier: 0x5894cd85

Device Boot Start End Sectors Size Id Type
 /dev/sda1 * 2048 20969471 20967424 10G 8e Linux LVM</pre>

&nbsp;

Dysk jest powiększony ale partycja jeszcze nie, aby ją powiększyć skasuje partycje fdisk&#8217;iem i zaraz po tym utworzę ją na nowo już z nowym rozmiarem. Nie trzeba się bać tego kroku żądne dane nie znikną z tej partycji. Przecież masz backup jak by co :) Pogrubiłem miejsca wydawania poleceń.

Po odpaleniu fdiska mamy dostępne takie akcje:

  * p &#8211; wyświetl informacje
  * n &#8211; nowa partycja, trzeba podać numer
  * d &#8211; skasuj partycje, trzeba podać numer
  * t &#8211; ustaw typ partycji
  * w &#8211; zapisz zmiany na dysku o partycjach

<pre>root@ubuntu:~# <strong>fdisk /dev/sda</strong>

Welcome to fdisk (util-linux 2.29).
 Changes will remain in memory only, until you decide to write them.
 Be careful before using the write command.
<strong> Command (m for help): p
</strong> Disk /dev/sda: 11.7 GiB, 12582912000 bytes, 24576000 sectors
 Units: sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes
 Disklabel type: dos
 Disk identifier: 0x5894cd85

Device Boot Start End Sectors Size Id Type
 /dev/sda1 * 2048 20969471 20967424 10G 8e Linux LVM

Command (m for help):
 Device Boot Start End Sectors Size Id Type
 /dev/sda1 * 2048 20969471 20967424 10G 8e Linux LVM

<strong>Command (m for help): d
 Selected partition 1
</strong> Partition 1 has been deleted.

<strong>Command (m for help): n
</strong> Partition type
 p primary (0 primary, 0 extended, 4 free)
 e extended (container for logical partitions)
<strong> Select (default p): p
</strong> Partition number (1-4, default 1):
 First sector (2048-24575999, default 2048):
 Last sector, +sectors or +size{K,M,G,T,P} (2048-24575999, default 24575999):

Created a new partition 1 of type 'Linux' and of size 11.7 GiB.
 Partition #1 contains a LVM2_member signature.

<strong>Do you want to remove the signature? [Y]es/[N]o: N
</strong>
<strong>Command (m for help): p
</strong>
Disk /dev/sda: 11.7 GiB, 12582912000 bytes, 24576000 sectors
 Units: sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes
 Disklabel type: dos
 Disk identifier: 0x5894cd85

Device Boot Start End Sectors Size Id Type
 /dev/sda1 2048 24575999 24573952 11.7G 83 Linux

<strong>Command (m for help): t
</strong> Selected partition 1
<strong> Partition type (type L to list all types): L
</strong>
0 Empty 24 NEC DOS 81 Minix / old Lin bf Solaris
 1 FAT12 27 Hidden NTFS Win 82 Linux swap / So c1 DRDOS/sec (FAT-
 2 XENIX root 39 Plan 9 83 Linux c4 DRDOS/sec (FAT-
 3 XENIX usr 3c PartitionMagic 84 OS/2 hidden or c6 DRDOS/sec (FAT-
 4 FAT16 &lt;32M 40 Venix 80286 85 Linux extended c7 Syrinx
 5 Extended 41 PPC PReP Boot 86 NTFS volume set da Non-FS data
 6 FAT16 42 SFS 87 NTFS volume set db CP/M / CTOS / .
 7 HPFS/NTFS/exFAT 4d QNX4.x 88 Linux plaintext de Dell Utility
 8 AIX 4e QNX4.x 2nd part 8e Linux LVM df BootIt
 9 AIX bootable 4f QNX4.x 3rd part 93 Amoeba e1 DOS access
 a OS/2 Boot Manag 50 OnTrack DM 94 Amoeba BBT e3 DOS R/O
 b W95 FAT32 51 OnTrack DM6 Aux 9f BSD/OS e4 SpeedStor
 c W95 FAT32 (LBA) 52 CP/M a0 IBM Thinkpad hi ea Rufus alignment
 e W95 FAT16 (LBA) 53 OnTrack DM6 Aux a5 FreeBSD eb BeOS fs
 f W95 Ext'd (LBA) 54 OnTrackDM6 a6 OpenBSD ee GPT
 10 OPUS 55 EZ-Drive a7 NeXTSTEP ef EFI (FAT-12/16/
 11 Hidden FAT12 56 Golden Bow a8 Darwin UFS f0 Linux/PA-RISC b
 12 Compaq diagnost 5c Priam Edisk a9 NetBSD f1 SpeedStor
 14 Hidden FAT16 &lt;3 61 SpeedStor ab Darwin boot f4 SpeedStor
 16 Hidden FAT16 63 GNU HURD or Sys af HFS / HFS+ f2 DOS secondary
 17 Hidden HPFS/NTF 64 Novell Netware b7 BSDI fs fb VMware VMFS
 18 AST SmartSleep 65 Novell Netware b8 BSDI swap fc VMware VMKCORE
 1b Hidden W95 FAT3 70 DiskSecure Mult bb Boot Wizard hid fd Linux raid auto
 1c Hidden W95 FAT3 75 PC/IX bc Acronis FAT32 L fe LANstep
 1e Hidden W95 FAT1 80 Old Minix be Solaris boot ff BBT
<strong> Partition type (type L to list all types): 8e
</strong> Changed type of partition 'Linux' to 'Linux LVM'.

<strong>Command (m for help): w
</strong> The partition table has been altered.
 Calling ioctl() to re-read partition table.
 Re-reading the partition table failed.: Device or resource busy

The kernel still uses the old table. The new table will be used at the next reboot or after you run partprobe(8) or kpartx(8).</pre>

Jak widać wyżej fdisk informuje, że kernel nie zaktualizował sobie informacji o partycjach i najlepiej aby to mu zaktualizować zrestartuj maszynę.

<pre>root@ubuntu:~# reboot</pre>

Po restarcie fdisk widzi już powiększoną partycję.

<pre>root@ubuntu:~# fdisk -l
 Disk /dev/sda: 11.7 GiB, 12582912000 bytes, 24576000 sectors
 Units: sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes
 Disklabel type: dos
 Disk identifier: 0x5894cd85

Device Boot Start End Sectors Size Id Type
 /dev/sda1 2048 24575999 24573952 11.7G 8e Linux LVM</pre>

Sprawdzam poleceniem pvs jak &#8222;lvm&#8217;y&#8221; widzą partycję. Muszę sam ręcznie powiększyć ten &#8222;fizyczny kontener&#8221; tak właśnie zarządza się miejscem za pomocą LVM.

<pre>root@ubuntu:~# pvs
 PV VG Fmt Attr PSize PFree
 /dev/sda1 ubuntu-vg lvm2 a-- 10.00g 36.00m
 root@ubuntu:~# pvresize /dev/sda1
 Physical volume "/dev/sda1" changed
 1 physical volume(s) resized / 0 physical volume(s) not resized</pre>

Sprawdzam pvs ponownie i widzę, że teraz widać żądaną wielkość

<pre>root@ubuntu:~# pvs
 PV VG Fmt Attr PSize PFree
 /dev/sda1 ubuntu-vg lvm2 a-- 11.71g 1.75g</pre>

Przechodzę do logicznych wolumenów i sprawdzam co u nich. Widać, że trzeba wolumen grupie zwiększyć rozmiar. Teraz mam z czego bo mam fizycznie większą partycję.

<pre>root@ubuntu:~# lvs
 LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
 root ubuntu-vg -wi-ao---- 8.96g
 swap_1 ubuntu-vg -wi-ao---- 1020.00m</pre>

Powiększam wolumen grupe o całe dostępne miejsce

<pre>root@ubuntu:~# lvresize -l +100%FREE /dev/mapper/ubuntu--vg-root
 Size of logical volume ubuntu-vg/root changed from 8.96 GiB (2295 extents) to 10.72 GiB (2744 extents).
 Logical volume ubuntu-vg/root successfully resized.</pre>

Teraz muszę rozszerzyć filesystem, robię to rezise2fs jeśli filesystem to ext3/4, jeśli filesystem to xfs muszę uzyć xfs_growfs

<pre>root@ubuntu:~# resize2fs /dev/mapper/ubuntu--vg-root
 resize2fs 1.43.4 (31-Jan-2017)
 Filesystem at /dev/mapper/ubuntu--vg-root is mounted on /; on-line resizing required
 old_desc_blocks = 2, new_desc_blocks = 2
 The filesystem on /dev/mapper/ubuntu--vg-root is now 2809856 (4k) blocks long.
lub</pre>

<pre>root@ubuntu:~# xfs_growfs /dev/mapper/ubuntu--vg-root</pre>

Sprawdzam czy system widzi poprawnie powiększoną partycję

<pre>root@ubuntu:~# df -h
 Filesystem Size Used Avail Use% Mounted on
 udev 473M 0 473M 0% /dev
 tmpfs 100M 3.2M 96M 4% /run
 <strong>/dev/mapper/ubuntu--vg-root 11G 1.5G 8.6G 15% /</strong>
 tmpfs 496M 0 496M 0% /dev/shm
 tmpfs 5.0M 0 5.0M 0% /run/lock
 tmpfs 496M 0 496M 0% /sys/fs/cgroup
 tmpfs 99M 0 99M 0% /run/user/1000</pre>

Dawajcie znać w komentarzach jak wam poszło :)

 [1]: //techfreak.pl/konfiguracja-lvm/
 [2]: //techfreak.pl/konfiguracja-lvm#Zmniejszanie_dysku
 [3]: //techfreak.pl/konfiguracja-lvm#Rozszerzanie_dodawanie_nowego_dysku_do_wolumen_grupy
 [4]: https://www.youtube.com/watch?v=1aEqd4bl6Bs