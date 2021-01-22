---
title: Freeradius + Google Authenticator
author: Przemek
type: post
date: 2018-05-01T16:34:32+00:00
url: /freeradius-google-authenticator/
featured_image: /wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-2.png
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - checkpoint
  - Linux
  - radius

---
Użycie drugiego składnika logowania zabezpiecza dostęp ale może powodować pewne trudności lub koszty we wdrożeniu. Chciałbym pokazać jak za pomocą darmowego radiusa, biblioteki google authenticator i aplikacji w telefonie można zrealizować to zadanie.

<!--more-->

Cel jest taki aby zabezpieczyć logowanie do urządzenia na login i hasło + drugi zmienny składnik. Login i hasło będą pobierane lokalnie z radiusa i będą danymi wygenerowanym przy zakładaniu konta systemowego. Natomiast drugim zmiennym składnikiem względem czasu będzie biblioteka google-authenticator. Czyli użytkownik logując się np. do routera poda swój login i hasło a po haśle wpisze sześcio cyfrowy kod. Plusem oprócz zwiększonego bezpieczeństwa jest zarządzanie użytkownikami z poziomu radiusa.

Chciałbym zaznaczyć, że aplikacja google authentocator to nie jest żadna usługa online. Aplikacja w telefonie bazuje na kluczu, który nie jest nigdzie wysyłany. Nawet google backup nie zachowuje tych danych w chmurze.

Kolejną rzeczą o której trzeba pamiętać to, że hasło admina czy roota na urządzeniu podłączonego do radiusa magicznie nie znika i zawsze zostaje jako lokalnie zarządzane konto więc musi posiadać przyzwoite hasło. Np. Na wypadek gdyby sam radius uległ awarii.

#### Instalacja paczek

<pre>apt-get install ntp freeradius libpam-google-authenticator</pre>

#### Zmiana grup na których działa demon freeradiusa

<pre>/etc/freeradius/3.0/radusd.conf
 user = root
 group = root</pre>

#### Włączenie modułu PAM

Włączam moduł pam w freeradius

<pre>ln -s /etc/freeradius/3.0/mods-available/pam /etc/freeradius/3.0/mods-enabled/pam
</pre>

W pliku /etc/freeradius/3.0/users, za wpisem **Deny access for a specific user** wklejam:

<pre>DEFAULT Group == "radius-disabled", Auth-Type := Reject
 Reply-Message = "Your account has been disabled."
DEFAULT Auth-Type := PAM</pre>

W pliku /etc/freeradius/3.0/sites-enabled/default, szukam sekcji authenticate o włączam linie pam.

<pre>authenticate {

pam

}</pre>

W pliku /etc/pam.d/radiusd wyłączam wszystkie linie i dodaje dwie poniższe

<pre>#@include common-auth 
#@include common-account 
#@include common-password 
#@include common-session

auth requisite pam_google_authenticator.so forward_pass
auth required pam_unix.so use_first_pass</pre>

#### Definiuje kto może zostać klientem

W pliku  /etc/freeradius/3.0/clients.conf dodaje wpis w którym definiuje wpis urządzenia.

<pre>client private-network-1 {
 ipaddr = 172.18.10.1
 secret = secret
 }</pre>

#### Dodaje testowego użytkownika

Dodałem użytkowniak test  z hasłem q1w2e3r4

<pre>adduser test
su - test

</pre>

#### Google authentocator

Aby wygenerować swoje kody i obrazek do zeskanowania aplikacją w telefonie (google authentocator) trzeba uruchomić komendę google-authenticator na swoim koncie po zalogowaniu poprzez ssh.

<pre>google-authenticator</pre>

#### [<img class="aligncenter size-full wp-image-14568" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-2.png" alt="" width="783" height="678" />][1]

#### Start freeradius&#8217;a

<pre>service freeradius restart</pre>

#### Testy

Do wykonywania testów lokalnych mam polecenie radtest, definiuje serwer localhost, port 18120, hasło testing123. Hasło jest już zdefiniowane w pliku clients.conf.

<pre>radtest test &lt;unix_password&gt;&lt;google_auth&gt; localhost 18120 testing123</pre>

<pre>root@raspberrypi:~# radtest test q1w2e3r4 localhost 18120 testing123</pre>

Dostęp został zabroniony, hasło się nie zgadza. brakuje drugiego składnika.

<pre>Sent Access-Request Id 145 from 0.0.0.0:38089 to 127.0.0.1:1812 length 74
 User-Name = "test"
 User-Password = "q1w2e3r4"
 NAS-IP-Address = 127.0.1.1
 NAS-Port = 18120
 Message-Authenticator = 0x00
 Cleartext-Password = "q1w2e3r4"
 Received Access-Reject Id 145 from 127.0.0.1:1812 to 0.0.0.0:0 length 20
 (0) -: Expected Access-Accept got Access-Reject</pre>

<pre>root@raspberrypi:~# radtest test q1w2e3r466889585 localhost 18120 testing123</pre>

Dostęp został zezwolony, hasło się zgadza.

<pre>Sent Access-Request Id 104 from 0.0.0.0:59800 to 127.0.0.1:1812 length 74
 User-Name = "test"
 User-Password = "q1w2e3r466889585"
 NAS-IP-Address = 127.0.1.1
 NAS-Port = 18120
 Message-Authenticator = 0x00
 Cleartext-Password = "q1w2e3r466889585"
 Received Access-Accept Id 104 from 127.0.0.1:1812 to 0.0.0.0:0 length 20</pre>

#### Produkcja

Wszystko działa poprawnie można podłączać środowisko produkcyjne. Jeśli ktoś się zastanawia gdzie będzie wpisywać drugi składnik logowania to będzie musiał on być podany tak samo jak w powyższym teście czyli zaraz po haśle. Poniżej konfiguracja radiusa w której podaje serwer radiusa, port i hasło z clients.conf.

[<img class="aligncenter size-full wp-image-14569" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-4.png" alt="" width="528" height="467" />][2]  
Poniżej widać że logowanie nie nie różni się niczym od zwykłego logowania. Po wpisaniu loginu i hasła trzeba odczytać czasowy kod z aplikacji w telefonie i wpisać zaraz po haśle.  
[  
<img class="aligncenter size-full wp-image-14570" src="http://techfreak.pl/wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-5.png" alt="" width="736" height="414" />][3] 

#### Debug

Aby sprawdzić co jest nie tak można zatrzymać radiusa i odpalić go z opcją -X

<pre>freeradius -X</pre>

 [1]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-2.png
 [2]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-4.png
 [3]: http://techfreak.pl/wp-content/uploads/2018/04/techfreak-freeradius-google-authentocator-5.png