import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../provider/auth_provider.dart';
import '../../provider/crime_location_provider.dart';
import '../../provider/map_provider.dart';

GetIt locator = GetIt.I;

setupLocator() {
  locator.registerFactory(() => AuthProvider());
  locator.registerFactory(() => MapProvider());
  locator.registerFactory(() => CrimeLocationProvider());
  log('[Locator : Registered Locators]');
}
