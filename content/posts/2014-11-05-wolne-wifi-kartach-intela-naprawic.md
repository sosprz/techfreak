---
title: Wolne WiFi na kartach intela – jak naprawić?
author: Przemek
type: post
date: 2014-11-05T15:30:59+00:00
url: /wolne-wifi-kartach-intela-naprawic/
featured_image: /wp-content/uploads/2014/11/slow_wifi_intel_wolne_wifi_N_180Mbps-624x313.jpg
hits:
  - 469
dsq_thread_id:
  - 3185777260
categories:
  - Linux
tags:
  - ubuntu
  - wifi

---
Na swoim laptopie używam Xubuntu i w zasadzie jestem zadowolony z systemu, no może poza paroma bugami które były uciążliwe od wersji 14.04. Jakiś czas temu testowałem <a href="http://techfreak.pl/gigsowe-wifi-czy-to-juz-test-routera-tew-812dru-i-karty-usb-tew-805ub/" target="_blank">WiFi w standardzie ac</a> gdzie potrzebowałem maksymalnych przepustowości karty. Teraz jestem przed kolejnym testem standardu AC i łącząc aktualny system Xubuntu 14.10 i  prędkość WiFi zostałem niemile zaskoczony. Prędkość mojej karty to 25Mbps a w standardzie N 2&#215;2 powinno być to ok 150Mbps. Poniżej pokażę jak to szybko naprawić.

<!--more-->

### Wolne WiFi na intelu

Posiadam kartę Intel Corporation Centrino Advanced-N 6205 \[Taylor Peak\] (rev 34) która działa w standardzie N 2&#215;2 czyli dwa strumienie przestrzenne (spatial streams) 150Mbps na 2,4Ghz lub 5Ghz. Czyli razem 300Mbps a że Wifi działa w half duplex to realny transfer to ok. 150Mbps. Ja po uruchomieniu iperf uzyskiwałem tylko 25Mbps.

<a href="http://techfreak.pl/wolne-wifi-kartach-intela-naprawic/slow_wifi_intel_wolne_wifi/" rel="attachment wp-att-8017"><img class="aligncenter size-full wp-image-8017" src="http://techfreak.pl/wp-content/uploads/2014/11/slow_wifi_intel_wolne_wifi.jpg" alt="slow_wifi_intel_wolne_wifi" width="616" height="180" /></a>

Chociaż link zestawił mi się na 300Mbps:

<pre>root@dell:~# iwconfig 
wlan0 IEEE 802.11abgn ESSID:"ap" 
Mode:Managed Frequency:5.18 GHz Access Point: C0:4A:00:11:11:11 
Bit Rate:300 Mb/s Tx-Power=15 dBm 
Retry short limit:7 RTS thr:off Fragment thr:off
Encryption key:off
Power Management:on
Link Quality=70/70 Signal level=-36 dBm 
Rx invalid nwid:0 Rx invalid crypt:0 Rx invalid frag:0
Tx excessive retries:0 Invalid misc:73 Missed beacon:0
</pre>

### WiFi N

Bardzo mi się ten fakt nie spodobał i zacząłem przeszukiwać internety. Początkowo znalazłem tylko informacje żeby wyłączyć w niektórych kartach standard N, że to pomoże. No niestety nie pomagało. W końcu natrafiłem na <a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1319630" target="_blank">informacje</a> że w którymś momencie developerzy wyłączyli <a href="https://www.kernel.org/doc/htmldocs/80211/aggregation.html" target="_blank">TX AMPDU</a> i w kartach intela przestała działać eN&#8217;ka.  Na szczęście jednym wpisem można przywrócić tą funkcjonalność.

### Back to N

W pliku /etc/modprobe.d/iwlwifi.conf trzeba dopisać options iwlwifi 11n_disable=8

<pre>root@dell:~# cat /etc/modprobe.d/iwlwifi.conf 
options iwlwifi 11n_disable=8
root@dell:~#</pre>

Moduł iwlwifi ma więcej opcji które można sprawdzić:

<pre>modinfo iwlwifi</pre>

Po restarcie znowu uruchomiłem iperf który pokazał mi że teraz transfery są na dobrym poziomie czyli 179Mbps.

<a href="http://techfreak.pl/wolne-wifi-kartach-intela-naprawic/slow_wifi_intel_wolne_wifi_n/" rel="attachment wp-att-8020"><img class="aligncenter size-full wp-image-8020" src="http://techfreak.pl/wp-content/uploads/2014/11/slow_wifi_intel_wolne_wifi_N.jpg" alt="slow_wifi_intel_wolne_wifi_N" width="547" height="275" /></a>

### Exit

Generalnie szkoda że ta funkcjonalność została wyłączona bez wiedzy użytkownika, wiele osób może nawet nie wiedzieć że teraz pracuje na niższych prędkościach. Co pewnie powoduje narzekanie albo szukanie nowego sprzętu ;)