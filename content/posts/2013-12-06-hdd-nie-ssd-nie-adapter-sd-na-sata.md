---
title: To HDD?! nie! SSD?! nie! to adapter SD na SATA!
author: Przemek
type: post
date: 2013-12-06T21:21:45+00:00
url: /hdd-nie-ssd-nie-adapter-sd-na-sata/
featured_image: /wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13074.jpg
hits:
  - 1906
dsq_thread_id:
  - 2031047343
categories:
  - Elektronika

---
Jakiś czas temu przy zakupach na banggood trafiłem na reklamę przejściówki <a href="http://www.banggood.com/Wholesale-SD-SDHC-Secure-Digital-MMC-To-SATA-Adapter-Support-Windows-Mac-Linux-p-48064.html?p=9H0114137951201303E0&#038;utm_campaign=techfreak&#038;utm_content=chendongling" target="_blank">SD na SATA za 10$</a>. Pomyślałem że przetestuję to bo mam starego lapka Lenovo X61 w którym przydał by mi się dysk flashowy o niedużej pojemności zamiast mechanicznego.<!--more-->

#### SD SATA Adapter

Lenovo X61 nie ma możliwość bootowania systemu z SD ale ma z USB. Szkoda zajmować porty USB więc pomyślałem że taka tania przejściówka była by dobrym wyjściem. Karta SD jakiej użyłem to **8GB Goodram class 10**.

[<img class="aligncenter size-full wp-image-5494" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13070" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13070.jpg" width="1000" height="1333" />][1] [<img class="aligncenter size-full wp-image-5493" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13071" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13071.jpg" width="1000" height="1333" />][2] [<img class="aligncenter size-full wp-image-5492" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13072" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13072.jpg" width="1000" height="1333" />][3] [<img class="aligncenter size-full wp-image-5491" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13073" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13073.jpg" width="1000" height="1333" />][4]

Powyższa przejściówka obsługuje karty o pojemności do 32GB a transfer jaki można maksymalnie uzyskać to 22MB/s. Wsadziłem kartę SD do przejściówki i sprawdziłem jej osiągi programem **hdparm. **Wynik to **14,77MB/s**. Dla porównania zamieszczam też wynik testu dysku mechanicznego który dobił do **43.39MB/s.**

[<img class="aligncenter size-full wp-image-5489" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13075" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13075.jpg" width="1000" height="1333" />][5] [<img class="aligncenter size-full wp-image-5488" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13076" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13076.jpg" width="1000" height="500" />][6] [<img class="aligncenter size-full wp-image-5487" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13077" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13077.jpg" width="1000" height="500" />][7]

#### Cel

Moim celem jest zainstalowanie systemu xubuntu na tym dysku (SD to SATA). Sciągam xubuntu 13.10 i instaluje iso za pomocą unetbootin na osobnym pendrive z którego zbootuję lapka i uruchomię instalkę.

[<img class="aligncenter size-full wp-image-5485" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13079" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13079.jpg" width="1000" height="500" />][8] [<img class="aligncenter size-full wp-image-5484" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130710" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130710.jpg" width="1000" height="500" />][9]

#### Instalacja

Napotkałem małe problemy o których nawet bym nie pomyślał. Przejściówka wpadała w dziurę na dysk i ciężko było ją poprawnie wsadzić w slot. Wymyśliłem sposób na to aby instalacja była o wiele łatwiejsza, wykorzystałem do tego starą kartę do kina.

[<img class="aligncenter size-full wp-image-5483" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130711" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130711.jpg" width="1000" height="500" />][10] [<img class="aligncenter size-full wp-image-5482" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130712" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130712.jpg" width="1000" height="500" />][11] [<img class="aligncenter size-full wp-image-5481" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130713" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130713.jpg" width="1000" height="500" />][12] [<img class="aligncenter size-full wp-image-5480" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130714" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130714.jpg" width="1000" height="500" />][13] [<img class="aligncenter size-full wp-image-5479" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130715" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130715.jpg" width="1000" height="500" />][14]

Następnie uruchomiłem instalacje Live ubuntu 13.10 z pendrive. Jeszcze przed instalacją trzeba zainicjować tabelę partycji. Najlepiej zrobić to przy pomocy programu **gparted**. Gdy już miałem skonfigurowany dysk. Przystąpiłem do instalacji systemu. Dysk czyli nazwa przejściówki, na jaki instalowałem system to **ATA FC-1307 SD to FC**.

[<img class="aligncenter size-full wp-image-5475" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130719" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130719.jpg" width="1000" height="500" />][15] [<img class="aligncenter size-full wp-image-5474" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130720" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130720.jpg" width="1000" height="500" />][16]

Po poprawnej instalacji zrestartowałem komputer i uruchomiłem boot menu aby się upewnić że system wystartuje z nowego dysku. Po starcie systemu, sprawdziłem programem hdparm transfery dysku. Wyszło **23.61MB/s,** co jest ciut większym wynikiem niż deklaruje producent.

&nbsp;

[<img class="aligncenter size-full wp-image-5473" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130721" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130721.jpg" width="1000" height="500" />][17] [<img class="aligncenter size-full wp-image-5472" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130722" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130722.jpg" width="1000" height="500" />][18]

#### Jest ok

Wynik jest zadowalający i zgodny z tym co producent deklaruje. Byłem ciekawy czy może karta będzie zaszyfrowana i czy będzie można ją odczytać przez zwykłą przejściówkę SD-USB. I okazało się że nie jest szyfrowana i można zbootować ten sam system z SD-USB jak i SD-SATA.

[<img class="aligncenter size-full wp-image-5470" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130724" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130724.jpg" width="1000" height="500" />][19] [<img class="aligncenter size-full wp-image-5469" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130725" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130725.jpg" width="1000" height="1333" />][20] [<img class="aligncenter size-full wp-image-5471" alt="techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130723" src="http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130723.jpg" width="1000" height="500" />][21]

### Podsumowanie

Mam, kupiłem, działa. 30zł to nie dużo za taką przejściówkę. Polecam. Link do sklepu poniżej.

<a href="http://www.banggood.com/Wholesale-SD-SDHC-Secure-Digital-MMC-To-SATA-Adapter-Support-Windows-Mac-Linux-p-48064.html?p=9H0114137951201303E0&#038;utm_campaign=techfreak&#038;utm_content=chendongling" target="_blank">http://www.banggood.com/Wholesale-SD-SDHC-Secure-Digital-MMC-To-SATA-Adapter-Support-Windows-Mac-Linux-p-48064.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling</a>

 [1]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13070.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13071.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13072.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13073.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13075.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13076.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13077.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_13079.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130710.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130711.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130712.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130713.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130714.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130715.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130719.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130720.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130721.jpg
 [18]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130722.jpg
 [19]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130724.jpg
 [20]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130725.jpg
 [21]: http://techfreak.pl/wp-content/uploads/2013/12/techfreak_pl_SD_SDHC_Secure_Digital_MMC_to_SATA_FC_130723.jpg