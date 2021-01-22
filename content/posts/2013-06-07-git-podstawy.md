---
title: Git podstawy
author: Przemek
type: post
date: 2013-06-07T21:48:40+00:00
url: /git-podstawy/
featured_image: /wp-content/uploads/2013/06/git_podstawy_642_362_force.jpg
hits:
  - 1419
dsq_thread_id:
  - 1376348051
categories:
  - Linux

---
Dziś będą git podstawy, dodaje parę przydatnych komend w zasadzie takie małe wprowadzenie. Sam korzystam z github.com i używam podstawowych poleceń aby go w miarę ogarniać. Nie jest to jakiś oszałamiający zestaw, ale na pewno początkującemu użytkownikowi przyda się aby łatwo zarządzać wersjami swojego projektu.

<!--more-->

Poniżej komendy w takiej kolejności tak jak mniej więcej się ich używa w praktyce.

#### Git podstawy

**git init** &#8211; inicjalizacja repozytorium

<pre>sosprz@sosprz:~$ mkdir test
sosprz@sosprz:~$ cd test/
sosprz@sosprz:~/test$ ls
sosprz@sosprz:~/test$ touch index.php
sosprz@sosprz:~/test$ echo "test123" &gt;&gt; index.php

<span style="line-height: 1.61538em;">sosprz@sosprz:~/test$ </span>git init<span style="line-height: 1.61538em;"> 
Initialized empty Git repository in /home/sosprz/test/.git/</span></pre>

**git config** &#8211; konfiguracja

<pre>sosprz@sosprz:~/test$ git config --global user.email "test@gmail.com"
sosprz@sosprz:~/test$ git config --global user.name "User"</pre>

**git status** &#8211; status projektu, przydatna sprawa widać co się dzieje i informuje o nowych plikach w repo.

<pre>sosprz@sosprz:~/test$ git status
 # On branch master
 #
 # Initial commit
 #
 # Untracked files:
 # (use "git add ..." to include in what will be committed)
 #
 # index.php
 nothing added to commit but untracked files present (use "git add" to track)</pre>

**git add** &#8211; dodaje pliki do repozytorium

<pre>sosprz@sosprz:~/test$ git add index.php</pre>

**git status**

<pre>sosprz@sosprz:~/test$ git status
 # On branch master
 #
 # Initial commit
 #
 # Changes to be committed:
 # (use "git rm --cached ..." to unstage)
 #
 # new file: index.php
 #</pre>

**git commit -am &#8222;pierwszy&#8221;** &#8211; zatwierdzanie zmian, trzeba dodać komentarz.

<pre>sosprz@sosprz:~/test$ git commit -am "pierwszy" 
 [master (root-commit) f301ae3] start 1 file changed, 1 insertion(+) 
 create mode 100644 index.php</pre>

**git commit -am &#8222;nowe zmiany&#8221;**

<pre>sosprz@sosprz:~/test$ echo "test1234" &gt;&gt; index.php

sosprz@sosprz:~/test$ git commit -am "nowe zmiany"
 [master 0701f4a] nowe zmiany
 1 file changed, 1 insertion(+)</pre>

**git log** &#8211; wyświetla listuje zatwierdzone commity wraz z komentarzami

<pre>sosprz@sosprz:~/test$ git log
 commit 0701f4a1bd44c8edee30a606ca7ca2c2e9e65361
 Author: User &lt;test@gmail.com&gt;
 Date: Wed Jun 5 23:51:54 2013 +0200

nowe zmiany

commit f301ae30211c419ef90a4f8e87a1cad81a9598cd

 Author: User &lt;test@gmail.com&gt;

 Date: Wed Jun 5 23:49:51 2013 +0200

start</pre>

#### 

#### Git wgrywanie danych na zdalny serwer

**git remote add** &#8211; dodanie zdalnego punktu

<pre><em id="__mceDel">git remote add sosprz https://github.com/sosprz/nettemp</em></pre>

**git push** &#8211; wgrywanie zmian na zdalny serwer

<pre>git push sosprz</pre>

#### 

#### Zarządzanie gałęziami

**git branch** &#8211; wyświetlanie istniejących gałężi i ich tworzenie.

<pre>sosprz@sosprz:~/test$ git branch
* master</pre>

<pre>sosprz@sosprz:~/test$ git branch fix</pre>

