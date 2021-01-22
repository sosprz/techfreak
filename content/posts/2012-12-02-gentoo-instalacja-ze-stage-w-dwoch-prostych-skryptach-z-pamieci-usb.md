---
title: Gentoo instalacja ze stage w dwóch prostych skryptach z pamięci usb
author: Przemek
type: post
date: 2012-12-01T23:15:13+00:00
url: /gentoo-instalacja-ze-stage-w-dwoch-prostych-skryptach-z-pamieci-usb/
bfa_virtual_template:
  - hierarchy
hits:
  - 279
dsq_thread_id:
  - 1020722796
categories:
  - Linux
tags:
  - gentoo

---
Skrypt pomagający zainstalować Gentoo z USB (stage1)

<!--more-->

<pre>#! /bin/bash 

date
passwd
hdparm -d1c1u1m16 /dev/hda
ifconfig eth0 192.168.1.2
route add default gw 192.168.1.1
echo "nameserver 192.168.14.1" &gt;&gt; /etc/resolv.conf
echo "konfiguracja dyskow"
mke2fs  /dev/hda1 && mke2fs -j /dev/hda3
mkswap /dev/hda2 && swapon /dev/hda2
mount /dev/hda3 /mnt/gentoo && mkdir /mnt/gentoo/boot && mount /dev/hda1 /mnt/gentoo/boot

cd /mnt/gentoo/
if du -sh stage1-x86-2006.1.tar.bz2
then echo "STAGE ISTNIEJE ;)"
else
wget http://mirror.datapipe.net/gentoo/releases/
x86/2006.1/stages/stage1-x86-2006.1.tar.bz2
fi

tar -xvjpf stage?-*.tar.bz2

#kopiowanie wczesniej przygotowanych make.conf fstab lilo.conf resolv.conf locales.build rc.conf
cp -Rf /usb/gentoo-installer/etc /mnt/gentoo/

#mirrorselect -s4 -o -D  &gt;&gt; /mnt/gentoo/etc/make.conf

mount -t proc proc /mnt/gentoo/proc
mount -o bind /dev /mnt/gentoo/dev
mkdir /mnt/gentoo/usb
mount /dev/sda1 /mnt/gentoo/usb
mkdir /mnt/gentoo/hdd
mount /dev/hda4 /mnt/gentoo/hdd
chroot /mnt/gentoo /bin/bash
#############koniec 1 czesci
</pre>

Druga cześć skryptu którą trzeba odpalić po chroot.

<pre>#! /bin/bash 

rm -Rf /usr/portage
ln -s /hdd/gentoo/portage /usr/portage
env-update && source /etc/profile
read y 
emerge --sync
emerge portage
echo "sys-libs/glibc userlocales" &gt;&gt; /etc/portage/package.use
nano -w /etc/locale.gen
echo "en_US/ISO-8859-1" &gt; /etc/locale.gen
echo "en_US.UTF-8/UTF-8" &gt; /etc/locale.gen
read x
echo "bootstrapowanie"
env-update && source /etc/profile && 
emerge --oneshot --nodeps gcc-config && USE="-* build bootstrap" emerge linux-headers 
&& emerge --nodeps gdbm libperl perl && 
/usr/portage/scripts/bootstrap.sh &&  

echo "koniec bootstrapowania"
echo "instalacja systemu"
emerge -O libperl && emerge -O python && emerge --deep system 

echo "instalka programow"
USE=openntpd emerge --nodeps acpid ntp && emerge slocate syslog-ng lilo vixie-cron udev dhcpcd && 
rc-update add syslog-ng default && rc-update add net.eth0 default && rc-update add vixie-cron default 
rc-update add ntp-client default && ntpdate -u -b pool.ntp.org
echo "strefa czasowa"
rm /etc/localtime
cp /usr/share/zoneinfo/Poland  /etc/localtime
ntpdate -u -b pool.ntp.org

echo "kompilacja"
emerge -f gentoo-sources genkernel
genkernel --menuconfig all

#### nano fstyb
#### nano lilo
#### emerge gentoo xdm
</pre>