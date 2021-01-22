---
title: Jak zrobić bootowalny pendrive z instalacją windowsa na ubuntu?
author: Przemek
type: post
date: 2017-08-23T11:45:16+00:00
url: /zrobic-bootowalny-pendrive-instalacja-windowsa-ubuntu/
featured_image: /wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive1_1.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6088984291
categories:
  - Linux
tags:
  - boot iso
  - grub
  - Linux
  - live usb
  - ubuntu

---
Jak zainstalować windows&#8217;a na komputerze bez stacji cdrom? Jak stworzyć bootowalny pendrive z instalacją systemu Windows 7 lub Windows 10?

<!--more-->

Czasami nawet linuksiarz musi zainstalować babci czy innej sąsiadce system operacyjny. Płyt CD i DVD już dawno na oczy nie widziałem leżą pewnie gdzieś obok dyskietek. A napędy cdrom służą tylko do robienia [mini laserów][1]. Poniżej pokażę jak zrobić bootowalny pendrive z systemami z rodziny windows.

Sprawa jest całkiem prosta bo trzeba posiadać ISO systemu np. Windows 7 lub Windows 10 i zainstalować paczkę Winiso (inna nazwo Woeusb) która za pomocą dwóch kliknięć zamieni twój pendrive w nosnik instalacyjny systemu Windows!

### Instalacja

<pre>sudo add-apt-repository ppa:nilarimogard/webupd8 
sudo apt-get update 
sudo apt-get install winusb</pre>

&nbsp;

[<img class="aligncenter size-full wp-image-13094" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive3_1.jpg" alt="" width="1000" height="568" />][2]

### Uruchomienie

Aby stworzyć ten upragniony pendrive z Win7 wybierz ISO i docelowe urządzenie.

[<img class="aligncenter wp-image-13091 size-large" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive0_1-878x1024.jpg" alt="" width="800" height="933" />][3]

Program można odpalić z linii komend:

[<img class="aligncenter size-full wp-image-13095" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive4_1.jpg" alt="" width="1000" height="200" />][4]

Po instalacji na dysku docelowym pojawi się podobna do tego poniżej struktura katalogów

[<img class="aligncenter size-full wp-image-13093" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive2_1.jpg" alt="" width="1000" height="226" />][5]

### Odpalenie

Poniżej screen po uruchomieniu komputera w trybie wyboru urządzenia i wybraniu USB.

[<img class="aligncenter size-full wp-image-13092" src="//techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive1_1.jpg" alt="" width="1000" height="500" />][6]

&nbsp;

Proste prawda?

 [1]: //techfreak.pl/mini-laser-grawerowania-test/
 [2]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive3_1.jpg
 [3]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive0_1.jpg
 [4]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive4_1.jpg
 [5]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive2_1.jpg
 [6]: //techfreak.pl/wp-content/uploads/2017/08/techfreak-winusb-woeusb-windows-instalation-pendrive1_1.jpg