---
title: Jak zabezpieczyć logowanie do swojego bloga?
author: Przemek
type: post
date: 2014-05-11T20:45:52+00:00
url: /jak-zabezpieczyc-logowanie-do-swojego-bloga/
featured_image: /wp-content/uploads/2014/05/wireshark_sniff_POST.jpg
hits:
  - 278
dsq_thread_id:
  - 2677808433
categories:
  - Linux
tags:
  - certyfikaty
  - domeny
  - wordpress

---
Tym razem mam temat dotyczący bezpieczeństwa logowania do bloga, strony, panelu lub co sobie tam wymyślicie. Ostatnio logując się do swojego panelu admina, do którego domyślne logowanie odbywa się przez http. Pomyślałem że fajnie było by robić to dobrze i logować się po https. Hosting z którego korzystam ma z defaulta certyfikat wildcard którego można używać ale wtedy dostaje ostrzeżenia od przeglądarki. Ponierważ domena nie zgadza się z tą z certyfikatu. Zawsze można zaakceptować wyjątek ale to nie jest wyjście. Zacząłem szukać darmowych certyfikatów.

<!--more-->

Długo nie szukając znalazłem <a title="Darmowy certyfikat" href="https://www.startssl.com/" target="_blank">https://www.startssl.com/</a>, stronę na której można wygenerować sobie darmowy certyfikat na domenę i sub domenę. Rejestracja i wystawienie przebiega w sumie szybko bo w jakąś godzinę lub dwie centrum dostarcza do panelu podpisany certyfikat. O czym trzeba pamiętać że po zarejestrowaniu w przeglądarce instaluje się certyfikat logowania do panelu i trzeba go sobie zachować. Aby w razie potrzeby zalogowania lub ściągnięcia certyfikatu na konkretną domenę go mieć. Certyfikat jest wystawiany na rok i po roku możemy wygenerować nowy też za darmo. Ja oczywiście to zrobiłem a mój hosting po dostarczeniu certyfikatu zainstalował go w parę godzin. Efekty można podziwiać po wpisaniu https://techfreak.pl. W tym przypadku zobaczycie że https działa i nie wywala ostrzeżeń ale kłódeczka jest z żółtym trójkącikiem co oznacza że nie wszystkie elementy na stronie są bezpieczne. Jest to prawdopodobnie spowodowane tym że nie wszystkie liki zaczynają się od https. Cala reszta jest szyfrowana. OK, ale mi tylko chodziło aby ukryć login i hasło które jest wysyłane <a href="http://pl.wikipedia.org/wiki/POST_(metoda)" target="_blank">POST</a>&#8217;em i można je przechwycić (np. jeśli staniemy się ofiarą ataku MiTM. Jak wykonać i jak bronić się przed takim atakiem pisałem jakiś czas temu: <a href="http://techfreak.pl/jak-bronic-sie-przed-atakiem-arpspoof/" target="_blank">techfreak.pl/jak-bronic-sie-przed-atakiem-arpspoof</a>) A tak wygląda przechwycony formularz logowania:

[<img class="aligncenter size-full wp-image-6984" src="http://techfreak.pl/wp-content/uploads/2014/05/wireshark_sniff_POST.jpg" alt="wireshark_sniff_POST" width="1013" height="440" />][1]

Powyżej widać że pakiet przechwycony wiresharkiem zawiera login i hasło. (Jak by co hasło było testowe;) Na tą chwile po wejściu https://techfreak.pl/wp-admin wszystko jest ok i mogę się spokojnie logować bo moje hasło jest przekazywane do serwera w zaszyfrowanej postaci. Czyli jest, tak jak chciałem. Ale zawszę muszę pamiętać żeby wpisać https przed stroną logowania. Na szczęście WordPress przychodzi z przydatnymi opcjami FORCE\_SSL\_LOGIN i FORCE\_SSL\_ADMIN dzięki którym wymusza używanie https. Wystarczy wpisać w wp-config.php dwie linie:

<pre>define('FORCE_SSL_LOGIN', true);
define('FORCE_SSL_ADMIN', true);
/* To wszystko, zakończ edycję w tym miejscu! Miłego blogowania! */</pre>

Zresztą instrukcja jest tu: <a href="http://codex.wordpress.org/Administration_Over_SSL" target="_blank">http://codex.wordpress.org/Administration_Over_SSL</a>. Ok mam darmowy certyfikat, zwiększyłem trochę bezpieczeństwo swojej strony. Mam nadzieję że, nie tylko mi przyda się ta informacja. Jak by ktoś znalazł inne darmowe certyfikaty niech da znać w komentarzach.

 [1]: http://techfreak.pl/wp-content/uploads/2014/05/wireshark_sniff_POST.jpg