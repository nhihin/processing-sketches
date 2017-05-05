// Create a new ArrayList which will contain all balls / bubbles.
// The ArrayList `balls` is basically a list where each item is an object with the class `Ball`.
ArrayList<Ball> balls = new ArrayList();


void setup() {
  size(800, 400);
  background(#ffffff, 1);
  smooth();
  frameRate(60);
  noStroke();
}

void draw() {
  background(#ffffff, 1);
  
  // When mouse is pressed, create a new object with the class `Ball`.
  if (mousePressed) {
  balls.add(new Ball());
  }
  
  // The .size() thing gives the length of the `balls` ArrayList. 
  // This length varies according to how many times the mouse is pressed (which creates a new ball each time).
  for(int i = 0; i < balls.size(); i++) {
    balls.get(i).display();
  }
  
  // To prevent lag, remove first ball when the 61st ball is created, so that only 60 balls are on screen at a time.
  if (balls.size() > 60) {
    balls.remove(0);  
  }
}


class Ball {

  // Use PVectors to define the x (horizontal) and y (vertical) components of the position, speed and acceleration. 
  // Position is the x and y coordinates where a ball is placed. Here, it is placed in a location within 10 pixels of the mouseclick location.
  PVector pos = new PVector(mouseX+random(-10,10), mouseY+random(-10,10));
  PVector spd = new PVector(random(-5,5),random(-5,5));
  PVector acl = new PVector(0.3,0.3);
  float aclDecay = 0.8; // How quickly the acceleration decays. Increase this to more quickly reach a rolling motion after bouncing.
  
  // Display attributes
  float ballWidth = random(10,50); // Randomise width of balls
  float opacity = random(20,200); // Randomise opacity of balls
  float greenValue = random(140, 255); // Randomise green value of the RGB colour of balls
  
  void display() {
    fill(109, greenValue, 255, opacity);
    ellipse(pos.x, pos.y, ballWidth, ballWidth);
    pos.y += spd.y; // Vertical position is incremented by the vertical speed each frame.
    spd.y += acl.y; // Vertical speed is incremented by the vertical acceleration each frame.
    pos.x += spd.x; // Horizontal position is incremented by the horizontal speed each frame.
    
    if(pos.y > height-(ballWidth/2)){
      spd.y *= -0.9 * aclDecay; // Each time the ball bounces, the speed is in the opposite direction and slightly decreased to simulate air friction. 
      pos.y -= 1;
      if (aclDecay > 0) {
        aclDecay -= 0.02; 
      }
    }
    
    if(pos.x > width-(ballWidth/2) || pos.x-(ballWidth/2) < 0){
       spd.x *= -1;
    }
  
  }

}
