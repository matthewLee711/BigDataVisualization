//Put into seperate file
//next step is to add multiple objects
class Tree {
  
  final int MAX_VELOCITY = 3;
  final float NOISE_DELTA = 0.01;
  final int WIDTH = 100;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency;
  float xOffset;
  
  ArrayList<Food> data = new ArrayList<Food>();
  
  public int x;
  public int y;

  public Tree(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 0);//initialize x and y coordinate
    acceleration = new PVector(0, 1);//initialize with 1pixel
    tendency = new PVector(0,1);
    xOffset = 0.0;
  }

  public void walk() {
    //factory method -- noise generate 1 to -1
    acceleration = PVector.fromAngle( noise(xOffset) * TWO_PI);
    velocity.add(acceleration);//always applying acceleration to veclocity
    velocity.add(tendency);//adds a tendency for object to go certin direction
    location.add(velocity);//adds velocity to location
    velocity.limit(3);//limit wind from going past 3 pixels
    xOffset += NOISE_DELTA;//adds random movement
    
    //Catches ball when goes off screen
    if (location.y < 0) location.y = height;
    if (location.y > 750) location.y = 0; 
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
  }
  //acceleration
  public void applyForce(PVector f) {
    velocity.add(f);
  }
  
  void draw() {
    //Draws ellipse which captures circles
    fill(50);
    ellipse(location.x, location.y, 100, 100);
    fill(0, 102, 153, 204);
    textSize(32);
    text("Tree", location.x - 37, location.y);
    //Draw food in specific area when captured
    for(Food f : data) {
     fill(f.c);
     ellipse(f.location.x, f.location.y, 10, 10);
    }
  }
  
  boolean isTouching(Food f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (WIDTH / 2 + f.diameter / 2);
  }
  
  //Adds to data structure
  void eat(Food f) {
    //adds to data structure
    data.add(f);
    //location off stored food
    f.location.x = random(820, 980);
    f.location.y = random(height - 180, height);
  }
  
  

}