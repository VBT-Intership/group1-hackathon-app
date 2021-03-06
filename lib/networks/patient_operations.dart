import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathonapp/models/Patient.dart';

class PatientOperations {
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

  /// This function get all data
  Future<dynamic> listRecords() async {
    var list = [];
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("patients").getDocuments().then((value) {
      value.documents.forEach((element) {
        list.add(element.data);
      });
    });
    return list;
  }

  /// This function get all data by patient key
  Future<dynamic> listRecordsByNurse(String nurseKey) async {
    var list = [];
    final firestoreInstance = Firestore.instance;
    await firestoreInstance
        .collection("patients")
        .where("nurseKey", isEqualTo: nurseKey)
        .getDocuments()
        .then((value) {
      value.documents.forEach((element) {
        list.add(element.data);
      });
    });
    return list;
  }

  /// This function is login operation
  Future<bool> login(String username, String password) async {
    var list = [];
    final firestoreInstance = Firestore.instance;
    await firestoreInstance
        .collection("patients")
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .getDocuments()
        .then((value) {
      value.documents.forEach((element) {
        list.add(element.data);
      });
    });
    if(list.length > 0){
      return true;
    }else{
      return false;
    }
  }

  /// This function get one record by document id
  Future<dynamic> getRecord(String documentId) async {
    var list = [];
    final firestoreInstance = Firestore.instance;
    await firestoreInstance
        .collection("patients")
        .document(documentId)
        .get()
        .then((value) {
      list.add(value.data);
    });
    return list;
  }
}
