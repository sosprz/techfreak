---
title: Jak naprawić grub po awarii lub przeniesieniu na inny dysk ?
author: Przemek
type: post
date: 2012-10-02T17:05:35+00:00
url: /jak-naprawic-grub-po-awarii-lub-przeniesieniu-na-inny-dysk/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1025091385
hits:
  - 353
categories:
  - Linux
tags:
  - grub

---
## Jak naprawić grub po awarii ?

<!--more-->

Przykładowe informacje o partycjach:  
/dev/sda1 /boot  
/dev/sda2 swap  
/dev/sda3 / (root)

<pre class="lang:default highlight:0 decode:true">mount /dev/sda3 /mnt
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
chroot /mnt
mount /dev/sda1 /boot
grub-install /dev/sda
update-grub
reboot</pre>