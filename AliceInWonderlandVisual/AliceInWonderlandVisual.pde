void openFile2() {
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
          //println(parts[i]);
          if(parts[i] == parts[i] || parts[i] == "Alice.") {
            aliceFreq++;
            println("bang");
          }
          //read each individual character and find frequency
          for(int g = 0; g < parts[i].length(); g++) {
            letterAt = line.charAt(g);
            graphFrequency(letterAt);
          }
          //color pixel -- all need to be ints or color class
          //set(i, y, colorPixel(letterAt));
          set(x, y, colorPixel(letterAt));
          x += 10;
          //set(300, 300, color(0));
          //move to next row
          if(x % width == 0) {
            y += 5;
            x = 0;
          }
          total++;
        }//End of for loop
        //System.out.println(line);
      }//End of While loop
      println(total);
      textSize(30);
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
    //println("changed");
  }
  //Store frequency of each letter
  else {
    //println("store: " + store);
    letterFrequency[store - 97]++;
    //println("element: " + letterFrequency[0]);
    //println("element: " + test[0]);
  }
}