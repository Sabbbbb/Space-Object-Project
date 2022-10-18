ArrayList<Float> masses = new ArrayList<Float>();
ArrayList<Float> dataBetween = new ArrayList<Float>();
ArrayList<Float> dataDivided360 = new ArrayList<Float>();
float total;
float ratio;
float currentDouble;
float ratio360;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
float currentData;
float angles[];
float colourLabel1, colourLabel2, colourLabel3, colourLabel4;
color colour;
color red0 = color(255, 116, 116);
color blue1 = color(118, 255, 245);
color green2 = color(121, 255, 135);
color purple3 = color(233, 121, 255);
color orange4 = color(255, 197, 121);
color pink5 = color(255, 149, 250);
color yellow6 = color(255, 251, 137);
color grey7 = color(126, 127, 147);
color darkGreen8 = color(79, 129, 88);
color darkBlue9 = color(65, 50, 247);


class PieChart {
  void setup() {
    noStroke();
    noLoop();  // Run once and stop
  }

  void draw() {
    background(0);
    tint(160);
    image(background, -200, 0, 1440, 900);
    pieChart(450, angles);
    fill(235);
    textSize(40);
    text("Pie Chart Representing Mass\n" + "        of First 10 Objects", 195, 150);
  }

  void pieChart(float diameter, float[] data) {
    if (data!=null) {
      float lastAngle = 0;
      for (int i = 0; i < data.length; i++) {
        if (i==0) {
          colour = red0;
        } else if (i==1) {
          colour = blue1;
        } else if (i==2) {
          colour = green2;
        } else if (i==3) {
          colour = purple3;
        } else if (i==4) {
          colour = orange4;
        } else if (i==5) {
          colour = pink5;
        } else if (i==6) {
          colour = yellow6;
        } else if (i==7) {
          colour = grey7;
        } else if (i==8) {
          colour = darkGreen8;
        } else if (i==9) {
          colour = darkBlue9;
        }
        fill(colour);

        //loat indexData = data.get(i);
        arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
        lastAngle += radians(data[i]);
      }
    }
  }
}
