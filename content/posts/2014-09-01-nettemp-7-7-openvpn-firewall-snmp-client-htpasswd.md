---
title: nettemp 7.7 openvpn firewall snmp client htpasswd
author: Przemek
type: post
date: 2014-09-01T14:15:42+00:00
url: /nettemp-7-7-openvpn-firewall-snmp-client-htpasswd/
featured_image: /wp-content/uploads/2014/09/nettemp_snmp_3.jpg
hits:
  - 1477
dsq_thread_id:
  - 2978168875
categories:
  - Elektronika
tags:
  - firewall
  - iptables
  - nettemp
  - openvpn
  - Raspberry pi

---
Hej, wypuściłem nową wersję nettempa z paroma nowymi funkcjami. Przede wszystkim skupiłem się tym razem na poprawie bezpieczeństwa i zdalnym dostępie. Dużo użytkowników pisze do mnie a żebym u nich coś zobaczył albo po prostu piszą &#8222;hej nettemp u mnie jest pod tym adresem IP&#8221;.

<!--more-->

Nie jestem specem od php i pewnie dało by radę znaleźć tam jakieś błędy bezpieczeństwa ale dużo osób zostawia nettempa na domyślnych hasłach. Dlatego też pomyślałem sobie że zrobienie dostępu do całości na htaccess będzie dobrym pomysłem i zabezpieczy dodatkowo aplikację. Ale to wciąż za mało, dlatego dołożyłem zabezpieczenie firewallem gdzie można zdefiniować sobie IP z którego port 80 będzie otwarty. Można tam też zdefiniować serwisy które mają być dostępne SSH, ICMP, OpenVPN. No właśnie dodałem obsługę OpenVPN, gdzie możemy wystawiać tylko port 1195 i łączyć się do nettempa po VPN ale i do swojej sieci lokalnej. Ostatnią funkcją jest klient SNMP o którego zostałem poproszony przez użytkowników którzy są adminami w serwerowniach :) Dzięki tej nowej funkcji można czytać temperaturę ze zdalnego serwera który ma uruchmiony SNMP serwer. Trzeba znać tylko odpowiedni OID (ang. Object IDentifier). Ja osobiście testowałem to na swoim NAS&#8217;ie Synology.

&nbsp;

Dodatkowo wprowadziłem procedurę testowania nettempa na środowisku wirtualnym gdzie wychwytuję większość błędów. Jest to zwykły debian. Trzeba pamiętać że Nettemp nei jest tylko na Raspberry Pi :)

Poniżej kilka zrzutów z nowej wersji.

[<img class="aligncenter size-full wp-image-7679" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_openvpn.jpg" alt="nettemp_openvpn" width="1030" height="412" />][1] [<img class="aligncenter size-full wp-image-7680" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_firewall.jpg" alt="nettemp_firewall" width="1030" height="390" />][2] [<img class="aligncenter size-full wp-image-7681" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_htaccess.jpg" alt="nettemp_htaccess" width="1029" height="429" />][3] [<img class="aligncenter size-full wp-image-7682" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_htaccess_2.jpg" alt="nettemp_htaccess_2" width="708" height="210" />][4] [<img class="aligncenter size-full wp-image-7683" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp.jpg" alt="nettemp_snmp" width="1030" height="283" />][5] [<img class="aligncenter size-full wp-image-7684" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp_2.jpg" alt="nettemp_snmp_2" width="1032" height="516" />][6] [<img class="aligncenter size-full wp-image-7685" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp_3.jpg" alt="nettemp_snmp_3" width="1032" height="541" />][7] [<img class="aligncenter size-full wp-image-7686" src="http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp_4.jpg" alt="nettemp_snmp_4" width="1035" height="497" />][8]

 [1]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_openvpn.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_firewall.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_htaccess.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_htaccess_2.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp_2.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp_3.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2014/09/nettemp_snmp_4.jpg