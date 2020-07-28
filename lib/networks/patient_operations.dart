import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathonapp/models/Patient.dart';

class PatientOperations{

  /// This function add a new patient data
  void addNewRecord(Patient patient) {
    final firestoreInstance = Firestore.instance;
    firestoreInstance.collection("patients").add({
      "namesurname": patient.namesurname,
      "username": patient.username,
      "password": patient.password,
      "latitude": patient.latitude,
      "longitude": patient.longitude,
    }).then((value) {
      print("Patient added succesfully");
    });
  }

}