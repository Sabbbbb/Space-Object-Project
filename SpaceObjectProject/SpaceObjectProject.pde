import processing.sound.*;
PImage background;
PFont myFont, menuHeaderFont;
SoundFile buttonClick, transition, keyboardClick;
Widget pieChartButton, barChartButton, backButton, searchButton, altitudeButton, guideButton, nextButton, previousButton;
TextWidget focus, searchBar;
boolean mainMenu, barChart, pieChart, search, altitudes, guide, noResults;
ArrayList MenuWidgetList;
String lines[];
ArrayList<DataPoint> dataList = new ArrayList<DataPoint>();
ArrayList<SpaceObject> spaceObjects = new ArrayList<SpaceObject>();
ArrayList<SpaceObject> spaceObjectsWithinRange = new ArrayList<SpaceObject>();
ArrayList<String> objectsByLaunchYear = new ArrayList<String>();
ArrayList<String> lessObjectsByYear = new ArrayList<String>();
Scrollbar bar1, minimumAltitudeBar, maximumAltitudeBar;
PieChart pieChartDisplay;
float minAltitudeIndex, maxAltitudeIndex;
PFont barChartHeader, countries, font;
int USObjects, SUObjects, CAObjects, FObjects, UKObjects ;
BarChart barChartDisplay;
int index = 0;
String launchYear;
int count;
int textY;



void setup() {
  size(900, 900);
  textY = 270;
  count = 0;
  mainMenu = true;
  background = loadImage("galaxyBackground.jpg");
  myFont = loadFont("KohinoorBangla-Regular-30.vlw");
  menuHeaderFont = loadFont("DINAlternate-Bold-80.vlw");
  buttonClick = new SoundFile(this, "ButtonClick.wav");
  transition = new SoundFile(this, "Transition.wav");
  keyboardClick = new SoundFile(this, "TypingSound.wav");
  searchBar = new TextWidget(283, 200, 500, 50, 5,
    "", color(235), myFont, EVENT_SEARCH, 18);
  searchButton = new Widget(118, 200, 160, 50, 5,
    "Search Bar:", color(235), myFont, EVENT_NULL);
  pieChartButton = new Widget(375, 330, 150, 50, 14,
    "Pie Chart", color(235), myFont, EVENT_PIECHART);
  barChartButton = new Widget(375, 460, 150, 50, 12,
    "Bar Chart", color(235), myFont, EVENT_BARCHART);
  altitudeButton = new Widget(375, 590, 150, 50, 15,
    "Altitudes", color(235), myFont, EVENT_ALTITUDES);
  nextButton = new Widget(550, 640, 150, 50, 15,
    "Next", color(235), myFont, EVENT_NEXT);
  previousButton = new Widget(200, 640, 150, 50, 15,
    "Previous", color(235), myFont, EVENT_PREVIOUS);
  guideButton = new Widget(375, 720, 150, 50, 36,
    "Guide", color(235), myFont, EVENT_GUIDE);
  backButton = new Widget(780, 20, 100, 50, 18,
    "Back", color(235), myFont, EVENT_BACK);
  focus = null;
  MenuWidgetList = new ArrayList();
  MenuWidgetList.add(searchButton);
  MenuWidgetList.add(searchBar);
  MenuWidgetList.add(pieChartButton);
  MenuWidgetList.add(barChartButton);
  MenuWidgetList.add(altitudeButton);
  MenuWidgetList.add(guideButton);
  loadData();
  bar1 = new Scrollbar(100, 700, 700, 20, 0.0, 990.0);
  minimumAltitudeBar = new Scrollbar(100, 680, 700, 20, 0.0, 40000.0);
  maximumAltitudeBar = new Scrollbar(100, 730, 700, 20, 0.0, 40000.0);

  pieChartDisplay = new PieChart();
  barChartDisplay = new BarChart();
  font = createFont("Courier New", 30);
  barChartHeader = loadFont("AppleSymbols-55.vlw");
  countries = loadFont("AppleSymbols-40.vlw");
  //Country object counts
  // US has 16418 objects
  USObjects = countryObjectCount("US", dataList);
  // SU has 15781 objects
  SUObjects = countryObjectCount("SU", dataList);
  //CA has 101 objects
  CAObjects = countryObjectCount("CA", dataList);
  //F has 1413 objects
  FObjects = countryObjectCount("F", dataList);
  //UK has 563 objects
  UKObjects = countryObjectCount("UK", dataList);

  //PieChart setup
  //Creates new array with 10 doubles starting from index
  masses = massArrayList(dataList);
  for (int i=index; i<(index +10); i++) {
    currentData = masses.get(i);
    total += currentData;
    dataBetween.add(currentData);
  }
  //Creates ratio and creates array of floats with elements adding to 360
  ratio = 360/total;
  for (int i=0; i<dataBetween.size(); i++) {
    currentDouble = dataBetween.get(i);
    if (currentDouble >0) {
      ratio360 = currentDouble * ratio;
      dataDivided360.add(ratio360);
    }
  }

  angles = new float[dataDivided360.size()];
  for (int i=0; i< dataDivided360.size(); i++) {
    angles[i] = dataDivided360.get(i);
  }
}

