import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class MapScreen2 extends StatefulWidget {
  @override
  _MapScreen2State createState() => _MapScreen2State();
}

class _MapScreen2State extends State<MapScreen2> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  LatLng savedLocation = LatLng(31.89572742309952, 34.84224949032068);
  BitmapDescriptor? _markerIcon;

  @override
  void initState() {
    super.initState();
    _loadMarkerIcon();
  }

  Future<void> _loadMarkerIcon() async {
    final ByteData byteData = await rootBundle.load('assets/logo.png');
    final Uint8List imageData = byteData.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(imageData,
        targetHeight: 150, targetWidth: 150);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image resizedImage = frameInfo.image;
    final ByteData? resizedByteData =
        await resizedImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedImageData = resizedByteData!.buffer.asUint8List();
    final BitmapDescriptor bitmapDescriptor =
        BitmapDescriptor.fromBytes(resizedImageData);

    setState(() {
      _markerIcon = bitmapDescriptor;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMapTap(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  void _searchAddress() {
    // TODO: Implement the address search functionality using Geocoding API or other services.
  }

  void _saveLocation() {
    if (_selectedLocation != null) {
      // Save the selected location to a variable or use it as needed
      setState(() {
        savedLocation = _selectedLocation!;
      });
      print('Selected location: $savedLocation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onLongPress: _onMapTap,
        initialCameraPosition: CameraPosition(
          target: LatLng(savedLocation.latitude, savedLocation.longitude),
          zoom: 15.0,
        ),
        markers: _selectedLocation != null
            ? {
                Marker(
                  markerId: MarkerId('selected_location'),
                  position: LatLng(_selectedLocation!.latitude,
                      _selectedLocation!.longitude + 0.00005),
                  icon: _markerIcon!,
                ),
              }
            : {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveLocation,
        child: Icon(Icons.save),
      ),
    );
  }
}
