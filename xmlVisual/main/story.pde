//Text used in INTROXML
String introXMLText = "The information you are about to see was extracted from wikibook's xml dump";
String introXMLText2 = "But before the cool stuff, lets get some stuff straight.";
String introXMLText3 = "For the statistics to be displayed next page, we must do something called parsing.";
String introXMLText4 = "Which is extracting information from a given dataset.";
String visualizeText = "The next key press will visualize this program parsing wikibook's xml dump";
String catchit = "Did you catch those numbers?";
String na = "Na, didn't think so";
String computersFast = "Parsers now days are so fast, the human eye can't catch it";
String overall = "Overall, the parser enters the nodes id and text and extracts the info we need";
void displayDOM() {
    text("<mediawiki>", 10, 140);
    text("<id> " + total, 20, 170);
    text("</id>", 130, 170);
    text("<body> some text", 20, 200);
    text("</body>", 210, 200);
    text("</mediawiki>", 10, 230);
    text(na, 200, 170);
}

//Text used

//Text used in data
String random = "Trees saved? where did that come from";
String purpose = "The reason this program was created it to not only to visualize data,";
String purpose2 = "but to give you an idea of how online text like wikibooks saves trees!";