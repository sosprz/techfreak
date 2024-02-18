---
title: Yubikey klucz do bezpieczeństwa
author: Przemek
type: post
date: 2015-08-25T05:36:09+00:00
url: /yubikey-klucz-do-bezpieczenstwa/
featured_image: /wp-content/uploads/2015/08/techfreak_yubikey_neo_nfc_token_linux-624x468.jpg
hits:
  - 677
dsq_thread_id:
  - 4064274737
colormag_page_layout:
  - default_layout
categories:
  - Linux
tags:
  - NFC
  - usb
  - Yubico

---
Parę słów i przykładów z działania klucza Yubikey NEO, który nie tylko przypomina pamięć USB a pomaga chronić dostępu do najpopularniejszych serwisów internetowych.

<!--more-->

Jesteśmy w czasach kiedy hasło do konta pocztowego nie zapewnia wystarczającej ochrony. Na każdym kroku zwiedzania internetu czy korzystania z komputera użytkownik jest narażony na niebezpieczeństwo utraty hasła. Świadomość, że atakujący mógłby przejąć  konto pocztowe na którym opieramy wszelkie inne dostępy w sieci na napawa optymizmem. Jeśli jesteś posiadaczem konta np. Google mail to masz możliwość włączenia dwuskładnikowego logowania przy pomocy Google authenticator lub tokena U2F. Utrudniło by to potencjalnym włamywaczom przejęcie konta. W pierwszym przypadku Google authenticator jest instalowany na telefonie w drugim trzeba posiadać fizyczny klucz. Niestety telefony też posiadają systemy które są podatne na zagrożenia. Dlatego do dwuskładnikowego uwierzytelnienia używam Yubikey. Poniżej opiszę trochę jak działa klucz Yubikey i co można z nim zrobić.

Jest wiele ważnych serwisów które przydało by się dodatkowo zabezpieczyć. Dla mnie ważne są lastpass, droppbox, gmail, github, digitalocean, openvpn, wordpress. Tak się składa, że je wszystkie mogę zabezpieczyć dwuskładnikowym logowaniem przy pomocy google authenticator (GA). Taka opcja przydała by się  jeszcze w bankach lub takich serwisach jak eBay lub PayPal. Skoro jestem przy GA, to generalnie jego używanie na pewno podwyższa poziom bezpieczeństwa. I jeśli ktoś używa to plus dla niego. Jest bezpiecznie, fanie. Co ma do tego Yubikey? I co to jest w ogóle Yubikey??

<a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_neo_nfc_token_linux_131/" rel="attachment wp-att-10155"><img class="aligncenter size-full wp-image-10155" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_Yubikey_neo_nfc_token_linux_131.jpg" alt="techfreak_Yubikey_neo_nfc_token_linux_131" width="1000" height="650" /></a>

Yubikey jest prostym i bezpiecznym kluczem chroniącym przeróżne konta w internecie. Najprostszym przykładem jest dwuskładnikowa ochrona gmaila za pomocą standardu **Universal 2nd Factor** (**U2F**). Która polega na wsadzeniu klucza do portu usb po podaniu loginu i hasła. Ciekawe jest to, że przy chęci włączenia **U2F** w danym serwisie, Yubikey generuje parę kluczy które nie są przetrzymywane na nim samym lecz w serwisie w którym się rejestruje. Co pozwala na wykorzystanie klucza Yubikey w dowolnej ilości serwisów online. Ciekawe co? Przy rejestracji token generuje klucz prywatny przy pomocy secp256r1 który jest szyfrowany głównym hasłem urządzenia i jest wysyłany do serwisu online. Przy próbie logowania yubikey rozszyfrowuje zapytanie w którym jest zawarty wcześniej wygenerowany klucz. Jest fajnie ale nie do końca. Obsługa **U2F** jest dostępna tylko w przeglądarce Chrome. Firefox się ociąga.

