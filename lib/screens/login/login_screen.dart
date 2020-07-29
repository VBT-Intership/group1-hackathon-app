import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonapp/constants/UserType.dart';
import 'package:hackathonapp/screens/login/register_screen.dart';
import 'package:hackathonapp/screens/nurse/nurse_home_screen.dart';
import 'package:hackathonapp/screens/patient/patient_home_screen.dart';
import 'package:hackathonapp/store/flutter_store.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FlutterStore flutterStore = new FlutterStore();



  @override
  Widget build(BuildContext context) {

    TextEditingController txtMail = new TextEditingController();
    TextEditingController txtPassword = new TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF05454F)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Giriş Yap",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(5, 69, 79, 0.5),
                                  blurRadius: 25,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: txtMail,
                                decoration: InputDecoration(
                                    hintText: "Kullanıcı Adı",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: txtPassword,
                                decoration: InputDecoration(
                                    hintText: "Şifre",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                                obscureText: true,
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: (){
                        _loginOperation(txtMail.text, txtPassword.text);
                      },
                      child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF05454F)),
                      child: Center(
                        child: Text(
                          "Giriş",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NurseHomeScreen()),
                            );
                          },
                          child: Text("Hesabın Yok Mu ?",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        ),
                        FlatButton(
                          textColor: Color(0XFF7B1FA2),
                          child: Text(
                            'Üye Ol',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                ),

              ),
            ))
          ],
        ),
      ),
    );
  }

  /// Burada login islemi yapilir
  void _loginOperation(String username, String password) {
    flutterStore.setUserType(UserType.PATIENT);
    flutterStore.setUserId("h8L955qYiBLwOWLbbAjZ");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientHomeScreen()),
    );
  }
}
