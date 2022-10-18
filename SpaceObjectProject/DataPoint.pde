class DataPoint{
   String name;
   String launchDate;
   String status;
   String state;
   float mass;
   float diameter;
   float perigee;
   float apogee;
  
   DataPoint(String objectName, String objectLaunchDate, String objectStatus, 
   String objectState, float objectMass, float objectDiameter, float objectPerigee,
   float objectApogee){
     name = objectName;
     launchDate = objectLaunchDate;
     status = objectStatus;
     state = objectState;
     mass = objectMass;
     diameter = objectDiameter;
     perigee = objectPerigee;
     apogee = objectApogee;
   }
   
   String getName() {
    return name;
  }
  String getLaunchDate() {
    return launchDate;
  }
  String getStatus() {
    return status;
  }
  String getState() {
    return state;
  }
  float getMass() {
    return mass;
  }
  float getDiameter() {
    return diameter;
  }
  float getPerigee() {
    return perigee;
  }
  float getApogee() {
    return apogee;
  }
}
