import 'package:crime_map/src/provider/map_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> markers = [];
  late GoogleMapController _controller;

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
    final mapProvider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: mapProvider.currentUserLocation == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : GoogleMap(
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
