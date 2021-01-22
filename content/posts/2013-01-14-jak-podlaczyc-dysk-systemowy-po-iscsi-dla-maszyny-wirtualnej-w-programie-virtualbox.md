---
title: Jak podłączyć dysk systemowy po iSCSI dla maszyny wirtualnej w programie VirtualBox?
author: Przemek
type: post
date: 2013-01-14T12:36:25+00:00
url: /jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/
featured_image: /wp-content/uploads/2013/01/virtualbox_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 753
dsq_thread_id:
  - 1025081481
categories:
  - Linux
tags:
  - virtualbox

---
Opis pokazuje jak do wirtualnej maszyny postawionej na virtualbox podpiąć dysk systemowy poprzez iSCSI.

<!--more-->

1. Tworzymy pusta maszynę bez dysku &#8211; nazwa: Win7_iscsi

&nbsp;

<a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/1/" rel="attachment wp-att-1832"><img class="aligncenter size-full wp-image-1832" alt="1" src="http://techfreak.pl/wp-content/uploads/2013/01/1.jpg" width="1366" height="726" /></a> <a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/2/" rel="attachment wp-att-1831"><img class="aligncenter size-full wp-image-1831" alt="2" src="http://techfreak.pl/wp-content/uploads/2013/01/2.jpg" width="1362" height="718" /></a> <a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/3/" rel="attachment wp-att-1830"><img class="aligncenter size-full wp-image-1830" alt="3" src="http://techfreak.pl/wp-content/uploads/2013/01/3.jpg" width="1364" height="719" /></a> <a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/4/" rel="attachment wp-att-1829"><img class="aligncenter size-full wp-image-1829" alt="4" src="http://techfreak.pl/wp-content/uploads/2013/01/4.jpg" width="1360" height="718" /></a>

&nbsp;

2. Upewniamy się że w Settings &#8211; Storage mamy SATA Controller

<a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/6/" rel="attachment wp-att-1827"><img class="aligncenter size-full wp-image-1827" alt="6" src="http://techfreak.pl/wp-content/uploads/2013/01/6.jpg" width="1363" height="719" /></a>

&nbsp;

3. Tak powinny wyglądać właściwości maszyny:

<a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/5/" rel="attachment wp-att-1828"><img class="aligncenter size-full wp-image-1828" alt="5" src="http://techfreak.pl/wp-content/uploads/2013/01/5.jpg" width="1362" height="722" /></a>  
4. Przechodzimy do konsoli i wpisujemy poniższą linie gdzie:

**Win7_iscsi** &#8211; Nazwa wirtualnej maszyny  
**SATA Controller** &#8211; Nazwa kontrolera sata dodanego dla maszyny Win7_iscsi  
**&#8211;server 10.0.0.1** &#8211; IP serwera udostepniajacego udzial iSCSI  
**&#8211;target** iqn.2000-01.com.synology:DiskStation.win7 &#8211; udział iSCSI stworzony na maszynie w tym przypadku Synology NAS DS212+.

<pre class="lang:default decode:true">vboxmanage storageattach Win7_iscsi --storagectl "SATA Controller" --port 1 --device 0 --type hdd --medium iscsi --server 10.0.0.1 --target iqn.2000-01.com.synology:DiskStation.win7</pre>

5. Tak powinny wyglądać właściwości w sekcji **STORAGE**:

<a href="http://techfreak.pl/jak-podlaczyc-dysk-systemowy-po-iscsi-dla-maszyny-wirtualnej-w-programie-virtualbox/attachment/7/" rel="attachment wp-att-1826"><img class="aligncenter size-full wp-image-1826" alt="7" src="http://techfreak.pl/wp-content/uploads/2013/01/7.jpg" width="1364" height="722" /></a>

&nbsp;

6. Teraz można zabierać się za instalacje systemu na takim dysku. Z własnego doświadczenia mogę powiedzieć ze po WiFI da się pracować na takim systemie choć to rozwiązanie jest dedykowane dla szybszych połączeń :)

&nbsp;

&nbsp;