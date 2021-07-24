import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_map/src/helpers/widgets/map_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../models/crime_location_model.dart';
import '../utils/map_utility.dart';
import 'config/base_provider.dart';

class MapProvider extends BaseProvider {
  final _mapSerivce = MapSerivce();
  BuildContext? context;

  Position? currentUserLocation;
  PlacesDetailsResponse? placedetails; //From Search
  List<Placemark>? places; //From Gecoding
  List<DocumentSnapshot>? locationData;
  List<CrimeLocationModel> crimeLocations = <CrimeLocationModel>[];
  List<Marker> markers = [];
  MapProvider() {
    setCurrentLocation();
    fetchLocations();
  }

  Future<void> setCurrentLocation() async {
    currentUserLocation = await _mapSerivce.getUserCurrentLocation();
    await _requestCurrentUserAreaDetails(
        currentUserLocation!.latitude, currentUserLocation!.longitude);
    notifyListeners();
  }

  Future<void> getUserPlaceSearch(context) async {
    placedetails = await _mapSerivce.searchPlace(context);
    notifyListeners();
  }

  Future<void> _requestCurrentUserAreaDetails(double lat, double lng) async {
    places = await _mapSerivce.getCurrentUserArea(lat, lng);
    notifyListeners();
  }

  Future<void> saveLocationToDB(Map<String, dynamic> data) async {
    _mapSerivce.dataBase
        .saveCrimeLocation(data)
        .then((value) => setBusy(false));
  }

  Future<void>? fetchLocations() {
    _mapSerivce.dataBase.getCrimeLocations()!.listen((event) {
      crimeLocations.clear();
      markers.clear();
      event.docs.forEach((element) =>
          crimeLocations.add(CrimeLocationModel.fromFirestore(element)));
      crimeLocations.forEach((element) {
        print("Makers ============ ${element.latitude!}, ${element.longitude}");
        markers.add(Marker(
          onTap: () {
            print("========${element.latitude}");
            mapWidgets(element, context!);
          },
          draggable: false,
          icon: element.reportNumber! < 5
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
              : (element.reportNumber! > 5 && element.reportNumber! < 20)
                  ? BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueYellow)
                  : BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
          markerId: MarkerId(element.latitude.toString()),
          position: LatLng(element.latitude!, element.longitude!),
        ));
      });
      notifyListeners();
    });
    notifyListeners();
  }
}
