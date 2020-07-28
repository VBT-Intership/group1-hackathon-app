import 'package:cloud_firestore/cloud_firestore.dart';

class NurseOperations{

    /// This function get all data by patient key
  Future<dynamic> listRecords(String patientKey) async{
    var list = [];
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("nurses").where("patientkey", isEqualTo:patientKey).getDocuments().then((value){
      value.documents.forEach((element) { 
        list.add(element.data);
      });
    });
    return list;
  }
}