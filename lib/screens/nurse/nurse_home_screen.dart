import 'package:flutter/material.dart';
import 'package:hackathonapp/components/my_app_bar.dart';
import 'package:hackathonapp/components/my_drawer_menu.dart';
import 'package:hackathonapp/constants/StaticColors.dart';
import 'package:hackathonapp/screens/common/map_screen.dart';

class NurseHomeScreen extends StatefulWidget {
  @override
  _NurseHomeScreenState createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Text("test1"),
    MapScreen(),
    Text("123"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: _buildBody(),
      drawer: MyDrawerMenu(),
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
      selectedItemColor: StaticColors.colorBlue,
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
      ],
    );
  }

  Widget _buildBody() {
    return _children[_currentIndex];
  }
}
