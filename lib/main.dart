import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'src/app/app.dart';
import 'src/data/di/locator.dart';
import 'src/helpers/common/app_constants.dart';
import 'src/helpers/common/color_palette.dart';
import 'src/provider/config/provider_config.dart';

void main() async {
  await dotenv.load(fileName: AppConstants.envFilePath);
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarIconBrightness: Brightness.light,
  //     systemNavigationBarColor: Palette.primaryAccent,
  //     statusBarColor: Palette.transaparent,
  //   ),
  // );
  // await Firebase.initializeApp();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) =>
  runApp(CrimeMap());
  //);
  log('[Main : Entry Point]');
}

class CrimeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderConfig.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
          primaryColor: Palette.primaryColor,
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
      ),
    );
  }
}
