---
title: Jak założyć limity na system plików ? (file system quotas)
author: Przemek
type: post
date: 2012-10-06T14:52:29+00:00
url: /jak-zalozyc-limity-na-system-plikow-file-system-quotas/
bfa_virtual_template:
  - hierarchy
hits:
  - 356
dsq_thread_id:
  - 1018916802
categories:
  - Linux

---
## Jak ograniczyć miejsce dyskowe dla poszczególnych użytkowników ?

<!--more-->

Na samym początku w pliku /etc/fstab trzeba zdefiniować który dysk lub partycja ma być objęta file system quotas. Aby to zrobić trzeba dodać po **defaults, usrquota**.

<pre class="lang:default highlight:0 decode:true">/dev/hda1     /home   ext3    defaults,usrquota             1    1</pre>

Następnie należy stworzyć plik aquota.user na dysku gdzie ma być nakładana quota.

<pre class="lang:default highlight:0 decode:true">touch /home/aquota.user 
chmod 600 /home/aquota.user</pre>

Aby zastosować zmiany trzeba albo zamontować ponownie dysk lub uruchomić ponownie maszynie.

<pre class="lang:default highlight:0 decode:true">mount -o remount /home</pre>

Po tych operacjach mamy możliwość włączania i wyłączania file system quotas.

<pre class="lang:default highlight:0 decode:true">quotaon - włączanie quota na systemie plików.
quotaoff - wyłączanie quota na systemie plików.</pre>

Skanowanie dysków i sprawdzanie na jakie dyski/partycje została nałożona quota.

<pre class="lang:default highlight:0 decode:true">quotacheck -vguma</pre>

Sprawdzanie czy quota jest nałożona.

<pre class="lang:default highlight:0 decode:true">quotaon -av</pre>

Gdy sam mechanizm quota jest uruchomiony można przystąpić do nakładania limitów na konkretnych użytkowników.

Wyświetlanie limitów quota dla użytkownika.

<pre class="lang:default highlight:0 decode:true">quota -u user</pre>

Output:

Disk quotas for user devil (uid 666):  
Filesystem blocks soft hard inodes soft hard  
/dev/sda3 62084 3000000 0 0 0 0

Zmiana limitów dla użytkownika.  
Po wydaniu polecenia jak po niżej otworzy się edytor vi w którym trzeba zmienić limity.

<pre class="lang:default highlight:0 decode:true">edquota -u user</pre>

Druga i trzecia kolumna to limit wielkości danych.

Piąta i szósta kolumna to limit ilości plików.

Raporty dla quoty:

<pre class="lang:default highlight:0 decode:true">quota -q
repquota -a</pre>

Przykład z repquota:

<pre class="lang:default highlight:0 decode:true">*** Report for user quotas on device /dev/sda3
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      -- 4619736       0       0         105103     0     0       
daemon    --      20       0       0              3     0     0       
lp        --       8       0       0              1     0     0       
rpm       --   33184       0       0            123     0     0       
avahi     --      12       0       0              3     0     0       
smmsp     --       8       0       0              2     0     0       
vcsa      --       8       0       0              1     0     0       
rpcuser   --       8       0       0              1     0     0       
ntp       --       8       0       0              1     0     0       
xfs       --       0       0       0              1     0     0       
devil	  -- 3079796 3000000 3000000           2613     0     0       
proftpd   --      16       0       0              4     0     0       
curupld   --    4668       0       0            696     0     0       
apache    -- 1152700       0       0          25873     0     0       
svn       -- 1532712 2000000 2000000          26170     0     0       
postfix   --       4       0       0              1     0     0       
mysql     --  245420       0       0            619     0     0</pre>

&nbsp;

&nbsp;