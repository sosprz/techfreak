---
title: Weekendowy projekt – POV na Arduino mini pro
author: Przemek
type: post
date: 2014-06-15T17:19:10+00:00
url: /weekendowy-projekt-pov-arduino-mini-pro/
featured_image: /wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini9.jpg
hits:
  - 2115
dsq_thread_id:
  - 2766975880
categories:
  - Elektronika
tags:
  - arduino

---
Ostatnio natrafiłem na instructables.com na prosty ale fajny i ciekawy projekt <a href="http://www.instructables.com/id/ATtiny8545-POV-Display/?ALLSTEPS" target="_blank">POV Display na ATiny85</a>. Takich projektów widziałem pełno. Już chciałem zrobić wpis na TF, ale pomyślałem zaraz, zaraz sam to zrobię i wtedy coś napiszę :) no i proszę jest.

<!--more-->

Swój klon projektu POV (Persistence of Vision) wzorowałem może nie najlepszym ale na prostym projekcie który jest do zrealizowania w ok. godzinkę i jest nie drogi. Potrzebowałem 5 diod z rezystorami, arduino pro mini i stary wentylator. No w sumie to jeszcze baterię 2S i taśmę dwustronną no i klocki lego. Fotki poproszę.

#### Fotki

[<img class="aligncenter size-full wp-image-7226" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini0.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini0" width="1000" height="500" />][1] [<img class="aligncenter size-full wp-image-7227" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini1.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini1" width="1000" height="500" />][2] [<img class="aligncenter size-full wp-image-7228" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini2.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini2" width="1000" height="500" />][3] [<img class="aligncenter size-full wp-image-7229" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini3.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini3" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-7230" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini4.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini4" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-7231" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini5.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini5" width="1000" height="500" />][6] [<img class="aligncenter size-full wp-image-7232" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini6.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini6" width="1000" height="500" />][7] [<img class="aligncenter size-full wp-image-7233" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini7.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini7" width="1000" height="500" />][8] [<img class="aligncenter size-full wp-image-7234" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini8.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini8" width="1000" height="500" />][9] [<img class="aligncenter size-full wp-image-7235" src="http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini9.jpg" alt="techfreakpl_simple_pov_arduino_pro_mini9" width="1000" height="500" />][10]

&nbsp;

Dobra, pewnie niektórzy się wciąż zastanawiają ale o co chodzi z tymi diodami i klockami lego. Filmik proszę!

### Filmik



### Opowiadanki

Robiłem z tego co było pod ręką dlatego nie wszystkie diody są jednolitego koloru. Lego technics okazały się świetnym materiałem w którym można umieścić diody. Kartoniki się wyginały :) Jak widać projekt jest naprawdę łatwy. Nie jest idealny, ale bardziej jako fajna zajawka do upgradów. A jeśli ktoś tak jak ja użyje goldpinów  i wtyczek to spokojnie możne Arduino pro mini wyciągnąć jak będzie potrzebne do innego projektu.

### Code

Kod programu jest ten sam co na <a href="http://www.instructables.com/id/ATtiny8545-POV-Display/?ALLSTEPS" target="_blank">instructables.com</a> z taką zmianą że teraz działa literka C. Zresztą całość poniżej.

<pre>int delayTime = 1;
int charBreak = 2.1;

int LED1 = 6;
int LED2 = 5;
int LED3 = 4;
int LED4 = 3;
int LED5 = 2;

void setup()
{
pinMode(LED1, OUTPUT);
pinMode(LED2, OUTPUT);
pinMode(LED3, OUTPUT);
pinMode(LED4, OUTPUT);
pinMode(LED5, OUTPUT);
}

int a[] = {1, 6, 26, 6, 1};
int b[] = {31, 21, 21, 10, 0};
int c[] = {14, 17, 17, 10, 0};
int d[] = {31, 17, 17, 14, 0};
int e[] = {31, 21, 21, 17, 0};
int f[] = {31, 20, 20, 16, 0};
int g[] = {14, 17, 19, 10, 0};
int h[] = {31, 4, 4, 4, 31};
int i[] = {0, 17, 31, 17, 0};
int j[] = {0, 17, 30, 16, 0};
int k[] = {31, 4, 10, 17, 0};
int l[] = {31, 1, 1, 1, 0};
int m[] = {31, 12, 3, 12, 31};
int n[] = {31, 12, 3, 31, 0};
int o[] = {14, 17, 17, 14, 0};
int p[] = {31, 20, 20, 8, 0};
int q[] = {14, 17, 19, 14, 2};
int r[] = {31, 20, 22, 9, 0};
int s[] = {8, 21, 21, 2, 0};
int t[] = {16, 16, 31, 16, 16};
int u[] = {30, 1, 1, 30, 0};
int v[] = {24, 6, 1, 6, 24};
int w[] = {28, 3, 12, 3, 28};
int x[] = {17, 10, 4, 10, 17};
int y[] = {17, 10, 4, 8, 16};
int z[] = {19, 21, 21, 25, 0};

