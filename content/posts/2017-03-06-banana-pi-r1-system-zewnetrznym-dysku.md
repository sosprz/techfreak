---
title: Banana Pi R1 system na zewnętrznym dysku
author: Przemek
type: post
date: 2017-03-06T14:31:13+00:00
url: /banana-pi-r1-system-zewnetrznym-dysku/
featured_image: /wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-11-624x416.jpg
dsq_thread_id:
  - 5788722826
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - banana pi
  - dysk

---
Jak zacząć pracę z mini komputerem Banana PI R1?

<!--more-->

Banana Pi R1 to w zasadzie klon popularnego mini komputera Raspberry Pi. Może nie do końca klon a może fork z tego powodu, że Banana Pi rozwija się np. pod takimi względami sprzętowymi jak gigabitowy port ethernet, wbudowany przełącznik, port SATA do którego można podłączyć dysk, lub wbudowane WiFi. Z taką konfiguracją z powodzeniem można zbudować &#8222;NAS&#8217;a&#8221;, router lub Access Pointa. Przy tym wszystkim posiada taki sam rozkład pinów GPIO jak Raspberry Pi oraz system Rasbian.

[<img class="aligncenter size-full wp-image-12639" src="https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-12.jpg" alt="" width="1000" height="667" />][1] [<img class="aligncenter size-full wp-image-12641" src="https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-15.jpg" alt="" width="1000" height="667" />][2]

Niewątpliwie główną zaletą Banana Pi R1 jest możliwość podłączenia dysku. Trzeba jednak pamiętać, że tak czy inaczej zawsze czy to Rasbperry Pi czy Banana uruchamiają potrzebna pliki do uruchomienia systemu z partycji boot która leży na karcie SD. Czyli uruchamiamy banana z boot a reszta systemu może leżeć na dysku zewnętrznym.

[<img class="aligncenter size-full wp-image-12650" src="https://techfreak.pl/wp-content/uploads/2017/03/bananapir1.png" alt="" width="576" height="395" />][3]

[<img class="aligncenter size-full wp-image-12644" src="https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-16.jpg" alt="" width="1000" height="667" />][4]

Zaraz pokażę jak dodać zewnętrzny dysk do systemu i przesunąć system z karty SD na ten dysk. Ja wykorzystałem zewnętrzny dysk SSD o którym mówiłem na swoim kanale [Youtube][5].

Jeżeli zaczynasz przygodę z Banana Pi i nie wiesz jak zainstalować system to przygotuj kartę SD 8GB i ściągnij obraz systemu Raspbian Lite 3.4 z 2016-07-12 [banana-pi.org][6]. Instalacja systemu na karcie to wydanie polecenia dd:

<pre>dd if=2016-07-12-raspbian-lite-bpi-m1-m1p-r1.img of=/dev/mmcblk0 bs=4M</pre>

Po instalacji wydaj polecenie **df -h** a zobaczysz, że obecne pliki systemowe leżą na partycji /dev/mmcblk0p2

<pre>pi@bpi-iot-ros-ai:~ $ sudo su -
root@bpi-iot-ros-ai:~# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/mmcblk0p2 1.6G 1.4G 201M 87% /
udev 435M 0 435M 0% /dev
tmpfs 88M 4.5M 83M 6% /run
tmpfs 437M 0 437M 0% /dev/shm
tmpfs 5.0M 4.0K 5.0M 1% /run/lock
tmpfs 437M 0 437M 0% /sys/fs/cgroup
/dev/mmcblk0p1 256M 208M 48M 82% /boot</pre>

Podłącz i sprawdź czy twój dysk jest widziany przez system, najlepiej poleceniem fdisk -l

<pre>fdisk -l |grep sda

</pre>

[<img class="aligncenter size-full wp-image-12645" src="https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-18.jpg" alt="" width="1000" height="500" />][7]

&nbsp;

Jeśli dysk jest widoczny trzeba stworzyć na nim partycję i system plików, ale na początek ja czyszczę informacje o partycji

<pre>dd if=/dev/zero of=/dev/sda bs=512 count=1 conv=notrunc</pre>

Tworzę jedną partycję partycję za pomocą fdisk w formie skryptu:

<pre>(
echo o # Create a new empty DOS partition table
echo n # Add a new partition
echo p # Primary partition
echo 1 # Partition number
echo # First sector (Accept default: 1)
echo # Last sector (Accept default: varies)
echo w # Write changes
) | fisk /dev/sda</pre>

Tworzę system plików ext4

<pre>mkfs.ext4 /dev/sda1</pre>

Instaluje pakiety potrzebne w dalszych krokach:

<pre>aptitude update && aptitude install rsync u-boot-tools</pre>

Montuje dysk i kopiuje pliki dotychczasowej partycji na nowy dysk, za pomocą rsync:

<pre>mkdir /tmp/sata
mount /dev/sda1 /tmp/sata
rsync -arx --progress / /tmp/sata
sync
umount /tmp/sata</pre>

Zmieniam wpisy w pliku rozruchowym boot.cmd, która partycja to root i kompiluje plik boot.scr, który jest rozumiany przez bootloader U-BOOT

<pre>mount /dev/mmcblk0p1 /boot
cd /boot/bananapi/bpi-r1/linux
mv boot.scr boot.scr.old
sed -i -e 's/root=\/dev\/mmcblk0p2/root=\/dev\/sda1/g' boot.cmd
mkimage -C none -A arm -T script -d boot.cmd boot.scr</pre>

Reboot systemu aby sprawdzić czy dysk zozstanie poprawnie zamontowany

<pre>reboot</pre>

Po ponownym zalogowaniu do systemu powinno pojawić się taka tablica jak poniżej po wykonaniu df -h. To oznacza, że wszelkie dane zapisują się teraz już na głównej partycji czyli zewnętrznym dysku HDD

<pre>pi@bpi-iot-ros-ai:~ $ df -h
Filesystem Size Used Avail Use% Mounted on
/dev/sda1 29G 1.5G 26G 6% /
udev 435M 0 435M 0% /dev
tmpfs 88M 8.5M 79M 10% /run
tmpfs 437M 0 437M 0% /dev/shm
tmpfs 5.0M 4.0K 5.0M 1% /run/lock
tmpfs 437M 0 437M 0% /sys/fs/cgroup
/dev/mmcblk0p1 256M 208M 48M 82% /boot
</pre>

To koniec w temacie podłączenia dysku do Raspberry Pi R1. Dawajcie znać jak wam poszło!

 [1]: https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-12.jpg
 [2]: https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-15.jpg
 [3]: https://techfreak.pl/wp-content/uploads/2017/03/bananapir1.png
 [4]: https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-16.jpg
 [5]: https://www.youtube.com/watch?v=7n_bQuwh-EA.
 [6]: http://www.banana-pi.org/r1-download.html
 [7]: https://techfreak.pl/wp-content/uploads/2017/03/bananapi-r1-add-external-root-hdd-ssd-usb-raspbian-18.jpg