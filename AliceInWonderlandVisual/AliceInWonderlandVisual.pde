//Matthew Lee
//Project 1: Alice in Wonderland Visualization
/*The story of Alice in Wonderland is visualized into a
colored pictography defining most and least frequent letters and
the times Alice appeared in wonderland. 
*/ 
void openFile() {
  reader = createReader("wonderland.txt");
  try {
     int x = 0;
     int y = 0;
     int total = 0;
     while ((line = reader.readLine()) != null) {
       //set line to lower case
       line.toLowerCase();
       
       //Split string and find frequency of Alice
       String[] parts = line.split(Pattern.quote(" "));
       
       //Find frequency of Alice and color pixels
       for(int i = 0; i < parts.length; i++) {
          //Catches frequency of Alice
          if(parts[i] == parts[i] || parts[i] == "Alice.") {
            aliceFreq++;
          }
          //read each individual character and find frequency
          for(int g = 0; g < parts[i].length(); g++) {
            letterAt = line.charAt(g);
            graphFrequency(letterAt);
          }
          //color pixel
          set(x, y, colorPixel(letterAt));
          //add spacing between words
          x += 10;
          //move to next row
          if(x % width == 0) {
            y += 5;
            x = 0;
          }
          total++;
        }//End of for loop
      }//End of While loop
      fill(255, 255, 255);
      textSize(28);
      text("Alice In Wonderland Visualized in Pixels", 10, 690);
      textSize(20);
      //Alice
      text("Alice appeared: ", 10, 720);
      text("1240", 10, 750);
      text("times", 69, 750);
      //Least frequent
      text("Least Frequent letter: J", 260, 720);
      text(letterFrequency[9], 260, 750);
      text("pixels", 290, 750);
      //Most Frequent
      text("Most Frequent letter: E", 560, 720);
      text(letterFrequency[4], 560, 750);
      text("pixels", 615, 750);
  } catch(Exception e) {
    e.printStackTrace();
  }
}

//Store frequency in graph
void graphFrequency(char word) {
  //convert char into ascii
  int store = word;
  //ignore changed characters
  if(store < 97) {
    store = 143;
  }
  //Store frequency of each letter
  else {
    letterFrequency[store - 97]++;
  }
}

void visualizeGraph() {
  textSize(32);
  char alphabet;
  for(int i = 0; i < 26; i++) {
    alphabet = char(i + 97);
    text("Letter Frequency", 275, 30);
    text(alphabet, i * 31, 60);
    rect(i * 31, 80, 20, letterFrequency[i] * .19);
  }//end of for
  //initializations to find min/max number
  int max = 0;
  int min = 1000;
  for(int i = 0; i < 26; i++) {
    if(letterFrequency[i] > max) {
      max = letterFrequency[i];
    }
    else if(letterFrequency[i] < min) {
      min = letterFrequency[i];
    }
  }//end of for
  
  //Visualize max
  fill(200,100,0);
  rect(4 * 31, 80, 20, max * .19);
  //visualize min
  fill(255,0,0);
  rect(9 * 31, 80, 20, min * .19);
}