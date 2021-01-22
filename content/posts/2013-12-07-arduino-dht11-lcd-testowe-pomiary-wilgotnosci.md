---
title: Arduino DHT11 LCD testowe pomiary wilgotności
author: Przemek
type: post
date: 2013-12-07T21:09:48+00:00
url: /arduino-dht11-lcd-testowe-pomiary-wilgotnosci/
featured_image: /wp-content/uploads/2013/12/IMG_20131207_212440_1.jpg
hits:
  - 2261
dsq_thread_id:
  - 2033667653
colormag_page_layout:
  - default_layout
categories:
  - Elektronika
tags:
  - arduino
  - Raspberry pi

---
Nawiązując do nowej funkcji nettempa, czyli obsługi czujników wilgotności DHT11, musiałem sobie zbudować tester takich czujników. Najlepiej na Arduino, więc zobaczcie jak to zrobiłem.

<!--more-->

<a href="http://www.banggood.com/Wholesale-Arduino-Compatible-R3-UNO-ATmega16U2-AVR-USB-Board-p-68537.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling" target="_blank" rel="noopener">Arduino</a> i <a href="http://www.banggood.com/Keypad-Shield-Blue-Backlight-For-Arduino-Robot-LCD-1602-Board-p-79326.html?p=9H0114137951201303E0&utm_campaign=techfreak&utm_content=chendongling" target="_blank" rel="noopener">LCD 2&#215;16 shield</a> to fajna sprawa, dzięki takim kanapkom można łatwo i fajnie ożywić swój projekt. Ja dołączyłem jeszcze do tego czujnik temperatury i wilgotności DHT11.

[<img class="aligncenter size-full wp-image-5528" src="http://techfreak.pl/wp-content/uploads/2013/12/IMG_20131207_193003_1.jpg" alt="IMG_20131207_193003_1" width="1000" height="500" />][1] [<img class="aligncenter size-full wp-image-5527" src="http://techfreak.pl/wp-content/uploads/2013/12/IMG_20131207_202340_1.jpg" alt="IMG_20131207_202340_1" width="1000" height="500" />][2]

Hardware jest ale potrzeby był jeszcze program dla Arduino. Trochę pogooglałem i dopiero po jakimś czasie znalazłem fajny wsad który dobrze działa z DHT11 i odczytuje go co dwie sekundy bez błędów. Link do wątku na <a href="http://forum.arduino.cc/index.php?topic=107553.0" target="_blank" rel="noopener">forum arduino</a>. A ja go trochę zmodyfikowałem dodając obsługę LCD shielda, tak aby wyświetlał wyniki w dwóch liniach. Naprawdę nic trudnego. Kod poniżej.

<pre><span style="color: #7e7e7e;">/*  DHT11 Example Sketch Code for reading the sensor without delay on your program!</span>
<span style="color: #7e7e7e;"> Example Code by: Nick Athanasoulas</span>
<span style="color: #7e7e7e;"> Date: 27/5/2012</span>
<span style="color: #7e7e7e;"> FUNCTION: It reads the sensor every 2 seconds without delays.</span>
<span style="color: #7e7e7e;"> The user can also use the temperature and humidity values directly as an integer </span>
<span style="color: #7e7e7e;"> and compare it to other values without making new arrays.</span>
<span style="color: #7e7e7e;"> Date; 07/12/2013 add LCD2x16 techfreak.pl</span>
<span style="color: #7e7e7e;"> */</span>

#include &lt;<span style="color: #cc6600;">LiquidCrystal</span>.h&gt;

#define DHT11_PIN 4      <span style="color: #7e7e7e;">// ADC0  Define the ANALOG Pin connected to DHT11 Sensor</span>
<span style="color: #cc6600;">int</span> temp1[3];                <span style="color: #7e7e7e;">//Temp1, temp2, hum1 & hum2 are the final integer values that you are going to use in your program. </span>
<span style="color: #cc6600;">int</span> temp2[3];                <span style="color: #7e7e7e;">// They update every 2 seconds.</span>
<span style="color: #cc6600;">int</span> hum1[3];
<span style="color: #cc6600;">int</span> hum2[3];

