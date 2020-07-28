import 'package:hackathonapp/constants/UserType.dart';

/// We will use this class for state management library 
class FlutterStore {
  static final FlutterStore _singleton = FlutterStore._internal();

  UserType userType;
  String userId;

  factory FlutterStore() {
    return _singleton;
  }

  FlutterStore._internal();


  /// This function returns user type
   UserType getUserType(){
     return userType;
  }

  /// This function is update user type.
  void setUserType(UserType userType){
    this.userType = userType;
  }

  /// This function returns user id
   String getUserId(){
     return userId;
  }

  /// This function is update user id.
  void setUserId(String userId){
    this.userId = userId;
  }

}