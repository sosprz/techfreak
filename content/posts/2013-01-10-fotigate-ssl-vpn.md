---
title: Fotigate SSL VPN
author: Przemek
type: post
date: 2013-01-10T22:15:33+00:00
url: /fotigate-ssl-vpn/
featured_image: /wp-content/uploads/2012/12/fortinet.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 743
dsq_thread_id:
  - 1019080253
categories:
  - Linux
  - Network
tags:
  - ssl
  - vpn

---
Zdarza się że pracownicy będący poza biurem a muszą dostać się  do sieci LAN w pracy.  Możemy oczywiście zrobić na swoim ruterze przekierowanie portów ale transmisja ta nie jest szyfrowana, ponadto takie przekierowania są męczące/nieskalowalne i robimy sobie tylko problem. Możemy również zestawić tunel VPN dla takich pracowników.

<!--more-->

W FG (skrót od Fortigate) możemy skorzystać z dwóch tuneli:

  1. ipsec
  2. ssl-vpn

Opis tunel IPsec zostawimy sobie na inny dzień, a dziś pokaże jak ustawić SSL-VPN.

#### Możemy skorzystać z takiego tunelu na dwa sposoby:

1) wchodząc na specjalny portal/stronę naszego FG.

<p style="text-align: center;">
  <a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn10/" rel="attachment wp-att-1244"><img class="aligncenter  wp-image-1244" alt="fgsslvpn10" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn10.jpg" width="455" height="290" /></a>
</p>

Po zalogowaniu  zobaczymy zakładkę  „Connection Tool”, gdzie mamy do wyboru protokoły takie jak: Telnet, Rdp, Ssh, Vnc, Http/Https,  Ftp . Wybierając np.: protokół RDP i wpisując adres IP połączymy się ze  zdalnym pulpitem komputera sieci LAN (aplet Javy).

**Jakie są plusy w/w rozwiązania?**&#8211; nie instalujemy żadnego programu na naszym domowym komputerze i wszystko robimy z przeglądarki.

**Jakie są minusy?** -za dużo wpisywania (chodzi o url ,login, hasło itp). Ponadto nie ma możliwości  skorzystania z drukarki sieciowej(jest smb).

&nbsp;

2) drugą możliwością jest wgranie programu na komputerze. Program zajmuje  około 1MB.  
<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn11/" rel="attachment wp-att-1272"><img class="aligncenter size-full wp-image-1272" alt="fgsslvpn11" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn11.jpg" width="353" height="362" /></a>

Po zainstalowaniu programu możemy zdefiniować naszego vpna( podając host, login, hasło).

## Poniżej opis konfiguracji FG

### 1) Adresacja

Definiujemy adresy IP(pool), które będą nadawane komputerom łączącym się  z naszym  vpnem:

Wchodźmy do:

**Firewall Objects →  Address → Address** &#8211; definiujemy naszą pulę  adresów

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn1/" rel="attachment wp-att-1210"><img class="aligncenter size-full wp-image-1210" alt="fgsslvpn1" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn1.jpg" width="642" height="20" /></a>

### 2) Ustawiamy nowy portal

**VPN → SSL → Config**

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn2/" rel="attachment wp-att-1211"><img class="aligncenter size-full wp-image-1211" alt="fgsslvpn2" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn2.jpg" width="449" height="302" /></a>

**VPN → SSL → Portal**

Domyślnie ( poniżej FortiOS 5.0) znajdują się trzy portale do wyboru. Edytujemy portal o nazwie _Full-access_ .Wygląda on tak jak na zdjęciu poniżej.

&nbsp;

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn3/" rel="attachment wp-att-1212"><img class="aligncenter size-full wp-image-1212" alt="fgsslvpn3" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn3.jpg" width="642" height="281" /></a>

Klikamy na _Settings_ i wybieramy z jakich protokołów chcemy skorzystać po zalogowaniu się na portal.

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn4/" rel="attachment wp-att-1213"><img class="aligncenter size-full wp-image-1213" alt="fgsslvpn4" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn4.jpg" width="642" height="350" /></a>

Następnie edytujemy zakładkę _Tunnel Mode,_ której używa program wgrany na nasz komputer.  
Wybieramy nasz _IP Pools_ oraz odznaczamy _Split Tunneling_.

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn5/" rel="attachment wp-att-1214"><img class="aligncenter size-full wp-image-1214" alt="fgsslvpn5" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn5.jpg" width="519" height="324" /></a>

&nbsp;

### 3) Użytkownicy

**User → User → User**  Tworzymy użytkowników którzy mają mieć dostęp do naszego Vpna

**User → User Group → User Group** Wyżej założonych userów dodajemy do nowej grupy pamiętając o wybraniu dla nich portalu.

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn8/" rel="attachment wp-att-1217"><img class="aligncenter size-full wp-image-1217" alt="fgsslvpn8" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn8.jpg" width="537" height="89" /></a>

### 4) Firewall**  
** 

**Policy → Policy → Policy**

Zakładamy dwie Policy tak jak poniżej, uwzględniając oczywiście swoje nazwy interfejsu Wan, grupy userów itp.

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn6/" rel="attachment wp-att-1215"><img class="aligncenter size-full wp-image-1215" alt="fgsslvpn6" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn6.jpg" width="458" height="362" /></a>

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn7/" rel="attachment wp-att-1216"><img class="aligncenter size-full wp-image-1216" alt="fgsslvpn7" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn7.jpg" width="642" height="348" /></a>

&nbsp;

### 6) Definiujemy ruting**  
** 

**Router → Static →Static Route**

<a href="http://techfreak.pl/fotigate-ssl-vpn/fgsslvpn9/" rel="attachment wp-att-1218"><img class="aligncenter size-full wp-image-1218" alt="fgsslvpn9" src="http://techfreak.pl/wp-content/uploads/2013/01/fgsslvpn9.jpg" width="642" height="54" /></a>

To by było na tyle. Można teraz połączyć się programem do naszego nowego VPNa.