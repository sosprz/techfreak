---
title: Jak zamontować dysk LG Nexus 4 na Ubuntu? tryb pamięci MTP
author: Przemek
type: post
date: 2013-04-07T13:20:34+00:00
url: /jak-zamontowac-dysk-lg-nexus-4-na-ubuntu-tryb-pamieci-mtp/
featured_image: /wp-content/uploads/2013/04/lg_nexus_4_ubuntu_techfreakpl_642_362_force.jpg
hits:
  - 536
dsq_thread_id:
  - 1193299122
categories:
  - Linux
tags:
  - google
  - ubuntu

---
[<img class="aligncenter size-full wp-image-2730" alt="lg_nexus_4_ubuntu_techfreakpl" src="http://techfreak.pl/wp-content/uploads/2013/04/lg_nexus_4_ubuntu_techfreakpl.jpg" width="546" height="362" />][1]

Aby dostać się do dysku telefonu LG Nexus 4 z Andoridem 4.2.2 w Ubuntu 12.10 (quantal) trzeba zainstalować deweloperską wersje Gvfs i libmtp. Bo niestety domyślnie system nie rozpoznaje telefonu.

### <!--more--> Dodanie repozytorium ppa

<pre>sudo add-apt-repository ppa:langdalepl/gvfs-mtp
sudo apt-get update</pre>

### Jak połączyć się z LG Nexus 4 na Ubuntu?

Gdy już gvfs jest załatwiony trzeba zainstalować jakiegoś klienta do komunikacji. Ja znalazłem gMTP i sprawuje się całkiem sprawnie.

<pre>sudo aptitude install gmtp</pre>

### [<img class="aligncenter size-full wp-image-2724" alt="ubuntu_lg_nexus_4" src="http://techfreak.pl/wp-content/uploads/2013/04/ubuntu_lg_nexus_4.jpg" width="641" height="362" />][2]

### Cofanie zmian czyli usunięcie developerskiej wersji gvfs i powrót do oryginalnej

<pre>sudo aptitude install ppa-purge
sudo ppa-purge ppa:langdalepl/gvfs-mtp</pre>

 [1]: http://techfreak.pl/wp-content/uploads/2013/04/lg_nexus_4_ubuntu_techfreakpl.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/04/ubuntu_lg_nexus_4.jpg