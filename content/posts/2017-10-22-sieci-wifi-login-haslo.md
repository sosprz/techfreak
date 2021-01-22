---
title: Sieci WiFi na login i hasło
author: Przemek
type: post
date: 2017-10-22T19:33:44+00:00
url: /sieci-wifi-login-haslo/
featured_image: /wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-8.jpg
colormag_page_layout:
  - default_layout
dsq_thread_id:
  - 6233658853
categories:
  - Bez kategorii
  - Network
tags:
  - debian
  - Linux
  - radius
  - tplink

---
Jak zrobić dostęp do sieci WiFi na podstawie loginu i hasła? To całkiem proste gdy możemy w domu postawić serwer RADIUS. Serwer Radius to obecnie najpopularniejszy protokół uwierzytelniania i autoryzowania użytkowników sieci LAN i WiFi. Teraz gdy w domu masz możliwość uruchomienia Radius&#8217;a na routerze, raspberry pi lub serwerze plików NAS np. Synology, to ten sposób jest w zasięgu reki. Oczywiście poniższy przykład to zajawka i każdy musi zastanowić się czy lepiej dołączyć mamę do WiFi przez WPA2-Enterprise czy samo hasło WPA2-PSK. Czy może jeszcze dodatkowo token fizyczny.

Poniższy sposób przedstawia skonfigurowanie routera tplink z obsługą 802.1x, serwera RADIUS na debianie i klientów, którzy wybierają logowanie za pomocą EAP PEAP MS-CHAPv2 podając tylko login i hasło. EAP PEAP jest jedyną metodą gdzie można użyć samego loginu i hasła. Cała komunikacja jest zabezpieczona w tunelu TLS, który jest równolegle zestawiamy przy prośbie o dołączenie do sieci. Dodatkowym atutem jest to, że sposób jest dostępny na wielu systemach i urządzeniach.

  * [EAP][1] &#8211; Extensible Authentication Protocol
  * PEAP &#8211; Protected EAP
  * [RADIUS][2] &#8211; Remote Authentication Dial In User Service
  * [MS-CHAPv2][3] &#8211; Microsoft Challenge Handshake Authentication Protocol version 2
  * [802.1X][4] &#8211;  Standard IEEE kontroli dostępu do sieci przewodowych i bezprzewodowych

<!--more-->

### Konfiguracja routera tplink

Na routerze wystarczy wybrać sposób WPA2 Enterprise zamiast WPA2- PSK, wskazać adres IP serwera RADIUS oraz podać hasło dostępowe.

