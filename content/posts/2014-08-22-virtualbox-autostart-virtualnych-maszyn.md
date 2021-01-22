---
title: Virtualbox autostart virtualnych maszyn
author: Przemek
type: post
date: 2014-08-22T14:45:41+00:00
url: /virtualbox-autostart-virtualnych-maszyn/
featured_image: /wp-content/uploads/2014/08/virtualbox_vm.jpg
hits:
  - 699
dsq_thread_id:
  - 2949813671
categories:
  - Linux
tags:
  - virtualbox

---
Dziś temat postaw sobie Windowsa na Linuksie, czyli temat o wirtualizacji a dokładnie o Virtualbox który ma przydatną opcję automatycznego startowania wirtualnych systemów przy starcie głównej fizycznej maszyny. Czyli zakładam że chce postawić sobie jakiś lekki system np. Lubuntu na którym zainstaluje VirtualBoxa i tam stworzę jakieś wirtualne maszyny które będą się automatycznie uruchamiać przy starcie głównego serwera. <!--more-->

[<img class="aligncenter size-full wp-image-7566" src="http://techfreak.pl/wp-content/uploads/2014/08/virtualbox_add.jpg" alt="virtualbox_add" width="553" height="443" />][1]

Moja maszyny nazywa się win7 a użytkownik na linuxie to techfreak. Jako root edytuje plik:

<pre>nano /etc/default/virtualbox</pre>

Dodaje do niego dwie linie:

<pre>VBOXAUTOSTART_DB=/etc/vbox
VBOXAUTOSTART_CONFIG=/etc/vbox/autostart.conf</pre>

Nadaje uprawnienia na folder:

<pre>gpasswd -a techfreak vboxusers
chgrp vboxusers /etc/vbox
chmod 1775 /etc/vbox</pre>

W pliku /etc/vbox/autostart.conf nadaje uprawnienia dla użytkownika techfreak które uprawniają go do odpalania automatycznie virtualnych systemów:

<pre>nano  /etc/vbox/autostart.conf</pre>

<pre># Default policy is to deny starting a VM, the other option is "allow".
default_policy = deny
# user vbox is allowed to start virtual machines but starting them
# will be delayed for 10 seconds
techfreak = {
 allow = true
 startup_delay = 10
}</pre>

Loguje się jako techfreak:

<pre>VBoxManage setproperty autostartdbpath /etc/vbox
VBoxManage modifyvm win7 --autostart-enabled on</pre>

Restartuje główną maszynę i virtualka win7 powinna się uruchomić. VirtualBox nie potrzebuje środowiska graficznego aby maszyny działały ale potrzebuje aby je stworzyć. Po skończeniu tworzenia win7 można wyłączyć uruchamianie managera logowania lightdm, dodając do CMD gruba linie text.

<pre>nano /etc/default/grub</pre>

<pre>GRUB_CMDLINE_LINUX="text"</pre>

[<img class="aligncenter size-full wp-image-7562" src="http://techfreak.pl/wp-content/uploads/2014/08/virtualbox_kvm.jpg" alt="virtualbox_kvm" width="677" height="480" />][2] Kolejną rzeczą którą trzeba było by zrobić, to jakoś dobijać się do tej maszyny. Najlepiej po RDP. W opcjach maszyny w zakładce Display jest opcja Remote Display którą trzeba zaznaczyć. Teraz moja maszyna jest dostępna na porcie 3389 tak jak by to była fizyczna maszyna. Z tym bonusem że jest widoczny cały proces uruchamiania maszyny jak w zdalnym KVM. [<img class="aligncenter size-full wp-image-7563" src="http://techfreak.pl/wp-content/uploads/2014/08/virtualbox_vm.jpg" alt="virtualbox_vm" width="1226" height="724" />][3]

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/08/virtualbox_add.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/08/virtualbox_kvm.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/08/virtualbox_vm.jpg