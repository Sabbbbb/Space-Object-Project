class BarChart{
  void setup(){
    size(900,900);
  }
  
  void draw(){
    fill(235);
    textFont(countries);
    text("16400", 12, 100); 
    text("0", 90, 750);
    fill(235);
    textFont(barChartHeader);
    text("Number of Space Objects Per Country", 45, 58);
    fill(235);
    textFont(countries);
    text("US", 155, 780);
    text("SU", 279, 780);
    text("F", 418, 780);
    text("CA", 530, 780);
    text("UK", 656, 780);
    noStroke();
    fill(39,3,255);
    rect(150, (740-(USObjects/25)) , 50, USObjects/25);
    noStroke();
    fill(246,255,0);
    rect(275, (740-(SUObjects/25)), 50, SUObjects/25);
    fill(185, 232, 183);
    noStroke();
    rect(400, (740-(FObjects/25)), 50, FObjects/25);
    fill(255,0,9);
    rect(525, (740-(CAObjects/25)), 50, CAObjects/25);
    noStroke();
    fill(0,255,240);
    rect(650, (740-(UKObjects/25)), 50, UKObjects/25);
    
 //   stroke(#51B9B3);  
   // strokeWeight(4);
    fill(255);
    rect(120, 84, 2, 664);
    rect(120, 747, 581, 2);
    stroke(0);
    
  }
  
  
  
  
  
  
}
