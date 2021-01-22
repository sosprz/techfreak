---
title: Budowa zestawu FPV z KITU GB190 (GEP-ZX5)
author: Przemek
type: post
date: 2016-08-26T23:06:13+00:00
url: /budowa-zestawu-fpv-kitu-gb190-gep-zx5/
featured_image: /wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-79.jpg
dsq_thread_id:
  - 5097814070
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - fpv
  - geprc

---
Zapraszam do kolejnej budowy quadkoptera, tym razem na ramie [GEP-ZX5][1] w której odległość pomiędzy motorami to 190mm. I co za tym idzie, pozwala latać na pięcio calowych śmigłach!

<!--more-->Po ostatniej budowie 

[dubai210][2], na ramie QAV210 która dosyć fajnie się sprawuje przyszedł czas na ramę w kształcie X a raczej plusa. Dlatego, że wszystkie ramiona są pochylone względem siebie o 90 stopni. Jak poszukacie na techfreak pierwszych moich budowli to były one właśnie na takim prawdziwym X ale były wielkie i montowanie części na takim pokładzie to problem. Mowa o FPV250.  Po modzie na ramy H, znowu powracamy do początków. Mniej problemów z PID&#8217;ami, ale też i części są coraz mniejsze co pozwala na zmniejszenie ramy do wymiarów 190. Pisząc ten wpis, jak zawsze jestem po testach i mogę napisać, że nie ma nic za darmo. Małe wymiary wiążą się np. z dłuższym czasem budowy. Niby takie składnie jest proste ale spędzam czas na analizie co jak poskładać aby było praktyczne i dobrze złożone.

W skład kitu [GB190][1] wchodzą:

  * Silniki RS2205 2300kv
  * Regulatory LittleBee 30A Blheli 14.6
  * Kontroler lotu SPracing F3
  * PDB matek 5V i 12V + kabeek z wtyczką XT60
  * Kamera HD 1000TVL
  * Transmitter Video TS5823 600mW + antenka
  * Śmigła 5045 triblade
  * Rama GEP-ZX5

Brakuje:

  * Odbiornika RC
  * Buzzera

### Fotki na początek

[<img class="aligncenter size-full wp-image-11972" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-24.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-24" width="1000" height="667" />][3] [<img class="aligncenter size-full wp-image-11973" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-23.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-23" width="1000" height="667" />][4] [<img class="aligncenter size-full wp-image-11974" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-27.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-27" width="1000" height="667" />][5] [<img class="aligncenter size-full wp-image-11975" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-28.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-28" width="1000" height="667" />][6] [<img class="aligncenter size-full wp-image-11977" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-30.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-30" width="1000" height="667" />][7] [<img class="aligncenter size-full wp-image-11976" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-31.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-31" width="1000" height="667" />][8] [<img class="aligncenter size-full wp-image-11978" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-33.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-33" width="1000" height="667" />][9] [<img class="aligncenter size-full wp-image-11979" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-32.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-32" width="1000" height="667" />][10] [<img class="aligncenter size-full wp-image-11980" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-35.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-35" width="1000" height="667" />][11] [<img class="aligncenter size-full wp-image-11981" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-34.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-34" width="1000" height="667" />][12] [<img class="aligncenter size-full wp-image-11982" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-36.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-36" width="1000" height="667" />][13] [<img class="aligncenter size-full wp-image-11983" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-38.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-38" width="1000" height="667" />][14] [<img class="aligncenter size-full wp-image-11985" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-40.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-40" width="1000" height="667" />][15] [<img class="aligncenter size-full wp-image-11989" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-44.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-44" width="1000" height="667" />][16] [<img class="aligncenter size-full wp-image-11990" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-43.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-43" width="1000" height="667" />][17] [<img class="aligncenter size-full wp-image-11991" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-45.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-45" width="1000" height="667" />][18] [<img class="aligncenter size-full wp-image-11992" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-47.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-47" width="1000" height="667" />][19] [<img class="aligncenter size-full wp-image-11993" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-46.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-46" width="1000" height="667" />][20] [<img class="aligncenter size-full wp-image-11994" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-49.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-49" width="1000" height="667" />][21] [<img class="aligncenter size-full wp-image-11995" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-48.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-48" width="1000" height="667" />][22] [<img class="aligncenter size-full wp-image-11996" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-51.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-51" width="1000" height="667" />][23] [<img class="aligncenter size-full wp-image-11997" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-50.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-50" width="1000" height="667" />][24] [<img class="aligncenter size-full wp-image-11998" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-53.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-53" width="1000" height="667" />][25] [<img class="aligncenter size-full wp-image-11999" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-52.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-52" width="1000" height="667" />][26] [<img class="aligncenter size-full wp-image-12000" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-54.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-54" width="1000" height="667" />][27] [<img class="aligncenter size-full wp-image-12001" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-55.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-55" width="1000" height="667" />][28] [<img class="aligncenter size-full wp-image-12002" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-58.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-58" width="1000" height="667" />][29] [<img class="aligncenter size-full wp-image-12004" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-59.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-59" width="1000" height="667" />][30]

