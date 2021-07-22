import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

import '../helpers/common/app_constants.dart';
import '../views/home/places/adress_search.dart';
import '../views/home/places/places_service.dart';

class MapSerivce {
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
}
