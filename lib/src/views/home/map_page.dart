import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../helpers/common/color_palette.dart';
import '../../provider/map_provider.dart';
import '../../utils/app_navigation.dart';
import 'add_crime_location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapProvider? mapProvider;
  List<Marker> markers = [];
  late GoogleMapController _mapController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mapProvider = Provider.of<MapProvider>(context);
  }

  void onMapCreated(controller) {
    setState(() {
      _mapController = controller;
    });

    markers.add(Marker(
      draggable: false,
      markerId: MarkerId("0"),
      position: LatLng(mapProvider!.currentUserLocation!.latitude,
          mapProvider!.currentUserLocation!.longitude),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: mapProvider!.currentUserLocation == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Stack(
                children: [
                  GoogleMap(
                      mapType: MapType.normal,
                      markers: Set.from(markers),
                      myLocationEnabled: true,
                      scrollGesturesEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            mapProvider!.currentUserLocation!.latitude,
                            mapProvider!.currentUserLocation!.longitude),
                        zoom: 8,
                      ),
                      onMapCreated: onMapCreated),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton(
                        backgroundColor: Palette.primaryColor,
                        onPressed: () => appNavigatorPush(
                            context: context, path: AddCrimeLocation()),
                        child: Icon(Icons.add),
                      ))
                ],
              ));
  }
}
