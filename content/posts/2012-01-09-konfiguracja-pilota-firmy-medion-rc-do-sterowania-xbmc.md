---
title: Konfiguracja pilota firmy MEDION RC do sterowania XBMC.
author: Przemek
type: post
date: 2012-01-09T06:55:54+00:00
url: /konfiguracja-pilota-firmy-medion-rc-do-sterowania-xbmc/
bfa_virtual_template:
  - hierarchy
hits:
  - 1043
dsq_thread_id:
  - 1015888332
categories:
  - Linux
tags:
  - xbmc

---
<!--more--> Na samym początku musimy wywalić standardowy moduł który ładuje się zaraz po włożeniu odbiornika RC do USB.

<pre class="lang:default decode:true">rmmod ati_remote</pre>

Następnie trzeba dodać go do blacklisty żeby się już więcej nie ładował.

<pre>echo "blacklist ati_remote" &gt;&gt; /etc/modprobe.d/blacklist.conf</pre>

Tworzymy plik lircd.conf.atiusb i wklejamy do niego poniższą zawartość. W tym pliku są mapowanie klawisze i zawartość można jak najbardziej zmieniać. (Ta zawartośc po części pochodzi z orginalnego Pliku ale zmodyfikowałem ja żeby współpracowała z plikiem Lircmap.xml ale to zaraz). Plik wrzycamy do np: **/home/user/**

<pre>#
# this config file was automatically generated
# using lirc-0.7.0(any) on Tue Mar 29 17:33:06 2005
#
# contributed by Raphaël Doursenaud (rdoursenaud@free.fr)
#
# brand: Sapphire (ATI)
# model no. of remote control: 5000023600
# devices being controlled by this remote: xmms, tvtime
#

begin remote

name SAPPHIRE_ATIUSB_5000023600
bits 40
eps 30
aeps 100

one 0 0
zero 0 0
gap 227990
toggle_bit 0
begin codes
1 0x00000014E20D0000
2 0x00000014E30E0000
3 0x00000014E40F0000
4 0x00000014E5100000
5 0x00000014E6110000
6 0x00000014E7120000
7 0x00000014E8130000
8 0x00000014E9140000
9 0x00000014EA150000
Mute 0x00000014D5000000
b 0x00000014D6010000
Power 0x00000014D7020000
tv 0x00000014D8030000
dvd 0x00000014D9040000
web 0x00000014DA050000
media_library 0x00000014DB060000
drag 0x00000014DC070000
0 0x00000014EC170000
Menu 0x00000014EE190000
Title 0x00000014F01B0000
Mute 0x00000014DF0A0000
tv_on_demand 0x00000014F11C0000
Back 0x00000014F5200000
e 0x00000014F6210000
f 0x00000014F8230000
OK 0x00000014F31E0000
Left 0x00000014F21D0000
Right 0x00000014F41F0000
Up 0x00000014EF1A0000
Down 0x00000014F7220000
Rewind 0x00000014F9240000
Play 0x00000014FA250000
Forward 0x00000014FB260000
Record 0x00000014FC270000
Stop 0x00000014FD280000
Pause 0x00000014FE290000
mouse_button_left 0x000000144D780000
mouse_button_right 0x00000014517C0000
Vol-Down 0x00000014DE090000
Vol-Up 0x00000014DD080000
chan-down 0x00000014E10C0000
chan-up 0x00000014E00B0000
mouse-up 0x0000001447720000
mouse-down 0x0000001448730000
mouse-left 0x0000001445700000
mouse-right 0x0000001446710000
mouse-left_up 0x0000001449740000
mouse-left_down 0x000000144C770000
mouse-right_up 0x000000144A750000
mouse-right_down 0x000000144B760000
Info 0x00000014EB160000
Display 0x00000014ED180000
end codes

end remote</pre>

Teraz przechodzę do konfiguracji samego LIRC-a w pliku /etc/lirc/hardware.conf Trzeba skonfigurować trzy opcje:

<pre>REMOTE_MODULES="lirc_atiusb"
REMOTE_DEVICE="/dev/lirc0"
REMOTE_LIRCD_CONF="/home/user/lircd.conf.atiusb" # lokalizacja powyższego pliku</pre>

Restart LIRC-a i możemy przez wydanie komendy irw i przyciskanie klawiszy zobaczyć czy jest jakaś akcja. Na tym etapie mamy skonfigurowanego LIRC-a. Fajnie ale w XBMC do klawisza trzeba przypisać akcje. Robimy to w pliku Lircmap.xml. Ważne są Case Sensivity. Plik poniżej

<pre><!-- This file contains the mapping of LIRC keys to XBMC keys used in Keymap.xml -->


<!-- -->


<!-- How to add remotes -->


<!-- <remote device="name_Lirc_calls_the_remote"> -->


<!-- -->


<!-- For the commands the layout following layout is used -->


<!-- <XBMC_COMMAND>LircButtonName</XBMC_COMMAND> -->


<!-- -->


<!-- For a list of XBMC_COMMAND's check out the <remote> sections of keymap.xml -->PlayPauseStopForwardRewindLeftRightUpDown

<select>OK</select>ChanUpChanDownBack</pre>

<menu>
  Menu
</menu>

<pre>Info
Skip
Replay
Display
Home
Record
Vol-Up
Vol-Down
Mute
Power
Videos
Music
Pictures
TV
One
Two
Three
Four
Five
Six
Seven
Eight
Nine
Zero
Star
Hash
Clear
Enter
Red
Green
Yellow
Blue
Teletext</pre>