Pierwszy przykład użycia za nami ale nie napisałem ogólnie o co chodzi w Yubikeyu. Cały pic polega na dotknięciu złotego kółeczka aby w danym czasie uruchomić token. Nie jest tak, że wkładam w USB token i on już działa. Za każdym razem kiedy chce go użyć muszę go dotknąć. Zaświeci się diodka i akcja została wykonana. W przypadku logowania do strony z U2F po dotknięciu zostaniemy przeniesieni do żądanej treści. Yubikey ma jeszcze inne funkcje kryjące się pod magicznym guziczkiem. Posiada dwa sloty przetrzymujące hasła. Przy przytrzymaniu palca około sekundy zostanie wklejone hasło ze slotu pierwszego. Jeśli zrobię to trzy sekundy zostanie wklejone hasło z drugiego slotu. Yubik jest wykrywany jako klawiatura i działa jako klawiatura. Jednym tapnięciem wkleja 32 znakowe hasło np. do last passa lub do dysku. Nie przetrzymuje żadnych innych informacji o użytkoniwku więc nawet jak go zgubie nikt nie będzie wiedział gdzie go użyć. Z tą opcja mam niestety problem bo po prostu pamiętam swoje 32 znakowe hasło.

<a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_neo_nfc_token_linux_yubico_letter-jpg/" rel="attachment wp-att-10166"><img class="aligncenter wp-image-10166 size-medium" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_Yubikey_neo_nfc_token_linux_yubico_letter.jpg-300x225.jpg" alt="techfreak_Yubikey_neo_nfc_token_linux_yubico_letter.jpg" width="300" height="225" /></a>

#### Yubico Authenticator

Pomijając U2F i wklejanie haseł. Wspominałem o Google Authenticator który instaluje się na telefonie i generuje  co minutę nowe hasło &#8211; token do wybranego serwisu. Generowanie tokena opiera się na funkcji <a href="http://garbagecollected.org/2014/09/14/how-google-authenticator-works/" target="_blank" rel="noopener">HMAC-SHA1,</a> która generuje sześcio znakowe hasła na podstawie głównego hasła które jest zapisane w serwisie jak i w Google Authenticator. Yubikey posiada swoją własną aplikację Yubico Authentocator która w pełni zastępuje GA. Klucz Yubikey posiada opcje kontenera który trzyma w sobie te wszystkie główne hasła i po wsadzeniu go do komputera, czy przyłożeniu go do telefonu z NFC pokażą się tokeny do serwisów. Tak, Yubikey może być odczytywany poprzez NFC. Oczywiście dostęp do tego kontenera jest zabezpieczany osobnym hasłem. Aby korzystać na telefonie z tej funkcjonalności trzeba zainstalować darmowy program [Yubico Authentocator][1]. Nie ma problemu aby odczytać kody na komputerze z różnymi systemami operacyjnymi ale potrzeba do tego <a href="https://developers.yubico.com/yubioath-desktop/Releases/" target="_blank" rel="noopener">aplikacji</a>. Zapewnia to pewną elastyczność użytkowania. Użytkownik nie jest przywiązany do swojego telefonu i nie jest zależny od niego.<figure id="attachment_10165" aria-describedby="caption-attachment-10165" style="width: 530px" class="wp-caption aligncenter">

<a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_neo_nfc_token_linux_yubico_authentocator_ubuntu/" rel="attachment wp-att-10165"><img class="wp-image-10165 size-full" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_Yubikey_neo_nfc_token_linux_yubico_authentocator_ubuntu.jpg" alt="techfreak_Yubikey_neo_nfc_token_linux_yubico_authentocator_ubuntu" width="530" height="405" /></a><figcaption id="caption-attachment-10165" class="wp-caption-text">Yubico Authentoicator na Xubuntu</figcaption></figure> <figure id="attachment_10185" aria-describedby="caption-attachment-10185" style="width: 576px" class="wp-caption aligncenter"><a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_yubico_authenticator/" rel="attachment wp-att-10185"><img class="wp-image-10185 size-large" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_yubico_authenticator-576x1024.jpg" alt="techfreak_yubikey_yubico_authenticator" width="576" height="1024" /></a><figcaption id="caption-attachment-10185" class="wp-caption-text">Yubico Authentocator na Androidzie</figcaption></figure> 