<span style="color: #cc6600;">byte</span> read_dht11_dat()
{
  <span style="color: #cc6600;">byte</span> i = 0;
  <span style="color: #cc6600;">byte</span> result=0;
  <span style="color: #cc6600;">for</span>(i=0; i&lt; 8; i++){

    <span style="color: #cc6600;">while</span>(!(PINC & _BV(DHT11_PIN)));  <span style="color: #7e7e7e;">// wait for 50us</span>
    <span style="color: #cc6600;">delayMicroseconds</span>(30);

    <span style="color: #cc6600;">if</span>(PINC & _BV(DHT11_PIN)) 
      result |=(1&lt;&lt;(7-i));
    <span style="color: #cc6600;">while</span>((PINC & _BV(DHT11_PIN)));  <span style="color: #7e7e7e;">// wait '1' finish</span>

  }
  <span style="color: #cc6600;">return</span> result;
}

<span style="color: #cc6600;">long</span> dht11delay_previousMillis = 0;        <span style="color: #7e7e7e;">// will store last time LED was updated</span>
<span style="color: #cc6600;">long</span> dht11delay_interval = 1000;           <span style="color: #7e7e7e;">// dht11delay_interval at which to blink (milliseconds)</span>

<span style="color: #7e7e7e;">// initialize the library with the numbers of the interface pins</span>
<span style="color: #7e7e7e;">//LiquidCrystal lcd(12, 11, 5, 4, 3, 2);</span>
<span style="color: #cc6600;">LiquidCrystal</span> lcd(8, 9, 4, 5, 6, 7);

<span style="color: #cc6600;">void</span> <span style="color: #cc6600;"><b>setup</b></span>()
{
  DDRC |= _BV(DHT11_PIN);
  PORTC |= _BV(DHT11_PIN);

  <span style="color: #7e7e7e;">// set up the LCD's number of columns and rows: </span>
  lcd.<span style="color: #cc6600;">begin</span>(16, 2);

  <span style="color: #cc6600;"><b>Serial</b></span>.<span style="color: #cc6600;">begin</span>(9600);
<span style="color: #cc6600;"><b>Serial</b></span>.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"DHT11 without delay"</span>);
<span style="color: #cc6600;"><b>Serial</b></span>.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"Example code by: Nick Athanasoulas"</span>);
  <span style="color: #cc6600;"><b>Serial</b></span>.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"Ready"</span>);
  <span style="color: #cc6600;">delay</span>(1000);
}