<pre>sosprz@sosprz:~/test$ git branch
 fix
* master</pre>

**git checkout** &#8211; przełączanie się pomiędzy gałęziami

<pre>sosprz@sosprz:~/test$ git checkout fix
Switched to branch 'fix'</pre>

**git status**

<pre>sosprz@sosprz:~/test$ echo lol &gt;&gt; index.php 

sosprz@sosprz:~/test$ git status
# On branch fix
# Changes not staged for commit:
# (use "git add &lt;file&gt;..." to update what will be committed)
# (use "git checkout -- &lt;file&gt;..." to discard changes in working directory)
#
# modified: index.php
#
no changes added to commit (use "git add" and/or "git commit -a")</pre>

**git commit**

<pre>sosprz@sosprz:~/test$ git commit -am "fix"
[fix b69efd0] fix
 1 file changed, 1 insertion(+)</pre>

**git checkout**

<pre>sosprz@sosprz:~/test$ git checkout master
Switched to branch 'master'</pre>

**git merge** &#8211; łączenie gałężi z głównym repozytorium

<pre><span style="line-height: 1.61538em;">sosprz@sosprz:~/test$ git merge fix</span>
Updating 0701f4a..b69efd0
Fast-forward
 index.php | 1 +
 1 file changed, 1 insertion(+)</pre>

**git push -u** &#8211; wgrywanie gałężi na zdalny serwer

<pre>sosprz@sosprz:~/test$ git push -u origin fix

Username for 'https://github.com': sosprz
Password for 'https://sosprz@github.com': 
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/sosprz/nettemp
 * [new branch] fix -&gt; fix
Branch test set up to track remote branch test from origin.</pre>

<strong style="line-height: 1.5em;">git push &#8211;delete </strong>&#8211; kasowanie zdalnej gałężi

<pre>sosprz@sosprz:/test$ git push --delete origin fix

 <em id="__mceDel" style="line-height: 1.5em;">Username for 'https://github.com': sosprz</em>
 <em id="__mceDel">Password for 'https://sosprz@github.com':
 To https://github.com/sosprz/nettemp
 - [deleted] fix</em></pre>

**git push &#8211;delete** &#8211; kasowanie lokalnej gałężi

<pre>sosprz@sosprz:test$ git branch --delete test
Deleted branch test (was 7f6d216).</pre>

**git remote show origin** &#8211; pokazuje informacje o zdalnym repozytroium

<pre>root@raspberrypi:/var/www/nettemp# git remote show origin
* remote origin
 Fetch URL: https://github.com/sosprz/nettemp
 Push URL: https://github.com/sosprz/nettemp
 HEAD branch (remote HEAD is ambiguous, may be one of the following):
  master
  v6
 Remote branches:
  master tracked
  v6 tracked
 Local branches configured for 'git pull':
  master merges with remote master
  v6 merges with remote v6
 Local refs configured for 'git push':
  master pushes to master (up to date)
  v6 pushes to v6 (up to date</pre>

**git pull** &#8211; pobiera tylko zmiany

<pre>git pull https://github.com/sosprz/nettemp</pre>

**git clone** &#8211; pobiera całość

<pre>git clone https://github.com/sosprz/nettemp</pre>

Dodawanie zdalnej gałęźi 

<pre>git checkout -b beta origin/beta</pre>

#### Dodatkowe:

**git update-index**

Przydatną komendą w git, jest opcja **git update-index &#8211;assume-unchanged** która to powoduje że plik który wskażemy zostaje cały czas w takim samym stanie w bazie git, chyba że wydamy komendę **git update-index &#8211;no**-assume-unchanged.**** Przydaje się to np gdy pracujemy z bazą i nie chcemy żeby po każdym komicie w git były tam dane np. testowe lub prywatne.

<pre><em id="__mceDel">git update-index --assume-unchanged baza.sql</em></pre>

<pre>git update-index --no-assume-unchanged baza.sql</pre>

**git clone -b** &#8211; pobieranie gałęzi

Aby ściągnąć gałąź bo np. jest tam nasza wersja beta trzeba wydać polecenie: **git clone -b** gałąź repo

<pre>git clone -b v7 https://github.com/sosprz/nettemp</pre>

**git reset**

Aby zrestartować zmiany/cofnąć się do ostatniego commita

<pre>git reset --hard HEAD</pre>

&nbsp;

&nbsp;