#### Przykłady użycia Yubico Authentocator który w pełni zastępuje Google Authenticator

Yubico Authentocator z powodzeniem zastępuje w pełni Google Authenticator w takich aplikacjak jak google, lastpass, github, wordpress, dropbox. Pełna lista znajduje się pod <a href="https://en.wikipedia.org/wiki/Google_Authenticator" target="_blank" rel="noopener">tym</a> linkiem.<figure id="attachment_10187" aria-describedby="caption-attachment-10187" style="width: 897px" class="wp-caption aligncenter">

<a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_yubico_authenticator_wordpress/" rel="attachment wp-att-10187"><img class="wp-image-10187 size-full" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_yubico_authenticator_wordpress.jpg" alt="techfreak_yubikey_yubico_authenticator_wordpress" width="897" height="576" /></a><figcaption id="caption-attachment-10187" class="wp-caption-text">Yubico Authenticator wordpress</figcaption></figure> <figure id="attachment_10189" aria-describedby="caption-attachment-10189" style="width: 912px" class="wp-caption aligncenter"><a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_yubico_authenticator_gmail/" rel="attachment wp-att-10189"><img class="wp-image-10189 size-full" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_yubico_authenticator_gmail.jpg" alt="techfreak_yubikey_yubico_authenticator_gmail" width="912" height="396" /></a><figcaption id="caption-attachment-10189" class="wp-caption-text">Yubico Authenticator gmail</figcaption></figure> <figure id="attachment_10190" aria-describedby="caption-attachment-10190" style="width: 1188px" class="wp-caption aligncenter"><a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_yubico_authenticator_lastpass/" rel="attachment wp-att-10190"><img class="wp-image-10190 size-full" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_yubico_authenticator_lastpass.jpg" alt="techfreak_yubikey_yubico_authenticator_lastpass" width="1188" height="400" /></a><figcaption id="caption-attachment-10190" class="wp-caption-text">Yubico Authentocator LastPass</figcaption></figure> 

#### Jak zabezpieczyć stronę www prywatnym kluczem który znajduje się na Yubikey?

<p class="lang:default highlight:0 decode:true">
  Poniżej pokaże bardzo fajny przykład jak zabezpieczyć stronę www certyfikatem, który jest przetrzymywany na Yubikey. Kiedyś napisałem krótką instrukcję jak włączyć takie zabezpieczenie na apache2, można znaleźć ją pod <a href="http://techfreak.pl/jak-ustawic-dostep-do-strony-www-na-podstawie-certyfikatu/" target="_blank" rel="noopener">tym</a> linkiem. Zostały opisane tam cztery punkty a wynikiem ostatniego jest certyfikat o nazwie public_client.p12 zabezpieczony hasłem. Teraz aby wgrać taki certyfikat na Yubikey trzeba włączyć obsługę CCID (smartcard) w samym kluczyku. Do tego służy program YubiKey NEO Manager
</p>

<p class="lang:default highlight:0 decode:true">
  <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_ccid_1/" rel="attachment wp-att-10194"><img class="aligncenter size-full wp-image-10194" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_ccid_1.jpg" alt="techfreak_yubikey_ccid_1" width="668" height="297" /></a> <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_ccid_2/" rel="attachment wp-att-10195"><img class="aligncenter size-full wp-image-10195" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_ccid_2.jpg" alt="techfreak_yubikey_ccid_2" width="655" height="296" /></a>
</p>

<p class="lang:default highlight:0 decode:true">
  Następnym programem który będzie potrzebny jest Yubico PIV tool którym importuje do Yubikey&#8217;a certyfikat klienta (hasło exportowe q1w2e3r4)
