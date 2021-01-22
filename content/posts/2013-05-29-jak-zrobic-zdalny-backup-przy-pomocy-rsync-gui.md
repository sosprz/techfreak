---
title: Jak zrobić zdalny backup przy pomocy rsync gui?
author: Przemek
type: post
date: 2013-05-29T14:34:08+00:00
url: /jak-zrobic-zdalny-backup-przy-pomocy-rsync-gui/
featured_image: /wp-content/uploads/2013/05/synology_check_netbackup_1_642_362_force.jpg
hits:
  - 1500
dsq_thread_id:
  - 1335366631
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - Backup
  - rsync

---
Tylko twardziele nie robią backupu albo !admini. A ja myślę że co jakiś czas trzeba na wszelki wypadek zrobić jakąś kopie bezpieczeństwa a że posiadam w domu serwer NAS, to często wrzucam ją na dyski poprzez rsync gui.

<!--more-->

Kiedyś robiłem kopie z linii poleceń ale znalazłem fajne GUI do rsync o nazwie luckybackup. Jest to fajny program z dużymi możliwościami. Poniżej zaprezentuje jak robić kopie na NAS firmy synology. Zacznę od konfiguracji serwisu NetBackup na NAS a skończę na uruchomieniu backup.

### Konfiguracja NetBackup na Synology

Trzeba zaznaczyć: **Enable network backup service** jak poniżej.

[<img class="aligncenter size-full wp-image-3411" src="http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_1.jpg" alt="synology_enable_netbackup_1" width="1360" height="768" />][1]

Następnie w pliku /etc/rsyncd.conf konfigurujemy sekcje [NetBackup] jak poniżej i definiujemy czy ma być tylko do odczytu i dla jakich użytkowników dajemy dostęp.

<pre>[NetBackup]
path = /var/services/NetBackup
comment = Network Backup Share
uid = root
gid = root
read only = no
list = yes
charset = utf-8
auth users = sosprz
secrets file = /etc/rsyncd.secrets</pre>

[<img class="aligncenter size-full wp-image-3412" src="http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_2.jpg" alt="synology_enable_netbackup_2" width="1355" height="615" />][2]

W pliku /etc/rsyncd.secrets wpisujemy login i hasło dla wcześniej zdefiniowanego użytkownika

<pre>sosprz:tajnehaslo</pre>

[<img class="aligncenter size-full wp-image-3413" src="http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_3.jpg" alt="synology_enable_netbackup_3" width="1356" height="614" />][3]

Dla użytkownika sosprz trzeba nadać uprawnia do folderu NetBackup

[<img class="aligncenter size-full wp-image-3427" src="http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_4.jpg" alt="synology_enable_netbackup_4" width="1357" height="615" />][4]

&nbsp;

Gdy mamy tak skonfigurowane ustawienia NetBackup można sprawdzić czy usługa poprawnie chodzi i możemy się zalogować i wyświetlić zdalne katalogi.

<pre>rsync -Rnv sosprz@172.18.10.1::NetBackup/sosprz/app/</pre>

[<img class="aligncenter size-full wp-image-3414" src="http://techfreak.pl/wp-content/uploads/2013/05/synology_check_netbackup_1.jpg" alt="synology_check_netbackup_1" width="1360" height="615" />][5]

Jeśli wyświetliły się zdalne foldery to znacz że jest ok i można iść dalej.

### Konfiguracja LuckyBackup (rsync gui)

Na początek trzeba stworzyć plik /etc/rsyncd.passwd na maszynie którą będziemy backupować np. laptop. Plik ma być dostępny tylko dla użytkownika root i będzie on przechowywał login i hasło które zostało wcześniej zdefiniowane dla klienta &#8222;sosprz&#8221;, do modułu rsync na serwerze NAS.

<pre>chmod 700  /etc/rsyncd.passwd
chown root.root /etc/rsyncd.passwd</pre>

<pre>ls -la /etc/rsyncd.passwd 
-rwx------ 1 root root 9 mar 25 15:00 /etc/rsyncd.passwd</pre>

Ok zakładając, że naszym folderem który chcemy backupować jest **/hdd/app,** a zdalnym katalogiem jest **NetBackup/sosprz/,** to tak teraz skonfiguruje zadanie w programie luckybackup aby ten pierwszy był kopiowany do tego drugiego.

Trzeba pamiętać że w tym przypadku nasz moduł **NetBackup** nosi taką samą nazwę jak folder na dysku. I na poniższych screenach w linii **Destination**, **NetBackup** to moduł a nie katalog.

[<img class="aligncenter size-full wp-image-3431" src="http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_0.jpg" alt="configure_luckybackup_0" width="1357" height="710" />][6] [<img class="aligncenter size-full wp-image-3432" src="http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_1.jpg" alt="configure_luckybackup_1" width="1359" height="709" />][7] [<img class="aligncenter size-full wp-image-3433" src="http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_2.jpg" alt="configure_luckybackup_2" width="1357" height="714" />][8] [<img class="aligncenter size-full wp-image-3434" src="http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_3.jpg" alt="configure_luckybackup_3" width="1356" height="716" />][9]

Kiedy już wszystko jest skonfigurowane na powyższy wzór, klikamy **RUN** aby wykonać backup.

[<img class="aligncenter size-full wp-image-3435" src="http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_4.jpg" alt="configure_luckybackup_4" width="1358" height="712" />][10]

&nbsp;

<strong style="line-height: 1.5em;">All task completed</strong><span style="line-height: 1.5em;"> taki wynik kończy konfiguracje i odpalenie. Mam nadzieje że nie tylko mi udało sie poprawnie skonfigurować i wykonać kopie bezpieczeństwa.</span>

[<img class="aligncenter size-full wp-image-3436" src="http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_5.jpg" alt="configure_luckybackup_5" width="1357" height="714" />][11]

&nbsp;

### <span style="font-size: 1.71429em; line-height: 1.75em; font-weight: normal;">Ręczne odpalanie skryptów</span>

W luckyBackup zawsze możemy kliknąć na ikonkę **Validate** gdzie wyskoczy nam okienko zawierające dokładnie tą samą komendę która zostanie wykonana dla skonfigurowanego przez nas zadania. Oczywiście możemy używać jej zamiast GUI.

<pre>rsync -h --progress --stats -r -tgo -p -l -D --update --delete-after --protect-args --password-file=/etc/rsyncd.passwd /hdd/app/ sosprz@172.18.10.1::NetBackup/sosprz/app/</pre>

&nbsp;

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_2.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_3.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/05/synology_enable_netbackup_4.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2013/05/synology_check_netbackup_1.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_0.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_1.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_2.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_3.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_4.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/05/configure_luckybackup_5.jpg