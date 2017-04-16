// initial angle in degrees
int angle = 0;

void setup() {
  size(400,400);
  background(220,220,220);
  noFill();
}

void draw() {
  background(220,220,220);
  translate(width/2,height/2); // draw spirogram in centre of screen
  
  for (int i = 0; i < 100; i++) {
    ellipseMode(CORNER);
    rotate(radians(angle));
    ellipse(0,0,100,100);
  }
  
  angle+=1; // increment angle by 1 degree each time draw() is run
  println(angle); // to find out angles for reproducing particularly notable spirograms :)
  frameRate(5);
}