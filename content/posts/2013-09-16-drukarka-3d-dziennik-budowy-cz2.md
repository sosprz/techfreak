---
title: Drukarka 3D dziennik budowy cz2
author: Przemek
type: post
date: 2013-09-16T10:09:41+00:00
url: /drukarka-3d-dziennik-budowy-cz2/
featured_image: /wp-content/uploads/2013/09/pronterface_250000.jpg
hits:
  - 1838
dsq_thread_id:
  - 1765402612
categories:
  - Drukarki 3D
tags:
  - drukarka 3d

---
Tym razem rozwiązanie problemu połączenia do ramps który napotkałem w poprzednim wpisie [drukarka-3d-dziennik-budowy-cz1][1]

<!--more-->

### Pronterface 250000

Rozwiązanie problemu połączenia na 250000 programem pronterface (printrun) do Ramps 1.4 (Atmega 2560) znalazłem pod tym <a href="https://groups.google.com/forum/#!searchin/ultimaker/pyserial/ultimaker/BNjPpoJpfrE/gGSKAdhY5VwJ" target="_blank">linkiem</a>. Poniżej opis jak zaaplikować patch dla pythona:

Trzeba ściągnąc poniższy patch i zapisać jako pyserial.patch

<pre>Index: pyserial/serial/serialposix.py
===================================================================
--- pyserial/serial/serialposix.py (revision 455)
+++ pyserial/serial/serialposix.py (working copy)
@@ -36,26 +36,25 @@
def device(port):
return '/dev/ttyS%d' % port

- ASYNC_SPD_MASK = 0x1030
- ASYNC_SPD_CUST = 0x0030
+ TCGETS2 = 0x802C542A
+ TCSETS2 = 0x402C542B
+ BOTHER = 0o010000

def set_special_baudrate(port, baudrate):
+ # right size is 44 on x86_64, allow for some growth
import array
- buf = array.array('i', [0] * 32)
+ buf = array.array('i', [0] * 64)

# get serial_struct
- FCNTL.ioctl(port.fd, TERMIOS.TIOCGSERIAL, buf)
+ FCNTL.ioctl(port.fd, TCGETS2, buf)
+ # set custom speed
+ buf[2] &= ~TERMIOS.CBAUD
+ buf[2] |= BOTHER
+ buf[9] = buf[10] = baudrate

- # set custom divisor
- buf[6] = buf[7] / baudrate
-
- # update flags
- buf[4] &= ~ASYNC_SPD_MASK
- buf[4] |= ASYNC_SPD_CUST
-
# set serial_struct
try:
- res = FCNTL.ioctl(port.fd, TERMIOS.TIOCSSERIAL, buf)
+ res = FCNTL.ioctl(port.fd, TCSETS2, buf)
except IOError:
raise ValueError('Failed to set custom baud rate: %r' % baudrate)</pre>

Jak zaaplikować patch na Ubuntu 13.04:

<pre>mv pyserial.patch /usr/lib/python2.7/dist-packages/serial
cd /usr/lib/python2.7/dist-packages/serial
cp  serialposix.py  serialposix.py.old
patch -p2 &lt; pyserial.patch</pre>

Definiujemy w marlin > Confguration.h

<pre>#define BAUDRATE 250000
//#define BAUDRATE 115200</pre>

Uruchamiamy pronterface

<pre>./pronterface.py</pre>

[<img class="aligncenter size-full wp-image-4893" alt="pronterface_250000" src="http://techfreak.pl/wp-content/uploads/2013/09/pronterface_250000.jpg" width="791" height="538" />][2]

&nbsp;

 [1]: http://techfreak.pl/drukarka-3d-dziennik-budowy-cz1/
 [2]: http://techfreak.pl/wp-content/uploads/2013/09/pronterface_250000.jpg