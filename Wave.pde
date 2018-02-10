class Wave {
  
  float phi; // the phase shift offset amount
  float amplitude; // the amplitude of our wave
  float frequency; // slow down our wave so we can see it better
  int numPoints; // the granularity of our drawing
  
  float x;
  float y;
  
  int r,g,b,s;
  
  
  
// Default Constructor
Wave(){ 
  phi =  0; // the phase shift offset amount
  amplitude = 100; // the amplitude of our wave
  frequency = 1.0/32; // slow down our wave so we can see it better
  numPoints = 600; // the granularity of our drawing
  
  r = 0;
  g = 0;
  b = 0;
  
  noFill();

}

// Constructor that will be filled with parsed values

/*

  Left Toe > Amplitude
  Left Heel > Frequency
  Right Toe > Type of wave (sine or cosine)
  Right Heel > y value for the center of the wave
  Left X > Wave Rotation around x-axis
  Left Y > 
  Left Z > Number of points on the wave
  Right X > r value for stroke(rgb)
  Right Y > g value for stroke(rgb)
  Right Z > b value for stroke(rgb)
  
*/

Wave(float temp_amplitude, float temp_frequency, int temp_numPoints, int temp_r, int temp_g, int temp_b, int temp_s) {
  phi = 0;
  amplitude = temp_amplitude/6;
  frequency = temp_frequency/400;
  numPoints = temp_numPoints;
  r = temp_r;
  g = temp_g;
  b = temp_b;
  s = temp_s;
   
  
  noFill();
  
  
}

void display() {
  
  //translate(0, height/2);
  //blendMode(MULTIPLY);
  colorMode(HSB,360,100,100);
  strokeWeight(s/5);
  stroke((r*3)+177,100,b+50);
  
  // if we consider 1 pixel to be 1 radian, then this is the number 
  // of radians between points
  float angle = (width+1000)/numPoints;
  
  // we are drawing the curve using our shape tool
  beginShape();
  //vertex(0,0);
  for (int i = -20; i < numPoints; i++) {
    
    // calculate where we are along x
    x = angle*i;
    
    // y is determined by our function
    y = sin(x*frequency+phi)* amplitude;
    vertex(x, y);
  }
  endShape();
  
}

void move() {
  
  // phase shift to the left so the wave appears to b marching to the right
  phi -= .05;
  
  
  float rotY = map(mouseY, 0, height, 0, 180);
  float rotX = map(mouseX, 0, width, -90, 90);
  //translate(width/2, 0, 0);
  //rotateY(radians(rotY));
  //rotateX(radians(millis()/1000.0));
  rotateX(radians(rotX));
  
  
}

}
  