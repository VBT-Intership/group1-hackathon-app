import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/screens/ml/home_camera.dart';

class PatientMlScreen extends StatefulWidget {
  @override
  _PatientMlScreenState createState() => _PatientMlScreenState();
}

class _PatientMlScreenState extends State<PatientMlScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    main().then((value){
    super.initState();
    });
  }

  List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeCamera(cameras),
    );
  }
}
