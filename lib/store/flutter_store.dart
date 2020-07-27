/// We will use this class for state management library 
class FlutterStore {
  static final FlutterStore _singleton = FlutterStore._internal();

  factory FlutterStore() {
    return _singleton;
  }

  FlutterStore._internal();
}