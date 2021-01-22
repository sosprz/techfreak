---
title: Sekcja zwłok – czyli produkt mówi o projektancie.
author: Pawel R.
type: post
draft: true
date: 2018-08-25T04:24:35+00:00
url: /sekcja-zwlok-czyli-produkt-mowi-o-projektancie/
featured_image: /wp-content/uploads/2018/08/Symbol_003aa_1.jpg
colormag_page_layout:
  - default_layout
onesignal_meta_box_present:
  - 1
categories:
  - Elektronika
  - Inne
tags:
  - inne
  - smd
  - smt

---
<img class="alignright wp-image-15084" src="http://techfreak.pl/wp-content/uploads/2018/08/Symbol_000.jpg" alt="" width="227" height="356" />      W tym opisie chciałbym przedstawić swoje przemyślenia na temat procesu produkcji elektroniki na przykładzie moim zdaniem porządnego urządzenia jakim był denat tj czytnik kodów kreskowych marki Motorola Symbol. Obecnie wyczynem nie jest kupić coś z chin za 3$ z darmową wysyłką a często sami z góry już zakładamy że to nie przeżyje długo wpływ na taką postawę ma samo urządzenie (sposób zaprojektowania, użyte elementy, proces produkcji i o ile jest testowanie wyrobu gotowego), opinie o nim w internecie lub opinie o podobnych wyrobach. No ale patrząc na ilość stron oferujących towar tego pokroju jest na to zapotrzebowanie&#8230; więc udaje się nas złowić.  
Tu chciałbym się skupić na części elektronicznej układu (elektroniki jest teraz pełno we wszystkim nawet tam gdzie jest to absurdalne )- a dokładniej co możemy wywnioskować patrząc tylko na wyrób gotowy i jak firma się przyłożyła (lub nie) do jego powstania. Zachęcam też osoby zainteresowane drążeniem taki spraw do własnych analiz co i jak powstało. W tekście jest kilka odnośników do dokumentów z którymi trzeba się zapoznać aby zrozumieć artykuł.

Na zdjęciu pie[<img class="wp-image-15098 size-thumbnail alignleft" src="http://techfreak.pl/wp-content/uploads/2018/08/techfreak-symbol-1-478x200.jpg" alt="" width="478" height="200" />][1]rwszym &#8211; wygląd złożonego produktu. Jak widać jest to urządzenie przeznaczone do stawiania na biurko i prawdopodobnie do obsługi przez człowieka &#8211; kształt dopasowany do dłoni.

