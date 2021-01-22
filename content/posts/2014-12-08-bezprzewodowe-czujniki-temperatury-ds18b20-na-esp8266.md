---
title: Bezprzewodowe czujniki temperatury DS18b20 na ESP8266
author: Przemek
type: post
date: 2014-12-08T06:06:02+00:00
url: /bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/
featured_image: /wp-content/uploads/2014/12/techfreakpl_esp8266_ds18b20-624x468.jpg
hits:
  - 22401
dsq_thread_id:
  - 3301522535
categories:
  - Elektronika
tags:
  - ESP8266
  - nettemp

---
Długo czekałem na takie proste i ciekawe rozwiązanie bezprzewodowego pomiaru temperatury. Nie tak dawno ukazał się tani układ Wifi ESP8266. Generalnie znany jako serial wifi ponieważ komunikacja odbywa się po TX,RX co jest i tak dużym ułatwieniem w stosunku np. do nRF2401. Okazuje się że sam moduł posiada 32 bitowy mikroprocesor który pozwala na załadowanie całkiem ciekawych programów. Dzięki takiemu rozwiązaniu można zbudować mini projekt bez użycia dodatkowego sprzętu takiego jak np. arduino. Super!  
<!--more-->

Na początek zobacz filmik żeby zobaczyć o czym będę pisał :)



### Co i jak

Poniżej postaram się pokazać jak załadować bardzo świeży kod do odczytywania temperatury z czujników temperatury DS18B20, który złożyłem z przykładów dostępnych w necie.

Na początek trzeba się zapoznać z pinami jakie są dostępne na ESP8266<figure id="attachment_8288" aria-describedby="caption-attachment-8288" style="width: 947px" class="wp-caption aligncenter">

<a href="http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/esp8266-pinout1/" rel="attachment wp-att-8288"><img class="wp-image-8288 size-full" src="http://techfreak.pl/wp-content/uploads/2014/12/esp8266-pinout1.png" alt="esp8266-pinout1" width="947" height="551" /></a><figcaption id="caption-attachment-8288" class="wp-caption-text">fotka z http://mcuoneclipse.com/2014/10/15/cheap-and-simple-wifi-with-esp8266-for-the-frdm-board/</figcaption></figure> 

### Połączenie

Aby się połączyć z układem trzeba mieć kabelek USB serial ale na 3.3V np. popularny FTDI 232RL. Najważniejsze piny to RX,TX, VCC, GND, CH\_PD. VCC można na stałe zewrzeć z CH\_PD bo to pin odpowiedzialny za uruchomienie mikroprocesora. Po zwarciu zostaje standardowy set pinów do podłączenia VCC, GND, RX, TX który trzeba podłączyć do swojego FTDI.

### Bootloader mode

Aby moc wgrywać &#8222;softy&#8221; trzeba wprowadzić układ w tryb w którym przyjmuje on nowe softy. Aby to zrobić trzeba zewrzeć GPIO0 do masy.

### Program do wgrywania

Do wgrywania używam esptool.py który można pobrać <a href="https://goo.gl/cK2d9N" target="_blank">github</a>. (git clone https://github.com/themadinventor/esptool)

Używa się go wydając polecenie:

<pre>./esptool.py --port /dev/ttyUSB0 write_flash 0x00000 nodemcu_512k.bin</pre>

Gdzie wskazałem porty USB mojego ftdi i plik nidemcu_512k.bin

### Co wgrać?

Można wgrywać różne programy, jest dostępne SDK więc może pojawiać się ich coraz więcej. Ja skorzystałem z <a href="http://www.nodemcu.com/" target="_blank">nodemcu</a> w którym piszę się trochę jak w arduino z tym że już od razu komendy lecą do pamięci i nie ma tu kompilowania i późniejszego ładowania. Na forum esp8266.com można sobie poczytać co i jak, jakie są przykłady, co można wgrać. Trochę wiedzy do ogarnięcia.

Z ściągam plik nodemcu_512k.bin z <a href="https://github.com/nodemcu/nodemcu-firmware" target="_blank">https://github.com/nodemcu/nodemcu-firmware</a> i tą samą komendą co wyżej wgrywam plik do układu ESP8266

<pre>./esptool.py --port /dev/ttyUSB0 write_flash 0x00000 nodemcu_512k.bin</pre>

### Czym się łączyć

Ja używam GTKterm lub cutecom więc trzeba sobie zainstalować coś z tych programów. Nodemcu różni się tym od innych że po połączeniu na np. /dev/ttyUSB0 na domyślny baudrate 9600 od razu dostaje znak zachęty. Bez ustawiania CR LF itp. co wymagane jest w innych wsadach i można się pogubić przy łączeniu przez USB np. myśląc: nie działa fak ;)

