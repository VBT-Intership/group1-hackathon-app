import 'package:flutter/material.dart';
import 'package:hackathonapp/screens/common/map_screen.dart';

class PatientHomeScreen extends StatefulWidget {
  @override
  _PatientHomeScreenState createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Text("test1"),
    MapScreen(),
    Text("test3"),
    Text("test4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello App"),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Anasayfa'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.map),
          title: new Text('Harita'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.list), title: Text('Görevler')),
        BottomNavigationBarItem(
            icon: Icon(Icons.open_in_browser), title: Text('Nesne Tanıma')),
      ],
    );
  }

  Widget _buildBody() {
    return _children[_currentIndex];
  }
}
