import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathonapp/networks/location_operations.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  Location location = new Location();

  LocationOperations _locationOperations = new LocationOperations();
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();

    _getUserPosition().then((value) {
      print("Location is found.");
    });

    location.onLocationChanged.listen((LocationData currentLocation) {
     print("burada save ettir.");
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
      ),
      RaisedButton(
        onPressed: () {
          _locationOperations.updateLocation(
              "patiens", "IBPTeQlSMEqVbhUr4FWj", latitude, longitude);
        },
        child: Text("dedededede"),
      ),
    ]);
  }
}
