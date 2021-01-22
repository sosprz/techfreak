---
title: Konfiguracja LVM
author: Przemek
type: post
date: 2012-10-06T11:50:06+00:00
url: /konfiguracja-lvm/
featured_image: /wp-content/uploads/2012/10/techfreak_konfiguracja_lvm_642_362_force.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 4019
dsq_thread_id:
  - 1015856803
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - bash
  - lvm
  - vmware

---
Bardzo ciekawym i nie aż tak skomplikowanym tematem są LVM czyli **Logical Volume Manager.** Jest to bardzo elastyczny mechanizm do zarządzania przestrzenią dyskową. Poniżej przedstawiam parę podstawowych komend którymi sam się posługuję.

Poniżej są też ćwiczenia z konkretnych przypadków

[Zmniejszanie dysku][1]  
[Rozszerzanie dodawanie nowego dysku do wolumen grupy][2]

<!--more-->

### Tworzenie LVM

Dostępne partycje:

<pre class="lang:default highlight:0 decode:true">/dev/sda1 /dev/sda2 /dev/sda3</pre>

Zainicjowanie fizycznych partycji do używania LVM:

<pre class="lang:default highlight:0 decode:true">pvcreate /dev/sda1
pvcreate /dev/sda2
pvcreate /dev/sda3</pre>

Wyświetlanie atrybutów fizycznych wolumenów:

<pre class="lang:default highlight:0 decode:true">pvdispaly & pvs</pre>

Tworzenie grupy wolumenu:

<pre class="lang:default highlight:0 decode:true">vgcreate vdysk /dev/sda1 /dev/sda2 /dev/sda3</pre>

lub

