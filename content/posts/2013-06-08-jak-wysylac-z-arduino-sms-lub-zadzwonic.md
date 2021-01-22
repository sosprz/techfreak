---
title: Jak wysyłać z Arduino sms lub zadzwonić ?
author: Przemek
type: post
date: 2013-06-08T19:17:24+00:00
url: /jak-wysylac-z-arduino-sms-lub-zadzwonic/
featured_image: /wp-content/uploads/2013/06/arduino_sms_modem_642_362_force.jpg
hits:
  - 2372
dsq_thread_id:
  - 1378934382
categories:
  - Elektronika
tags:
  - modem

---
Kiedyś wymyśliłem sobie, że napisze alarm do domu na arduino i w zasadzie to zrobiłem ale końcowo nie zainstalowałem go i nie doprowadziłem całości do stanu używalności. Projekt zawierał takie funkcje jak kontrola dostępu na rfid i powiadamianie SMS. I właśnie dziś chciałbym pokazać jak kiedyś zaprogramowałem arduino aby wysyłało do mnie sms lub dzwoniło.

<!--more-->

Do całości użyłem modemu Siemens ES75 bo miał wejście serial. Aby arduino komunikowało się bez problemu z modemem musiałem pomiędzy wstawić konwerter napięć max232N.

#### Fimik jak Arduino sms&#8217;uje i puszcza sygnał.

Na poniższym filmiku Arduino wysyła sms z tekstem: &#8222;Arduino Test&#8221;, po czym puszcza sygnał.



#### Program dla Arduino

Jest to przerobiony skrypt z <http://arduino.cc/en/tutorial/button> tak aby po naciśnięciu guzika modem wykonał funkcje send_sms i call, no i zapalał diodkę. Na pewno łatwo go przerobić na własne potrzeby np.  tylko dzwoni, lub tylko sms&#8217;uje.

<pre>const int buttonPin = 2; // guzik
const int ledPin = 13; // led
int count = 0;
int buttonState = 0; // stan guzika
void setup() {
 pinMode(ledPin, OUTPUT); 
 pinMode(buttonPin, INPUT); 
 Serial.begin(115200); //seriall speed
}
void send_sms() {
 digitalWrite(ledPin, HIGH);
 Serial.print("\r");
 delay(1000); 
 Serial.print("AT+CMGF=1\r"); 
 delay(2000);
 Serial.print("AT+CMGS=\"777888999\"\r"); //numer
 delay(2000);
 Serial.print("Arduino Test\r"); //tekst SMS
 delay(2000);
 Serial.write(0x1A);
 delay(2000); 
}
void call() {
 digitalWrite(ledPin, HIGH);
 Serial.print("\r");
 delay(1000); 
 Serial.println("ATD777888999;"); 
 delay(8000);
 Serial.println("ATH;"); // koniec rozmowy
}
void loop(){
 buttonState = digitalRead(buttonPin);
 if (buttonState == HIGH) { 
 send_sms();
 call();
 } 
 else {
 digitalWrite(ledPin, LOW); 
 }
}</pre>

#### Schemat mojej roboty

Kondensatory jakie użyłem to 10uF na 50V, innych akurat nie miałem.

[<img class="aligncenter size-full wp-image-3569" alt="schemat_arduino_sms_modem" src="http://techfreak.pl/wp-content/uploads/2013/06/schemat_arduino_sms_modem.jpg" width="2196" height="2644" />][1]

#### Zastosowania

Zastosowań może być wiele jak wiele jest pomysłów. Przede wszystkim właśnie alarmy, gdzie zamiast guzika podpinamy się pod wyjścia NC/NO. Innym zastosowaniem może być powiadamianie bezpośrednio z serwera, routera itd, itp&#8230;&#8230;&#8230;..

&nbsp;

 [1]: http://techfreak.pl/wp-content/uploads/2013/06/schemat_arduino_sms_modem.jpg