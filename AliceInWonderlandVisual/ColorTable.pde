color colorPixel(int letterAt) {
  if(letterAt >= 97) {  
    color [] colArray = { 
      color(255, 0, 0), //a //red
      color(255, 217, 0), //b
      color(185, 65, 200), //c
      color(0, 145, 35),   //d
      color(255, 0, 0), //e //red
      color(32, 95,200), //f //blue
      color(255, 217, 0), //g
      color(255, 217, 0), //h
      color(255, 0, 0), //i //red
      color(255, 217, 0), //j
      color(255, 217, 0), //k
      color(255, 217, 0), //l
      color(255, 217, 0), //m
      color(255, 217, 0), //n
      color(255, 0, 0), //o //red
      color(255, 217, 0), //p
      color(255, 217, 0), //q
      color(255, 217, 0), //r
      color(255, 217, 0), //s
      color(255, 217, 0), //t
      color(255, 0, 0), //u //red
      color(255, 217, 0), //v
      color(255, 217, 0), //w
      color(255, 217, 0), //x
      color(255, 217, 0), //y
      color(255, 217, 0) //z
    };
    return colArray[letterAt - 97];
  }
  else if(letterAt < 97) {
    return color(255, 255, 255);
  }
  else
    return 0;
}