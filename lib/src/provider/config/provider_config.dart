import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/di/locator.dart';
import '../auth_provider.dart';
import '../crime_location_provider.dart';
import '../map_provider.dart';
import 'base_provider.dart';

class ProviderConfig {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => locator<BaseProvider>()),
    ChangeNotifierProvider(create: (context) => locator<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => locator<MapProvider>()),
    ChangeNotifierProvider(
        create: (context) => locator<CrimeLocationProvider>()),
  ];
}
