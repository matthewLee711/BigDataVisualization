class Food {
  PVector location;
  int diameter;
  color c;
  
  Food(PVector location, color c) {
    this.location = location;
    diameter = 20;
    this.c = c;
  }
  
  void draw() {
    fill(c);
    ellipse(location.x, location.y, diameter, diameter);
  
  }
  
  
}