import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathonapp/constants/UserType.dart';
import 'package:hackathonapp/networks/location_operations.dart';
import 'package:hackathonapp/networks/nurse_operations.dart';
import 'package:hackathonapp/networks/patient_operations.dart';
import 'package:hackathonapp/store/flutter_store.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  FlutterStore flutterStore = new FlutterStore();

  GoogleMapController mapController;
  Location location = new Location();

  LocationOperations _locationOperations = new LocationOperations();
  double latitude;
  double longitude;

  NurseOperations nurseOperations = new NurseOperations();
  var nurse = [];

  PatientOperations patientOperations = new PatientOperations();
  var patient = [];

  @override
  void initState() {
    super.initState();

    _getUserPosition().then((value) {
      print("Location is found.");
    });

    /* Konumu Guncellemek Icin Kodlar */
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (flutterStore.getUserId() != null) {
        if (flutterStore.getUserType() == UserType.PATIENT) {
          _locationOperations.updateLocation(
              "patients", flutterStore.getUserId(), latitude, longitude);
        } else {
          _locationOperations.updateLocation(
              "patients", flutterStore.getUserId(), latitude, longitude);
        }
      }
    });

    if (flutterStore.getUserType() == UserType.PATIENT) {
      nurseOperations.listRecords(flutterStore.getUserId()).then((value) {
        setState(() {
          nurse = value;
        });
        _addNurse();
      });
    } else {
      patientOperations.listRecordsByNurse(flutterStore.getUserId()).then((value) {
        setState(() {
          nurse = value;
        });
        _addPatient();
      });
    }
  }

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  void _addNurse() {
    final MarkerId markerId = MarkerId("1");

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(nurse[0]["latitude"]),
          double.parse(nurse[0]["longitude"])),
      infoWindow: InfoWindow(title: " Bakıcı Bilgileri ", snippet: nurse[0]["namesurname"]),
      onTap: () {},
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  void _addPatient() {
    final MarkerId markerId = MarkerId("1");

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(patient[0]["latitude"]),
          double.parse(patient[0]["longitude"])),
      infoWindow: InfoWindow(title: "Patient", snippet: '*'),
      onTap: () {},
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Future<void> _getUserPosition() async {
    var pos = await location.getLocation();
    print("***********************************");
    /*
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(pos.latitude, pos.longitude),
      zoom: 17.0,
    )));
    */
    print("***********************************");
    setState(() {
      latitude = pos.latitude;
      longitude = pos.longitude;
    });
    print("***********************************");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(24.150, -110.32), zoom: 10),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        markers: Set<Marker>.of(markers.values),
      ),
    ]);
  }
}
