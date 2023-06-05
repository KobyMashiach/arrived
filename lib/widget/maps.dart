import 'package:arrived/widget/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(31.745208, 35.231077), zoom: 17);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("location"),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await _determinePostion();
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 17)));

            markers.clear();
            markers.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));
            setState(() {});
          },
          label: const Row(
            children: [
              Icon(Icons.location_searching),
              SizedBox(width: 3),
              Text("המיקום שלי"),
            ],
          )),
    );
  }

  Future<Position> _determinePostion() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('שירותי המיקום לא זמינים');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Future.error("לא קיימות הרשאות מיקום");
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("הרשאות המיקום לא מאושרות");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
