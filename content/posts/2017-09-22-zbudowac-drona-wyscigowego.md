---
title: Jak zbudować drona wyścigowego?
author: Przemek
type: post
date: 2017-09-22T13:11:51+00:00
url: /zbudowac-drona-wyscigowego/
featured_image: /wp-content/uploads/2017/09/techfreak-awesome-f200-3.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6162461026
categories:
  - Drony
tags:
  - blheli
  - DYS
  - fpv
  - quadcopter
  - recenzja
  - test

---
Parę zdań jak zbudować drona/quada wyścigowego i jakie części zakupić.  To wszystko na karbonowej ramie Awesome F200,

<!--more-->

Ja tym razem zdecydowałem się na ramę [Awesome F200][1] o grubości 4mm i w układzie X,  przede wszystkim dlatego, że jest w miarę tania i ma tylną cześć top plate pochyloną ku dołowi co ułatwia montowanie kamery GoPro Session. Ram do wyboru jest naprawdę wiele, obecnie ciężko się na którąś zdecydować i decydującym czynnikiem może być dobra opinia użytkowników. Niestety w środku nie ma zbyt wiele miejsca i w zależności od doboru Kontrolera lotu (**FC**), płytki zasilającej (**PDB**) i regulatorów silników (**ESC**) będzie zależeć stopień trudności i ilości części na pokładzie. A także stopień trudności serwisowania w czasie awarii. Na tą chwile FC i PDB to jedna płytka nie ma co kupować dwóch oddzielnych bo zajmą tylko miejsce a jakość części jest na tyle dobra, że nie ma co rozdzielać tych dwóch tematów. Oczywiście można spotkać płytki ALL in ONE, które posiadają też ESC ale używanie ich jest jeszcze trochę ryzykowane z tego powodu że ESC jednak raz na jakiś czas mogą się spalić i wtedy cała płytka jest do wymiany a AIO nie są tanie. Więc pozostaje zastanowić się na ESC w opcji cztery na jednej płycie, gdzie zaletą jest schowanie jej w kabinie pod FC lub rozdzielenie ich na osobne &#8211; każdy regulator na ramieniu. Są też rozwiązania cztery w jednym gdzie cztery elementy są lutowane razem i tworzą jedną płytkę i w czasie awarii jednego wystarczy go zamienić na nowy. Ja tym razem wybrałem kontroler lotu [DYS F4 PRO][2] z PDB i regulatory ESC [DYS F30][3] 4 w 1 &#8211; na jednej płytce. Razem te dwa elementy tworzą stos, który zajmuje po prostu mniej miejsca. Zaletą są piny łączące te dwie płytki, im mniej przewodów tym lepiej. Na koniec wstępu zostały motory tym razem są to [COBRA VEK 2207 2450kv][4]. Sam obecnie latam na [EMAX RS2205][5] są to dobre i popularne motory. Kiedyś kobry 2204 i 2206 były naprawdę dobrymi silnikami i teraz powracają w nowych wersjach jak 2207 i 2206.

### Lista części

  * Firmware kontrolera lotu: [Betaflight 3.2 RC5][6]
  * Kontroler lotu (FC): [DYS F4 PRO][2]
  * Rama: [Awesome F200 ][1]
  * Silniki: [Cobra VEK 2207 2450 ][4]
  * Kontroler silników (ESC): [DYS F30A 30amp ][3]
  * Kamera FPV: [FOXEER Arrow V3 2.5mm ][7]
  * Nadajnik video: TBS UNIFY PRO RACE HV [team-blacksheep.com][8]
  * Nadajnik video: [Tramp HV ][9]
  * Anteny: [Fatshark ImmersionRC SpiroNet 5.8GHz RHCP ][10]
  * Okulary FPV: Fatshark Dominator v2 + moduł [NExWave RF][11]
  * Odbiornik RC: [FrSky XSR ][12]
  * Odbiornik RC: [FrSky R-XSR ][13]
  * Aparatura: [Taranis QX7 ][14]
  * Video camera: GoPro 5 Session
  * LiPo 4s: [Infinity 1300mAh][15]
  * LiPo 4s: [Infinity 1500mAh ][16]
  * Smigła: [KingKong 5x3x5040][17]
  * Smigła: [KingKong 5x3x5045 ][18]