</p>

<p class="lang:default highlight:0 decode:true">
  <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_2/" rel="attachment wp-att-10197"><img class="aligncenter size-full wp-image-10197" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_2.jpg" alt="techfreak_yubikey_piv_ccid_2" width="952" height="125" /></a>
</p>

<p class="lang:default highlight:0 decode:true">
  Warto wiedzieć z jakimi hasłami domyślnie przychodzi klucz, dotyczą one tylko modułu CCID
</p>

  * default pin: 123456
  * default unblock pin: 12345678
  * default admin key : 010203040506070801020304050607080102030405060708

<p class="lang:default highlight:0 decode:true">
  Na testy zabezpieczyłem stronę mojego projektu nettemp. Nic się nie wyświetla ponieważ przeglądarka firefox nie jest skonfigurowana do używania smartcard.
</p>

<p class="lang:default highlight:0 decode:true">
  <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_1/" rel="attachment wp-att-10196"><img class="aligncenter size-full wp-image-10196" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_1.jpg" alt="techfreak_yubikey_piv_ccid_1" width="771" height="506" /></a>
</p>

<p class="lang:default highlight:0 decode:true">
  W zakładce Preferences > Adwanced > Certificates > Security Devices trzeba dodać moduł opensc wraz ze scieżką do pliku<strong> /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so</strong>. Do poprawnego działania wymagany jest program Opensc który odpowiada za komunikację z kartami smartcard.
</p>

<p class="lang:default highlight:0 decode:true">
  <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_3/" rel="attachment wp-att-10198"><img class="aligncenter size-full wp-image-10198" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_3.jpg" alt="techfreak_yubikey_piv_ccid_3" width="1362" height="549" /></a>
</p>

<p class="lang:default highlight:0 decode:true">
  <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_4/" rel="attachment wp-att-10199"><img class="aligncenter size-full wp-image-10199" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_4.jpg" alt="techfreak_yubikey_piv_ccid_4" width="1358" height="352" /></a>
</p>

<p class="lang:default highlight:0 decode:true">
  Przy ponownym wejściu na stronę tym razem firefox znalazł moje urządzenie i zostałem poproszony o hasło.
</p>

#### <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_5/" rel="attachment wp-att-10200"><img class="aligncenter size-full wp-image-10200" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_5.jpg" alt="techfreak_yubikey_piv_ccid_5" width="564" height="326" /></a> <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_6/" rel="attachment wp-att-10201"><img class="aligncenter size-full wp-image-10201" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_6.jpg" alt="techfreak_yubikey_piv_ccid_6" width="771" height="532" /></a> <a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_piv_ccid_7/" rel="attachment wp-att-10202"><img class="aligncenter size-full wp-image-10202" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_piv_ccid_7.jpg" alt="techfreak_yubikey_piv_ccid_7" width="630" height="567" /></a> {.lang:default.highlight:0.decode:true}

#### Yubikey i ssh?

Mi osobiści pierwsze co przyszło do głowy po otrzymaniu Yubikey&#8217;a to czy będzie on przetrzymywać on moje hasła do ssh. Nie udało mi się wgrać moich obecnych kluczy ale bez problemu można wygenerować nowy klucz SSH za pomocą Yubikey a następnie wgrać na pamięć Yubikey. I w tym przypadku CCID musi być włączone. Poniżej procedura generowanie kluczy dla ssh.

Generowanie prywatnego klucza, Yubikey musi być włożony w slot USB.

<pre>yubico-piv-tool -s 9a -a generate -o public.pem</pre>

Generowanie certyfikatu na podstawie powyższego klucza

<pre>yubico-piv-tool -a verify-pin -P 123456 -a selfsign-certificate -s 9a \
      -S "/CN=SSH techfreak/" -i public.pem -o cert.pem</pre>

Inportowanie certyfikatu na klucz yubikey

