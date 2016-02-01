//Matthew Lee
//Project 1: Alice in Wonderland Visualization
/*The story of Alice in Wonderland is visualized into a
colored pictography defining most frequent letters and
the times Alice appeared in wonderland. 
*/ 
import processing.core.*;
import java.io.*;
import java.util.regex.Pattern;

BufferedReader reader;
int[] letterFrequency = new int[26];
String[] alice = new String[2];
String line;
int aliceFreq = 5;
char letterAt;

final int VISUALIZATION1 = 0;
final int VISUALIZATION2 = 1;
int input = 1;

void setup() {
  size(800, 800);
  background(0);
  openFile2();
  alice[0] = "Alice";
  alice[1] = "Alice.";
  //letterFrequency = new int[26];
  //for(int i = 0; i < letterFrequency.length; i++)
  //  println(letterFrequency[i] + " ");
}

void draw(){
}

void mousePressed() {
  //visualize alice in wonderland
  if(input == VISUALIZATION1){
    input = 1;
    background(0);
    openFile2();
    //println("alice");
  }
  //visualize word frequency
  else if(input == VISUALIZATION2){
    input = 0;
    //reset visuals
    background(0);
    
    //Display graph
    visualizeGraph();
    //pieChart(500, letterFrequency);
    letterFrequency = new int[26];
    //println("graph");
  }
  
}