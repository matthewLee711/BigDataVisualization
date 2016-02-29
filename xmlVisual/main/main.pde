//Matthew Lee
//Project 3: Data Visualization
/*The internet is huge force within society due
to the fact information is readily available at the tips
of anyone's finger. This processing project will access an xml
file provided by a website and make a small visual.*/

import processing.core.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//Set states
final int INTRO = 0;
final int INTROXML = 1;
final int DATA = 2;

//Iterate through different states
int page = 0;
int animation = 0;
float textMoveX = 120;

//Counters for extracting xml stats
int missingPages = 0;
int id = 0;
int total = 0;

String imgURL;
PImage pic;

void setup() {
  size(800, 800);
  textSize(22);
  pic = loadImage("dom.jpg");
  //text("WikiBooks XML Dump", 290, height/2);
  
  
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
      text("WHOAAA", 0, height/2 + 60);
      text("A", textMoveX, height/2 + 60);
      textMoveX += 0.5;
    }
    if(animation == 2 || textMoveX > 340) {
      animation = 2;
      textSize(20);
      text("Also when there are no more animations, left mouse click!", 30, height/2 + 80);
    } 
    
  }
  
  if(page == INTROXML) {
    background(33);
    textSize(20);
    text(introXMLText, 10, 20);
    text("Press a key", width - 150, height - 30);
    if(animation == 3) {
      textSize(20);
      text(introXMLText2, 10, 60);
    }
    if(animation == 4) {
      text(introXMLText3, 10, 80);
    }
    if(animation == 5) {
      text(introXMLText4, 10, 100);
    }
    if(animation == 6) {
      text(visualizeText, 10, 120);
    }
    if(animation == 7) {
      text("<mediawiki>", 10, 140);
      text("<id>", 20, 170);
      text("</id>", 130, 170);
      text("Press a key", width - 150, height - 30);
      //xmlParse();
      text(catchit, 200, 170);
    }
    if(animation == 8) {
      displayDOM();
      text(na, 200, 170);
    }
    if(animation == 9) {
      displayDOM();
      text(computersFast, 10, 260);
    }
    if(animation == 10) {
      displayDOM();
      text(overall, 10, 260);
      image(pic, 20, 300, 750, 450);
    }
  }
  
  
  if(page == DATA) {
    animation = 0;
    background(33);
    fill(255,255,255);
    textSize(20);
    text("Total Number of Pages: " + id, 5, height-770);
    
    //text("Number of pages missing: " + missingPages, 5, height-730);
    
    if(animation == 1)
      text("Trees saved: ", 5, height-710);
    if(animation == 5)
      text("Number of words", 5, height-690);
    if(animation == 6)
      text("interesting enough", 5, height-670);
  }
  
}

void mousePressed() {
  page++;
  println(page);
}

void keyPressed() {
  animation++;
  println(animation);
}