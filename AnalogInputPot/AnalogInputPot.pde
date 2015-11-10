import processing.serial.*;

float[] input= {0, 0};
float w;
float h;
Serial port;
int ui = 0;
int inByte = 0;

void setup() {
  printArray(Serial.list());
  port = new Serial(this, Serial.list()[2], 9600);
  size(700, 700); 
  w = width;
  h = height;
  ui = 0;
  inByte = port.read();
  if (inByte == 'C') {
    while (ui < 2) {
      input[ui] = port.read();
      ui++;
    }
  }
}

void draw() {
  background(255);
  ui = 0;
  inByte = port.read();
  if (inByte == 'C') {
    while (ui < 2) {
      if(port.read() > 10) {
      input[ui] = port.read();
      }
      ui++;
    }
  }
  runit(input[0], 0);
  runit(input[1], w - (w/9.4));
  fill(0);
  noStroke();
  rect(0, input[0] * (h-h/5)/100, w/20, h/5);
  rect(w-w/20, input[1] * (h-h/5)/100, w/20, h/5);
}

void runit(float which, float halal) {
  pushMatrix();
  translate(halal, 0);
  scale(0.1, 0.1);
  fill(179, 124, 5);
  noStroke();

  //Body
  ellipse(w/2, h/2+h/10, w-(w/5), h-(h/5));
  rect(w/10, h/8, 4*w/5, 1.25*h/5, 0.03*((w+h)/2));
  fill(255);
  stroke(100);
  strokeWeight(w/50);

  //Leads
  ellipse(w/4, h/4, w/8, h/8);
  ellipse(w/2, h/4, w/8, h/8);
  ellipse(3*w/4, h/4, w/8, h/8);
  line(w/3, h/9, w/6, h/9);
  line(w/3+w/4, h/9, w/6+w/4, h/9);
  line(w/3+w/2, h/9, w/6+w/2, h/9);
  fill(100);
  noStroke();
  ellipse(w/2, h/1.7, w/3, h/3);
  stroke(100);
  strokeWeight(2);



  //Knob
  pushMatrix();
  translate(w/2, h/1.7);
  rotate(which/18 + 0.5);
  for (float i = 0; i < 3.0; i += 0.2) {
    pushMatrix();
    rotate(i);
    strokeWeight(8);
    line(-w/6, 0, w/6, 0);
    popMatrix();
  }
  stroke(0);
  strokeWeight(24);
  line(-w/7, 0, w/7, 0);
  popMatrix();
  popMatrix();
}