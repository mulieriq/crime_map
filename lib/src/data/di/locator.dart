import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../provider/auth_provider.dart';
import '../../provider/map_provider.dart';

GetIt locator = GetIt.I;

setupLocator() {
  locator.registerFactory(() => AuthProvider());
  locator.registerFactory(() => MapProvider());
  log('[Locator : Registered Locators]');
}
