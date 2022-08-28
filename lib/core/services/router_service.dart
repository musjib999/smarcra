import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';

class RouterService {
  void popRoute(BuildContext context) {
    Navigator.pop(context);
  }

  void nextRoute(Widget widget,{required BuildContext context}) {
    Navigator.push(
      context,
      Platform.isIOS
          ? CupertinoPageRoute<Widget>(
              builder: (BuildContext context) => widget)
          : MaterialPageRoute<Widget>(
              builder: (BuildContext context) => widget),
    );
  }

  void popReplaceRoute(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      Platform.isIOS
          ? CupertinoPageRoute<Widget>(
              builder: (BuildContext context) => widget)
          : MaterialPageRoute<Widget>(
              builder: (BuildContext context) => widget),
    );
  }

  void popUntil( Widget widget, {required BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntil(
        Platform.isIOS
            ? CupertinoPageRoute<Widget>(
                builder: (BuildContext context) => widget)
            : MaterialPageRoute<Widget>(
                builder: (BuildContext context) => widget),
        (Route<dynamic> route) => false);
    ModalRoute.withName('/');
  }

  void popDialog(BuildContext context, bool? value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }

  void exitApp() {
    SystemChannels.platform.invokeMethod<String>('SystemNavigator.pop');
  }
}
