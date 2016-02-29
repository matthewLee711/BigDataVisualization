XML document;
XML earthXML;

String pattern = "trees saved";
Pattern r;
Matcher m;

void xmlParse(){
  //open xml documents
  document = loadXML("test.xml");
  earthXML = loadXML("https://en.wikipedia.org/wiki/Special:Export/Earth_Day");
  //reach children
  XML[] childrenPages = document.getChildren("page/id");
  XML earthText = earthXML.getChild("page/revision/text");
  //extract content
  String extractText = earthText.getContent();
  int counter = 0;
  
  //Extracts page numbers from wikibooks
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
  //Regex to see if trees saved
  r = Pattern.compile(pattern);
  m = r.matcher(extractText);
  //Store total number of pages
  total = id;
}