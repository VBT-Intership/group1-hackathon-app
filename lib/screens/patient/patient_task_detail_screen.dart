import 'package:flutter/material.dart';
import 'package:hackathonapp/components/my_app_bar.dart';
import 'package:hackathonapp/constants/StaticColors.dart';
import 'package:hackathonapp/networks/todo_operations.dart';

class PatientTaskDetailScreen extends StatefulWidget {

  dynamic data;

  PatientTaskDetailScreen(this.data);

  @override
  _PatientTaskDetailScreenState createState() => _PatientTaskDetailScreenState();
}

class _PatientTaskDetailScreenState extends State<PatientTaskDetailScreen> {

  TodoOperations todoOperations = new TodoOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 0.2,
            height: 50,
            child: Card(
            child: Text(widget.data["title"], textAlign: TextAlign.center,),
          ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 0.2,
            height: 100,
            child: Card(
            margin: EdgeInsets.all(20),
            child: Text(widget.data["description"], textAlign: TextAlign.center,),
          ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 0.2,
            height: 100,
            child: Card(
            margin: EdgeInsets.all(20),
            child: Text(widget.data["date"], textAlign: TextAlign.center,),
          ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 0.2,
            height: 75,
            child: Card(
            margin: EdgeInsets.all(20),
            child: Text(widget.data["completed"], textAlign: TextAlign.center,),
          ),
          ),
          RaisedButton(
            onPressed: (){
              String statu = widget.data["completed"] == "true" ? "false" : "true";
              todoOperations.updateCompletedStatus("EGqRhHXvheK8yuuxhssw", statu);
            },
            child: Text("Durum Değiştir"),
            color: StaticColors.colorBlue,
          ),
        ],
      ),
    );
  }
}