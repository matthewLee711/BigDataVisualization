//Matthew Lee
//Project 1: Alice in Wonderland Visualization
/*The story of Alice in Wonderland is visualized into a
colored pictography defining most frequent letters and
the times Alice appeared in wonderland. 
*/

import java.io*;

BufferedReader reader;
String line;
String[] wordArray;
int[] letterFrequency;

class AliceInWonderLandVisual {
  
  //Constructor
  public AliceInWonderLandVisual() {
    //BufferedReader to open file
    reader = createReader("wonderland.txt");

    //Array which contains all color combinations
    String[] wordArray = new String[26];

    //Array which stores frequency of each character
    int[] letterFrequency = new int[26];
  }

  //open file
  public void openFile() {
    try {
      while((line = reader.readLine()) != null) {
        //Set line to lower case
        line.toLowerCase();
        
        //Split string and find frequency of Alice
        String[] parts = line.split(Pattern.quote(" "));
        
        //read each individual character and color pixel on screen

        
        
        System.out.println(line);
      }
    }catch(Exception e){
      e.printStackTrace();
    } 
  }

  //setup array for comparison
  public void colorPrep() {
    wordArray[0] = "#eht346";
    wordArray[1] = "#333333";
    wordArray[2] = "#333333";
    wordArray[3] = "#333333";
    wordArray[4] = "#333333";
    wordArray[5] = "#333333";
    wordArray[6] = "#333333";
    wordArray[7] = "#333333";
    wordArray[8] = "#333333";
    wordArray[9] = "#333333";
    wordArray[10] = "#333333";
    wordArray[11] = "#333333";
    wordArray[12] = "#333333";
    wordArray[13] = "#333333";
    wordArray[14] = "#333333";
    wordArray[15] = "#333333";
    wordArray[16] = "#333333";
    wordArray[17] = "#333333";
    wordArray[18] = "#333333";
    wordArray[19] = "#333333";
    wordArray[20] = "#333333";
    wordArray[21] = "#333333";
    wordArray[22] = "#333333";
    wordArray[23] = "#333333";
    wordArray[24] = "#333333";
    wordArray[25] = "#333333";
    wordArray[26] = "#333333";
  }

  //Takes int and uses color table
  private void colorPixel() {

  }
  
  private void graphFrequency(String word) {
    String ascii = word;
    byte[] bytes = ascii.getBytes("US-ASCII");

    for(int i = 0; i < bytes.length; i++) {
      //iterate through word and add characters to frequency
      letterFrequency[bytes[i] - 97]++;
    }
  }

}//End of class



