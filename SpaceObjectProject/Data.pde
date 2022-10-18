import java.util.ArrayList;
  //Names
  String currentName;
  String inputName;
  DataPoint dataPoint;

  //LaunchDate
  String launchDate;



  //Returns object with all relevant information about space object based on name
  public DataPoint matchName(String nameQuery, ArrayList<DataPoint> dataList) {
    for (int i=0; i<dataList.size(); i++) {
      dataPoint = dataList.get(i);
      currentName = dataPoint.getName();
      if (currentName.equals(nameQuery)) {
        return dataPoint;
      } else {
        dataPoint = null;
      }
    }
    return dataPoint;
  }

  //Returns arrayList of all names only
  public ArrayList<String> nameArrayList(ArrayList<DataPoint>dataList) {
    ArrayList<String> names = new ArrayList<String>();
    for (int i=0; i<dataList.size(); i++) {
      DataPoint dataPoint = dataList.get(i);
      String currentName = dataPoint.getName();
      names.add(currentName);
    }
    return names;
  }
  //Returns arrayList with name of all space objects filtered by country(state)
  public ArrayList<String>objectsByCountry(ArrayList<DataPoint>dataList, String country){
    ArrayList<String> objectsFromCountry = new ArrayList<String>();
    for(int i=0; i<dataList.size(); i++){
      dataPoint = dataList.get(i);
      currentName = dataPoint.getName();
      String currentCountry = dataPoint.getState();
      if(currentCountry.equals(country)){
        objectsFromCountry.add(currentName);
      }
    }
    return objectsFromCountry;
  }
  
  //Returns arrayList of names of objects that were launched in a year
  public ArrayList<String> objectsByLaunchDateYear(ArrayList<DataPoint>dataList,
  String objectLaunchYear){
    ArrayList<String> objectsLaunchedThatYear = new ArrayList<String>();
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint  = dataList.get(i);
      String currentLaunchDate = dataPoint.getLaunchDate();
      currentLaunchDate = currentLaunchDate.substring(0, currentLaunchDate.length()-3);
      String currentName = dataPoint.getName();
      if(currentLaunchDate.equalsIgnoreCase(objectLaunchYear)){
        objectsLaunchedThatYear.add(currentName);
      }
    }
    return objectsLaunchedThatYear;
  }

  // Returns arrayList of countries that launched a space object that year
  public ArrayList<String> countriesByLaunchDateYear(ArrayList<DataPoint>dataList,
    String objectLaunchYear) {
    //State = country
    ArrayList<String> countriesThatYear = new ArrayList<String>();
    for (int i=0; i<dataList.size(); i++) {
      DataPoint dataPoint = dataList.get(i);
      String currentLaunchDate = dataPoint.getLaunchDate();
      String currentState = dataPoint.getState();
      if (currentLaunchDate.equals(objectLaunchYear)) {
        countriesThatYear.add(currentState);
      }
    }
    return countriesThatYear;
  }

  //Returns arrayList of the status of all space objects
  public ArrayList<String> allStatuses(ArrayList<DataPoint>dataList){
    ArrayList<String> statuses = new ArrayList<String>();
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      String currentStatus = dataPoint.getStatus();
      statuses.add(currentStatus);
    }
    return statuses;
  }
  
  //Returns arrayList of all launchDates
  public ArrayList<String> allLaunchDates(ArrayList<DataPoint>dataList){
    ArrayList<String> launchDates = new ArrayList<String>();
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      String currentLaunchDate = dataPoint.getLaunchDate();
      launchDates.add(currentLaunchDate);
    }
    return launchDates;
  }

  //Returns arrayList of all states that have space objects
  public ArrayList<String> allCountries(ArrayList<DataPoint>dataList) {
    ArrayList<String> countries = new ArrayList<String>();
    for (int i=0; i<dataList.size(); i++) {
      DataPoint dataPoint = dataList.get(i);
      String currentCountry = dataPoint.getState();
      if (countries.contains(currentCountry)) {
      } 
      else {
        countries.add(currentCountry);
      }
    }
    return countries;
  }

  // public static double averageMass(int a, int b){}

  // Returns arrayList of all masses of the space objects
  public ArrayList<Float> massArrayList(ArrayList<DataPoint> dataList) {
    ArrayList<Float> objectMasses = new ArrayList<Float>();
    for (int i=0; i<dataList.size(); i++) {
      DataPoint dataPoint = dataList.get(i);
      float currentMass = dataPoint.getMass();
      objectMasses.add(currentMass);
    }
    return objectMasses;
  }

  // Returns arrayList of all diameters of the space objects
  public ArrayList<Float> diameterArrayList(ArrayList<DataPoint> dataList){
    ArrayList<Float> objectDiameters = new ArrayList<Float>();
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      float currentDiameter = dataPoint.getDiameter();
      objectDiameters.add(currentDiameter);
    }
    return objectDiameters;
  }

  // Returns arrayList of all perigees of the space objects 
  public ArrayList<Float> perigeeArrayList(ArrayList<DataPoint> dataList){
    ArrayList<Float> objectPerigees = new ArrayList<Float>();
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      float currentPerigee = dataPoint.getPerigee();
      objectPerigees.add(currentPerigee);
    }
    return objectPerigees;
  }

  // Returns arrayList of all apogees of the space objects
  public ArrayList<Float> apogeeArrayList(ArrayList<DataPoint> dataList){
    ArrayList<Float> objectApogees = new ArrayList<Float>();
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      float currentApogee = dataPoint.getApogee();
      objectApogees.add(currentApogee);
    }
    return objectApogees;
  }
  
  //Returns space objects within a certain altitude(perigee/apogee) range
  public ArrayList<SpaceObject> objectsWithinAltitude(ArrayList<SpaceObject> spaceObjects, 
  float minAltitude, float maxAltitude){
    ArrayList<SpaceObject> objectsWithinRange = new ArrayList<SpaceObject>();
    for(int i=0; i<spaceObjects.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      float objectPerigee = dataPoint.getPerigee();
      float objectApogee = dataPoint.getApogee();
      if(objectPerigee>=minAltitude && objectApogee<=maxAltitude){
        SpaceObject spaceObject = spaceObjects.get(i);
        objectsWithinRange.add(spaceObject);
      }
    }
    return objectsWithinRange;
  }
  
    //Returns a count with the number of space objects owned by the country passed through
 // as parameter
  public int countryObjectCount(String country, ArrayList<DataPoint> dataList){
    int count = 0;
    for(int i=0; i<dataList.size(); i++){
      DataPoint dataPoint = dataList.get(i);
      String currentState = dataPoint.getState();
      if(currentState.equals(country)){
        count += 1;
      }
    }
    return count;
  }
  
  
  
