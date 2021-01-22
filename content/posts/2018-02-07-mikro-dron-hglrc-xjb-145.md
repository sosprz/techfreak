---
title: Mikro dron HGLRC XJB-145
author: Przemek
type: post
date: 2018-02-07T19:17:10+00:00
url: /mikro-dron-hglrc-xjb-145/
featured_image: /wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-9.jpg
colormag_page_layout:
  - default_layout
categories:
  - Drony
tags:
  - betaflight
  - fpv
  - frsky
  - HGLRC
  - taranis

---
W dronowym świecie jak zawsze do przodu! Tym razem parę słów o mikro HGLRC XJB-145 czyli miniaturyzacja wyścigówek!

<!--more-->

Jedyne co jest pewnie w dronowym świecie to zmiany i miniaturyzacja. Kto śledzi nawet pobieżnie informacje jakie pojawiają się na forach, changelogach i facebookach to wie, zmiany z miesiąca na miesiąc są ogromne. Piszę tu nie tylko o zmianach sprzętowych ale też softowych. Zreszą jedne na drugie cały czas oddziałują bardzo mocno. Już starą ale bardzo fajną funkcją to Smart Audio dzięki której można ustawiać aparaturą kanały i moc na odbiorniku wideo. Kolejną jest miniaturyzacja kontrolera lotu do wymiarów 25x25mm. I cały czas rozwijające się oprogramowanie Betaflight, które zapewnia coraz szybsze wystartowanie z biurka i konfigurację. To tylko niektóre rzeczy które się dzieją w tym świecie. Jednym z ciekawszych zjawisk jest coraz większa liczba producentów produkujących między innymi drony klasy wyścigowej w formie plug and fly (PNF) lub bind and fly (BNF). Dlaczego w takiej formie a nie składać samemu? Cena jest prawie taka sama jak za części a model jest już złożony, nawet czasem skonfigurowany i przetestowany przez producenta co skraca cały czas od zakupy do wzniesienia się w powietrze. I właśnie tym razem chciałbym przedstawić złożoną wersję wyścigówki na 3&#8242; (trzy cale) [HGLRC XJB 145][1].

### XJB-145 unpack

Jednym słowem dobrze i ładnie zapakowany towar. W środku tylko jeden komplet zapasowych śmigieł, naklejki HGLRC i zapasowe śrubki.

[<img class="aligncenter size-full wp-image-14399" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-2.jpg" alt="" width="1000" height="500" />][2] [<img class="aligncenter size-full wp-image-14400" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-3.jpg" alt="" width="1000" height="500" />][3] [<img class="aligncenter size-full wp-image-14401" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-4.jpg" alt="" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-14402" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-5.jpg" alt="" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-14403" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-6.jpg" alt="" width="1000" height="500" />][6] [<img class="aligncenter size-full wp-image-14404" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-8.jpg" alt="" width="1000" height="500" />][7] [<img class="aligncenter size-full wp-image-14405" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-7.jpg" alt="" width="1000" height="500" />][8] [<img class="aligncenter size-full wp-image-14406" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-9.jpg" alt="" width="1000" height="500" />][9]

### Specyfikacja

Dokładny numer modelu to **XJB-145MM** na ramie karbonowej o grubości **3mm**. Kontroler lotu to **Micro F4.V2 Flight Control Board** z żyroskopem** MPU6000-SPI, OSD, blackbox flash 16M.** Regulatory 4 w 1 (ESC) z procesorem BB2 z firmware BlHeli 16.5 o wydajności 28A każdy.  Transmiter video to **XJB-TX20.V2** obsługujący** **smart audio i zmianę mocy** **na PIT/25mW/100mW/200mW/350mW. Posiada 48 kanałów. Kamera to **XJB-ELF CAMERA** 1/3&#8243; SONY Super HAD II CCD z soczewką 2.3. Model silników jaki zostal zainstalowany to **HF1407** o rozmiarze 1407 i 3600KV.

Dokładna specyfikacja znajduje się na stronie producenta [hglrc.com][10]

### Instalacja odbiornika FrSky R-XSR

Jedyne czego brakuje w zestawie to odbiornika RC. Ja zakupiłem odbiornik FrSky R-XSR ze względu małe wymiary oraz możliwość podłączenia pod kontroler pinu SBUS dzięki któremu działa telemetria w dwie strony. Czyli wysyłanie i odbieranie informacji przez aparaturę.

