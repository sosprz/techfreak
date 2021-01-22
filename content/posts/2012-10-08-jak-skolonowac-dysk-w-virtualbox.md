---
title: Jak sklonować dysk w VirtualBox ?
author: Przemek
type: post
date: 2012-10-08T09:34:01+00:00
url: /jak-skolonowac-dysk-w-virtualbox/
bfa_virtual_template:
  - hierarchy
dsq_thread_id:
  - 1025031038
hits:
  - 348
categories:
  - Linux
tags:
  - virtualbox

---
Jak sklonować, zrobić lustrzana kopie dysku w VirtualBox ?

<!--more-->

Klonowanie dysku w virtualbox:

<pre class="lang:default highlight:0 decode:true">VBoxManage clonehd /hdd/VirtualBox/clean_vbox/xp.vdi clone_xp.vdi --format VDI</pre>

Zmiana obrazu dysku o stałym rozmiarze na dynamiczny:

<pre class="lang:default highlight:0 decode:true">VBoxManage modifyvdi clone_xp.vdi compact</pre>

Montowanie na wirtualnej maszynie (windows) udostępnionego folderu wspólnego:

<pre class="lang:default highlight:0 decode:true">net use p: \vboxsvrVirtualFiles2</pre>

&nbsp;