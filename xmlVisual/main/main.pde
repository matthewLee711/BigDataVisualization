//Matthew Lee
//Project 3: Data Visualization
/*The internet is huge force within society due
to the fact information is readily available at the tips
of anyone's finger. This processing project will access an xml
file provided by a website and make a small visual.*/

import processing.core.*;

//Set states
final int INTRO = 0;
final int DATA = 1;
final int INTERACTION = 2;

//Iterate through different states
int page = 0;
int animation = 0;
float textMoveX = 0;
XML document;
String imgURL;
PImage image;

void setup() {
  size(800, 800);
  textSize(22);
  //text("WikiBooks XML Dump", 290, height/2);
  
  document = loadXML("test.xml");
  XML[] children = document.getChildren("page/id");
  
  int counter = 0;
  int missingPages = 0;
  //Extracts page numbers
  for(int i = 0; i < children.length; i++) {
    int id = Integer.parseInt(children[i].getContent());
    counter++;
    //Finds total number of missing pages
    if(counter != id) {
      missingPages += (id - counter);
      counter = id;
    }
  }//End of for loop
  println(missingPages);
  //XML imgNode = document.getChild("channel/image/url");
  //imgURL = imgNode.getContent();
  //image = loadImage(imgURL);
}
//Visuals
void draw() {
 
  if(page == INTRO) {
    textSize(20);
    text("The keyboard will be used today", 0, height/2);
    text("press a key.. and wait for visuals", 20, height/2 + 30);
    if(animation == 1) {
      textSize(32);
      text("WHOAAA", textMoveX, height/2 + 60);
    }
  }
  
  if(page == DATA) {
    String secret = "Open sourced is why. People can add content when they want";
    background(33);
    fill(255,255,255);
    textSize(20);
    text("Number of pages missing", 5, height-770);
    if(animation == 2)
      text("WHY?????", 5, height-750);
    if(animation == 3)  
      text("Number of pages saved", 5, height-730);
    if(animation == 4)
      text("text put online saves", 5, height-710);
    if(animation == 5)
      text("Number of words", 5, height-690);
    if(animation == 6)
      text("interesting enough", 5, height-670);
  }
  
  if(page == INTERACTION) {
    background(0);
  }
  
}

void mousePressed() {
  page++;
}

void keyPressed() {
  animation++;