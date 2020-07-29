import 'package:flutter/material.dart';
import 'package:hackathonapp/components/my_app_bar.dart';
import 'package:hackathonapp/constants/StaticColors.dart';

class NurseTaskAddScreen extends StatefulWidget {
  @override
  _NurseTaskAddScreenState createState() => _NurseTaskAddScreenState();
}

class _NurseTaskAddScreenState extends State<NurseTaskAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Başlık",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Açıklama",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Tarih",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            onPressed: (){

            },
            child: Text("Görev Ekle"),
            color: StaticColors.colorBlue,
          ),
        ),
      ],
    );
  }
}