Tu  pokazuje mamy zdjęcie środka urządzenia składającego się z 3 płytek ( modułów ) które są połączone taśmami [flex.][2] O tym że w trakcie projektowania pomyślano o etapie wytwarzania może świadczyć już ten obrazek &#8211; z prawej strony widzimy czarną taśmę flex z opisem która strona gdzie pow[<img class="wp-image-15092 alignleft" src="http://techfreak.pl/wp-content/uploads/2018/08/ICT_zneta.jpg" alt="" width="242" height="323" />][3]inna być podłączona „HANDLE“ i analogicznie na drugiej stronie mamy opis „BASE“ mimo braku kompatybilności złącz ( nie da się włożyć tej taśmy odwrotnie ) ktoś zdecydował o umieszcze[<img class="alignright wp-image-15111 size-thumbnail" src="http://techfreak.pl/wp-content/uploads/2018/08/Symbol_003aa_1-300x200.jpg" alt="" width="300" height="200" />][4]niu tych opisów. Przeglądając kilka filmów z chińskich fabryk w przypadku produktów najniższej klasy widok jest następujący &#8211; kilka lub kilkanaście osób siedzi wzdłuż linii produkcyjnej(taśmy) &#8211; wykonując kilka czynności manualnych ew coś sprawdzają bez rejestracji wyników &#8211; coś co nie przejdzie „testu“ manualnego ląduje w koszu. Ze zdjęć można wnioskować że tutaj etap produkcji zawierał jakieś zautomatyzowane testy. Wnioskować można na podstawie widocznej na zdjęciu  kodu qr oraz padów testowych do igieł (zdjęcie widoczne po lewej &#8211; przykład fixtury testującej zaopatrzonej w igły które celują w złocone pola). Przyglądając się uważnie padom można założyć że ta badana sztuka przeszła przez tester raz z wynikiem pozytywnym. Zakładam tak ponieważ widoczne na testpadach wkucia po igłach są tylko w jednym miejscu (często przy wielokrotnych testach jakieś opornej sztuki można byłoby zauważyć kilka miejsc wkuć &#8211; igła nie zawsze wpada w to samo miejsce), i tu też można spróbować wnioskować o założeniach projektowych &#8211; koszt testera jest stosunkowo duży ale poczyniono starania by powstał a projekt współpracował z nim w sposób najłatwiejszy jak to jest możliwe ( brak[<img class="alignright wp-image-15086" src="http://techfreak.pl/wp-content/uploads/2018/08/Symbol_003a.jpg" alt="" width="259" height="194" />][5] wysokich elementów w okolicach testpadów, a one same są stosunkowo duże ). Na całym projekcie  też widać optymalizację kosztową. Jedynie wybrane elementy na laminacie są złocone. Pozostałe części płyty nie zawierają złocenia być może widoczne położono w technice [ENIG][6] (nanoszenie warstwy złota metodą chemiczną warstwa zazwyczaj o małej grubości) &#8211; widać to na zdjęciach z mikroskopu prawdopodobnie dla komponentów smd użyto powłoki [OSP][7] ( jest to organiczna powłoka pokrywająca gołe pady miedziane &#8211; dużo tańsza w produkcji/zakupie ale posiadająca kilka wad jedna z nich to krótki cz<img class="alignleft wp-image-15087 size-medium" src="http://techfreak.pl/wp-content/uploads/2018/08/Symbol_004-300x225.jpg" alt="" width="300" height="225" />as przydatności płyty do produkcji na SMT ) . Jeżeli na zdjęciu kolor nie przypomina miedzianego jest to spowodowane tylko słabym mikroskopem &#8230;. Elementy SMD nie posiadają w swojej spodniej części śladów kleju-  można więc założyć [proces lutowania rozpływowy.][8] Inną wskazówką na proces rozpływowy jest sama mozaika [ścieżek do fali][9] &#8211; footrpint pod elementy SMD powinien być odrobinę inny.

Idziemy dalej &#8211; drugie zdjęcie w artykule wyraźnie pokazuje montaż w [technice SMD][10], jak by było to możliwe projektant dobrał by elementy tylko SMD ale jednak jest kilka elementów elektronicznych montowanych w [technice THT.][11] I tu można wnioskować o procesie automatycznym tj selektywne lutowanie au[<img class="wp-image-15102 alignright" src="http://techfreak.pl/wp-content/uploads/2018/08/Symbol_013.jpg" alt="" width="260" height="195" />][12]tomatyczne. Maszyna do selektywnego lutowania pozostawiła po sobie charakterystyczny ślad w postaci szarych osadów w około lutowanych obszarów ( prawdopodobnie po topniku ). Inne potwierdzenie że jest to lutowanie selektywne to obecność lutowia tylko na okolicznych testpadach otworów THT. Co do zasady elementy THT mają większą wytrzymałość mechaniczną więc obecność gniazda przyłączeniowego zamontowanego w tego typu obudowie nie dziwi.

Mimo iż urządzenie nie jest zadeklarowane jako posiadające stopień ochrony przed wilgocią na zdjęciu  widzimy że użyte przyciski mają dodatkową membranę chroniącą punkty styku przed wilgocią. Co moim zdaniem jest wynikiem zadbania o użytkownika końcowego, może dobrego projektu lub informacji zwrotnej że tańsze (bo te elementy zapewne są droższe) przełączniki nie sprawdziły się w jakiś testach [<img class="alignright wp-image-15085" src="http://techfreak.pl/wp-content/uploads/2018/08/Symbol_002a.jpg" alt="" width="217" height="202" />][13]wytrzymałościowych. W podstawie jest też ukryty przełącznik aktywujący skaner w czasie podnoszenia &#8211; zamiast rozwiązania mechanicznego użyto tu rozwiązania fotooptycznego (większa trwałość , brak styku elektrycznego ).

