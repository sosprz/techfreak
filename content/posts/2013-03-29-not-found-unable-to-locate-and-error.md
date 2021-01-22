---
title: 'not found,  Unable to locate and error'
author: Przemek
type: post
date: 2013-03-29T19:51:43+00:00
url: /not-found-unable-to-locate-and-error/
featured_image: /wp-content/uploads/2013/03/konsola_techfreak_642_362_force.jpg
hits:
  - 145
dsq_thread_id:
  - 1173633683
categories:
  - Linux

---
<span style="font-size: 14px; line-height: 1.5;">Pomyślałem że było by fajnie zbierać błędy które można napotkać w konsoli i zamieszczać od razu rozwiązania aby w późniejszym czasie nie tracić czasu na to co kiedyś już się rozwiązało lub naprawiło.</span>

<!--more-->

<p class="lang:default highlight:0 decode:true alert">
  Unable to locate openssl crypto include files
</p>

<p class="lang:default highlight:0 decode:true success">
  sudo apt-get install libcurl3-openssl-dev
</p>

<span style="font-size: 14px; line-height: 1.5;"> </span>CMake Error: your CXX compiler: &#8222;CMAKE\_CXX\_COMPILER-NOTFOUND&#8221; was not found

<p class="success">
  sudo apt-get install build-essential -y
</p>

 root@raspberrypi:~# /etc/init.d/openvpn restart  
<em id="__mceDel">[ ok ] Stopping virtual private network daemon:.<br /> [&#8230;.] Starting virtual private network daemon: serverSegmentation fault</em>

<p class="success">
  aptitude reinstall openvpn
</p>