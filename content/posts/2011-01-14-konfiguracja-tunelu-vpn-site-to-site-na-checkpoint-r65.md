---
title: Konfiguracja tunelu VPN site to site na Checkpoint R65
author: Przemek
type: post
date: 2011-01-14T09:44:27+00:00
url: /konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/
featured_image: /wp-content/uploads/2011/01/Checkpoint_.jpg
bfa_virtual_template:
  - hierarchy
hits:
  - 237
dsq_thread_id:
  - 1024857657
colormag_page_layout:
  - default_layout
categories:
  - Network
tags:
  - checkpoint
  - racoon
  - vpn

---
Przykład konfiguracji tunelu VPN site to site na platformie Check Point R65

<!--more-->

1. Tworzymy nową sieć o adresacji 192.168.1.0/24

&nbsp;

<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_1/" rel="attachment wp-att-1791"><img class="aligncenter size-full wp-image-1791" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_1.jpg" alt="cpngxr65s2s_1" width="217" height="228" /></a>  
<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_2/" rel="attachment wp-att-1790"><img class="aligncenter size-full wp-image-1790" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_2.jpg" alt="cpngxr65s2s_2" width="411" height="362" /></a>

&nbsp;

2. Tworzymy grupę do której wrzucamy obiekt sieci  
<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_3/" rel="attachment wp-att-1789"><img class="aligncenter size-full wp-image-1789" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_3.jpg" alt="cpngxr65s2s_3" width="451" height="264" /></a>

<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_4/" rel="attachment wp-att-1788"><img class="aligncenter size-full wp-image-1788" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_4.jpg" alt="cpngxr65s2s_4" width="405" height="362" /></a>

&nbsp;

3. Tworzymy nowy obiekt bramy zdalnej

<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_5/" rel="attachment wp-att-1787"><img class="aligncenter size-full wp-image-1787" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_5.jpg" alt="cpngxr65s2s_5" width="260" height="212" /></a>

&nbsp;

<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_6/" rel="attachment wp-att-1786"><img class="aligncenter size-full wp-image-1786" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_6.jpg" alt="cpngxr65s2s_6" width="336" height="362" /></a><a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_7/" rel="attachment wp-att-1785"><img class="aligncenter size-full wp-image-1785" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_7.jpg" alt="cpngxr65s2s_7" width="336" height="362" /></a><a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_7/" rel="attachment wp-att-1785"><img class="aligncenter size-full wp-image-1785" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_7.jpg" alt="cpngxr65s2s_7" width="336" height="362" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_8/" rel="attachment wp-att-1784"><img class="aligncenter size-full wp-image-1784" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_8.jpg" alt="cpngxr65s2s_8" width="337" height="362" /></a>

&nbsp;

&nbsp;

4. Tworzymy główną grupę VPN łączącą obie strony

&nbsp;

<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_9/" rel="attachment wp-att-1783"><img class="aligncenter size-full wp-image-1783" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_9.jpg" alt="cpngxr65s2s_9" width="386" height="160" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_10/" rel="attachment wp-att-1782"><img class="aligncenter size-full wp-image-1782" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_10.jpg" alt="cpngxr65s2s_10" width="377" height="362" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_11/" rel="attachment wp-att-1781"><img class="aligncenter size-full wp-image-1781" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_11.jpg" alt="cpngxr65s2s_11" width="377" height="362" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_12/" rel="attachment wp-att-1780"><img class="aligncenter size-full wp-image-1780" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_12.jpg" alt="cpngxr65s2s_12" width="377" height="362" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_13/" rel="attachment wp-att-1779"><img class="aligncenter size-full wp-image-1779" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_13.jpg" alt="cpngxr65s2s_13" width="378" height="362" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_14/" rel="attachment wp-att-1778"><img class="aligncenter size-full wp-image-1778" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_14.jpg" alt="cpngxr65s2s_14" width="379" height="362" /></a> <a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_15/" rel="attachment wp-att-1777"><img class="aligncenter size-full wp-image-1777" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_15.jpg" alt="cpngxr65s2s_15" width="378" height="362" /></a>

&nbsp;

&nbsp;

6. Reguły dostępowe

&nbsp;

<a href="http://techfreak.pl/konfiguracja-tunelu-vpn-site-to-site-na-checkpoint-r65/cpngxr65s2s_16/" rel="attachment wp-att-1776"><img class="aligncenter size-full wp-image-1776" src="http://techfreak.pl/wp-content/uploads/2013/01/cpngxr65s2s_16.jpg" alt="cpngxr65s2s_16" width="642" height="56" /></a>

&nbsp;

7. Trzeba pamiętać o odpowiednim routingu z sieci lokalnej do bramy Check Point&#8217;a

&nbsp;

&nbsp;