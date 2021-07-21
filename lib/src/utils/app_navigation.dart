import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void appNavigatorPush(
        {@required BuildContext? context, @required dynamic path}) =>
    Navigator.push(
        context!, CupertinoPageRoute(builder: (BuildContext context) => path));

void appNavigatorReplacement(
        {@required BuildContext? context, @required dynamic path}) =>
    Navigator.pushReplacement(
        context!, CupertinoPageRoute(builder: (BuildContext context) => path));

void appNavigatorPushRemoveUntil(
        {@required BuildContext? context, @required dynamic path}) =>
    Navigator.pushAndRemoveUntil(
        context!,
        CupertinoPageRoute(builder: (context) => path),
        (Route<dynamic> route) => false);