<span style="color: #cc6600;">void</span> <span style="color: #cc6600;"><b>loop</b></span>()
{

  <span style="color: #7e7e7e;">// set the cursor to column 0, line 1</span>
  <span style="color: #7e7e7e;">// (note: line 1 is the second row, since counting begins with 0):</span>
  lcd.<span style="color: #cc6600;">setCursor</span>(0, 1);
  <span style="color: #7e7e7e;">// print the number of seconds since reset:</span>
  <span style="color: #7e7e7e;">//lcd.print(millis()/1000);</span>

  <span style="color: #cc6600;">unsigned</span> <span style="color: #cc6600;">long</span> dht11delay_currentMillis = <span style="color: #cc6600;">millis</span>();

  <span style="color: #cc6600;">if</span>(dht11delay_currentMillis - dht11delay_previousMillis &gt; dht11delay_interval) {
    <span style="color: #7e7e7e;">// save the last time you blinked the LED </span>
    dht11delay_previousMillis = dht11delay_currentMillis;   
    <span style="color: #cc6600;">byte</span> dht11_dat[5];
    <span style="color: #cc6600;">byte</span> dht11_in;
    <span style="color: #cc6600;">byte</span> i;
    <span style="color: #7e7e7e;">// start condition</span>
    <span style="color: #7e7e7e;">// 1. pull-down i/o pin from 18ms</span>
    PORTC &= ~_BV(DHT11_PIN);
    <span style="color: #cc6600;">delay</span>(18);
    PORTC |= _BV(DHT11_PIN);
    <span style="color: #cc6600;">delayMicroseconds</span>(40);

    DDRC &= ~_BV(DHT11_PIN);
    <span style="color: #cc6600;">delayMicroseconds</span>(40);

    dht11_in = PINC & _BV(DHT11_PIN);

    <span style="color: #cc6600;">if</span>(dht11_in){
      lcd.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"dht11 start condition 1 not met"</span>);
      <span style="color: #cc6600;">return</span>;
    }
    <span style="color: #cc6600;">delayMicroseconds</span>(80);

    dht11_in = PINC & _BV(DHT11_PIN);

    <span style="color: #cc6600;">if</span>(!dht11_in){
      lcd.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"dht11 start condition 2 not met"</span>);
      <span style="color: #cc6600;">return</span>;
    }
    <span style="color: #cc6600;">delayMicroseconds</span>(80);
    <span style="color: #7e7e7e;">// now ready for data reception</span>
    <span style="color: #cc6600;">for</span> (i=0; i&lt;5; i++)
      dht11_dat[i] = read_dht11_dat();

    DDRC |= _BV(DHT11_PIN);
    PORTC |= _BV(DHT11_PIN);

    <span style="color: #cc6600;">byte</span> dht11_check_sum = dht11_dat[0]+dht11_dat[1]+dht11_dat[2]+dht11_dat[3];
    <span style="color: #7e7e7e;">// check check_sum</span>
    <span style="color: #cc6600;">if</span>(dht11_dat[4]!= dht11_check_sum)
    {
      lcd.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"DHT11 checksum error"</span>);
    }

lcd.<span style="color: #cc6600;">setCursor</span>(0, 0);
    temp1[0]=dht11_dat[2];
    temp2[0]=dht11_dat[3];
    lcd.<span style="color: #cc6600;">print</span>(<span style="color: #006699;">"Temp: "</span>);
    lcd.<span style="color: #cc6600;">print</span>(temp1[0]);
    lcd.<span style="color: #cc6600;">print</span>(<span style="color: #006699;">"."</span>);
    lcd.<span style="color: #cc6600;">print</span>(temp2[0]);
    lcd.<span style="color: #cc6600;">print</span>(<span style="color: #006699;">" C"</span>);
   <span style="color: #7e7e7e;">// lcd.print("    ");</span>
lcd.<span style="color: #cc6600;">setCursor</span>(1, 1);    
    hum1[0]=dht11_dat[0];
    hum2[0]=dht11_dat[1];
    lcd.<span style="color: #cc6600;">print</span>(<span style="color: #006699;">"Humidity: "</span>);
    lcd.<span style="color: #cc6600;">print</span>(hum1[0]);
    lcd.<span style="color: #cc6600;">print</span>(<span style="color: #006699;">"."</span>);
    lcd.<span style="color: #cc6600;">print</span>(hum2[0]);
    lcd.<span style="color: #cc6600;">println</span>(<span style="color: #006699;">"%"</span>);

  }
}
<span style="color: #7e7e7e;">// END OF CODE</span></pre>

A poniżej odczyty już na LCD.

[<img class="aligncenter size-full wp-image-5526" src="http://techfreak.pl/wp-content/uploads/2013/12/IMG_20131207_212440_1.jpg" alt="IMG_20131207_212440_1" width="1000" height="500" />][3]

Wygląda na to że odczyty są poprawne. A wiec szukam dalej jak usprawnić obsługę w Raspberry Pi i <a href="http://techfreak.pl/nettemp-czujniki-wilgotnosci/" target="_blank" rel="noopener">nettemp</a>.

 [1]: http://techfreak.pl/wp-content/uploads/2013/12/IMG_20131207_193003_1.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/12/IMG_20131207_202340_1.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/12/IMG_20131207_212440_1.jpg