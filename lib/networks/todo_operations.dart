import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathonapp/models/Todo.dart';

class TodoOperations{
  
    /// This function get all data by patient key
  Future<dynamic> listRecords(String patientKey) async{
    var list = [];
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("todos").where("patientkey", isEqualTo:patientKey).getDocuments().then((value){
      value.documents.forEach((element) { 
        list.add(element.data);
      });
    });
    return list;
  }

  /// This function update location data
  void updateCompletedStatus(String documentKey, String statu) {
    final firestoreInstance = Firestore.instance;
    firestoreInstance.collection("todos").document(documentKey).updateData({
      "completed": statu
    }).then((value) {
      print("Completed status is saved succesfully");
    });
  }

    /// This function add a new todo data
  void addNewRecord(Todo todo) {
    final firestoreInstance = Firestore.instance;
    firestoreInstance.collection("todos").add({
      "title": todo.title,
      "description": todo.description,
      "date": todo.date
    }).then((value) {
      print("Todo added succesfully");
    });
  }

}