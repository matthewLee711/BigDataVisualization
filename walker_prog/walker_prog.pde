//Matthew Lee
//Project 2: Data Structure Visualization
/*Data Structures play an integral role within our
world's software. Vizualizing a data structure and how
it works will provide a viewer an understanding of why it is used
*/
//Bag Initialization
Walker walker;
//Stack Initialization
Stack stack;
//Queue Initialization
Queue queue;
//Hash Initialization
Hash hash;
//Tree Initialization
Tree tree;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 10;
color[] colors = new color[NUMBER_OF_COLORS];


void setup() {
  size(1000, 1000);
  //Create bag object and set location
  walker = new Walker(new PVector(width / 2, height / 2));
  //Create stack object and set location
  stack = new Stack(new PVector(width / 2, 200));
  //Create queue object and set location
  queue = new Queue(new PVector(width / 2, 100));
  //Create hash object and set location
  hash = new Hash(new PVector(width / 2, 300));
  //Create hash object and set location
  tree = new Tree(new PVector(width / 2, 400));
  
  //fill array with a set of random colors
  for(int i = 0; i < 10; ++i) {
    colors[i]= color(random(0, 200), random(0, 200), random(0, 200));
  }
  //fill arraylist with food objects (giving location and color)
  for(int i = 0; i< NUMBER_OF_FOODS; ++i) {
    PVector l = new PVector(random(0, width), random(0, 758));
    color c = colors[(int)random(0, NUMBER_OF_COLORS)];
    foods.add(new Food(l, c));  
  }
}

void draw() {
  background(55);
  //line below text
  line(0, 800, 1000, 800);
  stroke(250);
  //line above text
  line(0, 765, 1000, 765);
  stroke(250);
  //Bag separation line
  textSize(32);
  fill(0, 102, 153, 204);
  text("Bag", 70, 795);
  line(200, 800, 200, 1000);
  stroke(250);
  //Stack separation line
  textSize(32);
  fill(0, 102, 153, 204);
  text("Stack", 250, 795);
  line(400, 800, 400, 1000);
  stroke(250);
  //Queue
  textSize(32);
  fill(0, 102, 153, 204);
  text("Queue", 450, 795);
  line(600, 800, 600, 1000);
  stroke(250);
  //Hash
  textSize(32);
  fill(0, 102, 153, 204);
  text("Hash", 670, 795);
  line(800, 800, 800, 1000);
  stroke(250);
  //Tree
  textSize(32);
  fill(0, 102, 153, 204);
  text("Tree", 870, 795);
  
  
  //Bag Data Structure
  walker.draw();
  walker.walk();
  walker.applyForce(new PVector(-0.1,0));//adding wind
  //drawWalker();
  
  //Shift food down in array for bag
  for(int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if(walker.isTouching(f)) {
      walker.eat(f);//add to data structure
      foods.remove(f);
    //remove f from the arrayList
    }
  }//End of Bag
  
  //Stack Data Structure
  stack.draw();
  stack.walk();
  stack.applyForce(new PVector(-0.1,0));//adding wind
  
  //Shift food down in array for stack
  for(int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if(stack.isTouching(f)) {
      stack.eat(f);//add to data structure
      foods.remove(f);
    //remove f from the arrayList
    }
  }//End of stack
  
  //Queue Data Structure
  queue.draw();
  queue.walk();
  queue.applyForce(new PVector(-0.1,0));//adding wind
  
  //Shift food down in array for queue
  for(int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if(queue.isTouching(f)) {
      queue.eat(f);//add to data structure
      foods.remove(f);
    //remove f from the arrayList
    }
  }//End of stack
  
  //Hash Data Structure
  hash.draw();
  hash.walk();
  hash.applyForce(new PVector(-0.1,0));//adding wind
  
  //Shift food down in array for hash
  for(int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if(hash.isTouching(f)) {
      hash.eat(f);//add to data structure
      foods.remove(f);
    //remove f from the arrayList
    }
  }//End of stack
  
  //Tree Data Structure
  tree.draw();
  tree.walk();
  tree.applyForce(new PVector(-0.1,0));//adding wind
  
  //Shift food down in array for hash
  for(int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if(tree.isTouching(f)) {
      tree.eat(f);//add to data structure
      foods.remove(f);
    //remove f from the arrayList
    }
  }//End of stack
  
}

//not needed functions
void drawWalker() {
  rectMode(CENTER);
  stroke(random(255), random(255), random(255));
  rect(walker.location.x, walker.location.y, 50, 50);
}

void mousePressed() {
  walker.applyForce(new PVector(3,0));
}