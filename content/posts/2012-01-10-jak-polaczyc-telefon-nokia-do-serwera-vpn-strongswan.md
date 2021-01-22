---
title: Jak połączyć telefon nokia do serwera VPN Strongswan
author: Przemek
type: post
date: 2012-01-10T08:56:09+00:00
url: /jak-polaczyc-telefon-nokia-do-serwera-vpn-strongswan/
bfa_virtual_template:
  - hierarchy
hits:
  - 558
dsq_thread_id:
  - 1031615355
categories:
  - Linux
  - Network
tags:
  - nokia
  - vpn

---
Jak stworzyć tunel VPN z telefonu firmy Nokia do serwera VPN Strongswan?

<!--more-->

Ipsec + Nokia (od Symbian s60v3)

Konfiguracja serwera:

Testowałem tą konfigurację z nokią 6120c i e51.  
Zaczynyamy od instalacji pakietu strongswan z use &#8222;nat&#8221;.  
W innej dystrubycji &#8222;nat&#8221; może być już defaultowo trzeba sprawdzić.  
W tym przypadku autoryzacja bedzie odbywać się na podstawie PSK i FQDN.

Edytujemy: /etc/ipsec.conf  
[crayon-5143e8eb6e5e2/]  
Edytujemy nasze hasło PSK: /etc/ipsec.secrets  
[crayon-5143e8eb6e629/]  
&nbsp;

Następnie startujemy demona ipsec:  
[crayon-5143e8eb6e66c/]  
&nbsp;

Włączamy tailowanie loga:  
[crayon-5143e8eb6e6aa/]  
To tyle po stronie serwera.

Konfiguracja klienta NOKIA:

Ściągamy ze strony nokia program Nokia Mobile VPN Client Policy Tool  
którym będziemy tworzyć polityk VPN dla naszej noki. I Klienta VPN dla noki mVPN\_S60\_v3\_1\_091231.sisx.  
Klienta VPN czyli *.sisx instalujemy na telefonie. A na kompie odpalamy Client Policy Tool.  
Generalnie konfiguracja wygląda jak niżej po skonfigurowaniu klikamy &#8222;Generate VPN Policy&#8221;  
a plik *.vpn wgrywamy do telefonu. Wygenerowaną politykę instalujemy poprzez kliknięcie na plik w telefonie.  
Jak skonfigurować punkt dostępu z wygenerowaną polityką trzeba sobie znaleść w necie :)

<a href="http://techfreak.pl/jak-polaczyc-telefon-nokia-do-serwera-vpn-strongswan/nmvpncpt/" rel="attachment wp-att-1189"><img class="aligncenter wp-image-2402" alt="nmvpncpt" src="http://techfreak.pl/wp-content/uploads/2013/01/nmvpncpt.jpg" width="410" height="362" /></a>

Trzeba pamiętać ze zautoryzowany telefon nie uzyska adresu ip z żadnej puli adresów lokalnych. I zawszę będzie się dobijał do lokalnych zasobów z zewnętrznego adresu. Aby to zmienić wystarczy zastosować prostą regułę iptables:  
(Zakłądając żę adresacja za serwerem to 10.0.0.0/24, ukryjemy wszystkich dobijających się na adres 10.0.0.1:80 pod adresem 10.0.0.254.)  
[crayon-5143e8eb6e6ee/]  
A tu log z połączenia zakończonego powodzeniem:  
[crayon-5143e8eb6e72d/]  
Konfiguracja IPtables &#8211; czyli udostępniamy internet poprzez VPN

Sieć 10.1.0.0/24 to pula z której przyznawane są adresy IP dla klientów.  
Sieć 192.168.0.0/24 za serverem VPN.  
[crayon-5143e8eb6e779/]  
&nbsp;