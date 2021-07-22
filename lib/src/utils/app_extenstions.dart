import 'package:crime_map/src/models/crime_location_model.dart';
import 'package:geolocator/geolocator.dart';

extension StringExtensions on String {
  String operator &(String other) => '$this $other';
}
