---
title: Jak odczytywać temperaturę z nettemp po SNMP?
author: Przemek
type: post
date: 2014-11-14T17:38:18+00:00
url: /odczytywac-temperature-nettemp-snmp/
featured_image: /wp-content/uploads/2014/11/techfreak_nettemp_snmp_3_1-624x403.jpg
hits:
  - 1081
dsq_thread_id:
  - 3224742280
categories:
  - Linux
tags:
  - nettemp

---
Tym razem trochę o odczytywaniu temperatury po SNMP z nettempa. Po ogłoszeniu nowej wersji Raspberry Pi A+ przyszło mi do głowy że jeśli nettemp może czytać temperatury po SNMP z serwerów czy innych urządzeń które udostępniają taką informację. To dlaczego nie może z samego siebie. Dokładnie chodzi mi taki scenariusz, że jedna instalacja nettemp&#8217;a zbiera wszystkie dane po SNMP z paru klientów zdalnych które maja zainstalowanego nettempa na Raspberry Pi A+. Sprawa w sumie prosta do zrealizowania bo trzeba tylko postawić serwer SNMP. I właśnie pokaże Ci poniżej jak to zrobić na nettemp.  
EDIT: Opcja została dodana do nettemp, w sekcji settings.

<!--more-->Na początek trzeba zainstalować serwer SNMPd.

<pre>apt-get install snmpd</pre>

Na początek ustawiamy na jakich interfejsach ma słuchać demon snmpd. Szukam linii i haszuje:

<pre>#  Listen for connections from the local system only
agentAddress  udp:127.0.0.1:161

na
#  Listen for connections from the local system only
#agentAddress  udp:127.0.0.1:161
</pre>

Następnie w **/etc/snmp/snmpd.conf haszujemy** linie:

<pre>#view systemonly included .1.3.6.1.2.1.1
#view systemonly included .1.3.6.1.2.1.25.1</pre>

<pre>#rocommunity public default -V systemonly</pre>

i dodajemy:

<pre>view  nettemp included .1.3.6.1.3</pre>

<pre>rocommunity public default -V nettemp</pre>

Czyli stworzyłem jedyny dostępny widok po SNMP. Bo po co więcej :)

Ale to nie wszystko, każdy nettemp od ostatniej wersji tworzy plik /var/www/nettemp/tmp/results  
gdzie można zobaczyć taki ciąg znaków jak poniżej

<pre>36.9:6.0:23.8:25.2:23.6:40.0:36.9</pre>

Jest to zrzut temperatur z czujników oddzielony dwukropkiem na potrzeby własnie odczytów po SNMP.

Serwer SNMP musi jakoś udostępniać te wyniki ale jako jedna wartość dla jednego czujnika.

Ja sobie wymyśliłem to tak że zrobię odczyty poszczególnych czujników przy pomocy parsowania pliku results poprzez AWK. Na samym końcu pliku **snmpd.conf** dodaje 8 linii, dzięki którym odczytam temperatury z ośmiu pierwszych czujników. Można dodać więcej jeśli potrzeba.

<pre>extend .1.3.6.1.3.1 /bin/bash "/usr/bin/awk -F: '{print $1}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.2 /bin/bash "/usr/bin/awk -F: '{print $2}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.3 /bin/bash "/usr/bin/awk -F: '{print $3}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.4 /bin/bash "/usr/bin/awk -F: '{print $4}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.5 /bin/bash "/usr/bin/awk -F: '{print $5}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.6 /bin/bash "/usr/bin/awk -F: '{print $6}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.7 /bin/bash "/usr/bin/awk -F: '{print $7}' /var/www/nettemp/tmp/results"
extend .1.3.6.1.3.8 /bin/bash "/usr/bin/awk -F: '{print $8}' /var/www/nettemp/tmp/results"</pre>

Każda linia jest odpowiedzialna za odczytanie kolejnej wartości z pliku results, czyli wartości temperatur które były tam wcześniej wpisane.

To tyle z konfiguracji serwera SNMP. Aby zamiany zadziałały trzeba go zrestartować.

<pre>/etc/init.d/snmpd restart</pre>

Może być to jeszcze nie jasne ale już pokazuje o co chodzi i jak to czytać. SNMP ma dwa narzędzia snmpwalk i snmpget. Aby sprawdzić czy serwer w ogóle odpowiada trzeba wydać polecenie snmpwalk które wyświetli dostępne OID czyli w tym przypadku numerki zaczynające się od  .1.3.6.1.3.8 które są adresami pod które trzeba będzie się kierować jeśli będę chciał odczytać wartości kryjące się pod nimi.

