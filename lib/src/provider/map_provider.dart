import 'package:geolocator/geolocator.dart';

import '../utils/map_utility.dart';
import 'config/base_provider.dart';

class MapProvider extends BaseProvider {
  final mapSerivce = MapSerivce();

  Position? currentUserLocation;
  MapProvider() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentUserLocation = await mapSerivce.getUserCurrentLocation();
    notifyListeners();
  }
}
