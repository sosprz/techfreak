---
title: Efekt Matrixa w konsoli
author: Przemek
type: post
date: 2014-08-09T06:20:22+00:00
url: /efekt-matrixa-konsoli/
featured_image: /wp-content/uploads/2014/08/damatrix.jpg
hits:
  - 425
dsq_thread_id:
  - 2912628387
categories:
  - Linux
tags:
  - bash

---
Taka ciekawostka tym razem związana z konsolą. Ostatnio znalazłem stary ale fajny efekt Matrixa w konsoli. Działa on bardzo fajnie a generuje go prosty skrypt w bashu. Autorem jest <a href="http://bruxy.regnet.cz/" target="_blank">BruXy</a>, który to na swoim blogu ma więcej fajnych rzeczy.

<!--more-->

<img class="alignnone" src="http://bruxy.regnet.cz/linux/matrix/matrix_bf32.gif" alt="" width="320" height="195" /> 

Kod można ściągnąć wgetem z <a href="http://bruxy.regnet.cz/linux/matrix/matrix.sh" target="_blank">http://bruxy.regnet.cz/linux/matrix/matrix.sh</a> lub przekleić:

<pre>#!/bin/bash
echo -e "\033[2J\033[?25l"; R=`tput lines` C=`tput cols`;: $[R--] ; while true 
do ( e=echo\ -e s=sleep j=$[RANDOM%C] d=$[RANDOM%R];for i in `eval $e {1..$R}`;
do c=`printf '\\\\0%o' $[RANDOM%57+33]` ### http://bruxy.regnet.cz/web/linux ###
$e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c; $s 0.1;if [ $i -ge $d ]
then $e "\033[$[i-d];${j}H ";fi;done;for i in `eval $e {$[i-d]..$R}`; #[mat!rix]
do echo -e "\033[$i;${j}f ";$s 0.1;done)& sleep 0.05;done #(c) 2011 -- [ BruXy ]</pre>

Kod ma jeden minus, nie można zmieniać rozmiaru okna w trakcie działania. Ale po za ty,  jest cool ;)