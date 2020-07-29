import 'package:flutter/material.dart';

class PatientDashboardScreen extends StatefulWidget {
  @override
  _PatientDashboardScreenState createState() => _PatientDashboardScreenState();
}

class _PatientDashboardScreenState extends State<PatientDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _myCard("Hoşgeldiniz : Test User"),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _myCard("Hava Durumu : 32"),
              ),
              Expanded(
                flex: 2,
                child: _myCard("Görev Sayısı : 6"),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _myCard("Dışarda hava mükemmel, istiyorsan biraz dolaşabilir ve hava alabilirsin."),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _myCard(String title) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      child: Container(
        height: 100,
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
