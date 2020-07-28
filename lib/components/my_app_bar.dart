import 'package:flutter/material.dart';
import 'package:hackathonapp/constants/StaticColors.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: StaticColors.colorWhite,
        centerTitle: true,
        toolbarHeight: 60,
        leadingWidth: 75,
        leading: Icon(Icons.menu),
        actions: [
         Padding(padding: EdgeInsets.only(right: 25),child:  Icon(Icons.info),),
        ],
        title: Text("Sağlık Asistanı"),
      );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}