public void loadData() {
  // Loading data arrayList (Sophie)
  lines = loadStrings("gcat.tsv");
  // For loop starts at 1 to avoid header line at index 0
  for (int i =1; i<lines.length; i++) {
    try {
      String[] spaceData = split(lines[i], '\t');
      String name = spaceData[NAME_INDEX];
      String launchDate = spaceData[LAUNCHDATE_INDEX];
      String status = spaceData[STATUS_INDEX];
      String state = spaceData[STATE_INDEX];
      float mass = Float.valueOf(spaceData[MASS_INDEX]).floatValue();
      float diameter = Float.valueOf(spaceData[DIAMETER_INDEX]).floatValue();
      float perigee = Float.valueOf(spaceData[PERIGEE_INDEX]).floatValue();
      float apogee = Float.valueOf(spaceData[APOGEE_INDEX]).floatValue();
      DataPoint dataPoint = new DataPoint(name, launchDate, status, state, mass,
        diameter, perigee, apogee);
      dataList.add(dataPoint);

      SpaceObject spaceObject = new SpaceObject(random(20, 850), random(20, 600), diameter*10, name);
      spaceObjects.add(spaceObject);
    }
    catch (NumberFormatException e) {
    }
  }
}

void draw() {
  background(0);
  tint(160);
  image(background, -200, 0, 1440, 900);
  if (mainMenu) {
    fill(235);
    count = 0;
    textFont(menuHeaderFont);
    text("Main Menu", 335, 120);
    //searchButton.draw();
    for (int i = 0; i<MenuWidgetList.size(); i++) {
      Widget aWidget = (Widget) MenuWidgetList.get(i);
      aWidget.draw();
    }
  } else if (guide == true) {
    backButton.draw();
    fill(235);
    stroke(0);
    rect(150, 150, 600, 600);
    textFont(menuHeaderFont);
    fill(0);
    text("Guide", 375, 230);
    textFont(myFont);
    text("- Click on the search bar and type a launch\n" +
      "  date in the format:\n" +
      "  YYYY MMM \n" +
      "  Example: 1958 Mar", 160, 300);
    text("- Click on any other button to view \n" +
      "  its associated data.", 160, 500);
    text("- On the altitude screen, select a\n" +
      "  minimum and maximum altitude to\n" +
      "  display all objects within that range.", 160, 620);
  } else if (pieChart == true) {
    stroke(0);
    pieChartDisplay.draw();
    backButton.draw();
  } else if (altitudes == true) {
    fill(255);
    int pos2 = int(minimumAltitudeBar.getPos());
    text(nf(pos2, 2), 550, 670);
    text("Min. Altitude: ", 360, 670);
    stroke(0);
    minimumAltitudeBar.update(mouseX, mouseY);
    stroke(0);
    minimumAltitudeBar.display();
    fill(255);
    int pos3 = int(maximumAltitudeBar.getPos());
    text(nf(pos3, 2), 550, 725);
    text("Max. Altitude: ", 360, 725);
    stroke(0);
    maximumAltitudeBar.update(mouseX, mouseY);
    stroke(0);
    maximumAltitudeBar.display();
    minAltitudeIndex = pos2;
    maxAltitudeIndex = pos3;
    spaceObjectsWithinRange = objectsWithinAltitude(spaceObjects, minAltitudeIndex, maxAltitudeIndex);
    for (int i = 0; i<spaceObjectsWithinRange.size(); i++) {
      spaceObjectsWithinRange.get(i).draw();
      spaceObjectsWithinRange.get(i).rollover(mouseX, mouseY);
    }
    backButton.draw();
  } else if (barChart == true) {
    barChartDisplay.draw();
    backButton.draw();
  } else if (search == true) {
    backButton.draw();
    textFont(menuHeaderFont);
    fill(235);
    text("The Object Names", 232, 170);
    stroke(0);
    fill(235);
    rect(200, 240, 500, 360);
    fill(0);
    textFont(myFont);
    if (objectsByLaunchYear.size() > 10) {
      for (int i = 0; i < 11; i++) {
        text("- " + objectsByLaunchYear.get(i), 210, textY);
        textY += 32;
        stroke(0);
      }
      textY = 270;
      if (count > 0) {
        stroke(0);
        fill(235);
        rect(200, 240, 500, 360);
        fill(0);
        textFont(myFont);
        for (int i = count + 2; i < 13 + count; i++) {
          if (i < objectsByLaunchYear.size()) {
            text("- " + objectsByLaunchYear.get(i), 210, textY);
            textY += 32;
          } else {
            break;
          }
        }
        textY = 270;
      } else if (objectsByLaunchYear.size() < 10) {
        for (int i = 0; i < objectsByLaunchYear.size(); i++) {
          text("- " + objectsByLaunchYear.get(i), 210, textY);
          textY += 32;
        }
      }
      textY = 270;
      if (objectsByLaunchYear.size() > 12 && count == 0) {
        nextButton.draw();
      } else if (count > 0 && (objectsByLaunchYear.size() - count) < 10) {
        previousButton.draw();
      } else if (count > 0 && (objectsByLaunchYear.size()-12) > count) {
        nextButton.draw();
        previousButton.draw();
      } else if (count > 0) {
        previousButton.draw();
      }
      //println("result");
    } else {
      backButton.draw();
      for (int i = 0; i < objectsByLaunchYear.size(); i++) {
        text("- " + objectsByLaunchYear.get(i), 210, textY);
        textY += 32;
        stroke(0);
      }
      textY = 270;
    }
  } else if (noResults == true) {
    fill(235);
    textFont(menuHeaderFont);
    text("No Results", 315, 460);
    backButton.draw();
  }
}


