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
                    child: Center(child: Text("Sağlık Asistanı"),),
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
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Nedir ?'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Nasıl Kullanılır ?'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}