import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

import '../data/database/database_client.dart';
import '../helpers/common/app_constants.dart';
import '../models/crime_location_model.dart';
import '../views/home/places/adress_search.dart';
import '../views/home/places/places_service.dart';

import '../utils/app_extenstions.dart';

class MapSerivce {
  final dataBase = FirebaseClient();
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: AppConstants.kGoogleApiKey);
  Future<Position> getUserCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<PlacesDetailsResponse> searchPlace(context) async {
    final sessionToken = DateTime.now().microsecondsSinceEpoch.toString();
    final Suggestion? result = await showSearch(
      context: context,
      delegate: AddressSearch(sessionToken),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(result!.placeId);

    return detail;
  }

  Future<List<Placemark>> getCurrentUserArea(lat, lng) async =>
      await placemarkFromCoordinates(lat, lng);

  static Future<String?> isAreaFrequentFlagged(
      double startLat, double startLng, List<CrimeLocationModel> places) async {
    String? reportCases = "0";
    for (int i = 0; i < places.length; i++) {
      double distanceInMeters = Geolocator.distanceBetween(
          startLat, startLng, places[i].latitude!, places[i].longitude!);
      if (distanceInMeters < 500) {
        reportCases =
            (places[i].reportNumber! + 1).toString() & places[i].locationId!;

        print("HIII place iko  kwa db  ,  ${places[i].locationId}");
      }
    }
    return reportCases;
  }
}
