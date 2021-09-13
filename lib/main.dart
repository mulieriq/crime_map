import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'src/app/app.dart';
import 'src/data/di/locator.dart';
import 'src/helpers/common/app_constants.dart';
import 'src/helpers/common/color_palette.dart';
import 'src/provider/config/provider_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await dotenv.load(fileName: AppConstants.envFilePath);
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Palette.primaryAccent,
      statusBarColor: Palette.transaparent,
    ),
  );
  await Firebase.initializeApp();

  //Error Handling

  FlutterError.onError = (FlutterErrorDetails details) async {
    final exception = details.exception;
    final stackTrace = details.stack;
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      Zone.current.handleUncaughtError(exception, stackTrace!);
    }
  };

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async => await SentryFlutter.init((options) {
            options.dsn =
                'https://252da9e243074c31bd5579902435c0d3@o996740.ingest.sentry.io/5955257';
          }, appRunner: () => runApp(CrimeMap())));

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

// import 'package:flutter/widgets.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

// Future<void> main() async {

//   // or define SENTRY_DSN via Dart environment variable (--dart-define)
// }

// import 'package:sentry/sentry.dart';

// try {
//   aMethodThatMightFail();
// } catch (exception, stackTrace) {
//   await Sentry.captureException(
//     exception,
//     stackTrace: stackTrace,
//   );
// }
