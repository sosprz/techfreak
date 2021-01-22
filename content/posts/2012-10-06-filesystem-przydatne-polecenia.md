---
title: Filesystem przydatne polecenia
author: Przemek
type: post
date: 2012-10-06T11:34:15+00:00
url: /filesystem-przydatne-polecenia/
bfa_virtual_template:
  - hierarchy
hits:
  - 138
dsq_thread_id:
  - 1024560507
categories:
  - Linux

---
## Przydatne polecenia dla systemu plików

<!--more-->

Naprawa ext3 z live cd:

<pre class="lang:default highlight:0 decode:true">fsck.ext3 -nf /dev/hda3 && fsck.ext3 /dev/hda3</pre>

Sprawdzanie kto korzysta w zamontowanego udziału:

<pre class="lang:default highlight:0 decode:true">fuser /mountpoint/</pre>

Uprawnienia &#8211; do zapamiętana na zawsze:

<pre class="lang:default highlight:0 decode:true">R W X
4 2 1</pre>

samba

<pre class="lang:default highlight:0 decode:true">mount.cifs //10.0.0.1/c$ /katalog_na_dysku -o user=mkowalski,pass=supertajnehaslo</pre>

Montwanie katalogu w innym miejscu.

<pre class="lang:default highlight:0 decode:true">mount --bind /home/jasio/upload/ /home/ftp/uploadjasia/</pre>

Montowanie obrazu iso:

<pre class="lang:default highlight:0 decode:true">mount -o loop /home/obraz.bin /cdrom</pre>

tar,rar

Rozpakowywanie:

<pre class="lang:default highlight:0 decode:true">tar -xvf arch.tar.gz</pre>

Pakowanie:

<pre class="lang:default highlight:0 decode:true">tar -cvf arch.tar /home</pre>

Dzielenie:

<pre class="lang:default highlight:0 decode:true">rar a -v300000 -m0 arch.rar plik.iso</pre>

&nbsp;

&nbsp;