//Matthew Lee
//Project 3: Data Visualization
/*The internet is huge force within society due
to the fact information is readily available at the tips
of anyone's finger. This processing project will access an xml
file provided by a website and make a small visual.*/



//Set states
final int INTRO = 0;

//Iterate through different states
int page = 0;

XML document;
String imgURL;
PImage image;

void setup() {
  size(800, 800);
  textSize(22);
  text("WikiBooks XML Dump", 290, height/2);
  
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

void draw() {
  //background(33);
}

void mousePressed() {
  if(page == INTRO)
  {
    page = 1;
  }

}















//final String URL ="https://salty-taiga-88147.herokuapp.com/beers";

//JSONObject json;

//void setup() {
//  try {
//    json = loadJSONObject(URL);
//    println(json);
//  } catch (Exception ex) {
//    ex.printStackTrace();  
//  }
  
//}

//void draw() {

//}