[<img class="aligncenter size-full wp-image-14220" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-4.jpg" alt="" width="1000" height="794" />][5]

### Instalacja RADIUS na debian 9.2 stretch

W moim labie system postawiłem na Virtualbox z dostępem do sieci lokalnej. Czyli adres IP został przydzielony z puli domowej. (Brak NAT w virtualbox). Poniżej instalacja pakietu freeradius.

<pre>aptitude install freeradius</pre>

Moja aktualna wersja:

<pre>root@radius:~# freeradius -v
 radiusd: FreeRADIUS Version 3.0.12, for host x86_64-pc-linux-gnu, built on Aug 10 2017 at 07:05:06</pre>

Przechodzę do katalogu konfiguracyjnego

<pre>cd /etc/freeradius/3.0</pre>

Na samym dole pliku clients.conf dodaje sekcje o nazwie home w której definiuje klientów radiusa. Mogę podać tu całe sieci lub pojedyncze adresy IP. Klientem radiusa nie są użytkownicy końcowi a pośrednicy czyli w naszym przypadku domowy router tp-link.

<pre>nano /etc/freeradius/3.0/clients.conf</pre>

<pre>client home {
 ipaddr = 172.18.10.254
 secret = tajnehaslo
 }</pre>

Na samym dole pliku/etc/freeradius/3.0/users definiuje użytkownika tf z hasłem techfreak.

<pre>tf Cleartext-Password := "techfreak" 
</pre>

Po wprowadzeniu zmian trzeba przeładować serwer:

<pre>systemctl restart freeradius.service</pre>

Sprawdzam aktualny status serwera

<pre>systemctl status freeradius.service</pre>

<pre>● freeradius.service - FreeRADIUS multi-protocol policy server
 Loaded: loaded (/lib/systemd/system/freeradius.service; disabled; vendor preset: enabled)
 Active: active (running) since Sun 2017-10-22 07:52:08 CDT; 13min ago
 Docs: man:radiusd(8)
 man:radiusd.conf(5)
 http://wiki.freeradius.org/
 http://networkradius.com/doc/
 Main PID: 3700 (freeradius)
 Tasks: 6 (limit: 4915)
 CGroup: /system.slice/freeradius.service
 └─3700 /usr/sbin/freeradius

Oct 22 07:52:08 radius freeradius[3694]: [/etc/freeradius/3.0/mods-config/attr_filter/access_reject]:11 Check item "FreeRADIUS-Response-Delay" found in filter list for realm "DEFAULT".
Oct 22 07:52:08 radius freeradius[3694]: [/etc/freeradius/3.0/mods-config/attr_filter/access_reject]:11 Check item "FreeRADIUS-Response-Delay-USec" found in filter list for realm "DEFAULT".
Oct 22 07:52:08 radius freeradius[3694]: rlm_cache (cache_eap): Driver rlm_cache_rbtree (module rlm_cache_rbtree) loaded and linked
Oct 22 07:52:08 radius freeradius[3694]: tls: Using cached TLS configuration from previous invocation
Oct 22 07:52:08 radius freeradius[3694]: tls: Using cached TLS configuration from previous invocation
Oct 22 07:52:08 radius freeradius[3694]: Ignoring "sql" (see raddb/mods-available/README.rst)
Oct 22 07:52:08 radius freeradius[3694]: Ignoring "ldap" (see raddb/mods-available/README.rst)
Oct 22 07:52:08 radius freeradius[3694]: radiusd: #### Skipping IP addresses and Ports ####
Oct 22 07:52:08 radius freeradius[3694]: Configuration appears to be OK
Oct 22 07:52:08 radius systemd[1]: Started FreeRADIUS multi-protocol policy server.</pre>

Jak widać serwer działa. Teraz najlepiej zastopować go i uruchomić w trybie debugowania aby zobaczyć czy klienci będą się łączyć lub czy przychodzą jakieś zapytania do radiusa.

Stopuje serwer radiusa

<pre>systemctl stop freeradius.service</pre>

Uruchamiam w trybie logowania wszystkich zdażeń

<pre>freeradius -X</pre>

Przykładowy wycinek z loga

<pre>(15) Found Auth-Type = eap
(15) # Executing group from file /etc/freeradius/3.0/sites-enabled/default
(15) authenticate {
(15) eap: Expiring EAP session with state 0xcfa5003ccaa3197b
(15) eap: Finished EAP session with state 0xb3cb481dbbc251b4
(15) eap: Previous EAP request found for state 0xb3cb481dbbc251b4, released from the list
(15) eap: Peer sent packet with method EAP PEAP (25)
(15) eap: Calling submodule eap_peap to process data
(15) eap_peap: Continuing EAP-TLS
(15) eap_peap: [eaptls verify] = ok
(15) eap_peap: Done initial handshake
(15) eap_peap: [eaptls process] = ok
(15) eap_peap: Session established. Decoding tunneled attributes
(15) eap_peap: PEAP state send tlv success
(15) eap_peap: Received EAP-TLV response
(15) eap_peap: Success
(15) eap: Sending EAP Success (code 3) ID 9 length 4
(15) eap: Freeing handler
(15) [eap] = ok
(15) } # authenticate = ok
(15) # Executing section post-auth from file /etc/freeradius/3.0/sites-enabled/default
(15) post-auth {
(15) update {
(15) No attributes updated
(15) } # update = noop
(15) [exec] = noop
(15) policy remove_reply_message_if_eap {
(15) if (&reply:EAP-Message && &reply:Reply-Message) {
(15) if (&reply:EAP-Message && &reply:Reply-Message) -&gt; FALSE
(15) else {
(15) [noop] = noop
(15) } # else = noop
(15) } # policy remove_reply_message_if_eap = noop
(15) } # post-auth = noop
(15) Sent Access-Accept Id 0 from 172.18.10.109:1812 to 172.18.10.254:45264 length 0
(15) MS-MPPE-Recv-Key = 0xbdfd77f02e761f17f3ec705a824b38628c37672bfcd788d43f2cec3c43e83aeb
(15) MS-MPPE-Send-Key = 0x67b088a0c899a21ca52491c6e913db783426919a5afaa4282f9ee0fb3a2fef4c
(15) EAP-Message = 0x03090004
(15) Message-Authenticator = 0x00000000000000000000000000000000
(15) User-Name = "tf"
(15) Finished request
Waking up in 4.9 seconds.
(15) Cleaning up request packet ID 0 with timestamp +5</pre>

Serwer RADIUS został skonfigurowany i klienci bez problemu łączą się do sieci WiFi poprzez WPA Enterprise EAP PEAP. Zobacz poniżej jak konfiguruje się klientów pod Androidem, Windowsem i Ubuntu. Trzeba pamiętać ze powyższy sposób może być dodatkowo zabezpieczony certyfikatem CA. Jest możliwość wymuszenia sprawdzania przez RADIUS&#8217;a czy klient go posiada  ale nie jest to wymagane od strony serwera jak i klienta. W tym przypadku nie sprawdzam i nie dostarczam certyfikatu dlatego trzeba zwrócić uwagę że wszystkie poniższe konfiguracje nie wymagają CA.

### Android

[<img class="aligncenter wp-image-14219 size-large" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-3-576x1024.jpg" alt="" width="576" height="1024" />][6] [<img class="aligncenter wp-image-14233 size-large" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-7-576x1024.jpg" alt="" width="576" height="1024" />][7]

### Windows 7

[<img class="aligncenter size-full wp-image-14218" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-2.jpg" alt="" width="1000" height="888" />][8] [<img class="aligncenter size-full wp-image-14216" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-0.jpg" alt="" width="1000" height="625" />][9] [<img class="aligncenter size-full wp-image-14217" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-1.jpg" alt="" width="1000" height="1330" />][10]

### Ubuntu

[<img class="aligncenter size-full wp-image-14221" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-5.jpg" alt="" width="1000" height="1053" />][11] [<img class="aligncenter size-full wp-image-14232" src="http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-6.jpg" alt="" width="1000" height="1246" />][12]

### Podsumowanie

Lepiej używać sprawdzania certyfikatu CA, czyli posiadać wystawiony przez siebie certyfikat ale w niektórych środowiskach nie jest pożądany dodatkowy składnik. Jak widać konfiguracja jest dosyć prosta i aby wykluczyć inne metody niż EAP można przejrzeć pliki konfiguracyjne, które znajdują się w /etc/freeradius/3.0/sites-enabled.

Warto zobaczyć moje poprzednie wpisy w powyższym temacie [Instalacja freeradius i gui daloradius na RedHat 6][13]  i [Test routera tp-link Archer C3200][14]

 [1]: https://pl.wikipedia.org/wiki/Extensible_Authentication_Protocol
 [2]: https://pl.wikipedia.org/wiki/RADIUS
 [3]: https://technet.microsoft.com/en-us/library/cc731462(v=ws.10).aspx
 [4]: https://pl.wikipedia.org/wiki/IEEE_802.1X
 [5]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-4.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-3.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-7.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-2.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-0.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-1.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-5.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2017/10/techfreak-radius-peap-debian-android-windows-ubuntu-6.jpg
 [13]: http://techfreak.pl/instalacja-freeradius-i-gui-daloradius-na-redhat-6/
 [14]: http://techfreak.pl/test-routera-tp-link-archer-c3200/