<pre>snmpwalk -v 2c -c public 172.18.10.9 1</pre>

snmpwalk wylistuje osiem razy poniższe linie

<pre>iso.3.6.1.3.1.1.0 = INTEGER: 1
iso.3.6.1.3.1.2.1.2.9.47.98.105.110.47.98.97.115.104 = STRING: "/usr/bin/awk -F: '{print $1}' /var/www/nettemp/tmp/results"
iso.3.6.1.3.1.2.1.3.9.47.98.105.110.47.98.97.115.104 = ""
iso.3.6.1.3.1.2.1.4.9.47.98.105.110.47.98.97.115.104 = ""
iso.3.6.1.3.1.2.1.5.9.47.98.105.110.47.98.97.115.104 = INTEGER: 5
iso.3.6.1.3.1.2.1.6.9.47.98.105.110.47.98.97.115.104 = INTEGER: 1
iso.3.6.1.3.1.2.1.7.9.47.98.105.110.47.98.97.115.104 = INTEGER: 1
iso.3.6.1.3.1.2.1.20.9.47.98.105.110.47.98.97.115.104 = INTEGER: 4
iso.3.6.1.3.1.2.1.21.9.47.98.105.110.47.98.97.115.104 = INTEGER: 1
iso.3.6.1.3.1.3.1.1.9.47.98.105.110.47.98.97.115.104 = STRING: "36.9"
iso.3.6.1.3.1.3.1.2.9.47.98.105.110.47.98.97.115.104 = STRING: "36.9"
iso.3.6.1.3.1.3.1.3.9.47.98.105.110.47.98.97.115.104 = INTEGER: 1
iso.3.6.1.3.1.3.1.4.9.47.98.105.110.47.98.97.115.104 = INTEGER: 0
iso.3.6.1.3.1.4.1.2.9.47.98.105.110.47.98.97.115.104.1 = STRING: "36.9"
iso.3.6.1.3.2.1.0 = INTEGER: 1
iso.3.6.1.3.2.2.1.2.9.47.98.105.110.47.98.97.115.104 = STRING: "/usr/bin/awk -F: '{print $2}' /var/www/nettemp/tmp/results"</pre>

Można zobaczyć tu takie info jak, jaki skrypt się wykonał lub odczyt z pierwszego czujnika temperatury o wartości 36.9 pod numerem OID iso.3.6.1.3.1.4.1.2.9.47.98.105.110.47.98.97.115.104.1.

Dobra ale chcemy uzyskać jedną zmienną a nie klika lini. Z pomocą przychodzi snmpget

<pre>snmpget -v1 -c public 172.18.10.9 iso.3.6.1.3.1.4.1.2.9.47.98.105.110.47.98.97.115.104.1 -O v</pre>

wynik to:

<pre>STRING: "36.9"</pre>

Taką zmienną jest już łatwo obrabiać. Ale jeśli używamy nettempa do odczytu to wystarczy przejść do zakładki Devices > SNMP i dodać nazwę, community, IP, OID i dzielnik który może być potrzebny jeśli dane są udostępniane jako np. 369. Wtedy trzeba wpisać 10 aby uzyskać wynik 36.9.

### SNMP w nettemp

### <a href="http://techfreak.pl/odczytywac-temperature-nettemp-snmp/techfreak_nettemp_snmp_1_1/" rel="attachment wp-att-8132"><img class="aligncenter size-full wp-image-8132" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nettemp_snmp_1_1.jpg" alt="techfreak_nettemp_snmp_1_1" width="1026" height="372" /></a> <a href="http://techfreak.pl/odczytywac-temperature-nettemp-snmp/techfreak_nettemp_snmp_2_1/" rel="attachment wp-att-8133"><img class="aligncenter size-full wp-image-8133" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nettemp_snmp_2_1.jpg" alt="techfreak_nettemp_snmp_2_1" width="1026" height="328" /></a> <a href="http://techfreak.pl/odczytywac-temperature-nettemp-snmp/techfreak_nettemp_snmp_3_1/" rel="attachment wp-att-8134"><img class="aligncenter size-full wp-image-8134" src="http://techfreak.pl/wp-content/uploads/2014/11/techfreak_nettemp_snmp_3_1.jpg" alt="techfreak_nettemp_snmp_3_1" width="1026" height="663" /></a>

Pewnie w najbliższych wersjach nettemp serwer snmpd będzie do skonfigurowania bezpośrednio z GUI. Jak by co czekam na pytania :)

&nbsp;