/*textFont(font);
 textAlign(CENTER);
 fill(255);
 int pos1 = int(bar1.getPos());
 text(nf(pos1, 2), 450, 770);
 text("Index: ", 375, 770);
 bar1.update(mouseX, mouseY);
 bar1.display();
 */

void mousePressed() {
  //Scrollbar
  bar1.press();
  minimumAltitudeBar.press();
  maximumAltitudeBar.press();
  int event;
  for (int i = 0; i<MenuWidgetList.size(); i++) {
    Widget aWidget = (Widget) MenuWidgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BARCHART:
      if (!buttonClick.isPlaying() && mainMenu == true) {
        buttonClick.play();
        barChart = closeOtherScreens();
      }
      break;
    case EVENT_PIECHART:
      if (!buttonClick.isPlaying() && mainMenu == true) {
        buttonClick.play();
        pieChart = closeOtherScreens();
      }
      break;
    case EVENT_ALTITUDES:
      if (!buttonClick.isPlaying() && mainMenu == true) {
        buttonClick.play();
        altitudes = closeOtherScreens();
      }

      break;
    case EVENT_GUIDE:
      if (!buttonClick.isPlaying() && mainMenu == true) {
        buttonClick.play();
        guide = closeOtherScreens();
      }
      break;
    case EVENT_NEXT:
      if (!buttonClick.isPlaying() && search == true) {
        buttonClick.play();
      }
      //add to index of shortened array
      break;
    case EVENT_PREVIOUS:
      if (!buttonClick.isPlaying() && search == true) {
        buttonClick.play();
      }
      //sub from index of shortened array
      break;
    case EVENT_SEARCH:
      focus = (TextWidget)aWidget;
      if (!buttonClick.isPlaying() && mainMenu == true) {
        buttonClick.play();
      }
      return;
    default:
      focus = null;
    }
  }
  event = backButton.getEvent(mouseX, mouseY);
  if (event == EVENT_BACK) {
    searchBar.clearLabel();
    if (!buttonClick.isPlaying() && mainMenu == false) {
      buttonClick.play();
    }
    mainMenu = closeOtherScreens();
  }
  event = nextButton.getEvent(mouseX, mouseY);
  if (event == EVENT_NEXT) {
    if (!buttonClick.isPlaying() && search == true && count < objectsByLaunchYear.size() && objectsByLaunchYear.size() > 10 && (objectsByLaunchYear.size()-12) > count) {
      buttonClick.play();
      count += 10;
      println(count);
    }
  }
  event = previousButton.getEvent(mouseX, mouseY);
  if (event == EVENT_PREVIOUS) {
    if (!buttonClick.isPlaying() && search == true && count >= 10) {
      buttonClick.play();
      count -= 10;
      println(count);
    }
  }
}

