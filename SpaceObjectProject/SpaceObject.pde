class SpaceObject{
  // x and y to be set to mouseX and mouseY when object is initialised in main
  float x,y;
  float diameter;
  String name;
  color col;
  
  boolean over = false;
  
  SpaceObject(float objectX,float objectY, float objectDiameter, String objectName){
    x = objectX;
    y = objectY;
    diameter = objectDiameter;
    name = objectName;
    col = color(random(0,255), random(0,255), random(0,255));
  }
  
  void rollover(float px, float py){
    float d = dist(px,py,x,y);
    if(d < diameter/2){
      over = true;
    }
    else{
      over = false;
    }
  }
  
  void draw(){
    stroke(col);
    //strokeWeight(2);
    fill(col);
    ellipse(x,y,diameter,diameter);
    if(over){
      fill(255);
      text(name,x-50,y+diameter/2+30);
    }
  }
  
  
}
