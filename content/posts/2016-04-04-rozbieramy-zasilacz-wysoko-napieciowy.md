---
title: 'Rozbieramy!  Zasilacz wysoko-napięciowy.'
author: Pawel R.
type: post
date: 2016-04-04T05:23:05+00:00
url: /rozbieramy-zasilacz-wysoko-napieciowy/
featured_image: /wp-content/uploads/2016/03/DSCF2090.jpg
dsq_thread_id:
  - 4718101700
categories:
  - Elektronika
tags:
  - zasilacz

---
Witam. Dzisiaj chciałbym przedstawić wnętrze urządzenia laboratoryjnego z którym na co dzień nie można się spotkać a jako że miałem okazje… postanowiłem zajrzeć do środka i zobaczyć szczegóły konstrukcyjne bo wiadomo – wszystko co ma naklejkę **grożącą śmiercią** i ostrzegającą o **nie przekraczaniu 5KV** jest ciekawe.

<!--more-->

Tak więc – przedmiotem ciekawości jest tester/ zasilacz **GW INSTEK  GPT 815**  to nie najnowsze urządzenie nadal często jest użytkowane jako tester dla urządzeń elektronicznych  na liniach produkcyjnych i jako test w laboratorium.<figure id="attachment_11489" aria-describedby="caption-attachment-11489" style="width: 426px" class="wp-caption alignleft">

<img class=" wp-image-11489" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2106.jpg" alt="Panel frontowy urządzenia" width="426" height="239" /> <figcaption id="caption-attachment-11489" class="wp-caption-text">Panel frontowy urządzenia</figcaption></figure> 

Podstawowa specyfikacja:

<table>
  <tr>
    <td width="196">
      Napięcie wyjściowe DC
    </td>
    
    <td width="104">
      0,2 – 5kV
    </td>
  </tr>
  
  <tr>
    <td width="196">
      Regulacja
    </td>
    
    <td width="104">
      20%
    </td>
  </tr>
  
  <tr>
    <td width="196">
      Dokładność dla woltomierza
    </td>
    
    <td width="104">
      +/-3 %
    </td>
  </tr>
  
  <tr>
    <td width="196">
      Prąd testu
    </td>
    
    <td width="104">
      0,3 – 10mA
    </td>
  </tr>
  
  <tr>
    <td width="196">
      Dokładność amperomierza
    </td>
    
    <td width="104">
      +/-5%
    </td>
  </tr>
  
  <tr>
    <td width="196">
      Waga
    </td>
    
    <td width="104">
       20kG
    </td>
  </tr>
  
  <tr>
    <td width="196">
      Moc
    </td>
    
    <td width="104">
      500 VA
    </td>
  </tr>
</table>

Duża waga jak widać z pierwszego zdjęcia wnętrza bierze się z aż trzech transformatorów znajdujących się w środku. Jeden zasila płytkę pomiarową i jest małej mocy ( górny prawy róg).<figure id="attachment_11476" aria-describedby="caption-attachment-11476" style="width: 327px" class="wp-caption alignleft">

