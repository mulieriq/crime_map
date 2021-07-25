import 'package:crime_map/src/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../helpers/common/app_constants.dart';
import '../../helpers/common/color_palette.dart';
import '../../helpers/widgets/app_text.dart';
import '../../utils/app_navigation.dart';
import '../home/map_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(AppConstants.appIcon)),
              authProvider.appBusy
                  ? Center(
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Palette.white),
                    )
                  : OutlinedButton.icon(
                      onPressed: () => authProvider.handleSignIn()
                      // appNavigatorPush(context: context, path: const MapPage())
                      ,
                      icon: const Icon(FontAwesomeIcons.google),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      label: CustomText(
                        text: AppConstants.signIn,
                        color: Palette.primaryColor,
                      ))
            ],
          ),
        ));
  }
}