(gdzie PE &#8211; Physical Extents będzie wynosił 32M, domyślnie 4M)

<pre class="lang:default highlight:0 decode:true">vgcreate -s 32 vdysk /dev/sda1 /dev/sda2 /dev/sda3</pre>

Wyświetlanie atrybutów grup wolumenów:

<pre class="lang:default highlight:0 decode:true">vgdisplay & vgs</pre>

Tworzenie logicznego wolumenu w grupie wolumenu:

<pre class="lang:default highlight:0 decode:true">lvcreate -L 32M -n part1 vdysk</pre>

Tworzenie systemu pików na logicznym wolumenie:

<pre class="lang:default highlight:0 decode:true">mkfs.ext4 /dev/vdysk/part1</pre>

Wyświetlanie atrybutów logicznych wolumenów:

<pre class="lang:default highlight:0 decode:true">lvdisplay & lvs</pre>

Tworzenie katalogu i montowanie:

<pre class="lang:default highlight:0 decode:true">mkdir /lvm
mount /dev/vdysk/part1 /lvm</pre>

lub

<pre class="lang:default highlight:0 decode:true">mount /dev/mapper/vdysk-part1</pre>

### Powiększanie LVM

Wyświetlanie atrybutów grup wolumenów:

<pre class="lang:default highlight:0 decode:true">vgs</pre>

Rozszerzenie logicznych wolumenów o 12M:

<pre class="lang:default highlight:0 decode:true">lvextend -L +12M /dev/vdysk/part1</pre>

lub

Rozszerzenie logicznych wolumenów o 4 jednostki PE:

<pre class="lang:default highlight:0 decode:true">lvextend -l +4 /dev/vdysk/part1</pre>

lub o 50%

<pre>lvextend -l +50%FREE /dev/vdysk/part1</pre>

Rozszerzanie systemy plików:

<pre class="lang:default highlight:0 decode:true">resize2fs /dev/vdysk/part1</pre>

Sprawdzanie wielkości partycji:

<pre class="lang:default highlight:0 decode:true">df -h</pre>

### Zmniejszanie LVM

Odmontowanie logicznego wolumena zamontowanego w katalogu lvm:

<pre class="lang:default highlight:0 decode:true">umount /lvm</pre>

Zmniejszenie rozmiaru sytstemu plików do 32M

<pre class="lang:default highlight:0 decode:true">resize2fs /dev/vdysk/part1 32M</pre>

Zmiejszenie rozmiaru partycji do 32M

<pre class="lang:default highlight:0 decode:true">lvreduce -L 32 /dev/vdysk/part1
mount /dev/vdysk/part1 /lvm</pre>

### Dodawanie dodatkowej partycji/miejsca do volumen grupy

<pre class="lang:default highlight:0 decode:true">pvcreate /dev/sda4
vgextend vdysk /dev/sda4</pre>

### Zmniejszanie wielkości partycji

<pre>pvresize /dev/sda2 --setphysicalvolumesize 50G</pre>

### Odłączenie dysku od grupy

(pvmove &#8211; Przenosi dane na inne partycje dostępne w volum grupie)

<pre class="lang:default highlight:0 decode:true">pvmove /dev/sda1</pre>

Odłączenie /dev/sda1 z grupy vdysk:

<pre class="lang:default highlight:0 decode:true">vgreduce vdysk /dev/sda1</pre>

Usuniecie oznaczenia LVM z fizycznej partycji

<pre class="lang:default highlight:0 decode:true">pvremove /dev/sda1</pre>

### Snapshot

<pre class="lang:default highlight:0 decode:true">lvcreate -L 12M -n snapszot -s /dev/vdysk/part1</pre>

&nbsp;

### Ćwiczenia z LVM:

#### Zmniejszanie dysku {#Zmniejszanie_dysku}

Przypuśćmy, że mamy maszynę na której mamy 180G dysk, dane zajmują 30G i musimy go zmniejszyć do rozmiarów 50G. Najszybciej było by można dodać drugi dysk o rozmiarach 50G i podłączyć pod Volumen Grupę i przesunąć dane na nową mniejszą partycję. A starą 180G usunąć. I tak własnie zaraz zrobię.

<pre>[root@baza01 ~]# lvs
 LV VG Attr LSize Pool Origin Data% Move Log Copy% Convert
 vg_DB vg_HDD1 -wi-ao-- 179,50g
 lv_home vg_produkcja -wi-ao-- 33,76g 
 lv_root vg_produkcja -wi-ao-- 50,00g 
 lv_swap vg_produkcja -wi-ao-- 15,75g</pre>

<pre>[root@baza01 ~]# pvs
 PV VG Fmt Attr PSize PFree 
 /dev/sda2 vg_produkcja lvm2 a-- 99,51g 0 
 /dev/sdb1 vg_HDD1 lvm2 a-- 180,00g 508,00m</pre>

<pre>[root@baza01 ~]# vgs
 VG #PV #LV #SN Attr VSize VFree 
 vg_HDD1 1 1 0 wz--n- 180,00g 508,00m
 vg_produkcja 1 3 0 wz--n- 99,51g 0</pre>

<pre>[root@baza01 ~]# fdisk /dev/sdc
 Urządzenie nie zawiera poprawnej DOS-owej tablicy partycji ani etykiety dysku Sun, SGI ani OSF
 Tworzenie nowej etykiety dysku typu DOS z identyfikatorem dysku 0x16358207.
 Zmiany pozostaną tylko w pamięci do chwili ich zapisania.
 Potem, oczywiście, poprzednia zawartość będzie nie do odzyskania.
 Uwaga: niepoprawna flaga 0x0000 tablicy partycji 4 będzie poprawiona przy zapisie (w)
 UWAGA: tryb kompatybilności z DOS-em jest przestarzały. Zdecydowanie
 zaleca się wyłączyć ten tryb (polecenie 'c') i zmienić jednostki
 wyświetlania na sektory (polecenie 'u').
 Polecenie (m wyświetla pomoc): p
 Dysk /dev/sdc: 53.7 GB, bajtów: 53687091200
 głowic: 255, sektorów/ścieżkę: 63, cylindrów: 6527
 Jednostka = cylindrów, czyli 16065 * 512 = 8225280 bajtów
 Rozmiar sektora (logiczny/fizyczny) w bajtach: 512 / 512
 Rozmiar we/wy (minimalny/optymalny) w bajtach: 512 / 512
 Identyfikator dysku: 0x16358207
 Urządzenie Rozruch Początek Koniec Bloków ID System
 Polecenie (m wyświetla pomoc): n
 Polecenie
 e partycja rozszerzona
 p partycja główna (1-4)
 Numer partycji (1-4): 1
 Pierwszy cylinder (1-6527, domyślnie 1):
 Przyjęto wartość domyślną 1
 Ostatni cylinder, +cylindrów lub +rozmiar{K,M,G} (1-6527, domyślnie 6527):
 Przyjęto wartość domyślną 6527
 Polecenie (m wyświetla pomoc): p
 Dysk /dev/sdc: 53.7 GB, bajtów: 53687091200
 głowic: 255, sektorów/ścieżkę: 63, cylindrów: 6527
 Jednostka = cylindrów, czyli 16065 * 512 = 8225280 bajtów
 Rozmiar sektora (logiczny/fizyczny) w bajtach: 512 / 512
 Rozmiar we/wy (minimalny/optymalny) w bajtach: 512 / 512
 Identyfikator dysku: 0x16358207
 Urządzenie Rozruch Początek Koniec Bloków ID System
 /dev/sdc1 1 6527 52428096 83 Linux
 Polecenie (m wyświetla pomoc): w
 Tablica partycji została zmodyfikowana!
 Wywoływanie ioctl() w celu ponownego odczytu tablicy partycji.
 Synchronizacja dysków.</pre>

<pre>[root@baza01 ~]# pvcreate /dev/sdc1
 Writing physical volume data to disk "/dev/sdc1"
 Physical volume "/dev/sdc1" successfully created</pre>

<pre>[root@baza01 ~]# vgextend vg_HDD1 /dev/sdc1
 Volume group "vg_HDD1" successfully extended</pre>

<pre>[root@baza01 ~]# umount /DB</pre>

<pre>[root@baza01 ~]# e2fsck -f /dev/vg_HDD1/vg_DB
 e2fsck 1.41.12 (17-May-2010)
 Przebieg 1: Sprawdzanie i-węzłów, bloków i rozmiarów
 Przebieg 2: Sprawdzanie struktury katalogów
 Przebieg 3: Sprawdzanie łączności katalogów
 Przebieg 4: Sprawdzanie liczników odwołań
 Przebieg 5: Sprawdzanie sumarycznych informacji o grupach
 /dev/vg_HDD1/vg_DB: 2445/11763712 plików (42.2% nieciągłych), 7459456/47054848 bloków</pre>

<pre>[root@baza01 ~]# resize2fs /dev/vg_HDD1/vg_DB 49G
 resize2fs 1.41.12 (17-May-2010)
 Zmiana rozmiaru systemu plików /dev/vg_HDD1/vg_DB na 12845056 (4k) bloków.
 System plików na /dev/vg_HDD1/vg_DB ma teraz 12845056 bloków.</pre>

<pre>[root@baza01 ~]# lvreduce -L 49G /dev/vg_HDD1/vg_DB
 WARNING: Reducing active logical volume to 49,00 GiB
 THIS MAY DESTROY YOUR DATA (filesystem etc.)
 Do you really want to reduce vg_DB? [y/n]: y
 Reducing logical volume vg_DB to 49,00 GiB
 Logical volume vg_DB successfully resized</pre>

<pre>[root@baza01 ~]# lvs
 LV VG Attr LSize Pool Origin Data% Move Log Copy% Convert
 vg_DB vg_HDD1 -wi-a--- 49,00g
 lv_home vg_produkcja -wi-ao-- 33,76g
 lv_root vg_produkcja -wi-ao-- 50,00g
 lv_swap vg_produkcja -wi-ao-- 15,75g</pre>

<pre>[root@baza01 ~]# pvs
 PV VG Fmt Attr PSize PFree
 /dev/sda2 vg_produkcja lvm2 a-- 99,51g 0
 /dev/sdb1 vg_HDD1 lvm2 a-- 180,00g 131,00g
 /dev/sdc1 vg_HDD1 lvm2 a-- 50,00g 50,00g</pre>

<pre>[root@baza01 ~]# pvresize /dev/sdb1 --setphysicalvolumesize 50G
 Physical volume "/dev/sdb1" changed
 1 physical volume(s) resized / 0 physical volume(s) not resized</pre>

<pre>[root@baza01 ~]# pvs
 PV VG Fmt Attr PSize PFree
 /dev/sda2 vg_produkcja lvm2 a-- 99,51g 0
 /dev/sdb1 vg_HDD1 lvm2 a-- 50,00g 1020,00m
 /dev/sdc1 vg_HDD1 lvm2 a-- 50,00g 50,00g</pre>

<pre>[root@baza01 ~]# pvmove /dev/sdb1
 /dev/sdb1: Moved: 0,0%
 /dev/sdb1: Moved: 1,1%
 /dev/sdb1: Moved: 20,7%
 /dev/sdb1: Moved: 48,2%
 /dev/sdb1: Moved: 60,9%
 /dev/sdb1: Moved: 77,9%
 /dev/sdb1: Moved: 93,1%
 /dev/sdb1: Moved: 100,0%</pre>

<pre>[root@baza01 ~]# vgreduce vg_HDD1 /dev/sdb1
 Removed "/dev/sdb1" from volume group "vg_HDD1"</pre>

<pre>[root@baza01 ~]# pvremove /dev/sdb1
 Labels on physical volume "/dev/sdb1" successfully wiped</pre>

<pre>[root@baza01 ~]# df -h
 System plików rozm. użyte dost. %uż. zamont. na
 /dev/mapper/vg_produkcja-lv_root
 50G 30G 18G 63% /
 tmpfs 7,8G 0 7,8G 0% /dev/shm
 /dev/sda1 485M 69M 391M 15% /boot
 /dev/mapper/vg_produkcja-lv_home
 34G 2,3G 30G 8% /home</pre>

<pre>[root@baza01 ~]# mount -a</pre>

<pre>[root@baza01 ~]# df -h
 System plików rozm. użyte dost. %uż. zamont. na
 /dev/mapper/vg_produkcja-lv_root
 50G 30G 18G 63% /
 tmpfs 7,8G 0 7,8G 0% /dev/shm
 /dev/sda1 485M 69M 391M 15% /boot
 /dev/mapper/vg_produkcja-lv_home
 34G 2,3G 30G 8% /home
 /dev/mapper/vg_HDD1-vg_DB
 49G 26G 21G 56% /DB</pre>

#### Rozszerzanie / dodawanie nowego dysku do wolumen grupy {#Rozszerzanie_dodawanie_nowego_dysku_do_wolumen_grupy}

Mamy sytuację że mamy produkcyjną maszynę na VMware na której kończy się miejsce na dysku. Zadanie jest takie aby dodać nowy dysk i nie restartować maszyny bo mieli ważne dane.

Pierwsze co admin pomyśli po dodaniu dysku to czy system go zobaczy. Od razu nie zobaczy ale wystarczy przeskanować /sys/class/scsi_host i nowy dysk powinien się pojawić.

<pre>[root@produkcja ~]# ls /sys/class/scsi_host/
host0 host1 host2
 [root@produkcja ~]#echo - - - &gt; /sys/class/scsi_host/host0/scan
 [root@produkcja ~]#echo - - - &gt; /sys/class/scsi_host/host1/scan
 [root@produkcja ~]#echo - - - &gt; /sys/class/scsi_host/host2/scan</pre>

lub zastosować skrypt

<pre>#! /bin/bash
 host=`ls /sys/class/scsi_host/`
 for i in $host
 do
 echo - - - &gt; /sys/class/scsi_host/$i/scan
 done</pre>

Pojawił się dysk 70G

<pre>[root@produkcja ~]# fdisk -l
Dysk /dev/sdc: 75.2 GB, bajtów: 75161927680
głowic: 255, sektorów/ścieżkę: 63, cylindrów: 9137
Jednostka = cylindrów, czyli 16065 * 512 = 8225280 bajtów
Rozmiar sektora (logiczny/fizyczny) w bajtach: 512 / 512
Rozmiar we/wy (minimalny/optymalny) w bajtach: 512 / 512
Identyfikator dysku: 0x00000000</pre>

Upewniam się czy ten dysk na pewno nigdzie nie został przydzielony

<pre>[root@produkcja ~]# pvs
 PV VG Fmt Attr PSize PFree 
 /dev/sda2 vg_produkcja lvm2 a-- 99,51g 0 
 /dev/sdb1 vg_baza lvm2 a-- 50,00g 1020,00m</pre>

Nowy dysk /dev/sdc Nigdzie nie należy więc tworzę partycję

<pre>[root@produkcja ~]# fdisk /dev/sdc
 Urządzenie nie zawiera poprawnej DOS-owej tablicy partycji ani etykiety dysku Sun, SGI ani OSF
 Tworzenie nowej etykiety dysku typu DOS z identyfikatorem dysku 0xb4f1510c.
 Zmiany pozostaną tylko w pamięci do chwili ich zapisania.
 Potem, oczywiście, poprzednia zawartość będzie nie do odzyskania.
 Uwaga: niepoprawna flaga 0x0000 tablicy partycji 4 będzie poprawiona przy zapisie (w)
 UWAGA: tryb kompatybilności z DOS-em jest przestarzały. Zdecydowanie
 zaleca się wyłączyć ten tryb (polecenie 'c') i zmienić jednostki
 wyświetlania na sektory (polecenie 'u').
 Polecenie (m wyświetla pomoc): p
 Dysk /dev/sdc: 75.2 GB, bajtów: 75161927680
 głowic: 255, sektorów/ścieżkę: 63, cylindrów: 9137
 Jednostka = cylindrów, czyli 16065 * 512 = 8225280 bajtów
 Rozmiar sektora (logiczny/fizyczny) w bajtach: 512 / 512
 Rozmiar we/wy (minimalny/optymalny) w bajtach: 512 / 512
 Identyfikator dysku: 0xb4f1510c
 Urządzenie Rozruch Początek Koniec Bloków ID System
 Polecenie (m wyświetla pomoc): n
 Polecenie
 e partycja rozszerzona
 p partycja główna (1-4)
p
 Numer partycji (1-4): 1
 Pierwszy cylinder (1-9137, domyślnie 1):
 Przyjęto wartość domyślną 1
 Ostatni cylinder, +cylindrów lub +rozmiar{K,M,G} (1-9137, domyślnie 9137):
 Przyjęto wartość domyślną 9137
 Polecenie (m wyświetla pomoc): p
 Dysk /dev/sdc: 75.2 GB, bajtów: 75161927680
 głowic: 255, sektorów/ścieżkę: 63, cylindrów: 9137
 Jednostka = cylindrów, czyli 16065 * 512 = 8225280 bajtów
 Rozmiar sektora (logiczny/fizyczny) w bajtach: 512 / 512
 Rozmiar we/wy (minimalny/optymalny) w bajtach: 512 / 512
 Identyfikator dysku: 0xb4f1510c
 Urządzenie Rozruch Początek Koniec Bloków ID System
 /dev/sdc1 1 9137 73392921 83 Linux
 Polecenie (m wyświetla pomoc): w
 Tablica partycji została zmodyfikowana!
 Wywoływanie ioctl() w celu ponownego odczytu tablicy partycji.
 Synchronizacja dysków.</pre>

Tworzę nowy fizyczny wolumen

<pre>[root@produkcja ~]# pvcreate /dev/sdc1
 Writing physical volume data to disk "/dev/sdc1"
 Physical volume "/dev/sdc1" successfully created</pre>

Wyświetlam fizyczne wolumeny

<pre>[root@produkcja ~]# pvs
 PV VG Fmt Attr PSize PFree 
 /dev/sda2 vg_produkcja lvm2 a-- 99,51g 0 
 /dev/sdb1 vg_baza lvm2 a-- 50,00g 1020,00m
 /dev/sdc1 lvm2 a-- 69,99g 69,99g</pre>

Rozszerzam wolumen grupę o nowy fizyczny wolumen

<pre>[root@produkcja ~]# vgextend vg_baza /dev/sdc1
 Volume group "vg_baza" successfully extended</pre>

Sprawdzam czy fizyczny wolumen jest przypisany do wolumen grupy

<pre>[root@produkcja ~]# pvs
 PV VG Fmt Attr PSize PFree 
 /dev/sda2 vg_produkcja lvm2 a-- 99,51g 0 
 /dev/sdb1 vg_baza lvm2 a-- 50,00g 1020,00m
 /dev/sdc1 vg_baza lvm2 a-- 69,99g 69,99g</pre>

Wyświetlam logiczne volumeny aby wiedzieć jaki mam rozszerzyć.

<pre>[root@produkcja ~]# lvs
 LV VG Attr LSize Pool Origin Data% Move Log Copy% Convert
 vg_DB vg_baza -wi-ao-- 49,00g 
 lv_home vg_produkcja -wi-ao-- 33,76g 
 lv_root vg_produkcja -wi-ao-- 50,00g 
 lv_swap vg_produkcja -wi-ao-- 15,75g</pre>

Rozszerzam o 70G logiczny wolumen

<pre>[root@produkcja ~]# lvextend -L +70G /dev/vg_baza/vg_DB 
 Extending logical volume vg_DB to 119,00 GiB
 Logical volume vg_DB successfully resized</pre>

Sprawdzam wielkość zamontowanej partycji. Tu jeszcze będzie stara wartość.

<pre>[root@produkcja ~]# df -h
System plików rozm. użyte dost. %uż. zamont. na
/dev/mapper/vg_produkcja-lv_root  50G 29G 19G 61% /
tmpfs 7,8G 0 7,8G 0% /dev/shm 
/dev/sda1 485M 69M 391M 15% /boot
/dev/mapper/vg_produkcja-lv_home  34G 7,8G 24G 25% /home
/dev/mapper/vg_baza-vg_DB  49G 26G 21G 56% /baza</pre>

Rozszerzam system plików, jeśli system plików to XFS zamień komendę resize2fs na fsadm resize

<pre>[root@produkcja ~]# resize2fs /dev/vg_baza/vg_DB 
resize2fs 1.41.12 (17-May-2010)
System plików /dev/vg_baza/vg_DB jest zamontowany pod /dsdb; wymagana zmiana rozmiaru w locie
old desc_blocks = 4, new_desc_blocks = 8
Wykonywanie zmiany rozmiaru w locie /dev/vg_baza/vg_DB na 31195136 (4k) bloków.
System plików na /dev/vg_baza/vg_DB ma teraz 31195136 bloków.</pre>

Sprawdzam wielkość zamontowanej partycji. Tu już będzie nowa wartość 118G

<pre>[root@produkcja ~]# df -h
System plików rozm. użyte dost. %uż. zamont. na
/dev/mapper/vg_produkcja-lv_root
 50G 29G 19G 61% /
tmpfs 7,8G 0 7,8G 0% /dev/shm
/dev/sda1 485M 69M 391M 15% /boot
/dev/mapper/vg_produkcja-lv_home  34G 7,8G 24G 25% /home
/dev/mapper/vg_baza-vg_DB  118G 26G 86G 24% /dsdb</pre>

&nbsp;

 [1]: //techfreak.pl/konfiguracja-lvm#Zmniejszanie_dysku
 [2]: //techfreak.pl/konfiguracja-lvm#Rozszerzanie_dodawanie_nowego_dysku_do_wolumen_grupy