int eos[] = {0, 1, 0, 0, 0};
int excl[] = {0, 29, 0, 0, 0};
int ques[] = {8, 19, 20, 8, 0};

void displayLine(int line)
{
int myline;
myline = line;
if (myline&gt;=16) {digitalWrite(LED1, HIGH); myline-=16;} else {digitalWrite(LED1, LOW);}
if (myline&gt;=8) {digitalWrite(LED2, HIGH); myline-=8;} else {digitalWrite(LED2, LOW);}
if (myline&gt;=4) {digitalWrite(LED3, HIGH); myline-=4;} else {digitalWrite(LED3, LOW);}
if (myline&gt;=2) {digitalWrite(LED4, HIGH); myline-=2;} else {digitalWrite(LED4, LOW);}
if (myline&gt;=1) {digitalWrite(LED5, HIGH); myline-=1;} else {digitalWrite(LED5, LOW);}
}

void displayChar(char c2)
{
if (c2 == 'a'){for (int i = 0; i &lt;5; i++){displayLine(a[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'b'){for (int i = 0; i &lt;5; i++){displayLine(b[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'c'){for (int i = 0; i &lt;5; i++){displayLine(c[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'd'){for (int i = 0; i &lt;5; i++){displayLine(d[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'e'){for (int i = 0; i &lt;5; i++){displayLine(e[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'f'){for (int i = 0; i &lt;5; i++){displayLine(f[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'g'){for (int i = 0; i &lt;5; i++){displayLine(g[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'h'){for (int i = 0; i &lt;5; i++){displayLine(h[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'i'){for (int it = 0; it &lt;5; it++){displayLine(i[it]);delay(delayTime);}displayLine(0);}
if (c2 == 'j'){for (int i = 0; i &lt;5; i++){displayLine(j[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'k'){for (int i = 0; i &lt;5; i++){displayLine(k[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'l'){for (int i = 0; i &lt;5; i++){displayLine(l[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'm'){for (int i = 0; i &lt;5; i++){displayLine(m[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'n'){for (int i = 0; i &lt;5; i++){displayLine(n[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'o'){for (int i = 0; i &lt;5; i++){displayLine(o[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'p'){for (int i = 0; i &lt;5; i++){displayLine(p[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'q'){for (int i = 0; i &lt;5; i++){displayLine(q[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'r'){for (int i = 0; i &lt;5; i++){displayLine(r[i]);delay(delayTime);}displayLine(0);}
if (c2 == 's'){for (int i = 0; i &lt;5; i++){displayLine(s[i]);delay(delayTime);}displayLine(0);}
if (c2 == 't'){for (int i = 0; i &lt;5; i++){displayLine(t[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'u'){for (int i = 0; i &lt;5; i++){displayLine(u[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'v'){for (int i = 0; i &lt;5; i++){displayLine(v[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'w'){for (int i = 0; i &lt;5; i++){displayLine(w[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'x'){for (int i = 0; i &lt;5; i++){displayLine(x[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'y'){for (int i = 0; i &lt;5; i++){displayLine(y[i]);delay(delayTime);}displayLine(0);}
if (c2 == 'z'){for (int i = 0; i &lt;5; i++){displayLine(z[i]);delay(delayTime);}displayLine(0);}
if (c2 == '!'){for (int i = 0; i &lt;5; i++){displayLine(excl[i]);delay(delayTime);}displayLine(0);}
if (c2 == '?'){for (int i = 0; i &lt;5; i++){displayLine(ques[i]);delay(delayTime);}displayLine(0);}
if (c2 == '.'){for (int i = 0; i &lt;5; i++){displayLine(eos[i]);delay(delayTime);}displayLine(0);}
delay(charBreak);
}

void displayString(char* s)
{
for (int i = 0; i&lt;=strlen(s); i++)
{
displayChar(s[i]);
}
}

void loop()
{
displayString("techfreak.pl........");
}

</pre>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini0.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini2.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini3.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini4.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini5.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini6.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini7.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini8.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2014/06/techfreakpl_simple_pov_arduino_pro_mini9.jpg