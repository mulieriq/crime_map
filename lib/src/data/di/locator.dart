import 'dart:developer';

import 'package:crime_map/src/provider/auth_provider.dart';
import 'package:crime_map/src/provider/crime_location_provider.dart';
import 'package:crime_map/src/provider/map_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

setupLocator() {
  locator.registerFactory(() => AuthProvider());
  locator.registerFactory(() => MapProvider());
  locator.registerFactory(() => CrimeLocationProvider());
  log('[Locator : Registered Locators]');
}