O mozaice ścieżek i rozłożeniu elementów nie będę wspominał bo to kawałek na oddzielny i długi artykuł.

Na pytanie co zawiodło &#8211; nie znam odpowiedzi. Urządzenie pikaniem wskazuje niskie napięci[<img class="wp-image-15081 alignleft" src="http://techfreak.pl/wp-content/uploads/2018/08/symbol_010.jpg" alt="" width="105" height="79" />][14]e zasilania za pomocą dziwnych dźwięków. Przy pomiarze napięcia widać znaczący spadek kilka sekund po podłączeniu zasilania. Prawdopodobnie uszkodzenie mechaniczne lub lutowie bezołowiowe [powoduje zwarcie][15] (strona 42 w linku pokazuje jak to jest możliwe). Przy oględzinach płyty widać w niektórych polach lutowniczych duże zmiany koloru z jako tako srebrnego na ciemnoszary &#8211; może to ślady przejścia z [<img class="wp-image-15082 alignleft" src="http://techfreak.pl/wp-content/uploads/2018/08/symbol_011.jpg" alt="" width="259" height="194" />][16]jednego rodzaju metalu na inny. W urządzeniu jest kilka elementów przypominających BGA (w tym główny scalak) zamontow[<img class="alignright wp-image-15083" src="http://techfreak.pl/wp-content/uploads/2018/08/symbol_012.jpg" alt="" width="242" height="181" />][17]any w technologii flip chip ( układanie na sobie stosu z kilku elementów elektronicznych zadziwiające jest to że nawet w polskiej wersji wiki nie mamy opisanej [tej metody][18] w RPi2 mamy taki montaż jak ktoś chce się przyjrzeć  i ma ten SBC) i wlcsp ( niemal goły krzem bez obudowy zamocowany na kilku kulkach lutowia ) dla zainteresowanych tematem opisany [w tym linku][19]. Usterka może mieć swoją przyczynę właśnie z kulkami pod układami &#8211; mechaniczne oderwanie lub powstanie przewodzących mostków w wyniki elektromigracji. I na koniec ciekawostka &#8211; układ który prawdopodobnie kontroluje wskaźniki laserowe i diody oświetlające to stara dobra Atmega168 !

 [1]: http://techfreak.pl/wp-content/uploads/2018/08/techfreak-symbol-1.jpg
 [2]: https://en.wikipedia.org/wiki/Flexible_electronics
 [3]: https://i.pinimg.com/originals/f2/5c/17/f25c173a3d1ea1fc3fac0e2e315dd552.jpg
 [4]: //techfreak.pl/wp-content/uploads/2018/08/Symbol_003aa_1.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2018/08/Symbol_003a.jpg
 [6]: https://en.wikipedia.org/wiki/Electroless_nickel_immersion_gold
 [7]: https://en.wikipedia.org/wiki/Organic_solderability_preservative
 [8]: https://en.wikipedia.org/wiki/Reflow_soldering
 [9]: https://en.wikipedia.org/wiki/Wave_soldering
 [10]: https://pl.wikipedia.org/wiki/Monta%C5%BC_powierzchniowy
 [11]: https://pl.wikipedia.org/wiki/Monta%C5%BC_przewlekany
 [12]: http://techfreak.pl/wp-content/uploads/2018/08/Symbol_013.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2018/08/Symbol_002a.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2018/08/symbol_010.jpg
 [15]: https://nepp.nasa.gov/whisker/reference/tech_papers/2011-kostic-pb-free.pdf
 [16]: http://techfreak.pl/wp-content/uploads/2018/08/symbol_011.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2018/08/symbol_012.jpg
 [18]: https://en.wikipedia.org/wiki/Flip_chip
 [19]: https://www.nxp.com/docs/en/application-note/AN3846.pdf