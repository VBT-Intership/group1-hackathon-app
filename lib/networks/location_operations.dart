import 'package:cloud_firestore/cloud_firestore.dart';

class LocationOperations {

  /// This function update location data
  void updateLocation(String collectionName, String documentKey, double latitude, double longitude) {
    final firestoreInstance = Firestore.instance;
    firestoreInstance.collection(collectionName).document(documentKey).updateData({
      "latitude": latitude.toString(),
      "longitude": longitude.toString()
    }).then((value) {
      print("Location is saved succesfully");
    });
  }
}