[<img class=" wp-image-11476" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2090.jpg" alt="Środek urządzenia." width="327" height="233" />][1]<figcaption id="caption-attachment-11476" class="wp-caption-text">Środek urządzenia.</figcaption></figure> 

Kolejny to autotransformator  &#8211; jest widoczny w środku po lewej stronie który to zasila uzwojenie pierwotne trzeciego transformatora wysoko napięciowego . Autotransformator ma zakres regulacji od 0 do 230V a to napięcie jest podawane na transformator wysokonapięciowy o napięciu w uzwojeniu wtórnym 5000V &#8211; trafo jest całkowicie zabezpieczone zalewą.<figure id="attachment_11478" aria-describedby="caption-attachment-11478" style="width: 350px" class="wp-caption alignright">

<img class=" wp-image-11478" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2092.jpg" alt="Transformator HV" width="350" height="197" /> <figcaption id="caption-attachment-11478" class="wp-caption-text">Transformator HV</figcaption></figure> 

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Z racji iż urządzenie posiada opcję testu prądem AC/DC kolejnym dobrze widocznym blokiem w tej konstrukcji jest prostownik jedno połówkowy wraz z bankiem kondensatorów.<figure id="attachment_11479" aria-describedby="caption-attachment-11479" style="width: 298px" class="wp-caption alignleft">

[<img class=" wp-image-11479" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2093.jpg" alt="DC/AC moduł" width="298" height="183" />][2]<figcaption id="caption-attachment-11479" class="wp-caption-text">DC/AC moduł</figcaption></figure> 

Zmiana pomiędzy DC a AC odbywa dzięki dwóm przekaźnikom wysokonapięciowym  (szare elementy na zdjęciu). Napięcie z tego modułu trafia bezpośrednio na wyjście do elektrod.  Interesujące dla mnie jest to że PCB tego modułu została zaprojektowana z dużą dbałością  &#8211; widać przefrezowania pomiędzy elementami. Prostownik jedno połówkowy oparty na dwóch diodach i też są one w dodatkowym zabezpieczeniu ( osłonka z tworzywa). Pomiar prądu i napięcia jest zrobiony bezpośrednio za pomocą dzielnika rezystancyjnego.<figure id="attachment_11482" aria-describedby="caption-attachment-11482" style="width: 286px" class="wp-caption alignright">

[<img class=" wp-image-11482" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2097.jpg" alt="Dolne piętro modułu" width="286" height="161" />][3]<figcaption id="caption-attachment-11482" class="wp-caption-text">Dolne piętro modułu</figcaption></figure> 

Zdjęcie pokazuje dolną część modułu prostownika – kondensatory na napięcie 7kV. Taki bank mimo małej pojemności przy wysokim napięci jest w stanie zgromadzić dużą ilość energii.

&nbsp;

&nbsp;<figure id="attachment_11484" aria-describedby="caption-attachment-11484" style="width: 223px" class="wp-caption alignleft">

[<img class=" wp-image-11484" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2101.jpg" alt="Start i Reset tył panelu" width="223" height="125" />][4]<figcaption id="caption-attachment-11484" class="wp-caption-text">Start i Reset tył panelu</figcaption></figure> 

Kolejnym interesującym detalem są włączniki start i reset  &#8211; ich snap był bardzo nietypowy jak na przedni klawisz znajdujący się na froncie dowolnego urządzenia elektrycznego.. po zajrzeniu do środka okazało się że te dwa włączniki oparte są na mikroprzełącznikach.

&nbsp;

&nbsp;<figure id="attachment_11483" aria-describedby="caption-attachment-11483" style="width: 194px" class="wp-caption alignleft">

[<img class=" wp-image-11483" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2100.jpg" alt="Tył wyświetlacza" width="194" height="109" />][5]<figcaption id="caption-attachment-11483" class="wp-caption-text">Tył wyświetlacza</figcaption></figure> <figure id="attachment_11486" aria-describedby="caption-attachment-11486" style="width: 192px" class="wp-caption alignleft">[<img class=" wp-image-11486" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2103.jpg" alt="PCB pomiarowa" width="192" height="108" />][6]<figcaption id="caption-attachment-11486" class="wp-caption-text">PCB pomiarowa</figcaption></figure> <figure id="attachment_11480" aria-describedby="caption-attachment-11480" style="width: 187px" class="wp-caption alignleft">[<img class=" wp-image-11480" src="http://techfreak.pl/wp-content/uploads/2016/03/DSCF2095.jpg" alt="SSR dla trafa" width="187" height="105" />][7]<figcaption id="caption-attachment-11480" class="wp-caption-text">SSR dla trafa</figcaption></figure> 

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Mam nadzieje że urządzenie było na tyle ciekawe aby je tutaj zaprezentować. Pod względem technicznym składa się z prostych elementów &#8211; jako całość jest poważnym narzędziem laboratoryjnym.

 [1]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2090.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2093.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2097.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2101.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2100.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2103.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2016/03/DSCF2095.jpg