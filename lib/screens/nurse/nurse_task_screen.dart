import 'package:flutter/material.dart';
import 'package:hackathonapp/constants/StaticColors.dart';
import 'package:hackathonapp/networks/patient_operations.dart';
import 'package:hackathonapp/networks/todo_operations.dart';
import 'package:hackathonapp/screens/nurse/nurse_task_add_screen.dart';
import 'package:hackathonapp/screens/patient/patient_task_detail_screen.dart';
import 'package:hackathonapp/store/flutter_store.dart';

class NurseTaskScreen extends StatefulWidget {
  @override
  _NurseTaskScreenState createState() => _NurseTaskScreenState();
}

class _NurseTaskScreenState extends State<NurseTaskScreen> {
  FlutterStore flutterStore = new FlutterStore();

  PatientOperations patientOperations = new PatientOperations();
  TodoOperations todoOperations = new TodoOperations();

  var taskList = [];

  @override
  void initState() {
    super.initState();
    patientOperations.getRecord("h8L955qYiBLwOWLbbAjZ").then((value) {
      print(value);
    });
    todoOperations.listRecords("h8L955qYiBLwOWLbbAjZ").then((value) {
      setState(() {
        taskList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_circle_outline),
        title: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NurseTaskAddScreen()),
            );
          },
          child: Text(
            "Yeni Görev Ekle",
            style: TextStyle(color: Colors.white),
          ),
          color: StaticColors.colorBlue,
        ),
      ),
      body: taskList.length > 0 ? _buildBody() : _loadingScreen(),
    );
  }

  _buildBody() {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        var item = taskList[index];
        return _buildCard(
            item["title"], item["description"], item["date"], item);
      },
    );
  }

  _buildCard(String title, String description, String date, dynamic item) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientTaskDetailScreen(item)),
            );
          },
          leading: Icon(Icons.toc),
          title: Text(title),
          subtitle: Text(description),
          trailing: Text(date),
        ),
      ),
    );
  }

  _loadingScreen() {
    return Center(
      child: Text("Yükleniyor"),
    );
  }
}
