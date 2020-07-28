import 'package:flutter/material.dart';

class MyDrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 125,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}