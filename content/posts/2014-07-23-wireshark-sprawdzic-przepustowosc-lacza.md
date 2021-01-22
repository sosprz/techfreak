---
title: Wireshark jak sprawdzić przepustowość łącza
author: Przemek
type: post
date: 2014-07-23T11:34:44+00:00
url: /wireshark-sprawdzic-przepustowosc-lacza/
featured_image: /wp-content/uploads/2014/07/wireshark_statistic_protocol_hierarchy.jpg
hits:
  - 705
categories:
  - Linux
tags:
  - wireshark

---
Czasami są takie sytuacje gdzie trzeba sprawdzić zużycie jakiegoś interfejsu sieciowego, czy to na jakimś routerze czy na serwerze. Lub ogólnie sprawdzić przepustowość danego łącza. W niektórych sytuacjach najlepiej było by jeszcze określić jakie połączenia generują największe zużycie.

Jeśli mowa o testowaniu łącz to moim zdaniem najlepiej nadaje się do tego iperf. Jest to narzędzie klient / serwer które znajduje się domyślnie w każdym wydaniu livecd Knoppix. Przy okazji kiedyś opisywałem <a title="Multiboot cd" href="http://techfreak.pl/jak-uruchamiac-wiele-obrazow-iso-z-jednego-usb/" target="_blank">jak uruchamiać wiele obrazów z jednego flasha</a>. Kiedyś opisywałem też <a title="Iperf" href="http://techfreak.pl/iperf-narzedzie-do-pomiaru-przepustowosci-lacza-sieci/" target="_blank">jak używać iperf</a>, który jest prosty w użyciu i ma parę przydatnych opcji takich jak np. generowanie równoległych połączeń.

Co do systemu operacyjnego, bardzo przydatny jest program nethogs który pokazuje jakie zużycie sieciowe generują procesy lub programy. Krótki opis tego programu pojawił się też jakiś czas temu: <a title="nethogs" href="http://techfreak.pl/jak-sprawdzic-jakie-procesy-wykorzystuja-przepustowosc-karty-nethogs/" target="_blank">techfreak.pl/jak-sprawdzic-jakie-procesy-wykorzystuja-przepustowosc-karty-nethogs/</a>

Niektóre routery są wyposażone w opcje logowania całego ruchu wybranego interfejsu do pliku pcap. A czasem trzeba samemu uruchomić wireshark&#8217;a na odpowiednim interfejsie aby zebrać potrzebne informacje. Przy okazji wspomnę też że jeśli dysponujemy tylko konsolą można uruchomić odpowiednik wiresharka, tshark.

<pre>tshark -i eth0 -w /home/tshark/log/out.cap -b filesize:100000</pre>

&nbsp;

Ok, wireshark zbiera ruch i pomaga go analizować. Okazuje się że ma też bardzo przydatną opcję statystyki dzięki której można określić poziom transferu jaki były uzyskiwany w tym momencie. Jeśli nie zdefiniuje w filtrze zadęgo adresu IP wireshark podsumuje całość. Zrobiłem mały test i ściągałem 500MB plik i zbierałem ruch wiresharkiem. Pokazał taki sam poziom transferów jak przeglądarka.

[<img class="aligncenter size-full wp-image-7351" src="http://techfreak.pl/wp-content/uploads/2014/07/mozilla_download_gts.jpg" alt="mozilla_download_gts" width="671" height="257" />][1] [<img class="aligncenter size-full wp-image-7352" src="http://techfreak.pl/wp-content/uploads/2014/07/wireshark_start.jpg" alt="wireshark_start" width="922" height="582" />][2] [<img class="aligncenter size-full wp-image-7353" src="http://techfreak.pl/wp-content/uploads/2014/07/wireshark_statistic_protocol_hierarchy.jpg" alt="wireshark_statistic_protocol_hierarchy" width="1281" height="723" />][3]

Na pierwszym screenie widać, że plik ściągany jest z prędkością  2.5MB/s a na ostatnim wireshark pokazuje 26Mbit/s, wygląda na to że się wszystko zgadza. Przy głębszej analizie będą potrzebne filtry na konkretne IP, aby określić jaki IP np. ma największe zużycie.

Dzięki wireshark jestem w stanie określić jak duży ruch wychodzi lub wchodzi na konkretny interfejs. Można zastosować go też zamiast iperfa, wysycając łącze przy pomocy np. ftp i zbierać ruch wireshark&#8217;iem.

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/07/mozilla_download_gts.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/07/wireshark_start.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/07/wireshark_statistic_protocol_hierarchy.jpg