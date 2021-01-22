---
title: Proxy po ssh czyli zawsze wychodzę z tego samego IP
author: Przemek
type: post
date: 2014-05-06T18:58:14+00:00
url: /proxy-po-ssh-czyli-zawsze-wychodze-z-tego-samego-ip/
featured_image: /wp-content/uploads/2014/05/triki_ssh.jpg
hits:
  - 536
dsq_thread_id:
  - 2665658589
categories:
  - Linux
  - Network
tags:
  - openvpn
  - proxy
  - Raspberry pi
  - ubuntu

---
Dziś chciałbym pokazać wam ja wykorzystać sytuację w której posiadacie swojego hosta gdzieś w firmie lub w domu i chcecie korzystać właśnie z niego ze względu na IP a nie ma was na miejscu.

<!--more-->

W brew pozorom jest to bardzo przydatna opcja. Bo np. macie dostęp gdzieś &#8222;dalej&#8221; tylko z konkretnego IP lub np. siedzicie w hotelu lub jeszcze gdzieś indziej i macie zablokowane strony www. Założenia są takie że mam router na którym jest przekierowany port 1194 na Raspberry Pi z Debianem i zainstalowanym OpenVPN. <a title="Openvpn" href="http://techfreak.pl/raspberry-pi-openvpn-android/" target="_blank">Jak zainstalować OpenVPN</a> można przeczytać w poprzednim moim <a title="openvpn" href="http://techfreak.pl/raspberry-pi-openvpn-android/" target="_blank">wpisie</a>. Lub może to być jakikolwiek inny host z jakimś innym systemem do wyboru jest dużo. Uwaga, można było by od razu przekierować port 22 (ssh) na routerze i nie bawić się w VPN ale tak jest fajniej.

Dobra siedzę w hotelu i mam klienta OpenVPN którym się łączę do routera który przekierowuje mnie na Raspberry Pi. Połączenie zostało nawiązane jest ok. Wiadomo że OpenVPN daje możliwość dostępu tylko do LAN&#8217;u i nie tuneluje nas do internetu. Generalnie można było by tak zrobić aby po zapięciu tunelu mieć od razu dostęp do internetu z serwera VPN ale nie rozpatruję tego przypadku teraz bo konfiguracja było by poważniejsza. A tu chodzi o funkcjonalność przy okazji.

Teraz łączę się po ssh do mojego Raspberry Pi ale z opcją -D i portem 12345:

<pre>ssh -D 12345 pi@172.18.10.7</pre>

I nie zamykam okna ssh

[<img class="aligncenter size-full wp-image-6961" src="http://techfreak.pl/wp-content/uploads/2014/05/ssh_proxy_raspberry_pi.jpg" alt="ssh_proxy_raspberry_pi" width="554" height="168" />][1]

SSH proxy?

Co mi to dało? To że będę mógł wpisać w przeglądarce proxy. W tym przypadku dzięki opcjom ssh tworzę proxy które jest pośrednikiem pomiędzy moim komputerem a Raspberry Pi. A przeglądarce każę używać właśnie tego pośrednika do wyświetlania stron. Więc w <a title="socks" href="http://pl.wikipedia.org/wiki/SOCKS" target="_blank">SOCKS host</a> trzeba wpisać localhost a port 12345 czyli ten sam port który użyłem przy połączeniu ssh.

[<img class="aligncenter size-full wp-image-6962" src="http://techfreak.pl/wp-content/uploads/2014/05/ssh_proxy_socks.jpg" alt="ssh_proxy_socks" width="604" height="603" />][2]

Takim sposobem z każdego miejsca na świecie mogę się połączyć po VPN do domu i  stamtąd wychodzić zawsze z tego samego IP i to bez ewentualnych ograniczeń.

 [1]: http://techfreak.pl/wp-content/uploads/2014/05/ssh_proxy_raspberry_pi.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/05/ssh_proxy_socks.jpg