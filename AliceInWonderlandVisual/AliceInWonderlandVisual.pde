BufferedReader reader;
String line;

class AliceInWonderLandVisual {
  
  //Constructor
  public AliceInWonderlandVisual(BuffereredReader reader) {
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
      while(line = reader.readLine() != null) {
        line.toLowerCase();
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

  

}//End of class



