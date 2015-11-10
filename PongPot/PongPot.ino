int percentage = 0;

void setup() {
  Serial.begin(9600);
  pinMode(A0, INPUT);
  pinMode(A5, INPUT);
}

void loop() {
  delay(10);
  //Serial.println(analogRead(A5));
  
  //Serial.write('C');
  Serial.write(map(analogRead(A0), 723, 1023, 0, 100));
  Serial.println(map(analogRead(A5), 664, 1023, 0, 100));
  
  //Lower Value 724, Upper Value 1023
}
