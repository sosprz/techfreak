---
title: pam_cracklib – wymuszanie bezpieczniejszego hasła
author: Przemek
type: post
date: 2012-10-03T20:31:33+00:00
url: /pam_cracklib-wymuszanie-bezpieczniejszego-hasla/
bfa_virtual_template:
  - hierarchy
hits:
  - 457
dsq_thread_id:
  - 1025138989
categories:
  - Linux
tags:
  - ubuntu

---
## Jak wymuszać bezpieczne hasło w linuksie ?

<!--more-->

pam_cracklib ma za zadanie wymusić według wcześniej zdefiniowanych reguł mocniejsze hasła dla użytkowników.

&nbsp;

Instalacja cracklib w ubuntu:

<pre class="lang:default highlight:0 decode:true">sudo aptitude install libpam-cracklib</pre>

nano /etc/pam.d/common-password

zastąp poniższe linie:

<pre class="lang:default highlight:0 decode:true">password	requisite			pam_cracklib.so retry=3 minlen=8 difok=3 
password	[success=2 default=ignore]	pam_unix.so obscure use_authtok try_first_pass sha512</pre>

na:

<pre class="lang:default highlight:0 decode:true">password	required			pam_cracklib.so retry=3 minlen=8 difok=3 lcredit=0 ucredit=1 dcredit=1 ocredit=2
password	[success=2 default=ignore]	pam_unix.so obscure use_authtok try_first_pass sha512</pre>

&nbsp;

Objaśnienie zastosowanych polityk:

minlen=8 minimalna długość hasła  
difok=3 ile znakow moze byc takich samych jak w poprzednim haśle  
lcredit=0 ilośc małych znaków (lower character)  
ucredit=1 ilośc dużych znaków (upper character)  
dcredit=1 ilośc cyfr (digital)  
ocredit=2 ilośc innych znaków (other)

&nbsp;

Nastepnie w pliku  /etc/login.defs ustawiamy liczbę dni kiedy uzytkownik zostanie poproszony o zmiane hasła.

<pre class="lang:default highlight:0 decode:true">#
# Password aging controls:
#
#	PASS_MAX_DAYS	Maximum number of days a password may be used.
#	PASS_MIN_DAYS	Minimum number of days allowed between password changes.
#	PASS_WARN_AGE	Number of days warning given before a password expires.
#
PASS_MAX_DAYS	1
PASS_MIN_DAYS	0
PASS_WARN_AGE	1</pre>

Wszyscy uzytkownicy dodani przed tą zmianą będą mieli stare ustawiania co można podejżec w pliku /etc/shadow

<pre class="lang:default highlight:0 decode:true">test2:$1$njs1zxEO$ts5ebXwu6.wFspExcyWjs.:14400:0:99999:7:::
test:$6$4DrzXCnZ$LK8qw7GpggHj3jbSRcU7ypFEyUutxIoxyasV.:15216:0:1</pre>

Objaśnienie /etc/shadow

<pre class="lang:default highlight:0 decode:true">1                       2                              3   4 5 6 7 8
test:$6$4DrzXCnZ$LK8qw7GpggHj3jbSRcU7ypFEyUutxIoxyasV.:15216:0:1:1:5:6:</pre>

1. Nazwa użytkownika  
2. Hasło  
3. Ilośc dni po 1970-01-01 gdy hasło zostało zmienione  
4. Minimalna liczba dni, wymagana między zmianami hasła tj. kiedy uzytkownik może zmienic hasło.  
5. Maxymalna liczba dni po których hasło wygasa.  
6. Ilosc dni przed uplywem waznosci hasla kiedy uzytkownik zostanie powiadomiony ze haslo wygasnie.  
7. Liczba dni po wygasnieciu hasła kiedy konto zostanie zablokowane.  
8. Ilośc dni po 1970-01-01 gdy konto zostanie zabloko

&nbsp;

Info:

cracklib nie za bardzo działa na koncie root.  
żródło: <a href="http://www.deer-run.com/~hal/sysadmin/pam_cracklib.html" target="_blank">http://www.deer-run.com/~hal/sysadmin/pam_cracklib.html</a>

&nbsp;

&nbsp;

&nbsp;

&nbsp;