XML document;

void xmlParse(){
  document = loadXML("test.xml");
  XML[] childrenPages = document.getChildren("page/id");
  
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