&nbsp;

Video prezentujące skład zestawu:



Przechodząc do samej ramy GEP-ZX5, generalnie jest to bardzo fajna rama o 4 mm wymiennych ramionach i mam możliwość nawet zamontowania kamery na szczycie wieżyczki. Natomiast bateria, która to była zawsze na górze została siłą rzeczy przeniesiona pod pokład i lądowania na niej mogą jej nie służyć. W zamian za to została dodana antypoślizgowa guma pod, którą jest bateria. Naprawdę jest praktyczna. Drugą rzeczą o jakiej niestety muszę napisać to śrubki. Dali fajny zestaw a śrubki to jakaś porażka imbusy kręcą się w miejscu. Tak naprawdę do poziomu wieżyczki nie ma nic specjalnego ale na uwagę zasługuje kopułka w której siedzi kamerka. Nie dość, że jest przystosowana do popularnych kamerek jak HS1177 to dodali płytkę do której można przykręcić słabą jak na standardy kamerkę CMOS. Niestety musisz zmieścić w niej i nadajnik video i odbiornik RC.

### Budowa, timelaps

Poniżej wideo z budowy, oczywiście przyspieszone





No to kto przeżył wszystkie wideo to zapraszam jeszcze do oglądania fotek.

[<img class="aligncenter size-full wp-image-12005" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-61.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-61" width="1000" height="667" />][31] [<img class="aligncenter size-full wp-image-12006" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-64.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-64" width="1000" height="667" />][32] [<img class="aligncenter size-full wp-image-12007" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-63.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-63" width="1000" height="667" />][33] [<img class="aligncenter size-full wp-image-12008" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-65.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-65" width="1000" height="667" />][34] [<img class="aligncenter size-full wp-image-12009" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-67.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-67" width="1000" height="667" />][35] [<img class="aligncenter size-full wp-image-12010" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-69.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-69" width="1000" height="667" />][36] [<img class="aligncenter size-full wp-image-12011" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-70.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-70" width="1000" height="667" />][37] [<img class="aligncenter size-full wp-image-12012" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-73.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-73" width="1000" height="667" />][38] [<img class="aligncenter size-full wp-image-12013" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-72.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-72" width="1000" height="667" />][39] [<img class="aligncenter size-full wp-image-12014" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-74.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-74" width="1000" height="667" />][40] [<img class="aligncenter size-full wp-image-12015" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-75.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-75" width="1000" height="667" />][41] [<img class="aligncenter size-full wp-image-12016" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-77.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-77" width="1000" height="667" />][42] [<img class="aligncenter size-full wp-image-12017" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-80.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-80" width="1000" height="667" />][43] [<img class="aligncenter size-full wp-image-12018" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-79.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-79" width="1000" height="667" />][44] [<img class="aligncenter size-full wp-image-12019" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-81.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-81" width="1000" height="667" />][45] [<img class="aligncenter size-full wp-image-12020" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-82.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-82" width="1000" height="667" />][46] [<img class="aligncenter size-full wp-image-12021" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-84.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-84" width="1000" height="667" />][47] [<img class="aligncenter size-full wp-image-12022" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-86.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-86" width="1000" height="667" />][48] [<img class="aligncenter size-full wp-image-12023" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-88.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-88" width="1000" height="667" />][49] [<img class="aligncenter size-full wp-image-12024" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-87.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-87" width="1000" height="667" />][50] [<img class="aligncenter size-full wp-image-12025" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-90.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-90" width="1000" height="667" />][51] [<img class="aligncenter size-full wp-image-12026" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-89.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-89" width="1000" height="667" />][52] [<img class="aligncenter size-full wp-image-12027" src="//techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-91.jpg" alt="techfreakpl_gb190_gep-zx5-fpv-mini-frame-91" width="1000" height="667" />][53]

&nbsp;