&nbsp;

### Unpack

[<img class="aligncenter size-full wp-image-13234" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-0.jpg" alt="" width="1000" height="667" />][19] [<img class="aligncenter size-full wp-image-13235" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-1.jpg" alt="" width="1000" height="667" />][20][<img class="aligncenter size-full wp-image-13239" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-3.jpg" alt="" width="1000" height="667" />][21] [<img class="aligncenter size-full wp-image-13236" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-4-in-1-ESC-blheli-0.jpg" alt="" width="1000" height="667" />][22] [<img class="aligncenter size-full wp-image-13237" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-4-in-1-ESC-blheli-1.jpg" alt="" width="1000" height="667" />][23] [<img class="aligncenter size-full wp-image-13238" src="//techfreak.pl/wp-content/uploads/2017/09/tecjfreak-cobra-2207-2450kv-.jpg" alt="" width="1000" height="667" />][24][<img class="aligncenter size-full wp-image-13240" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-infinity-lipo-4s-1300mah.jpg" alt="" width="1000" height="667" />][25] [<img class="aligncenter size-full wp-image-13241" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-FC-F4-pro-betaflight-0.jpg" alt="" width="1000" height="667" />][26] [<img class="aligncenter size-full wp-image-13242" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-FC-F4-pro-betaflight-1.jpg" alt="" width="1000" height="667" />][27] [<img class="aligncenter size-full wp-image-13243" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-FC-F4-pro-betaflight-2.jpg" alt="" width="1000" height="667" />][28]

### Założenia

Głównym elementem jest kontroler lotu (FC) przez, którego przechodzą wszystkie dane. Przede wszystkim ma on odbierać informacje z wbudowanego żyroskopu i odbiornika RC a tym sterować silnikami quada poprzez regulatory silników (ESC). Do FC podłączony będzie odbiornik FrSky XSR z telemetrią. Posiada on dwie linie danych SBUS do przekazywania komend do FC i SPORT, która przekazuje dane od FC poprzez telemetrię do aparatury. Telemetria i SPORT jest o tyle fajna, że pozwala na odbieranie danych na aparaturze jak informacje o zasięgu lub stanie baterii i sterowanie takimi opcjami jak PID lub RATE. Czyli odpowiednią aparaturą, odbiornikiem RC, softem w FC zapewniam komunikację dwustronną aparatura &#8211; quad. Na tą chwile najlepszym wyborem jest Aparatura Taranis QX7 i odbiornik R-XSR. Aparatura jest funkcjonalna i tania a odbiornik bardzo mały. Zaletą powyższego rozwiązania jest też to, że nie trzeba zabierać laptopa czy telefonu aby zmienić opcje w quadzie. Płynnie przechodząc do wysyłania obrazu wideo z kamery na pokładzie do gogli. Latając ze znajomymi ważnym jest to aby moc zmienić moc i kanał w nadajniku wideo. Można to robić ręcznie ale jak zobaczysz czasem jest problemem aby dojść do przełącznika bo jest zabudowany.  Dlatego przy wyborze nadajnika wideo warto kierować się standardem i możliwościami, które się wykreowały ostatnim czasem. Mowa tu o nadajnikach wideo Tramp HV i TBS PRO RACE HV, które posiadają możliwość zmiany parametrów poprzez jedną szynę danych czyli jeden przewód zwany smart audio. Tak samo jak odbiornik RC, tak samo nadajnik wideo zostaje podłączony do portu TX na kolejnym UART na kontrolerze (FC). Po wykonaniu tej czynności, poprzez telemetrię, na aparaturze można sterować parametrami nadajnika video. OSD czyli on screen display to informacje z FC które wyświetlają się na obrazie przesyłanym do gogli. Jest to o tyle dobra sprawa, że pozwala nie tylko wyświetlić parametry co też zmienić je poprzez gałki na aparaturze. Czyli jest to kolejna mozliwość sterowania parametrami FC jak i nadajnika video. Można powiedzieć że bardziej analogowa ale jest. Trzeba wspomnieć ze oprogramowanie betaflight obsługuje w pełni OSD, wiec nie potrzeba już dodatkowych programatorów do OSD a wszystko robi się z tego samego menu przeglądarce suwakami i myszką. Poniższy schemat DYS F4 PRO powinien rozjaśnić jak to ma być wszystko podłączone.

[<img class="aligncenter size-full wp-image-13279" src="//techfreak.pl/wp-content/uploads/2017/09/dys-f4-pro-schema.jpg" alt="" width="1208" height="898" />][29]

#### Jak wygląda betaflight?

Zakładka ports w której trzeba wskazać urządzenia takie jak nadajnik video &#8211; TBS smart Audio (UART6), Smart Port dla odbiornika RC (UART3) i port SBUS dla odbiornika RC (UART1)

[<img class="aligncenter size-full wp-image-13301" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-0.jpg" alt="" width="1000" height="549" />][30]

W zakładce ESC trzeba ustawić protokół dla regulatorów: ja ustawiłem DSHOT600, Board and Sensor Aligment trzeba ustawić o ile stopni jest przekręcony kontroler lotu.

[<img class="aligncenter size-full wp-image-13302" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-1.jpg" alt="" width="1000" height="549" />][31]

W zakładce Receiver trzeba ustawić SBUS. W Other Features obowiązkowo Telemtry na ON i OSD.

&nbsp;

[<img class="aligncenter size-full wp-image-13303" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-2.jpg" alt="" width="1000" height="549" />][32]

W Power & Baterry trzeba ustawić scale na taką aby pomiar napięcia baterii był taki sam jak pomiar z miernika przyłożonego do baterii.

[<img class="aligncenter size-full wp-image-13304" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-3.jpg" alt="" width="1000" height="549" />][33]

W Stick min warto obniżyć wartość do 1010 dla większej precyzji gazu.

&nbsp;

[<img class="aligncenter size-full wp-image-13305" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-4.jpg" alt="" width="1000" height="549" />][34]

W modes trzeba ustawić ARM czyli uzbrojenie quada pod odpowiednim przełącznikiem i BEEPER (buzzer) aby wzbudzić piszczenie w razie zgubienia. To jedno ustawianie jest dla zwykłego buzzera jak i buzzera poprzez DSHOT commands.

[<img class="aligncenter size-full wp-image-13306" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-5.jpg" alt="" width="1000" height="549" />][35]

W OSD dostosowuje wygląd do swoich potrzeb. Ja korzystam tylko z napięcia i czasu lotu.

[<img class="aligncenter size-full wp-image-13307" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-6.jpg" alt="" width="1000" height="549" />][36]

&nbsp;

#### Chcesz przekręcić płytkę zmień YAW [<img class="aligncenter wp-image-13287" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-blheli-s-0.jpg" alt="" width="249" height="144" />][37]

#### Kolejność motorów się nie zgadza, zmień mapowanie

Po przekręceniu płytki z regulatorami (ESC) silniki tracą kolejność i trzeba je odpowiedni ustawić. Aby wyświetlić aktualny stan zmapowanych pinów procesora w CLI wydaj polecenie  **resources**

[<img class="aligncenter wp-image-13284" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-dump-0.jpg" alt="" width="614" height="337" />][38]

Jak już przemyślisz jak mają być zmapowane silniki wydaj polecenia aby je ustawić. Najlepiej dwa razy ponieważ CLI wyrzuci błąd że PIN jest używany i go zwalnia.

<pre># resources
resource MOTOR 1 A03
resource MOTOR 2 B00
resource MOTOR 3 A02
resource MOTOR 4 B01</pre>

&nbsp;

#### Chcesz mienić wygląd OSD

Przejdź do menu betaflight do zakładki OSD

[<img class="aligncenter size-full wp-image-13286" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-osd.jpg" alt="" width="1000" height="549" />][39]

#### Kopia ustawień &#8211; dump

Aby zachować kopie ustawień wydaj polecenie diff i zapisz je w notatniku. Backup z menu betaflight nie zapisuje ustawień z CLI.

[<img class="aligncenter size-full wp-image-13285" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-dump-1.jpg" alt="" width="1000" height="549" />][40]

### Taranis

Pare zrzutów z telemetrii o której pisałem wcześniej

[<img class="aligncenter size-full wp-image-13295" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-0.jpg" alt="" width="1000" height="650" />][41] [<img class="aligncenter size-full wp-image-13296" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-1.jpg" alt="" width="1000" height="650" />][42] [<img class="aligncenter size-full wp-image-13297" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-2.jpg" alt="" width="1000" height="650" />][43] [<img class="aligncenter size-full wp-image-13298" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-3.jpg" alt="" width="1000" height="650" />][44]

### Blheli

### Zmień kierunek obrotu silników na odpowiedni

Jeśli chcemy sterować kierunkiem silników można to zrobić na dwa sposoby albo zamienić miejscami dwa przewody od silników albo zrobić to z programu blheli, który służy do wgrywania oprogramowania i ustawiania opcji. Program blheli jest tak jak betaflight wtyczką do przeglądarki Chrome. Mamy tu miedzy innymi opcje Motor Direction, PPM Min/Max Thortle, Motor timing. Motor direction jak wiadomo to kierunek obrotu. Min i Max PPM to zakres gazu, który powinien być ustawiony na 1000 dla min i 2000 dla max. Jeśli regulatory obsługują protokół DSHOT nie kalibruje się ich. Zakres ustawia się ręcznie raz na zawsze. Motor Timing to ustawienie synchronizacji impulsów podawanych do silnika im wyższy tym motory kręcą się szybciej ale może występować rozsynchronizowanie i motory mogą robić się gorące a moment obrotowy spadać. Dla każdego silnika trzeba dobrać ustawienia Motor Timong. Domyslnie jest na Mednium czyli pośrodku.

[<img class="aligncenter size-full wp-image-13288" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-blheli-s-1.jpg" alt="" width="1000" height="549" />][45]

### 

### DSHOT commands

Dshot jest cyfrowym protokołem, który się rozwija i pozwala na wysyłanie dodatkowych komand przed wysłaniem informacji jak szybko mają kręcić się motory. W tym przypadku jeśli nie masz miejsca na pokładzie na buzzer możesz wgrać firmware z opcją command. Daje ona opcję taką, że regulatory zaczynają piszczeć jak buzzer w przypadku przełączenia gałki. Jest to obowiązkowa opcja jeśli nie chcesz stracić quada w gęstej trawie. Oczywiście Dshot command pozwala jeszcze na inne ciekawe opcje ale zostawiam to do późniejszego doczytania.

[<img class="aligncenter size-full wp-image-13289" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-blheli-s-2.jpg" alt="" width="1000" height="302" />][46]

&nbsp;

### Budowa quada

[<img class="aligncenter size-full wp-image-13246" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-0.jpg" alt="" width="1000" height="650" />][47] [<img class="aligncenter size-full wp-image-13247" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-1.jpg" alt="" width="1000" height="650" />][48] [<img class="aligncenter size-full wp-image-13248" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-2.jpg" alt="" width="1000" height="650" />][49] [<img class="aligncenter size-full wp-image-13249" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-3.jpg" alt="" width="1000" height="650" />][50] [<img class="aligncenter size-full wp-image-13250" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-4.jpg" alt="" width="1000" height="650" />][51] [<img class="aligncenter size-full wp-image-13251" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-5.jpg" alt="" width="1000" height="650" />][52] [<img class="aligncenter size-full wp-image-13252" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-6.jpg" alt="" width="1000" height="650" />][53] [<img class="aligncenter size-full wp-image-13253" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-7.jpg" alt="" width="1000" height="650" />][54] [<img class="aligncenter size-full wp-image-13254" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-8.jpg" alt="" width="1000" height="650" />][55] [<img class="aligncenter size-full wp-image-13255" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-9.jpg" alt="" width="1000" height="650" />][56] [<img class="aligncenter size-full wp-image-13256" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-10.jpg" alt="" width="1000" height="650" />][57] [<img class="aligncenter size-full wp-image-13257" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-11.jpg" alt="" width="1000" height="650" />][58] [<img class="aligncenter size-full wp-image-13258" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-12.jpg" alt="" width="1000" height="650" />][59] [<img class="aligncenter size-full wp-image-13259" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-13.jpg" alt="" width="1000" height="650" />][60] [<img class="aligncenter size-full wp-image-13260" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-14.jpg" alt="" width="1000" height="650" />][61] [<img class="aligncenter size-full wp-image-13261" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-15.jpg" alt="" width="1000" height="650" />][62] [<img class="aligncenter size-full wp-image-13262" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-16.jpg" alt="" width="1000" height="650" />][63] [<img class="aligncenter size-full wp-image-13263" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-17.jpg" alt="" width="1000" height="650" />][64] [<img class="aligncenter size-full wp-image-13264" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-18.jpg" alt="" width="1000" height="650" />][65] [<img class="aligncenter size-full wp-image-13265" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-19.jpg" alt="" width="1000" height="650" />][66] [<img class="aligncenter size-full wp-image-13266" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-20.jpg" alt="" width="1000" height="650" />][67] [<img class="aligncenter size-full wp-image-13267" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-21.jpg" alt="" width="1000" height="650" />][68] [<img class="aligncenter size-full wp-image-13268" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-22.jpg" alt="" width="1000" height="650" />][69] [<img class="aligncenter size-full wp-image-13269" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-23.jpg" alt="" width="1000" height="650" />][70] [<img class="aligncenter size-full wp-image-13270" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-24.jpg" alt="" width="1000" height="650" />][71] [<img class="aligncenter size-full wp-image-13271" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-25.jpg" alt="" width="1000" height="650" />][72] [<img class="aligncenter size-full wp-image-13272" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-26.jpg" alt="" width="1000" height="650" />][73] [<img class="aligncenter size-full wp-image-13273" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-27.jpg" alt="" width="1000" height="650" />][74] [<img class="aligncenter size-full wp-image-13274" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-28.jpg" alt="" width="1000" height="650" />][75] [<img class="aligncenter size-full wp-image-13275" src="//techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-29.jpg" alt="" width="1000" height="650" />][76]

&nbsp;

### Testowe loty

Poniżej wrzucam playlistę w youtube. Na pewnie będą się tu pojawiać nowe filmy.



&nbsp;

Niedawno założyłem instagrama i nie wiem dlaczego wcześniej tego nie zrobiłem naprawdę fajny portal społecznościowy :) Idealnie nadaje się na dzielenie fotkami quadów!

<blockquote class="instagram-media" style="background: #FFF; border: 0; border-radius: 3px; box-shadow: 0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width: 658px; padding: 0; width: calc(100% - 2px);" data-instgrm-captioned="" data-instgrm-version="7">
  <div style="padding: 8px;">
    <div style="background: #F8F8F8; line-height: 0; margin-top: 40px; padding: 50.0% 0; text-align: center; width: 100%;">
    </div>
    
    <p style="margin: 8px 0 0 0; padding: 0 4px;">
      <a style="color: #000; font-family: Arial,sans-serif; font-size: 14px; font-style: normal; font-weight: normal; line-height: 17px; text-decoration: none; word-wrap: break-word;" href="https://www.instagram.com/p/BZHI4BelhYN/" target="_blank" rel="noopener">First run awesome f200, cobra 2207, dys F4 pro, default pid and half lipo! #fpv #gopro #quick</a>
    </p>
    
    <p style="color: #c9c8cd; font-family: Arial,sans-serif; font-size: 14px; line-height: 17px; margin-bottom: 0; margin-top: 8px; overflow: hidden; padding: 8px 0 7px; text-align: center; text-overflow: ellipsis; white-space: nowrap;">
      A post shared by Przemek So (@techfreakpl) on <time style="font-family: Arial,sans-serif; font-size: 14px; line-height: 17px;" datetime="2017-09-16T18:13:20+00:00">Sep 16, 2017 at 11:13am PDT</time>
    </p>
  </div>
</blockquote>



### Podsumowanie

Cały czas czekam na odbiornik RC R-XSR, który mam nadzieję zmieścić pomiędzy FC a ESC. Z pierwszych lotów jestem zadowolony, niestety nie ma dobrej pogody aby polatać i przetestować PID. Na tą chwile na wersji betaflight 3.2 bez automatycznych filtrów większość quadów będzie latać dobrze więc nie ma co się martwić. Ja na tą chwilę też nie zmieniłem nic z domyślnych ustawień w sekcji PID i RATE. Na temat śmigieł i baterii napiszę tyle, że jeśli chcesz się ścigać to wiesz że trzeba zastosować baterię 1500 o wysokim C. Jeśli nie to baterie takie jak DINOGY czy INFINITY będą ok na początek. Tak samo ze śmigłami. KingKong 5040 i 5045 będą ok bo są tanie i w miarę ok. Jeśli myślisz o silnikach 2306 które ostatnio są popularne to na tą chwile nie ma sensu ich używania. W Shurikenie X1 o którym pisałem bateria przy szybszym łataniu to 1.5minuty i nie pożyje ona zbyt długo.  Baterie nie są w stanie oddawać po tyle amper ile pobierają silniki więc trzeba wziąć to wszystko pod uwagę przy projektowaniu maszyny. Tak samo jest z regulatorami ja mam 4x30A ale w zupełności wystarczyły by 4x20A. Posiadam 12 sztuk DYS XSD20A i wszystkie cały czas działają.

Ok, nie napisałem może tu o wszystkim ale mam nadzieje, że była to fajna zajawka do zbudowania nowego czy pierwszego quada.

&nbsp;

 [1]: https://www.banggood.com/Awesome-F200-200mm-4mm-Arm-FPV-Racing-X-Frame-Carbon-Fiber-CNC-Aluminum-Alloy-p-1142330.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [2]: https://www.banggood.com/DYS-30_5x30_5mm-Omnibus-F4-Pro-Flight-Control-Integrated-with-OSD-5V-BEC-and-Current-Sensor-p-1136875.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [3]: https://www.banggood.com/DYS-F30A-30amp-4-in-1-BLHeli_S-ESC-2-4S-BB2-BEC-5V12V-3A-Dshot600-Oneshot125-Oneshot42-Multishot-p-1143250.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [4]: https://www.banggood.com/Cobra-VEK-Blue-Edition-CP2207-2207-2450KV-3-6S-Brushless-Motor-for-Racing-Drone-p-1174960.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [5]: https://www.banggood.com/Eachine-V-tail-210-FPV-Drone-Spare-Part-Customized-Version-Emax-RS2205-2300KV-Brushless-Motor-3-4S-p-1158715.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [6]: //chrome.google.com/webstore/detail/betaflight-configurator/kdaghagfopacdngbohiknlhcocjccjao
 [7]: https://www.banggood.com/FOXEER-Arrow-V3-2_5mm-600TVL-HAD-II-CCD-PALNTSC-Mini-FPV-Camera-Built-in-OSD-MIC-p-1121696.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [8]: http://www.team-blacksheep.com/products/prod:unify_pro_hv
 [9]: https://www.banggood.com/ImmersionRC-Tramp-HV-6-18V-5_8GHz-1mW-to600mW-Video-Transmitter-International-Version-p-1088990.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [10]: https://www.banggood.com/Fatshark-ImmersionRC-SpiroNet-5_8GHz-RHCP-Antenna-Set-2-PCS-p-956810.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [11]: https://www.banggood.com/Fatshark-Dominator-Reciever-5_8GHz-32-Channels-RX-Module-RaceBand-p-1002025.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [12]: https://www.banggood.com/FrSky-XSR-2_4GHz-16CH-ACCST-Receiver-S-Bus-CPPM-Output-Support-X9D-X9E-X9DP-X12S-X-Series-p-1031481.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [13]: https://www.banggood.com/FrSky-R-XSR-Ultra-SBUSCPPM-D16-16CH-Mini-Redundancy-Receiver-1_5g-p-1186057.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [14]: https://www.banggood.com/FrSky-ACCST-Taranis-Q-X7-2_4GHz-16CH-Transmitter-White-Black-p-1112717.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [15]: https://www.banggood.com/Infinity-4S-14_8V-1300mAh-70C-Graphene-LiPo-Battery-XT60-Support-15C-Boosting-Charge-p-1062565.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [16]: https://www.banggood.com/Infinity-1500mah-14_8V-90C-4S1P-Race-Spec-Lipo-Battery-p-1112634.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [17]: https://www.banggood.com/10-Pairs-Kingkong-5040-5x4x3-3-Blade-Single-Color-CW-CCW-Propellers-for-FPV-Racer-p-1067875.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [18]: https://www.banggood.com/10-Pairs-Kingkong-5x4_5x3-5045-5-Inch-3-Blade-Propeller-CW-CCW-for-FPV-Racer-p-1067877.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling&utm_source=bbs&utm_medium=techfreak&utm_content=liangjunwen
 [19]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-0.jpg
 [20]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-1.jpg
 [21]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-3.jpg
 [22]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-4-in-1-ESC-blheli-0.jpg
 [23]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-4-in-1-ESC-blheli-1.jpg
 [24]: //techfreak.pl/wp-content/uploads/2017/09/tecjfreak-cobra-2207-2450kv-.jpg
 [25]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-infinity-lipo-4s-1300mah.jpg
 [26]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-FC-F4-pro-betaflight-0.jpg
 [27]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-FC-F4-pro-betaflight-1.jpg
 [28]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-DYS-FC-F4-pro-betaflight-2.jpg
 [29]: //techfreak.pl/wp-content/uploads/2017/09/dys-f4-pro-schema.jpg
 [30]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-0.jpg
 [31]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-1.jpg
 [32]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-2.jpg
 [33]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-3.jpg
 [34]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-4.jpg
 [35]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-5.jpg
 [36]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-3.2-6.jpg
 [37]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-blheli-s-0.jpg
 [38]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-dump-0.jpg
 [39]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-osd.jpg
 [40]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-betaflight-dump-1.jpg
 [41]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-0.jpg
 [42]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-1.jpg
 [43]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-2.jpg
 [44]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-taranis-qx7-3.jpg
 [45]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-blheli-s-1.jpg
 [46]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-blheli-s-2.jpg
 [47]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-0.jpg
 [48]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-1.jpg
 [49]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-2.jpg
 [50]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-3.jpg
 [51]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-4.jpg
 [52]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-5.jpg
 [53]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-6.jpg
 [54]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-7.jpg
 [55]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-8.jpg
 [56]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-9.jpg
 [57]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-10.jpg
 [58]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-11.jpg
 [59]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-12.jpg
 [60]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-13.jpg
 [61]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-14.jpg
 [62]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-15.jpg
 [63]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-16.jpg
 [64]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-17.jpg
 [65]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-18.jpg
 [66]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-19.jpg
 [67]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-20.jpg
 [68]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-21.jpg
 [69]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-22.jpg
 [70]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-23.jpg
 [71]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-24.jpg
 [72]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-25.jpg
 [73]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-26.jpg
 [74]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-27.jpg
 [75]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-28.jpg
 [76]: //techfreak.pl/wp-content/uploads/2017/09/techfreak-awesome-f200-DYS-f4-pro-cobra-motors-2017-29.jpg