import 'package:crime_map/src/provider/config/base_provider.dart';
import 'package:crime_map/src/utils/map_utility.dart';
import 'package:geolocator/geolocator.dart';

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