<pre>yubico-piv-tool -a import-certificate -s 9a -i cert.pem</pre>

Wyświetlenie prywatnego klucza który trzeba umieścić na zdalnej maszynie w pliku ~/.ssh/authorized_keys

<pre>ssh-keygen -D /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so</pre>

Aby ssh szukał klucza na Yubikey przy polaczeniu do serwera ssh trzeba w pliku ssh_config wskazać moduł opensc.

<pre>echo "PKCS11Provider /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so" &gt;&gt; /etc/ssh/ssh_config</pre>

Po konfiguracji w ssh_config i dodaniu kluczy publicznych na zdalnym hoscie można łączyć się po ssh nie podając hasła a wsadzając kluczyk do portu USB. Jeśli nie mam akurat go pod ręką. Mogę podać hasło i ile wcześnie nie wyłączyłem tej metody.

Aby wyświetlić zainstalowane certyfikaty:

<pre>laps:~$ yubico-piv-tool -a status
Slot 9a:	
	Algorithm:	RSA2048
	Subject DN:	CN=SSH techfreak
	Issuer DN:	CN=SSH techfreak
	Fingerprint:	aed0d2269c768502cf2149092dc7c7ea0cde23ee1df0df3b9c511a9e0d887515
	Not Before:	Aug 24 09:35:52 2015 GMT
	Not After:	Aug 23 09:35:52 2016 GMT
Slot 9c:	
	Algorithm:	RSA2048
	Subject DN:	C=AU, ST=Some-State, O=Internet Widgits Pty Ltd
	Issuer DN:	C=AU, ST=Some-State, O=Internet Widgits Pty Ltd
	Fingerprint:	d91cd1d2f114fe3621d8937d8a0b22bc8a4a805d21effff8516b857256abc114
	Not Before:	Aug 13 11:39:40 2015 GMT
	Not After:	Aug 12 11:39:40 2016 GMT
Slot 9d:	No data available.
Slot 9e:	No data available.
PIN tries left:	3
</pre>

#### Yubikey personalization tool

Twórcy Yubikey zapewniają naprawdę dobre wsparcie dla klucza. Między innymi podstawowym programem do konfiguracji jest Yubikey personalization tool w którym odbywa się konfiguracja.

<a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_neo_nfc_token_linux_4/" rel="attachment wp-att-10213"><img class="aligncenter size-full wp-image-10213" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_Yubikey_neo_nfc_token_linux_4.jpg" alt="techfreak_Yubikey_neo_nfc_token_linux_4" width="897" height="733" /></a>

### Podsumowanie

<a href="http://techfreak.pl/yubikey-klucz-do-bezpieczenstwa/techfreak_yubikey_na_spacerze_w_lesie_hasa/" rel="attachment wp-att-10212"><img class="aligncenter wp-image-10212 size-medium" src="http://techfreak.pl/wp-content/uploads/2015/08/techfreak_yubikey_na_spacerze_w_lesie_hasa-300x225.jpg" alt="techfreak_yubikey_na_spacerze_w_lesie_hasa" width="300" height="225" /></a>

Z tego co widać powyżej z Yubikey jest naprawdę fajnym kluczem i nie wiem czy nie jedynym o takich dużych możliwościach. Ja osobiście na co dzień używam Yubikey Authenticator czy to w telefonie z Androidem czy laptopie z xubuntu. Dokumentacja dostępna na stronie rozwiewa wszystkie wątpliwości a jeśli nie to jest do dyspozycji forum. Nie opisałem wszystkiego co można zrealizować przy pomocy Yubikey NEO ale mam nadzieje to zrobić to jeszcze w paru wpisach. Jeśli ktoś jest ciekawy jak wygląda klucz od środka to polecam obejrzeć fotki ze strony <a href="http://hexview.com/~scl/neo/" target="_blank" rel="noopener">hexview.com. </a>

 [1]: https://play.google.com/store/apps/details?id=com.yubico.yubioath&hl=pl