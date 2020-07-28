import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Text(
                    ' Welcome !',
                    style: GoogleFonts.carterOne(
                        fontSize: 60, color: Color(0xFF05454F)),
                  ),
                ],
              )),
          Container(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(400)),
                child: Image.asset(
                  'assets/image/aa.png',
                  width: 400,
                  height: 400,
                  fit: BoxFit.fill,
                ),
              ),
            )),
          ),
          RaisedButton(
            padding: EdgeInsets.all(20.0),
            onPressed: () {},
            child: Text(
              "Start !",
              style: TextStyle(fontSize: 35.0),
            ),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
            color: Color(0xFF05454F),
          )
        ],
      ),
    );
  }
}