### Działa!

Co dalej? Pierwszy kod który wgrałem to łączenie do mojej sieci po WiFi. Bardzo prostu kod który wkleja się linie po linii do terminalu.

<pre>print(wifi.sta.getip())
    --0.0.0.0
    wifi.setmode(wifi.STATION)
    wifi.sta.config("SSID","password")
    print(wifi.sta.getip())
    --192.168.18.110</pre>

Od tego momentu twój mały układzik będzie się łączył do twojego wifi :)

Więcej przykładów można zobaczyć na <a href="https://github.com/nodemcu/nodemcu-firmware" target="_blank">https://github.com/nodemcu/nodemcu-firmware</a> i ogólnie zasady działania kodu na nodemcu.

### Pomiar temperatury

Ja sobie wymyśliłem że chciałbym do ESP8266 bezpośrednio połączyć DS18b20 który wykorzystuje w <a href="http://techfreak.pl/nettemp" target="_blank">nettemp</a> i który jest po prostu popularny. Będzie to bardzo fajne połączenie do mini urządzenia z którego można zdalnie czytać pomiary temperatury. Okazało się że dziś ludzie z nodemcu dodali obsługę 1-wire i mogę stworzyć to co chciałem ;) I poskładałem poniższy kod który wykonuje trzy rzeczy: łączy się do twojego wifi, odpala serwer www i odczytuję temperaturę z czujnika i wyświetla ją.

Aktualny działający kod znajduje się na <a href="https://goo.gl/z8rnRa" target="_blank">https://github.com/sosprz/nettemp/blob/beta/modules/sensors/wireless/init.lua</a>

Do GPIO2 podłączyłem DATA z DS18B20, VCC do VCC, GND do GND ESP8266 i odczyty temperatury pojawiły się po wejściu na adres IP modułu.

### Jak wgrać ten kod!?

Do wgrywania tylu linii też stworzono specjalny program o nazwie <a href="https://github.com/4refr0nt/luatool" target="_blank">luatool</a> (git clone https://github.com/4refr0nt/luatool)

UWAGA: pod gpio nie może być nic podłączone przy wgrywaniu programów.

Plik z powyższymi liniami zapisuje jako np. tf.lua i moge wgrać go jako plik który ma się automatycznie uruchamiać po włączeniu zasilania. Trzeba wskazać tylko żeby był plikiem docelowym o nazwie init.lua

<pre>./luatool.py -p /dev/ttyUSB0 -f tf.lua -t init.lua</pre>

Jako debug warto patrzeć co się dzieje w terminalu ale nie jest on wymagany w żaden sposób do działania. Zresztą widać to na powyższym filmiku.

### Zasialnie

<a href="http://techfreak.pl/bezprzewodowe-czujniki-temperatury-ds18b20-na-esp8266/techfreakpl_esp8266_ds18b20/" rel="attachment wp-att-8297"><img class="aligncenter size-full wp-image-8297" src="http://techfreak.pl/wp-content/uploads/2014/12/techfreakpl_esp8266_ds18b20.jpg" alt="techfreakpl_esp8266_ds18b20" width="1000" height="500" /></a>

Jak widać ja zastosowałem bateryjkę 3.6V. Najlepiej ją zamienić na jakiś lipo bo trzyma tylko godzinę :) A chodzi o to żeby był to naprawdę długi czas. ESP ma takie opcja jak czasowe wyłącznie, pomiar napięcia więc postaram już niedługo dołożyć te funkcjonalności a przede wszystkim dodać obsługę zdalnych czujników do <a href="http://techfreak.pl/nettemp" target="_blank">nettempa</a>.

### koniec

Mam nadzieję że trochę przybliżyłem Ci jak zacząć pracę z ESP8266. Zostaw komentarz czy też udało Ci się odczytać zdalnie temperaturę.

EDIT: kolejna część artykułu <a href="http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/" target="_blank">http://techfreak.pl/bezprzewodowe-czujniki-na-esp8266-nettemp/</a>

EDIT2: Dodatkowy opis dla windowsowych <a href="http://techfreak.pl/forum/viewtopic.php?f=19&t=247&start=120#p2845" target="_blank">http://techfreak.pl/forum/viewtopic.php?f=19&t=247&start=120#p2845</a>

&nbsp;

&nbsp;