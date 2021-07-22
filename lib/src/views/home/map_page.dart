import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> markers = [];
  late GoogleMapController _controller;
  final _geoLocator = Geolocator();

  void onMapCreated(controller) {
    setState(() {
      _controller = controller;
    });

    markers.add(Marker(
      draggable: false,
      markerId: const MarkerId('1'),
      position: LatLng(0, 0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // lat == null
          //     ? const Center(
          //         child: CircularProgressIndicator.adaptive(),
          //       )
          //     :
          GoogleMap(
              mapType: MapType.normal,
              markers: Set.from(markers),
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: const LatLng(0, 0),
                zoom: 8,
              ),
              // polylines: model.polyline,
              onMapCreated: onMapCreated),
    );
  }
}
