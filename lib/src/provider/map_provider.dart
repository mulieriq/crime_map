import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

import '../utils/map_utility.dart';
import 'config/base_provider.dart';

class MapProvider extends BaseProvider {
  final _mapSerivce = MapSerivce();

  Position? currentUserLocation;
  PlacesDetailsResponse? placedetails; //From Search
  List<Placemark>? places; //From Gecoding
  MapProvider() {
    setCurrentLocation();
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

  Stream<QuerySnapshot>? fetchLocations() {
    return _mapSerivce.dataBase.getCrimeLocations();
  }
}
