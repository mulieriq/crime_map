import 'package:crime_map/src/helpers/common/app_constants.dart';
import 'package:crime_map/src/helpers/common/color_palette.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
          primaryColor: Palette.primaryColor,
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter text')),
        ));
  }
}
