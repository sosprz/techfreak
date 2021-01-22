---
title: Skrypt sterujacy wentylatorem w laptopach Lenovo
author: Przemek
type: post
date: 2011-11-01T23:39:14+00:00
url: /skrypt-sterujacy-wentylatorem-w-laptopach-lenovo/
bfa_virtual_template:
  - hierarchy
hits:
  - 158
dsq_thread_id:
  - 1025546265
categories:
  - Linux

---
<!--more--> Wymagany modul w kernelu: Device Drivers &#8212;> [*] X86 Platform Specific Device Drivers &#8212;> [M] ThinkPad ACPI Laptop Extras

<pre class="lang:default highlight:0 decode:true">#! /bin/bash
tmp=`cat /proc/acpi/ibm/thermal |cut -c 15-16`
level=`cat /proc/acpi/ibm/fan|grep level:| cut -c 9-`
rpm=`cat /proc/acpi/ibm/fan|grep speed:| cut -c 9-`
echo $tmp
echo $level
echo $rpm
if [ $tmp -lt 60 ] then echo "mniejsza od 60"
echo level auto &gt; /proc/acpi/ibm/fan else
if [ $tmp -ge 80 ] then echo "wwiekszy rowny 80 full speed"
echo level full-speed &gt; /proc/acpi/ibm/fan else
if [ $tmp -ge 70 ] then echo "wiekszy rowny 70 full-speed"
echo level full-speed &gt; /proc/acpi/ibm/fan else
if [ $tmp -ge 60 ] then echo "wiekszy rowmy 60 level 7"
echo level 7 &gt; /proc/acpi/ibm/fan
fi
fi
fi
fi</pre>