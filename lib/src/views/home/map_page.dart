import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

import '../../helpers/common/app_constants.dart';
import '../../provider/map_provider.dart';
import 'places/adress_search.dart';
import 'places/places_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapProvider? mapProvider;
  List<Marker> markers = [];
  late GoogleMapController _mapController;
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: AppConstants.kGoogleApiKey);
  final _controller = TextEditingController();
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
      markerId: const MarkerId('1'),
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
                      zoomGesturesEnabled: true,
                      myLocationEnabled: true,
                      compassEnabled: true,
                      scrollGesturesEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            mapProvider!.currentUserLocation!.latitude,
                            mapProvider!.currentUserLocation!.longitude),
                        zoom: 8,
                      ),
                      onMapCreated: onMapCreated),
                  Positioned(
                    top: 10,
                    left: 5,
                    right: 5,
                    child: Card(
                      child: TextField(
                        controller: _controller,
                        readOnly: true,
                        onTap: () async {
                          // generate a new token here
                          final sessionToken =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          final Suggestion? result = await showSearch(
                            context: context,
                            delegate: AddressSearch(sessionToken),
                          );
                          PlacesDetailsResponse detail = await _places
                              .getDetailsByPlaceId(result!.placeId);
                          setState(() {
                            print(
                                "this is the place =============== ${detail.result.geometry!.location.lat} , ${detail.result.geometry!.location.lng}");
                          });
                        },
                        decoration: InputDecoration(
                          icon: Container(
                            width: 10,
                            height: 10,
                            child: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                          ),
                          hintText: AppConstants.kGoogleSearchLocation,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
