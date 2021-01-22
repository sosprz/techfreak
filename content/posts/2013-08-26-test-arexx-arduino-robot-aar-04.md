---
title: Test Arexx Arduino Robot AAR-04
author: Przemek
type: post
date: 2013-08-26T05:41:59+00:00
url: /test-arexx-arduino-robot-aar-04/
featured_image: /wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-151.jpg
hits:
  - 2878
dsq_thread_id:
  - 1647587175
categories:
  - Elektronika
tags:
  - Android
  - arduino
  - bluetooth
  - roboty

---
[<img class="aligncenter size-full wp-image-4767" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-15.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-15" width="1000" height="500" />][1]  
**Robot Arduino AAR-04** to złożony gotowy do użycia elektroniczny pojazd napędzany dwoma kołami którymi można dowolnie sterować. Już Na tym etapie kontroli, użytkownik doznaje wiele przyjemności z tworzenia własnego jeżdżącego robota. Zamontowane na przedzie fototranzystory zwiększają możliwości poruszania się do tego stopnia, że staje się on autonomicznym pojazdem. Robot jest wyposażony w procesor **ATmega328P** który nie tylko steruje sinikami i odbiera informacje od sensorów ale i posiada wyprowadzenia które można wykorzystać w dowolny sposób. I tu zaczyna się cała zabawa która dzięki prostemu programowaniu przy pomocy platformy Arduino i przykładowym programom stwarza wiele możliwości nawet dla początkujących.

<!--more-->

### Specyfikacja:

  * 2x silniki 3V
  * Procesor ATmega328P (14 wyjść cyfrowych i 7 analogowych)
  * Układ do komunikacji poprzez USB FT232 IC
  * Układ sterujący silnikami L293D (H-bridge sterowany z procesora ATmega pozwala na zmianę polaryzacji silników)
  * Odomtery zainstalowane przy każdej zębatce napędzającej koło. Można mierzyć np. przebytą drogę na podstawie zliczonych impulsów.
  * Język programowania ARDUINO
  * Zasilanie 4 x baterie AAA (6 Volt)
  * Komunikacja poprzez port USB
  * Moduły rozszerzeń kompatybilne z ASURO (poprzednia generacja Robota jerzdzącego)
  * [*]Wymiary 40 mm x 120 mm x 180 mm

### <span style="line-height: 1.5em;">Opis i uruchomienie:</span>

Produkt jest dobrze zabezpieczony przed uszkodzeniem w transporcie a dostawa jak zawsze kurierem. Robot znajdował się w całkiem fajnym pudełku a dodatkowo znajdował się w plastikowym opakowaniu zabezpieczającym. W pudełku znajduje się złożony robot, płyta CD z przykładowymi programami i plikami PDF oraz oprogramowanie <a title="Arduino" href="http://www.arduino.cc/" target="_blank">Arduino</a>.

[<img class="aligncenter size-full wp-image-4774" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-0.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-0" width="1000" height="500" />][2] [<img class="aligncenter size-full wp-image-4773" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-1.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-1" width="1000" height="500" />][3] [<img class="aligncenter size-full wp-image-4772" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-10.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-10" width="1000" height="500" />][4] [<img class="aligncenter size-full wp-image-4771" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-11.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-11" width="1000" height="500" />][5] [<img class="aligncenter size-full wp-image-4770" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-12.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-12" width="1000" height="500" />][6] [<img class="aligncenter size-full wp-image-4769" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-13.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-13" width="1000" height="1333" />][7] [<img class="aligncenter size-full wp-image-4768" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-14.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-14" width="1000" height="1333" />][8]

### Arduino

Robota uruchamia się poprzez podłączenia zasilania (4 baterie AAA) i podłączenie go do komputera poprzez kabel USB który jest w zestawie. Na początku nie jest potrzebne zasilanie z baterii, jeśli użytkownik chce uruchamiać proste programy takie jak np. migająca dioda. Wtedy zasilanie odbywa się poprzez port USB komputera.



### Wygląd

Arduino robot AAR-04 to tak naprawdę <a href="http://arduino.cc/en/Main/arduinoBoardDuemilanove" target="_blank">standardowa płytka Arduino Duemilanove</a> bez regulatora napięcia na 5V, na kółkach. Trzecim przednim kołem jest metalowa kulka która nadaje całości ciężar, stabilizuje i hałasuje. Poniżej można zobaczyć parę fotek z bliska.

[<img class="aligncenter size-full wp-image-4775" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-16.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-16" width="1000" height="500" />][9] [<img class="aligncenter size-full wp-image-4777" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-8.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-8" width="1000" height="500" />][10] [<img class="aligncenter size-full wp-image-4778" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-6.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-6" width="1000" height="500" />][11] [<img class="aligncenter size-full wp-image-4779" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-5.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-5" width="1000" height="500" />][12] [<img class="aligncenter size-full wp-image-4782" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-2.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-2" width="1000" height="500" />][13] [<img class="aligncenter size-full wp-image-4781" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-3.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-3" width="1000" height="500" />][14] [<img class="aligncenter size-full wp-image-4780" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-4.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-4" width="1000" height="500" />][15] [<img class="aligncenter size-full wp-image-4776" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-151.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-15" width="1000" height="500" />][16]

### <span style="line-height: 1.5em;">Testy</span>

Testy rozpocząłem od przejrzenia CD. Na płycie dostępne są programy testowe i dokumentacja. W folderze Examples zainteresowały mnie dwa katalogi które mówiły same za siebie \_04\_move i \_05\_Line\_follow. Czyli programy testowe które miały w parę sekund ożywić robota. O ile program move działał. Trzeba było w nim tylko zmienić czasy działania silników na mniejsze, ponieważ nie starczało miejsca w salonie na ruchy robota. To Line\_follow w ogóle nie działał. Nie łapał żądnej linii. Linie rysowałem markerem i tworzyłem przy pomocy czarnej taśmy klejącej. Jak na dwa programy z których ten najefektowniejszy nie działa, pomyślałem że to nie dobrze. Nie zastanawiając się długo zamówiłem moduł Bluetooth i czujnik odległości. Razem ok 50 zł.

Przeglądając zawartość płyty znalazłem plik Bluetooth_AAR.apk, program do sterowana Robotem Arduino na Androida. Była to świetna wiadomość ze względu na wcześniejsze zakupy.

Czekając już prawie drugi tydzień na części z chin (bo taniej). Postanowiłem zacząć pisać programy do testów. Nie dawał mi spokoju [B]line follow[/B] który nie działał. A w końcu napisałem go sam. Bardzo pomocny stał się program [B]self_test[/B] w którym wszystkie główne funkcje takie jak wykrywanie czarnego pola lub sterowanie silnikami są podane na tacy, trzeba tylko umieć te funkcje poskładać w jedną całość. Gdy już opanowałem podążanie za linią, pomyślałem że wykrywanie czarnego pola i zawracanie to będzie fajne zajęcie dla robota. Zobaczcie wszystkie trzy programy o których wspomniałem powyżej.

Proste poruszanie się



Podążanie wzdłuż linii



Wykrywanie i zawracanie

  
Po tych testach byłem zadowolony z efektów bo robot sprawiał frajdę nawet jeśli odpalało się go na parę sekund aby popatrzeć jak podąża za linią. Niby podąża ale mógłby szybciej&#8230; Tu trzeba było by się pobawić kodem. Nawet po skończonym &#8222;celu&#8221; można dopracowywać swoje dzieła i tworzyć nowe funkcje, trasy itd. a to tylko foto tranzystor i dwa silniki.

No właśnie co z BT i czujnikiem odległości? Bluetooth doszedł czujnik nie..

Aby podłączyć moduł Bluetooth musiałem znaleźć 3.3V, GND i dwa cyfrowe porty aby emulować RX,TX (odbieranie, wysyłanie). Emulować, bo nie mogę w tym samym czasie programować robota i odbierać/wysyłać danych z bluetooth na tych samych pinach na procesorze.

[<img class="aligncenter size-full wp-image-4783" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-7.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-7" width="1000" height="500" />][17]

### Android

Po podłączeniu czas na aplikację na Androida. Okazało się że program wysyła komendy f = 8, b = 2, s = 5, l = 4, r = 6. Czyli programowanie nie było trudne trzeba było przypisać komendy jak w przypadku programu **move** pod odpowiednie cyfry. I sterowanie poprzez bluetooth gotowe. Poniżej zrzut z telefonu aby pokazać jak wygląda program do sterowania.

<p style="text-align: center;">
  <a href="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-9.jpg"><img class="aligncenter  wp-image-4784" src="http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-9.jpg" alt="techfreak_pl_Arduino-Robot_AAR-04_9-9" width="277" height="461" /></a>
</p>

Sterowanie poprzez Bluetooth



### Podsumowanie

Robot jest fajną opcją dla początkujących którzy szukają gotowej platformy podłącz i programuj. Praktycznie nie trzeba tu lutować a główny cel to pisanie programów w C. Oprócz modułu bluetooth można zastosować, serwa lub sterowanie poprzez diodę IR. Fajną opcja było by poruszanie się za pomocą czujnika odległości lub podłączenie wyświetlacza na którym wyświetlało by się np. odległość od obiektu lub temperaturę. Naprawdę możliwość są nie ograniczone.

Minusy

  * hałas metalowej kulki przy poruszaniu
  * mała liczba dostępnych wyjść 2 analogowe i 2 cyfrowe
  * brak regulatora napięcia na 5V
  * koszyk na baterie AAA. AA też by weszły

<span style="line-height: 1.5em;">Plusy</span>

  * Integralna platforma procesor, silniki, układy na jednej płycie
  * łatwe programowanie dzięki Arduino

Link do produktu [http://www.conrad.pl/Robot-Arduino&#8212;programowalny-Arexx-AAR][18]

### EDIT:

W końcu doszedł ultradźwiękowy moduł pomiaru odległości HC-SR04 i mogłem przetestować jak działa z robotem.



### Programy dla Arduino

move

<pre>/*
Arduino-Roboter AAR-04 move techfreak.pl dla conrad.pl
*/

/*
Name project: Example 4, RP6 Motor control
Author: Egbert Koerhuis
Company: Arexx Engineering
Discription:
This Example Program shows how to control the Motors.
Make sure that the AAR can __NOT__ move when uploading the program!
After uploading the program, the AAR will wait 2 seconds before the program start.

&gt;&gt;&gt; DO NOT FORGET TO REMOVE THE USB CABLE, after uploading the program.

ATTENTION: THE ROBOT MOVES AROUND IN THIS EXAMPLE! PLEASE PROVIDE ABOUT
1m x 1m OR MORE FREE SPACE FOR THE ROBOT!

You are free to change the code!
*/

void setup()
{
//Setup: Initalization
//pin 10 left foreward
pinMode(10, OUTPUT);
//pin 9 left backward
pinMode(9, OUTPUT);
//pin 5 right foreward
pinMode(5, OUTPUT);
//pin 6 right backward
pinMode(6, OUTPUT);

//Then set the start value of the signals to zero:
analogWrite(9, 0);
analogWrite(10, 0);
analogWrite(5, 0);
analogWrite(6, 0);

//Startup delay:
delay(2000);

}

void loop()
{
digitalWrite(9,LOW); analogWrite(10,200); //##set pin 9 to ground!## set speed left motor 200 foreward
digitalWrite(5,LOW); analogWrite(6,200); //##set pin 6 to ground!## set speed right motor 200 foreward
delay(500); //drive for 5000ms
digitalWrite(9,LOW); analogWrite(10,200); //##set pin 9 to ground!## set speed left motor 200 foreward
digitalWrite(6,LOW); digitalWrite(5,LOW); //make a left turn
delay(500); //drive for 5000ms
digitalWrite(10,LOW); analogWrite(9,200); //##set pin 10 to ground!## set speed left motor 200 backward
digitalWrite(6,LOW); analogWrite(5,200); //##set pin 5 to ground!## set speed right motor 200 backward
delay(500); //drive for 5000ms
digitalWrite(5,LOW); analogWrite(6,200); //##set pin 5 to ground!## set speed right motor 200 backward
digitalWrite(9,LOW); digitalWrite(10,LOW); //make a right turn
delay(500); //drive for 5000ms
digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors
}</pre>

serach and back

<pre>/*
Arduino-Roboter AAR-04 line_end techfreak.pl dla conrad.pl
*/

void setup()    
{
  //Setup: Initalization 
  //pin 10 left foreward
  pinMode(10, OUTPUT);
  //pin 9 left backward
  pinMode(9, OUTPUT);
  //pin 5 right foreward
  pinMode(5, OUTPUT);
  //pin 6 right backward
  pinMode(6, OUTPUT);
  //led
  pinMode(7,OUTPUT);

  //Then set the start value of the signals to zero: 
  analogWrite(9, 0);   
  analogWrite(10, 0);   
  analogWrite(5, 0);   
  analogWrite(6, 0);
  Serial.begin(9600);
  Serial.print("\ntechfreak.pl - Test Robota AREXX dla conrad.pl\n"); 
  digitalWrite(7,HIGH);  
  //Startup delay:
  delay(2000);

}

void square(){
  int left=0;
  int right=0;
  left = analogRead(A6);
  right = analogRead(A7);

  digitalWrite(10,LOW); analogWrite(9,100); //##set pin 10 to ground!## set speed left motor 200 backward 
  digitalWrite(6,LOW); analogWrite(5,100);  //##set pin 5 to ground!## set speed right motor 200 backward
  delay(1);

  if(left &lt; 200 || right &lt; 200){                         
  Serial.print("LEFT: BLACK    ");
    digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
    digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors   
    delay(10);
    digitalWrite(9,LOW); analogWrite(10,200); //##set pin 9 to ground!## set speed left motor 200 foreward
    digitalWrite(6,LOW); digitalWrite(5,LOW); //make a left turn
    delay(400);
  }
}

void loop()
{
square();
}</pre>

line follower / tracker

<pre>/*
Arduino-Roboter AAR-04 linesensor/linetracker techfreak.pl dla conrad.pl
*/

void setup()    
{
  //Setup: Initalization 
  //pin 10 left foreward
  pinMode(10, OUTPUT);
  //pin 9 left backward
  pinMode(9, OUTPUT);
  //pin 5 right foreward
  pinMode(5, OUTPUT);
  //pin 6 right backward
  pinMode(6, OUTPUT);
  //led
  pinMode(7,OUTPUT);

  //Then set the start value of the signals to zero: 
  analogWrite(9, 0);   
  analogWrite(10, 0);   
  analogWrite(5, 0);   
  analogWrite(6, 0);
  Serial.begin(9600);
  Serial.print("\ntechfreak.pl - Test Robota AREXX dla conrad.pl\n"); 
  digitalWrite(7,HIGH);  
  //Startup delay:
  delay(2000);

}
void l(){
 digitalWrite(10,LOW); analogWrite(9,100); //##set pin 9 to ground!## set speed left motor 200 foreward
 digitalWrite(6,LOW); digitalWrite(5,LOW); //make a left turn
 delay(10);
}
void r(){
 digitalWrite(6,LOW); analogWrite(5,100); //##set pin 5 to ground!## set speed right motor 200 backward
 digitalWrite(9,LOW); digitalWrite(10,LOW); //make a right turn
 delay(10);
}

void linesensor(){
  int left=0;
  int right=0;
  left = analogRead(A6);
  right = analogRead(A7);

  if(left &lt; 150){                         
      Serial.print("LEFT: BLACK    ");
r();
      }
      else {
        Serial.print("LEFT: WHITE    ");
      //delay(10);
      }

 if(right &lt; 150){                         
      Serial.print("RIGHT: BLACK    \n");
l();
      }
      else {
        Serial.print("RIGHT: WHITE    \n");
        //delay(10);

      }

}

void loop()
{

   linesensor();

}</pre>

sterowanie poprzez bluetooth

<pre>/*
Arduino-Roboter AAR-04 bluetooth control techfreak.pl dla conrad.pl
*/

#include 
SoftwareSerial mySerial(8, 4); // RX, TX
char incomingByte;
void setup()  
{
   pinMode(10, OUTPUT);
  //pin 9 left backward
  pinMode(9, OUTPUT);
  //pin 5 right foreward
  pinMode(5, OUTPUT);
  //pin 6 right backward
  pinMode(6, OUTPUT);
  //Then set the start value of the signals to zero: 
  analogWrite(9, 0);   
  analogWrite(10, 0);   
  analogWrite(5, 0);   
  analogWrite(6, 0);
// Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
  ; // wait for serial port to connect. Needed for Leonardo only
 }
  Serial.println("hello USB");
 // set the data rate for the SoftwareSerial port
  mySerial.begin(9600);
 mySerial.println("Hello, BT");
}
void loop() // run over and over
{
  if (mySerial.available())
   Serial.write(mySerial.read());
  if (Serial.available())
    mySerial.write(Serial.read());
  digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
  digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors   
  if (mySerial.available() &gt; 0) {          // if received UART data
    incomingByte = mySerial.read();        // raed byte
     if(incomingByte == '8') { 
      digitalWrite(10,LOW); analogWrite(9,200); //##set pin 10 to ground!## set speed left motor 200 backward 
      digitalWrite(6,LOW); analogWrite(5,200);  //##set pin 5 to ground!## set speed right motor 200 backward       
                delay(500);     }
    if(incomingByte == '4') { 
    digitalWrite(9,LOW); analogWrite(10,200); //##set pin 9 to ground!## set speed left motor 200 foreward
   digitalWrite(6,LOW); digitalWrite(5,LOW); //make a left turn
    delay(500);     }
     if(incomingByte == '2') { 
      digitalWrite(9,LOW); analogWrite(10,200); //##set pin 9 to ground!## set speed left motor 200 foreward 
      digitalWrite(5,LOW); analogWrite(6,200);  //##set pin 6 to ground!## set speed right motor 200 foreward 
    delay(500);     }
      if(incomingByte == '6') {
       digitalWrite(5,LOW); analogWrite(6,200); //##set pin 5 to ground!## set speed right motor 200 backward
   digitalWrite(9,LOW); digitalWrite(10,LOW); //make a right turn
    delay(500);     }
      if(incomingByte == '5') {
       digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
   digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors   
      }
   }
}</pre>

HC-SR04

<pre>*
 HC-SR04 Ping distance sensor:
 VCC to arduino 5v 
 GND to arduino GND
 Echo to Arduino pin 7 
 Trig to Arduino pin 8
 
 This sketch originates from Virtualmix: http://goo.gl/kJ8Gl
 Has been modified by Winkle ink here: http://winkleink.blogspot.com.au/2012/05/arduino-hc-sr04-ultrasonic-distance.html
 And modified further by ScottC here: http://arduinobasics.blogspot.com/
 on 10 Nov 2012.
 */

#define echoPin 4 // Echo Pin
#define trigPin 8 // Trigger Pin
#define LEDPin 13 // Onboard LED

int maximumRange = 20; // Maximum range needed
int minimumRange = 0; // Minimum range needed
long duration, distance; // Duration used to calculate distance

int randNumber = 0;

void setup() {
 Serial.begin (9600);
 pinMode(trigPin, OUTPUT);
 pinMode(echoPin, INPUT);
 pinMode(LEDPin, OUTPUT); // Use LED indicator (if required)
 
 //Setup: Initalization 
 //pin 10 left foreward
 pinMode(10, OUTPUT);
 //pin 9 left backward
 pinMode(9, OUTPUT);
 //pin 5 right foreward
 pinMode(5, OUTPUT);
 //pin 6 right backward
 pinMode(6, OUTPUT);

 //Then set the start value of the signals to zero: 
 analogWrite(9, 0);   
 analogWrite(10, 0);   
 analogWrite(5, 0);   
 analogWrite(6, 0);
 Serial.begin(9600);
 Serial.print("\ntechfreak.pl - Test Robota AREXX dla conrad.pl\n"); 
 digitalWrite(7,HIGH);  
 //Startup delay:
 delay(2000);

 
}

 void loop() {
 /* The following trigPin/echoPin cycle is used to determine the
 distance of the nearest object by bouncing soundwaves off of it. */ 
 digitalWrite(trigPin, LOW); 
 delayMicroseconds(2); 

 digitalWrite(trigPin, HIGH);
 delayMicroseconds(10); 
 
 digitalWrite(trigPin, LOW);
 duration = pulseIn(echoPin, HIGH);
 
 //Calculate the distance (in cm) based on the speed of sound.
 distance = duration/58.2;
 randNumber = 0;

 if (distance &lt;= maximumRange ){
 /* Send a negative number to computer and Turn LED ON 
 to indicate "out of range" */
 Serial.println("-1");
 digitalWrite(LEDPin, HIGH); 
 
// digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
// digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors   
// delay(10);
 //digitalWrite(9,LOW); analogWrite(10,200); // foreward 
// digitalWrite(5,LOW); analogWrite(6,200);  // foreward 
 //delay(10);
 
 digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
 digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors  
 delay(10);
 digitalWrite(9,LOW); analogWrite(10,200); // left motor foreward
 digitalWrite(6,LOW); digitalWrite(5,LOW); //make a left turn
 delay(500); 
 digitalWrite(6,LOW); digitalWrite(5,LOW); //stop motors
 digitalWrite(9,LOW); digitalWrite(10,LOW); //stop motors 
 }

 else {
 /* Send the distance to the computer using Serial protocol, and
 turn LED OFF to indicate successful reading. */
 Serial.println(distance);
 digitalWrite(LEDPin, LOW); 
 
 //forward
 
 digitalWrite(10,LOW); analogWrite(9,200); //##set pin 10 to ground!## set speed left motor 200 backward 
 digitalWrite(6,LOW); analogWrite(5,200);  //##set pin 5 to ground!## set speed right motor 200 backward       
 //delay(10);
 
 }
 
 //Delay 50ms before next reading.
 delay(10);
}
</pre>

 [1]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-15.jpg
 [2]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-0.jpg
 [3]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-1.jpg
 [4]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-10.jpg
 [5]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-11.jpg
 [6]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-12.jpg
 [7]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-13.jpg
 [8]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-14.jpg
 [9]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-16.jpg
 [10]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-8.jpg
 [11]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-6.jpg
 [12]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-5.jpg
 [13]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-2.jpg
 [14]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-3.jpg
 [15]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-4.jpg
 [16]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-151.jpg
 [17]: http://techfreak.pl/wp-content/uploads/2013/08/techfreak_pl_Arduino-Robot_AAR-04_9-7.jpg
 [18]: http://www.conrad.pl/Robot-Arduino---programowalny-Arexx-AAR-04.htm?websale7=conrad&pi=191694&Ctx=%7Bver%2F7%2Fver%7D%7Bst%2F3ec%2Fst%7D%7Bcmd%2F0%2Fcmd%7D%7Bm%2Fwebsale%2Fm%7D%7Bs%2Fconrad%2Fs%7D%7Bl%2F01-aa%2Fl%7D%7Bsf%2F%3Cs1%3E191694+%A0%A0%A0%3C%2Fs1%3E%2Fsf%7D%7Bp1%2F63972bf2c9596268ac8fea03b5d7a941%2Fp1%7D%7Bmd5%2F06629330f4abbf962ee7952d4c913b76%2Fmd5%7D