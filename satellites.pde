// adapted from my spirograph example

int angle = 0;

// Earth color
int earthInit = 80; // initial g value for the rgb colour of Earth / centre circle
int increment = 1; // g value default increment is set to 1 (colour pulses between blue-green)

// Randomise opacity of moons
color moon = color(0, 0, 0, random(5, 240));
color moon2 = color(0, 0, 0, random(5, 240));


void setup() {
  size(700, 700);
  background(50, 50, 100);
  noStroke();
}

void draw() {

  earthInit+=increment; // for pulsing colour of Earth
  color earth = color(50, earthInit, 240); // set r and b values to constants, so only the g value changes for pretty blue/green colours
  background(50, 50, 100);

// when colour of earth is green, change colour back to blue
  if (earthInit == 200) {
    increment = -1;
  } 
// when colour of earth is blue, change colour back to green
  if (earthInit == 80) {
    increment = 1;
  }

// center earth
  translate(width/2, height/2);

  for (int i = 0; i < 3; i++) {
    switch(i) {
    case 0:
      fill(earth);
      break;
    case 1:
      fill(moon);
      break;
    case 2:
      fill(moon2);
      break;
    }

    rotate(radians(angle));
    ellipse(0, 150*i, 150-i*50, 150-i*50);
  }

  angle+=1;
  println(earthInit);
  frameRate(60); 
}