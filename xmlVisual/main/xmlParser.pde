XML document;
XML earthXML;

void xmlParse(){
  document = loadXML("test.xml");
  earthXML = loadXML("earthday.xml");
  XML[] childrenPages = document.getChildren("page/id");
  XML earthText = earthXML.getChild("page/revision/text");
  String extractText = earthText.getContent();
  int counter = 0;
  
  //Extracts page numbers
  for(int i = 0; i < childrenPages.length; i++) {
    id = Integer.parseInt(childrenPages[i].getContent());
    textSize(20);
    
    text(id, 80, 170);

    counter++;
    //Finds total number of missing pages
    if(counter != id) {
      missingPages += (id - counter);
      counter = id;
    }
  }//End of for loop
  total = id;
}