[<img class="aligncenter size-full wp-image-14408" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-10.jpg" alt="" width="1000" height="500" />][11]

Poniżej dokładnie widać jak połączyłem odbiornik R-XSR z FC. Zrobiłem to przez SPORT uninverted ponieważ port TX w FC też jest uninverted. Zielony przewód jest podłączony do FC do portu TX6.

&nbsp;

[<img class="aligncenter size-full wp-image-14409" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-11.jpg" alt="" width="1000" height="500" />][12] [<img class="aligncenter size-full wp-image-14410" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-13.jpg" alt="" width="1000" height="500" />][13] [<img class="aligncenter size-full wp-image-14411" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-12.jpg" alt="" width="1000" height="500" />][14]

### Smart Audio

Poniżej widać jak działa Smart Audio, czyli kontrola nadajnika wideo poprzez dodatkowy przewód pomiędzy kontrolerem lotu (FC) a nadajnikiem video (VTX). Pokazuje jak zmieniam kanał video poprzez aparaturę, która jest połączona bezprzewodowo z odbiornikiem RC. Podsumowując FC zbiera informacje z różnych źródeł i odpowiednio przekazuje je dalej.

<blockquote class="instagram-media" data-instgrm-captioned data-instgrm-permalink="https://www.instagram.com/p/BeK7smmA8Mx/?utm_source=ig_embed&utm_campaign=loading" data-instgrm-version="12" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:658px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);">
  <div style="padding:16px;">
    <a href="https://www.instagram.com/p/BeK7smmA8Mx/?utm_source=ig_embed&utm_campaign=loading" style=" background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;" target="_blank"> </p> 
    
    <div style=" display: flex; flex-direction: row; align-items: center;">
      <div style="background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;">
      </div>
      
      <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;">
        <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;">
        </div>
        
        <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;">
        </div>
      </div>
    </div>
    
    <div style="padding: 19% 0;">
    </div>
    
    <div style="display:block; height:50px; margin:0 auto 12px; width:50px;">
      <svg width="50px" height="50px" viewBox="0 0 60 60" version="1.1" xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-511.000000, -20.000000)" fill="#000000"><g><path d="M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631"></path></g></g></g></svg>
    </div>
    
    <div style="padding-top: 8px;">
      <div style=" color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;">
        View this post on Instagram
      </div>
    </div>
    
    <div style="padding: 12.5% 0;">
    </div>
    
    <div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;">
      <div>
        <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);">
        </div>
        
        <div style="background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;">
        </div>
        
        <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);">
        </div>
      </div>
      
      <div style="margin-left: 8px;">
        <div style=" background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;">
        </div>
        
        <div style=" width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)">
        </div>
      </div>
      
      <div style="margin-left: auto;">
        <div style=" width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);">
        </div>
        
        <div style=" background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);">
        </div>
        
        <div style=" width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);">
        </div>
      </div>
    </div>
    
    <p>
      </a>
    </p>
    
    <p style=" margin:8px 0 0 0; padding:0 4px;">
      <a href="https://www.instagram.com/p/BeK7smmA8Mx/?utm_source=ig_embed&utm_campaign=loading" style=" color:#000; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none; word-wrap:break-word;" target="_blank">Hglrc xjb 145 + r-xsr + taranis = vtx20 Control :D Heeeeaaaahhhhhhhhhhh #fpvracingdrones #fpv #fpvracer #hglrc #frskyrc #frsky #rxsr #betaflight #taranis</a>
    </p>
    
    <p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;">
      A post shared by <a href="https://www.instagram.com/techfreakpl/?utm_source=ig_embed&utm_campaign=loading" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px;" target="_blank"> przemeks</a> (@techfreakpl) on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2018-01-20T12:15:52+00:00">Jan 20, 2018 at 4:15am PST</time>
    </p></div> </blockquote> 
    
    <p>
    </p>
    
    <p>
      &nbsp;
    </p>
    
    <h3>
      Jakie LiPo?
    </h3>
    
    <p>
      Na testy zakupiłem baterie LiPo tattu o pojemności 650mAh i 850mAh 4s czyli 16.8V i 75C. Mam też mało używane nanotech 850mAh 3S 45-90C.
    </p>
    
    <p>
      <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-21.jpg"><img class="aligncenter size-full wp-image-14412" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-21.jpg" alt="" width="1000" height="500" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-20.jpg"><img class="aligncenter size-full wp-image-14413" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-20.jpg" alt="" width="1000" height="500" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-23.jpg"><img class="aligncenter size-full wp-image-14414" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-23.jpg" alt="" width="1000" height="500" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-22.jpg"><img class="aligncenter size-full wp-image-14415" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-22.jpg" alt="" width="1000" height="500" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-24.jpg"><img class="aligncenter size-full wp-image-14416" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-24.jpg" alt="" width="1000" height="500" /></a>
    </p>
    
    <h3>
      Śmigła
    </h3>
    
    <p>
      W zestawie znajdują się śmigła bardzo podobne do DYS XT30453 3x30x45 i takie zakupiłem na zapas. Dodałem też na testy śmigła Gemfan 3052. Miałem też DALPROP T3045BN ale nie pokładam dużych nadziei w nich. Podobne miał<a href="https://techfreak.pl/awesome-youbi-xv-130-kolejny-mini-quadkopter/"> Awesome Youbi VX</a>.
    </p>
    
    <p>
      <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-1.jpg"><img class="aligncenter size-full wp-image-14417" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-1.jpg" alt="" width="1000" height="1333" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-18.jpg"><img class="aligncenter size-full wp-image-14419" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-18.jpg" alt="" width="1000" height="500" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-17.jpg"><img class="aligncenter size-full wp-image-14420" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-17.jpg" alt="" width="1000" height="500" /></a> <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-19.jpg"><img class="aligncenter size-full wp-image-14421" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-19.jpg" alt="" width="1000" height="500" /></a>
    </p>
    
    <h3>
      Antena
    </h3>
    
    <p>
      W zestawie znajduje się liniowa antena która spokojnie wystarczy do latania na bramkach. Na zawodach w <a href="https://techfreak.pl/zapraszam-drone-race/">koszałkowie</a> dostałem anetne VEE od ACTUNA i mam zamiar też ją przetestować.
    </p>
    
    <p>
      <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-16.jpg"><img class="aligncenter size-full wp-image-14422" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-16.jpg" alt="" width="1000" height="500" /></a>
    </p>
    
    <h3>
      Waga
    </h3>
    
    <p>
      <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-14.jpg"><img class="aligncenter size-full wp-image-14423" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-14.jpg" alt="" width="1000" height="500" /></a>
    </p>
    
    <h3>
      Kamera
    </h3>
    
    <p>
      Jak widać gopro session może być lekko za duże ale widziałem na YT, że się da! Innym wyborem może być micro kamera HD <a href="https://www.gearbest.com/automobiles-motorcycle/pp_1057406.html?lkid=12990988">Quelima SQ12</a>.
    </p>
    
    <p>
      <a href="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-15.jpg"><img class="aligncenter size-full wp-image-14418" src="http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-15.jpg" alt="" width="1000" height="500" /></a>
    </p>
    
    <h3>
      Wideo z lotów
    </h3>
    
    <p>
      Na teraz nie ma żądnych nagrań bo pogoda nie pozwala. Jednak post zostanie uzupełniony w najbliższym czasie. Tak czy inaczej zapraszam na mój kanał <a href="https://www.youtube.com/user/techfreakpl">youtube</a>.
    </p>
    
    <p>
    </p>
    
    <p>
      &nbsp;
    </p>
    
    <h3>
      Linkownia
    </h3>
    
    <p>
      <a href="https://www.gearbest.com/brushless-fpv-racer/pp_966052.html?lkid=12990988">HGLRC XJB-145</a>
    </p>
    
    <p>
      <a href="https://www.gearbest.com/radios-receiver/pp_716680.html?lkid=12990988">Frsky R-XSR</a>
    </p>
    
    <p>
      <a href="https://www.gearbest.com/battery/pp_836036.html?lkid=12990988">Tattu 4S 850mAh</a>
    </p>
    
    <p>
      <a href="https://www.gearbest.com/battery/pp_836036.html?lkid=12990988?lkid=12990988">Tattu 4S 650mAh</a>
    </p>
    
    <p>
      <a href="https://www.gearbest.com/propeller/pp_612948.html?lkid=12990988">DYS 30453</a>
    </p>
    
    <p>
      <a href="https://www.gearbest.com/propeller/pp_707387.html?lkid=12990988">GEMFAN 3053</a>
    </p>
    
    <h3>
      Podsumowanie jeszcze przed lotami
    </h3>
    
    <p>
      XJB 145 robi pozytywne wrażenie już na początku, małe wymiary i moc silników zapewne spowodują podobne wrażenia z lotów co na pięcio-calowych śmigłach. Konfiguracja na tym poziomie to naprawdę prosta sprawa. Nic mi nie brakuje w tym modelu oprócz tego, że nie ma do niego naprawdę dobrej micro kamery fullHD.
    </p>
    
    <p>
      Wpis będzie uzupełniany!
    </p>

 [1]: https://www.gearbest.com/brushless-fpv-racer/pp_966052.html?lkid=12990988
 [2]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-2.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-3.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-4.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-5.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-6.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-8.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-7.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-9.jpg
 [10]: https://www.hglrc.com/collections/drones/products/hglrc-xjb-145mm-fpv-racing-drone-pnp-omnibus-f4-28a-2-4s-blheli_s-esc-25-100-250mw-switchable-vtx-for-rc-drone
 [11]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-10.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-11.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-13.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2018/02/techfreak-hglrc-xjb-145-frsky-xsr-tattu-lipo-12.jpg