W trakcie budowy trzeba pamiętać o ustaleniu które silniki są z przodu które z tyłu EMAX RS2205 maja orientacje która trzeba ustawić. Niestety PDB z zestawu jest słabe pod względem ustawienia padów pod regulatory (ESC). PDB raczej do wymiany chyba, że ktoś chce się bawić jak ja co widać na fotkach. Kamerę zasilam z nadajnika video a to tylko dlatego, że po jakimś czasie zmieniłem nadajnik na 200mW z 600 które były w zestawie. Zawsze to mniej dwa kabelki ciągnąć z góry na dół. Kup kabelki silikonowe albo użyj tych z zestawu kontrolera lotu Spracing aby przy lutowaniu nie paliła ci się izolacja. Przydatne przy naprawach. Kup buzzer aby znaleźć kłada w trawie! Zaczep paskami zaciskowymi złącze nadajnika wideo o płyte karbonową aby przy upadku złącze się nie złamało. Kup rzepy aby zaczepić baterię tak jak ja na fotkach aby nie zerwać kabli przy upadku lub uszkodzić baterii. Zrób kalibrację regulatorów. Sprawdź czy kontroler lotu działa przed lotem. Mój SPracing niestety nie działał prawidłowo spędziłem trochę czasu na szukaniu, nie działającego YAW.



Gerabest migusiem wysłał mi nowy kontroler lotu na **swój koszt**. Jest możliwość zamienienia słupków na dłuższe co zwiększa trochę miejsce nad kontrolerem lotu ale to wybór budującego. Widziałem na forach, że wiele ludzi korzysta z tej opcji.

#### Pierwsze loty!

Po wgraniu betaflight 3.0 RC9 na domyślnych ustawieniach można sobie polatać.



### Podsumowanie

Ja jestem zadowolony z tego zestawu choć mógłby być lepszy! Pomijając PDB do zmiany i śrubki to wypadało by kamerę zamienić na coś w stylu HS1177. Ciekawe jest to, że gearbest.com wypuścił już [zestaw z lepsza kamerką i reglami z BLheli_S][54]. Powyższy zestaw można zakupić pod [TYM][1] linkiem.

Zaglądajcie na [Youtube][55] jak pogoda pozwoli będzie więcej filmów z lotów z GB190! Zadawajcie pytania w komentarzach!

Więcej promocji na wyścigówki:

[http://www.gearbest.com/multi-rotor-parts-c\_11353/a\_frame~kit/?odr=new&lkid=10102409][56]

<http://www.gearbest.com/promotion-rc-gadgets-special-743.html?lkid=10102414>

&nbsp;

&nbsp;

&nbsp;

 [1]: http://www.gearbest.com/multi-rotor-parts/pp_413709.html#lkid=1009712
 [2]: //techfreak.pl/kit-fpv-dubai-210-zloz-drona-wyscigowego/
 [3]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-24.jpg
 [4]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-23.jpg
 [5]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-27.jpg
 [6]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-28.jpg
 [7]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-30.jpg
 [8]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-31.jpg
 [9]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-33.jpg
 [10]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-32.jpg
 [11]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-35.jpg
 [12]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-34.jpg
 [13]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-36.jpg
 [14]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-38.jpg
 [15]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-40.jpg
 [16]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-44.jpg
 [17]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-43.jpg
 [18]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-45.jpg
 [19]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-47.jpg
 [20]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-46.jpg
 [21]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-49.jpg
 [22]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-48.jpg
 [23]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-51.jpg
 [24]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-50.jpg
 [25]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-53.jpg
 [26]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-52.jpg
 [27]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-54.jpg
 [28]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-55.jpg
 [29]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-58.jpg
 [30]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-59.jpg
 [31]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-61.jpg
 [32]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-64.jpg
 [33]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-63.jpg
 [34]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-65.jpg
 [35]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-67.jpg
 [36]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-69.jpg
 [37]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-70.jpg
 [38]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-73.jpg
 [39]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-72.jpg
 [40]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-74.jpg
 [41]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-75.jpg
 [42]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-77.jpg
 [43]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-80.jpg
 [44]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-79.jpg
 [45]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-81.jpg
 [46]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-82.jpg
 [47]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-84.jpg
 [48]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-86.jpg
 [49]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-88.jpg
 [50]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-87.jpg
 [51]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-90.jpg
 [52]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-89.jpg
 [53]: //techfreak.pl/wp-content/uploads/2016/08/techfreakpl_gb190_gep-zx5-fpv-mini-frame-91.jpg
 [54]: http://www.gearbest.com/multi-rotor-parts/pp_427259.html?lkid=10101997
 [55]: https://www.youtube.com/user/techfreakpl
 [56]: http://www.gearbest.com/multi-rotor-parts-c_11353/a_frame~kit/?odr=new&lkid=10102409