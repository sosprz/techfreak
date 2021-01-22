---
title: Jak podłączyć zewnetrzny gps poprzez bluetooth?
author: Przemek
type: post
date: 2012-01-10T08:44:07+00:00
url: /jak-podlaczyc-zewnetrzny-gps-poprzez-bluetooth/
bfa_virtual_template:
  - hierarchy
hits:
  - 247
dsq_thread_id:
  - 1024018052
categories:
  - Linux
tags:
  - bluetooth
  - gps

---
<!--more--> Łączymy zewnetrzny gps poprzez bluetooth

<pre class="lang:default decode:true">#! /bin/bash
passkey-agent --default 000 & #(pin do urządzenia BT paczka w bluez-utils)
rfcomm connect 0 xx:xx:xx:xx:xx:xx & #(mac urządzenia bluetooth)
gpsd /dev/rfcomm0 &
gpsdrvive & #(programik z mapami na linucha)</pre>