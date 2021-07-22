import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'src/data/di/locator.dart';
import 'src/helpers/common/app_constants.dart';
import 'src/helpers/common/color_palette.dart';
import 'src/provider/auth_provider.dart';
import 'src/provider/config/provider_config.dart';
import 'src/views/auth/auth_page.dart';
import 'src/views/home/map_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Palette.primaryAccent,
      statusBarColor: Palette.primaryColor,
    ),
  );
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(CrimeMap()));
  log('[Main : Entry Point]');
}

class CrimeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderConfig.providers,
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
          primaryColor: Palette.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (BuildContext context) {
            var provider =
                Provider.of<AuthProvider>(context).userIsAuthenticated();
            log('[Auth : $provider]');
            return provider == null ? AuthPage() : MapPage();
          }
        },
      ),
    );
  }
}
