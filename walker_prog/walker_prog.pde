Walker walker;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 10;
color[] colors = new color[NUMBER_OF_COLORS];


void setup() {
  size(1000, 1000);
  walker = new Walker(new PVector(width / 2, height / 2));
  
  //fill array with colors
  for(int i = 0; i < 10; ++i) {
    colors[i]= color(random(0, 200), random(0, 200), random(0, 200));
  }
  //fill arraylist with food objects
  for(int i = 0; i< NUMBER_OF_FOODS; ++i) {
    PVector l = new PVector(random(0, width), random(0, 800));
    color c = colors[(int)random(0, NUMBER_OF_COLORS)];
    foods.add(new Food(l, c));  
  }
}

void draw() {
  background(55);
  //Bag data structure
  walker.draw();
  walker.walk();
  walker.applyForce(new PVector(-0.1,0));//adding wind
  //drawWalker();
  
  //shift food down in array for Bag
  for(int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if(walker.isTouching(f)) {
      walker.eat(f);//add to data structure
      foods.remove(f);
    //remove f from the arrayList
    }
  }//End of Bag
}

void drawWalker() {
  rectMode(CENTER);
  stroke(random(255), random(255), random(255));
  rect(walker.location.x, walker.location.y, 50, 50);
}

void mousePressed() {
  walker.applyForce(new PVector(3,0));
}


//Put into seperate file
//next step is to add multiple objects
class Walker {
  
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

  public Walker(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 0);//initialize x and y coordinate
    acceleration = new PVector(1, 0);//initialize with 1pixel
    tendency = new PVector(1,0);
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
    if (location.y > height) location.y = 0; 
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
  }
  //acceleration
  public void applyForce(PVector f) {
    velocity.add(f);
  }
  
  void draw() {
    //Draws ellipse which captures circles
    ellipse(location.x, location.y, 100, 100);
    //Draw food in specific area when captured
    for(Food f : data) {
     fill(f.c);
     ellipse(f.location.x, f.location.y, 10, 10);
    }
  }
  
  boolean isTouching(Food f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (WIDTH / 2 + f.diameter / 2);
  }
  
  void eat(Food f) {
    //adds to data structure
    data.add(f);
    f.location.x = random(0,200);
    f.location.y = random(height - 200, height);//////////fix
  }
  
  

}