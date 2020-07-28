import 'package:flutter/material.dart';
import 'package:hackathonapp/screens/common/map_screen.dart';
import 'package:hackathonapp/screens/login/login_screen.dart';
import 'package:hackathonapp/screens/login/splash_screen.dart';
import 'package:hackathonapp/screens/patient/patient_home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}