void keyPressed() {
  if (focus != null && mainMenu == true) {
    keyboardClick.play();
  }
  if (focus != null && keyCode != 20) {
    focus.append(key);
    if (key == ENTER || key == RETURN) {
      if (!transition.isPlaying() && mainMenu == true) {
        transition.play();
      }
      launchYear = searchBar.setLabel(searchBar.getLabel().replace("\n", "").replace("\r", ""));
      objectsByLaunchYear = objectsByLaunchDateYear(dataList, launchYear);
      if (objectsByLaunchYear.size() == 0) {
        noResults = closeOtherScreens();
      } else {
        search = closeOtherScreens();
        // println(objectsByLaunchYear);
      }
    }
  }
}

void mouseReleased() {
  bar1.release();
  minimumAltitudeBar.release();
  maximumAltitudeBar.release();
}
void mouseMoved() {
  int event;
  if (mainMenu == true) {
    for (int i=0; i<MenuWidgetList.size(); i++) {
      Widget aWidget = (Widget) MenuWidgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);

      switch(event) {
      case EVENT_BARCHART:
        aWidget.strokeColorNorm = color(255);
        stroke(255);
        stroke(100, 100, 100, 40);
        break;
      case EVENT_ALTITUDES:
        aWidget.strokeColorNorm = color(255);
        stroke(255);
        stroke(100, 100, 100, 40);
        break;
      case EVENT_PIECHART:
        aWidget.strokeColorNorm = color(255);
        stroke (255);
        stroke(100, 200, 100, 40);
        break;
      case EVENT_GUIDE:
        aWidget.strokeColorNorm = color(255);
        stroke (255);
        stroke(100, 200, 100, 40);
        break;
      case EVENT_SEARCH:
        aWidget.strokeColorNorm = color(255);
        stroke (255);
        stroke(100, 200, 100, 40);
        break;
      default:
        aWidget.strokeColorNorm = color(0);
      }
    }
    backButton.strokeColorNorm = color(0);
  } else {
    searchBar.strokeColorNorm = color(0);
    searchButton.strokeColorNorm = color(0);
    pieChartButton.strokeColorNorm = color(0);
    barChartButton.strokeColorNorm = color(0);
    altitudeButton.strokeColorNorm = color(0);
    event = backButton.getEvent(mouseX, mouseY);
    if (event == EVENT_BACK) {
      backButton.strokeColorNorm = color(255);
      stroke (255);
    } else {
      backButton.strokeColorNorm = color(0);
    }
    event = nextButton.getEvent(mouseX, mouseY);
    if (event == EVENT_NEXT) {
      nextButton.strokeColorNorm = color(255);
      stroke (255);
    } else {
      nextButton.strokeColorNorm = color(0);
    }
    event = previousButton.getEvent(mouseX, mouseY);
    if (event == EVENT_PREVIOUS) {
      previousButton.strokeColorNorm = color(255);
      stroke (255);
    } else {
      previousButton.strokeColorNorm = color(0);
    }
  }
}

boolean closeOtherScreens() {
  boolean currentScreen = true;
  mainMenu = false;
  barChart = false;
  pieChart = false;
  search = false;
  guide = false;
  altitudes = false;
  noResults = false;
  return currentScreen;
}
