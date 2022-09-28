/******************************************************************************
* EECE 4510 / 5510 Digital Signal Processing
*
* Sketch to read photo resistor signal on A5. 
* When light from unconnected fluorescent bulb is detected, RF may be present.
* 
* Results are  displayed on 8x2 LCD display
*
* Fred J. Frigo
* Marquette University
* Sep 25, 2022
*
* Kuman 1602 LCD Shield for Arduino:
*
* LCD RS pin to digital pin 8
* LCD Enable pin to digital pin 9
* LCD D4 pin to digital pin 4
* LCD D5 pin to digital pin 5
* LCD D6 pin to digital pin 6
* LCD D7 pin to digital pin 7
******************************************************************************/
#include <LiquidCrystal.h>
// initialize the library with the numbers of the interface pins of LCD display
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
void setup() {
// initialize serial communication at 9600 bits per second:
Serial.begin(9600);
// set up the LCD's number of columns and rows:
lcd.begin(16, 2);
// Print a message to the LCD.
lcd.print("Monitoring...");
}
void loop() {
int sensorValue = analogRead(A5);
// set the cursor to column 0, line 1
// (note: line 1 is the second row, since counting begins with 0):
lcd.setCursor(0, 1);

// Determine the number of digits needed to display
if (sensorValue < 10){
// Sensor value is one digit
lcd.print(" ");
}else if(sensorValue < 100){
// Sensor value is two digits
lcd.print(" ");
}else if(sensorValue < 1000){
lcd.print(" ");
// Sensor value is three digits
}else {
// No spacing needed
}
lcd.print(sensorValue);
delay(500);
}


