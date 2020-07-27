import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            // Add a new data -> Firestore.instance.collection('books').document().setData({ 'title': 'berke', 'author': 'dew' });
            
            /*
            Get a specific data
            Firestore.instance.collection('books').document('H7GayJ5Tj8EHqndSHKn9').get().then((DocumentSnapshot ds){
              print(ds["title"]);
            });
            */

          

          },
          child: Text("click"),
        ),
      ),
    );
  }
}
