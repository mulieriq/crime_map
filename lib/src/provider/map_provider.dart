import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

import '../utils/map_utility.dart';
import 'config/base_provider.dart';
import 'package:geocoding/geocoding.dart';

class MapProvider extends BaseProvider {
  final _mapSerivce = MapSerivce();

  Position? currentUserLocation;
  PlacesDetailsResponse? placedetails; //From Search
  late List<Placemark>? places; //From Gecoding
  MapProvider() {
    setCurrentLocation();
  }

  void setCurrentLocation() async {
    currentUserLocation = await _mapSerivce.getUserCurrentLocation();
    notifyListeners();
    _requestCurrentUserAreaDetails(
        currentUserLocation!.latitude, currentUserLocation!.latitude);
  }

  Future getUserPlaceSearch(context) async {
    placedetails = await _mapSerivce.searchPlace(context);
    notifyListeners();
  }

  Future _requestCurrentUserAreaDetails(double lat, double lng) async {
    places = await _mapSerivce.getCurrentUserArea(lat, lng);
    notifyListeners();
  }
}
